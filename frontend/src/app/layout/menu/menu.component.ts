import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/servicios/Auth/auth.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {
  myClass :boolean=false;
  estaAutenticado:boolean=false;
  constructor(public dataService:DataService,
              private authService: AuthService,
              private router: Router) { }

  ngOnInit(): void {
  this.cambiar();
  this.authService.estaAutenticado.subscribe(res=>( this.estaAutenticado=res));
  }
// servicio para mostrar u ocultar menu
cambiar(){
  this.dataService.bLoggin.subscribe(
    v=>this.myClass = v
  );
}
// logica para abrir menu
openNav() {
 let doc=document.getElementById("mySidebar");
 let doc1=document.getElementById("main");
 if(doc!==null && doc1!==null){
  doc.style.width = "313px";
  doc1.style.marginLeft = "250px";
 }

}
// logica para cerrar menu
 closeNav() {
  let doc=  document.getElementById("mySidebar");
  let doc1= document.getElementById("main");
  if(doc!==null && doc1!==null){
    doc.style.width = "0";
    doc1.style.marginLeft= "0";
  }
 }


 onCerrarSesion(){
  this.authService.logOut();
  this.estaAutenticado=false;
  this.router.navigate(['']);
}

}
