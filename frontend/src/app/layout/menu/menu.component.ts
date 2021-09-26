import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/services/data.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {
  myClass :boolean=false;
  constructor(public dataService:DataService) { }

  ngOnInit(): void {
  this.cambiar();
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


}
