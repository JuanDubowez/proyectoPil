import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/servicios/Auth/auth.service';
import { LoginRequest } from 'src/app/servicios/cliente.service';
import {FormsModule} from '@angular/forms';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})

export class LoginComponent {
  loginForm: FormGroup;
  fieldTextType:boolean=false;
  usuario:LoginRequest=new LoginRequest;
  error?:string;

  constructor(private dataService:DataService,
              private  router:Router,
              private formBuilder: FormBuilder,
              private authService:AuthService) {

    this.loginForm = this.formBuilder.group({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required,Validators.minLength(8), Validators.maxLength(15)]),
    });
  }


  ngOnInit(): void {
  }

  onSubmit() {
    if (this.loginForm.valid) {
      console.log(this._v());
    }
  }
  _v() {
    return this.loginForm.value;
  }

  get passField() {
    return this.loginForm.get("password");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

  cambiarEstado(){
    //this.dataService.bLoggin.next(true);
  }

  ocultarPass(){
    this.fieldTextType = !this.fieldTextType;
  }

  onEnviar(event: Event, usuario: LoginRequest)
  {
    event.preventDefault(); //Cancela la funcionalidad por default.
    if (this.loginForm.valid)
    {
      console.log(this.loginForm.value); //se puede enviar al servidor...
      this.authService.login(this.usuario)
      .subscribe(
        data => {
        console.log("DATA"+ JSON.stringify( data));
        localStorage.setItem('auth-token', JSON.stringify(data));

        this.router.navigate(['mi-billetera/home']);

        },
        error => {
         this.error = error;
        }
      );
    }
    else
    {
      this.loginForm.markAllAsTouched(); //Activa todas las validaciones
    }
  }
}
