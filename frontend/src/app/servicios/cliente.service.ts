import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  url="https://localhost:44332/api/Cliente";
  url2="https://localhost:44332/api/Cuenta";

  constructor(private http:HttpClient) { }

  onCrearRegistro(usuario:Persona):Observable<any>{
    return this.http.post<Persona>(this.url, usuario);
  }

  onCrearCuenta(cuenta:Cuenta):Observable<Cuenta>{
    return this.http.post<Cuenta>(this.url2, cuenta);
  }


}

export class Persona
{
  nombre:string="";
  apellido:string="";
  fecha_de_nacimiento=null;
  documento=null;
  cuil:string="";
  nacionalidad:string="";
  genero:string="";
  id_localidad=null;
  mail:string="";
  contrasena:string="";
  imagen_delantera:string="Si";
  imagen_trasera:string="Si";
}

export class Cuenta
{
  id_cliente:number=0;
  cvu:string="";
  numero_de_cuenta:string="";
  saldo:number=0;
  id_tipo_cuenta=1;
}
