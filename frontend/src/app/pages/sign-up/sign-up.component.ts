import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder) { 
    this.form= this.formBuilder.group(
      {
        name:['',[Validators.required]],
        lastName: ['', [Validators.required]],
        dni:['', [Validators.required, Validators.minLength(7), Validators.maxLength(8)]],
        sexo:['', [Validators.required]],
        nacionalidad:['', [Validators.required]],
        nacimiento:['', [Validators.required]],
        telefono:['', [Validators.required]],
        mail:['', [Validators.required, Validators.email]],
        checkMail:['', [Validators.required, Validators.email]],
        contrasena:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]]
      }
    )
  }

  ngOnInit(): void {
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

  get dniField() {
    return this.form.get("dni");
  }

  get dniInvalid() {
    return this.dniField?.touched && !this.dniField.valid;
  }

  get nacionalidadField() {
    return this.form.get("nacionalidad");
  }

  get nacionalidadInvalid() {
    return this.nacionalidadField?.touched && !this.nacionalidadField.valid;
  }

  get telefonoField() {
    return this.form.get("telefono");
  }

  get telefonoInvalid() {
    return this.telefonoField?.touched && !this.telefonoField.valid;
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


  onEnviar(event: Event)
  {
    event.preventDefault();
    if (this.form.valid)
    {
      console.log(this.form.value); 
    }
    else
    {
      this.form.markAllAsTouched(); 
    }
  }

}
