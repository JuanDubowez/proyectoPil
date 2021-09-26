import { EventEmitter, Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
menuEnabled :boolean=false;
bandera$=new EventEmitter<boolean>(); //observable
public bLoggin =new BehaviorSubject(false);
  constructor() { }
}
