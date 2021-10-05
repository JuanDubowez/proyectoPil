import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';
import { DataService } from 'src/app/services/data.service';
import { ClienteService, Cuenta, Persona } from 'src/app/servicios/cliente.service';
import { LocalidadI, LocalidadService, ProvinciaI } from 'src/app/servicios/localidad.service';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  formu: FormGroup;
  formu2: FormGroup;
  fieldTextType:boolean=false;
  usuario: Persona = new Persona();
  cuenta: Cuenta = new Cuenta();
  provincias!: ProvinciaI[];
  localidades!: LocalidadI[];
  localidades4!: LocalidadI[];
  public selectedProvincia: ProvinciaI = { Id_provincia: 0, Provinciaa: ''};
  public selectedLocalidad: LocalidadI = { Id_localidad: 0, Nombre: '', Cosdigo_postal: 0, Id_provincia: 0};
  id_cliente:number=0;
  localidadSel:any;
  localidadSelected:any;
  provinciaSel:any;
  provinciaSelected:any;
  mostrarLoc:Boolean=true;
  exitoDatos:Boolean=false;
  exitoCuenta:Boolean=false;

  constructor(private formBuilder: FormBuilder,
              private menuSrv:DataService, 
              private clienteService: ClienteService, 
              private router: Router, 
              private localidadService: LocalidadService) {
    this.formu= this.formBuilder.group(
      {
        name:[''],
        lastName: [''],
        nacimiento:[''],
        dni:[''],
        cuil:['', [ Validators.minLength(10), Validators.maxLength(15)]],
      }
    )

    this.formu2= this.formBuilder.group(
      {
        mail:[''],
        contrasena:[''],
      }
    )
  }

  ngOnInit(): void {
    this.mostrar();

    this.cargarUsuario();
  }

  onSelectNacionalidad(nacionalidad: any):void {
    console.log(nacionalidad);
    this.usuario.nacionalidad = nacionalidad;
    console.log(this.usuario.nacionalidad);
  }

  onSelectGenero(genero: any):void {
    console.log(genero);
    this.usuario.genero = genero;
    console.log(this.usuario.genero);
  }

  onSelect(id_provincia: any):void {
    console.log(id_provincia);
    this.localidadService.ObtenerLocalidades().subscribe(
      data=> {
        this.mostrarLoc = false;
        this.localidades4=data;
        this.localidades = this.localidades4.filter(item => item.Id_provincia == id_provincia);
        console.log(this.localidades);
      }
    );
  }

  onSelectLocalidad(id_localidad: any):void{
    console.log(id_localidad);
    this.usuario.id_localidad = id_localidad;
    console.log(this.usuario.id_localidad);
  }


  onEnviar(event: Event, usuario:Persona): void
  {
    event.preventDefault;

    if (this.formu.valid)
    {
      console.log(usuario);
      this.clienteService.onActualizarUsuario(this.id_cliente,usuario).subscribe(
        data => {
          console.log(data);
          if(data){
            this.exitoDatos = true;
          }
          
      })
    }
    else
    {
      this.formu.markAllAsTouched(); 
    }  
  }

  onEnviar2(event: Event, usuario:Persona): void
  {
    event.preventDefault;

    if (this.formu2.valid)
    {
      console.log(usuario);
      this.clienteService.onActualizarUsuario(this.id_cliente,usuario).subscribe(
        data => {
          console.log(data);
          if(data){
            this.exitoCuenta = true;
          }
          
      })
    }
    else
    {
      this.formu2.markAllAsTouched(); 
    }  
  }
  
  ocultarPass(){
    this.fieldTextType = !this.fieldTextType;
  }

  mostrar(){
    this.menuSrv.bLoggin.next(true);
  }

  cargarUsuario2(){
    this.id_cliente = 4;
    this.usuario.nombre="Ana";
    this.usuario.apellido="Lopez";
    this.usuario.fecha_de_nacimiento="1998-04-10";
    this.usuario.documento=36000333;
    this.usuario.cuil="23-36000333-8";
    this.usuario.nacionalidad="Chilena";
    this.usuario.genero="Femenino";
    this.usuario.id_localidad=1;
    this.usuario.mail="analopez@gmail.com";
    this.usuario.contrasena="12345678";
    this.usuario.imagen_delantera="Si";
    this.usuario.imagen_trasera="Si";
  }

  cargarUsuario(){
    this.clienteService.onObtenerCliente(4).subscribe(
      data=>{
        console.log(data);
        this.id_cliente = data['Id_cliente'];
        this.usuario.nombre=data['Nombre'];
        this.usuario.apellido=data['Apellido'];
        this.usuario.fecha_de_nacimiento=new Date(data['Fecha_de_nacimiento']).toISOString().split('T')[0];
        this.usuario.documento=data['Documento'];
        this.usuario.cuil=data['Cuil'];
        this.usuario.nacionalidad=data['Nacionalidad'];
        this.usuario.genero=data['Genero'];
        this.usuario.id_localidad=data['Id_localidad'];
        this.usuario.mail=data['Mail'];
        this.usuario.imagen_delantera=data['Imagen_delantera'];
        this.usuario.imagen_trasera=data['Imagen_trasera'];
    
        this.localidadService.ObtenerLocalidades().subscribe(
          data=> {
            console.log(data);
            this.localidades=data;
            console.log(this.localidades);
            this.localidadSel=this.localidades.filter(item => item.Id_localidad == this.usuario.id_localidad);
            this.localidadSelected = this.localidadSel[0]['Nombre'];
            console.log(this.localidadSel);

            this.localidadService.ObtenerProvincias().subscribe(
              data=> {
                console.log(data);
                this.provincias=data;
                console.log(this.provincias);
                this.provinciaSel=this.provincias.filter(item => item.Id_provincia == this.localidadSel[0]['Id_provincia']);
                this.provinciaSelected = this.provinciaSel[0]['Provinciaa'];
                console.log(this.provinciaSel);
                console.log(this.provinciaSelected);
              }
            );
          }
        );

        
      }
    );
  }
}
