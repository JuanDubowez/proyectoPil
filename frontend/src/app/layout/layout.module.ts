import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './navbar/navbar.component';
import { AppRoutingModule } from '../app-routing.module';
import { FooterComponent } from './footer/footer.component';
import { MenuComponent } from './menu/menu.component';



@NgModule({
  declarations: [
    NavbarComponent,
    FooterComponent,
    MenuComponent
  ],
  imports: [
    CommonModule, AppRoutingModule
  ],
  exports: [NavbarComponent, FooterComponent,MenuComponent]
})
export class LayoutModule { }
