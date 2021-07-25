import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LandingPageComponent } from './landing-page/landing-page.component';


@NgModule({
  declarations: [
    LoginComponent,
    SignUpComponent,
    LandingPageComponent
  ],
  imports: [
    CommonModule, FormsModule, ReactiveFormsModule,
  ]
})
export class PagesModule { }

