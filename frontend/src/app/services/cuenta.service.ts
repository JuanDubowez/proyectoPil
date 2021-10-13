import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CuentaService {
  url="https://localhost:44332/api/cuenta";
  url7="https://localhost:44332/api/Cuenta?id_cliente=";
  url8="https://localhost:44332/api/Cuenta?id_cuenta=";
  constructor(private http:HttpClient) { }


  ObtenerOperaciones(id_cuenta:number)
  {
    return this.http.get<any>(this.url8+id_cuenta.toString());
  }

  ObtenerCuentaCliente(id:number){
    return this.http.get<any>(this.url7+id.toString());
  }


}
