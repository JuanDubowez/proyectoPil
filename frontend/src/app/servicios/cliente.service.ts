import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  url="https://localhost:44332/api/Cliente";

  constructor(private http:HttpClient) { }

  onCrearRegistro(usuario:Persona):Observable<Persona>{
    return this.http.post<Persona>(this.url, usuario);
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
