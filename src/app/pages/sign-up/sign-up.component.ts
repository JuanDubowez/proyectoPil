import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  mail=new FormControl('', [Validators.required, Validators.email]);
  password=new FormControl('',[Validators.required, Validators.minLength(8)]);

  constructor() { }

  ngOnInit(): void {
  }

}
