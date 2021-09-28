import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  url="https://localhost:44332/api/Cliente";
  url2="https://localhost:44332/api/Cuenta";
  url3="https://localhost:44332/api/Cliente?cuil=";
  url4="https://localhost:44332/api/Cuenta?documento={documento}&cuil={cuil}&mail={mail}";
  url5="https://localhost:44332/api/Cliente?id_cliente=";

  constructor(private http:HttpClient) { }

  onCrearRegistro(usuario:Persona):Observable<any>{
    return this.http.post<Persona>(this.url, usuario);
  }

  onCrearCuenta(cuenta:Cuenta):Observable<Cuenta>{
    return this.http.post<Cuenta>(this.url2, cuenta);
  }

  onObtenerId(cuil:string){
    return this.http.get<any>(this.url3+cuil);
  }

  onComparar(documento:number | undefined, cuil:string, mail:string) {
    return this.http.get<any>("https://localhost:44332/api/Cuenta?documento="+documento+"&cuil="+cuil+"&mail="+mail);
  }

  onActualizarUsuario(id_cliente:number, usuario:Persona):Observable<any>{
    return this.http.put<Persona>(this.url5+id_cliente, usuario);
  }

}

export class Persona
{
  nombre:string="";
  apellido:string="";
  fecha_de_nacimiento:any=null;
  documento:number | undefined;
  cuil:string="";
  nacionalidad:string="";
  genero:string="";
  id_localidad:any=null;
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
