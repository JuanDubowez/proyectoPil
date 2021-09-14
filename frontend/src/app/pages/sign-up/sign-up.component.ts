import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { Persona, ClienteService } from 'src/app/servicios/cliente.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  form: FormGroup;
  usuario: Persona = new Persona();

  constructor(private formBuilder: FormBuilder, private clienteService: ClienteService, private router: Router) { 
    this.form= this.formBuilder.group(
      {
        name:['',[Validators.required]],
        lastName: ['', [Validators.required]],
        nacimiento:['', [Validators.required]],
        dni:['', [Validators.required]],
        cuil:['', [Validators.required, Validators.minLength(10), Validators.maxLength(15)]],
        nacionalidad:['', [Validators.required]],
        sexo:['', [Validators.required]],
        localidad:['', [Validators.required]],
        mail:['', [Validators.required, Validators.email]],
        checkMail:['', [Validators.required, Validators.email]],
        contrasena:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
      }
    )
  }

  ngOnInit(): void {
  }

  onEnviar(event: Event, usuario:Persona): void
  {
    event.preventDefault;

    if (this.form.valid)
    {
      console.log(usuario);
      this.clienteService.onCrearRegistro(usuario).subscribe(
        data => {
          console.log(data);
      })
    }
    else
    {
      this.form.markAllAsTouched(); 
    }
  }

  get nameField() {
    return this.form.get("name");
  }

  get nameInvalid() {
    return this.nameField?.touched && !this.nameField.valid;
  }

  get lastNameField() {
    return this.form.get("lastName");
  }

  get lastNameInvalid() {
    return this.lastNameField?.touched && !this.lastNameField.valid;
  }

  get nacimientoField() {
    return this.form.get("nacimiento");
  }

  get nacimientoInvalid() {
    return this.nacimientoField?.touched && !this.nacimientoField.valid;
  }

  get dniField() {
    return this.form.get("dni");
  }

  get dniInvalid() {
    return this.dniField?.touched && !this.dniField.valid;
  }

  get cuilField() {
    return this.form.get("cuil");
  }

  get cuilInvalid() {
    return this.cuilField?.touched && !this.cuilField.valid;
  }

  get nacionalidadField() {
    return this.form.get("nacionalidad");
  }

  get nacionalidadInvalid() {
    return this.nacionalidadField?.touched && !this.nacionalidadField.valid;
  }

  get sexoField() {
    return this.form.get("sexo");
  }

  get sexoInvalid() {
    return this.sexoField?.touched && !this.sexoField.valid;
  }

  get localidadField() {
    return this.form.get("localidad");
  }

  get localidadInvalid() {
    return this.localidadField?.touched && !this.localidadField.valid;
  }

  get mailField() {
    return this.form.get("mail");
  }

  get mailInvalid() {
    return this.mailField?.touched && !this.mailField.valid;
  }

  get checkMailField() {
    return this.form.get("checkMail");
  }

  checkMailDifferent () {
    let result;
    if (this.mailField != this.checkMailField) {
      result = true;
    }
    else {
      result = false; 
    }
    return result;
  }

  get passField() {
    return this.form.get("contrasena");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

}
