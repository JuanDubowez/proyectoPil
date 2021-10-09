import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/servicios/Auth/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  alert:boolean=false;
  mostrarMenu:boolean=false;
  estaAutenticado:boolean=false;
  constructor(private router: Router,
              private _variableSrv:DataService,
              private authService: AuthService) { }

  ngOnInit(): void {
    this.mostrar();
    this.authService.estaAutenticado.subscribe(res=>( this.estaAutenticado=res));
  }
alertActivado(){
this.alert==!this.alert;
}

mostrar(){
  this._variableSrv.bLoggin.subscribe(
    v=>this.mostrarMenu = v
  );
}

}
