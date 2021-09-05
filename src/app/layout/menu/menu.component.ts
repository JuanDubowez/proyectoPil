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
  }

cambiar(){
  this.myClass=!this.myClass;
  // this.dataService.menuEnabled=this.myClass;
}

openNav() {
 let doc=document.getElementById("mySidebar");
 let doc1=document.getElementById("main");
 if(doc!==null && doc1!==null){
  doc.style.width = "313px";
  doc1.style.marginLeft = "250px";
 }

}

 closeNav() {
  let doc=  document.getElementById("mySidebar");
  let doc1= document.getElementById("main");
  if(doc!==null && doc1!==null){
    doc.style.width = "0";
    doc1.style.marginLeft= "0";
  }
 }


}
