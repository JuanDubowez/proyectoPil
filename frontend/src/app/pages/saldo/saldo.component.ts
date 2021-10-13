import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { CuentaService } from 'src/app/services/cuenta.service';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/servicios/Auth/auth.service';
import { ClienteService, Cuenta, LoginRequest } from 'src/app/servicios/cliente.service';
import { LocalidadService } from 'src/app/servicios/localidad.service';


@Component({
  selector: 'app-saldo',
  templateUrl: './saldo.component.html',
  styleUrls: ['./saldo.component.css']
})
export class SaldoComponent implements OnInit {
  mostrar_movimientos=true;
  hoy= new Date();
  movimientos: any[]=[];
  id_log:any;
  cliente:LoginRequest=new LoginRequest();
  cuenta: Cuenta = new Cuenta();
  saldo:number=0;
  id_cuenta:number=0;
  constructor(private formBuilder: FormBuilder,
              private menuSrv:DataService,
              private clienteService: ClienteService,
              private router: Router,
              private localidadService: LocalidadService,
              private authService:AuthService,
              private cuentaService: CuentaService,
             ) { }

  ngOnInit(): void {

    this.id_log = localStorage.getItem('auth-id');
      this.cuentaService.ObtenerCuentaCliente(this.id_log).subscribe(
        res=>{

          console.log(res);
          this.saldo= res['Saldo'];
          this.id_cuenta=res['Id_cuenta'];
        //ultimos movimientos
         this.cuentaService.ObtenerOperaciones(this.id_cuenta).subscribe(
          data=> {
           console.log(data);
           this.movimientos=data;
           for(var n=0;n< this.movimientos.length;n++){
            console.log(this.saldo);
            if(this.movimientos[n]['Id_tipo_operacion']==1){
                this.saldo=this.saldo-this.movimientos[n]['Monto'];

            }else if(this.movimientos[n]['Id_tipo_operacion']==2){
              this.saldo=this.saldo+this.movimientos[n]['Monto'];

            }
            console.log(this.saldo);
            //
           }


          }
        );
        }
      );
  }



}
