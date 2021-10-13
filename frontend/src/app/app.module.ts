import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { PagesModule } from './pages/pages.module';
import { ClienteService } from './servicios/cliente.service';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { LocalidadService } from './servicios/localidad.service';
import { FormsModule } from '@angular/forms';
import { DataService } from './services/data.service';
import { JwtInterceptor } from './servicios/Auth/interceptor.service';
import { ErrorInterceptor } from './servicios/Auth/error.service';
import { CuentaService } from './services/cuenta.service';
import { RouterModule } from '@angular/router';
import { SaldoComponent } from './pages/saldo/saldo.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    PagesModule,
    HttpClientModule,
    FormsModule,
    RouterModule
  ],
  providers: [ClienteService,LocalidadService,DataService,CuentaService,ClienteService,
   { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
   { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },],
  bootstrap: [AppComponent]
})
export class AppModule { }
