import { Injectable } from '@angular/core';
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest ,HttpHeaders} from '@angular/common/http';

import { Observable } from 'rxjs';
import { AuthService } from './Auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class JwtInterceptor implements HttpInterceptor{

  constructor( private authService:AuthService) {

  }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = this.authService.usuarioAutenticado.Token;
    debugger
    console.log("INTERCEPTOR WORKING");

    if(token) {
      req = req.clone({
        setHeaders:{
          'Authorization':  `Bearer ${token}`
        }
      });
    }
    console.log('headers:', req.headers);
    return next.handle(req);
  }

}
