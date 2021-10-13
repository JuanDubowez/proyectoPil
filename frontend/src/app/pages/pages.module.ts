import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LandingPageComponent } from './landing-page/landing-page.component';
import { HomeComponent } from './home/home.component';
import { MovimientosComponent } from './movimientos/movimientos.component';
import { ProfileComponent } from './profile/profile.component';
import { SaldoComponent } from './saldo/saldo.component';
import { MibilleteraComponent } from './mibilletera/mibilletera.component';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
    LoginComponent,
    SignUpComponent,
    LandingPageComponent,
    HomeComponent,
    MovimientosComponent,
    ProfileComponent,
    MibilleteraComponent,
    SaldoComponent,
  ],
  imports: [
    CommonModule, FormsModule, ReactiveFormsModule, RouterModule
  ],
  exports: [HomeComponent,LoginComponent, SignUpComponent, LandingPageComponent, MovimientosComponent, ProfileComponent, MibilleteraComponent]
})
export class PagesModule { }

