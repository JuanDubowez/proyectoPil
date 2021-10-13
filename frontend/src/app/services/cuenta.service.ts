import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Operacion } from '../servicios/cliente.service';

@Injectable({
  providedIn: 'root'
})
export class CuentaService {
  url="https://localhost:44332/api/cuenta";
  url7="https://localhost:44332/api/Cuenta?id_cliente=";
  url8="https://localhost:44332/api/Cuenta?id_cuenta=";
  url9="https://localhost:44332/api/Cuenta?cvu=";
  url10="https://localhost:44332/api/Operacion";
  url11="https://localhost:44332/api/Cuenta?id_c=";

  constructor(private http:HttpClient) { }


  ObtenerOperaciones(id_cuenta:number)
  {
    return this.http.get<any>(this.url8+id_cuenta.toString());
  }

  ObtenerCuentaCliente(id:number){
    return this.http.get<any>(this.url7+id.toString());
  }

  ObtenerCuentaCvu(cvu:string){
    return this.http.get<any>(this.url9+cvu);
  }

  ObtenerCuentaIdCliente(id_cliente:number){
    return this.http.get<any>(this.url11+id_cliente);
  }

  InsertarOperacion(operacion:Operacion):Observable<any>{
    return this.http.post<Operacion>(this.url10, operacion);
  }

}
