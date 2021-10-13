import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CuentaService } from 'src/app/services/cuenta.service';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/servicios/Auth/auth.service';
import {
  ClienteService,
  Cuenta,
  LoginRequest,
  Operacion,
} from 'src/app/servicios/cliente.service';
import { LocalidadService } from 'src/app/servicios/localidad.service';

@Component({
  selector: 'app-saldo',
  templateUrl: './saldo.component.html',
  styleUrls: ['./saldo.component.css'],
})
export class SaldoComponent implements OnInit {
  mostrar_movimientos = true;
  hoy = new Date();
  movimientos: any[] = [];
  id_log: any;
  cliente: LoginRequest = new LoginRequest();
  cuenta: Cuenta = new Cuenta();
  saldo: number = 0;
  id_cuenta: number = 0;
  form: FormGroup;
  usuario: LoginRequest = new LoginRequest();
  operacion: Operacion = new Operacion();
  mostrarIdDestino: any = false;
  constructor(
    private formBuilder: FormBuilder,
    private menuSrv: DataService,
    private clienteService: ClienteService,
    private router: Router,
    private localidadService: LocalidadService,
    private authService: AuthService,
    private cuentaService: CuentaService
  ) {
    this.form = this.formBuilder.group({
      monto:['',[Validators.required]],
      cvu:[''],
    });
  }

  ngOnInit(): void {
    this.onCargarDatos();
  }

  onCargarDatos () {
    this.id_log = localStorage.getItem('auth-id');
    this.cuentaService.ObtenerCuentaCliente(this.id_log).subscribe((res) => {
      console.log(res);
      this.saldo = res['Saldo'];
      this.id_cuenta = res['Id_cuenta'];
      //ultimos movimientos
      this.cuentaService
        .ObtenerOperaciones(this.id_cuenta)
        .subscribe((data) => {
          console.log(data);
          this.movimientos = data;
          for (var n = 0; n < this.movimientos.length; n++) {
            console.log(this.saldo);
            //deposito
            if (this.movimientos[n]['Id_tipo_operacion'] == 1) {
              if(this.movimientos[n]['Id_cuenta'] == this.id_log) {
                this.saldo = this.saldo - this.movimientos[n]['Monto'];
              } else {
                this.saldo = this.saldo + this.movimientos[n]['Monto'];
              }
              //transferencia
            } else if (this.movimientos[n]['Id_tipo_operacion'] == 2) {
              this.saldo = this.saldo + this.movimientos[n]['Monto'];
            }
            console.log(this.saldo);
          }
        });
    });
  }

  onSelectOperacion(tipoOperacion: any):void {
    console.log(tipoOperacion);
    this.operacion.id_tipo_operacion = tipoOperacion;
    console.log(this.operacion.id_tipo_operacion);
    if (tipoOperacion == 1) {
      this.mostrarIdDestino = true;
    } else {
      this.mostrarIdDestino = false;
    }
  }

  //otros metodos
  onEnviar(event: Event, cuenta: Cuenta) {
    this.id_log = localStorage.getItem('auth-id');
    //logica
  }
  onEnviarOperacion(event: Event, operacion:Operacion): void
  {
    event.preventDefault;

    if (this.form.valid)
    {
      console.log(operacion);
      this.id_log= Number(localStorage.getItem('auth-id'));
      console.log(this.operacion.id_cuenta);
      console.log(this.form.value.cvu);
      this.cuentaService.ObtenerCuentaIdCliente(this.id_log).subscribe(
        data => {
          this.operacion.id_cuenta = data;
          if (this.operacion.id_tipo_operacion == 1) {
            this.cuentaService.ObtenerCuentaCvu(this.form.value.cvu).subscribe(
              data => {
                this.operacion.id_cuenta_destino = data;
                console.log(this.operacion.id_cuenta_destino);
                this.cuentaService.InsertarOperacion(operacion).subscribe(
                  data => {
                    console.log(data);
                    this.onCargarDatos();
                  }
                )
              }
            )
          } else {
            this.cuentaService.InsertarOperacion(operacion).subscribe(
              data => {
                console.log(data);
                this.onCargarDatos();
              }
            )
          }
        }
        
      )
    }
    else
    {
      this.form.markAllAsTouched(); 
    }  
  }

  get montoField() {
    return this.form.get("monto");
  }

  get montoInvalid() {
    return this.montoField?.touched && !this.montoField.valid;
  }

}
