import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LandingPageComponent } from './pages/landing-page/landing-page.component';
import { LoginComponent } from './pages/login/login.component';
import { MibilleteraComponent } from './pages/mibilletera/mibilletera.component';
import { MovimientosComponent } from './pages/movimientos/movimientos.component';
import { ProfileComponent } from './pages/profile/profile.component';
import { SaldoComponent } from './pages/saldo/saldo.component';
import { SignUpComponent } from './pages/sign-up/sign-up.component';
import { AuthGuard } from './servicios/Auth/auth.guard';

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: 'mi-billetera', component: MibilleteraComponent,  canActivate: [AuthGuard],
  children:[
  {path: 'home', component: HomeComponent},
  {path:'movimientos', component: MovimientosComponent},
  {path: 'profile', component: ProfileComponent},
  {path:'saldo',component:SaldoComponent},
]},
  {path: 'sign-up', component: SignUpComponent},
  {path: '', component: LandingPageComponent},
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
