import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-movimientos',
  templateUrl: './movimientos.component.html',
  styleUrls: ['./movimientos.component.css']
})
export class MovimientosComponent implements OnInit {
  movimientos: string = "";
  fechas: string[];
  hoy = new Date();
  monto: string[];
  motivo: string[];
  hora: string[];
  @Input() montos : string;
  constructor() { 
    this.fechas =['13/09/20','19/09/20', '20/09/20']
    this.monto = ['-500','600','300']
    this.hora =['15:40', '20:14', '21:30']
    this.motivo = ['Transferencia','Deposito','deposito']
    this.montos ="500";
  }

  ngOnInit(): void {
  }
}
