import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  formu: FormGroup;


  constructor(private formBuilder: FormBuilder,) {
    this.formu= this.formBuilder.group(
      {
        name:['',[Validators.required]],
        lastName: ['', [Validators.required]],
        nacimiento:['', [Validators.required]],
        dni:['', [Validators.required]],
        cuil:['', [Validators.required, Validators.minLength(10), Validators.maxLength(15)]],
        mail:['', [Validators.required, Validators.email]],
        checkMail:['', [Validators.required, Validators.email]],
        contrasena:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
      }
    )
  }

  ngOnInit(): void {
  }

  get nameField() {
    return this.formu.get("name");
  }

  get nameInvalid() {
    return this.nameField?.touched && !this.nameField.valid;
  }

  get lastNameField() {
    return this.formu.get("lastName");
  }

  get lastNameInvalid() {
    return this.lastNameField?.touched && !this.lastNameField.valid;
  }

  get nacimientoField() {
    return this.formu.get("nacimiento");
  }

  get nacimientoInvalid() {
    return this.nacimientoField?.touched && !this.nacimientoField.valid;
  }

  get dniField() {
    return this.formu.get("dni");
  }

  get dniInvalid() {
    return this.dniField?.touched && !this.dniField.valid;
  }
}
