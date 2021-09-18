import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { PagesModule } from './pages/pages.module';
import { ClienteService } from './servicios/cliente.service';
import { HttpClientModule } from '@angular/common/http';
import { LocalidadService } from './servicios/localidad.service';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    PagesModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [ClienteService,LocalidadService],
  bootstrap: [AppComponent]
})
export class AppModule { }
