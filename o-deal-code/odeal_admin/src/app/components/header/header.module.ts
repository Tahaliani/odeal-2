import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header.component';
import { AppRoutingModule } from 'src/app/app-routing.module';
import { MatIconModule } from '@angular/material/icon';



@NgModule({
  declarations: [
    HeaderComponent
  ],
  imports: [
    MatIconModule,
    CommonModule,
    AppRoutingModule,
  ],
  exports:[
    HeaderComponent
  ]
})
export class HeaderModule { }
