import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  alert:boolean=false;
  mostrarMenu:boolean=false;
  constructor(private router: Router,
              private _variableSrv:DataService) { }

  ngOnInit(): void {
    this.mostrar();
  }
alertActivado(){
this.alert==!this.alert;
}

mostrar(){
  this._variableSrv.bLoggin.subscribe(
    v=>this.mostrarMenu = v
  );
  console.log(this.mostrarMenu);
}
logout(){
  this._variableSrv.bLoggin.next(true);
  console.log( this._variableSrv.bLoggin);
}

}
