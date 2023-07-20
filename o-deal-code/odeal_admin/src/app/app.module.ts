import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/pages/auth/login/login.component';
import {MatIconModule} from '@angular/material/icon';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppState } from './store';
import { NgxsModule } from '@ngxs/store';
import { environment } from 'src/environments/environment';
import { DashboardComponent } from './components/pages/dashboard/dashboard/dashboard.component';
import { HeaderModule } from './components/header/header.module';
import { UsersComponent } from './components/pages/dashboard/users/users.component';
import { StoresComponent } from './components/pages/dashboard/stores/stores.component';
import { ProductsComponent } from './components/pages/dashboard/products/products.component';
import { OffersComponent } from './components/pages/dashboard/offers/offers.component';
import { OrdersComponent } from './components/pages/dashboard/orders/orders.component';
import { ReviewsComponent } from './components/pages/dashboard/reviews/reviews.component';
import { AlertComponent } from './components/alert/alert.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    UsersComponent,
    StoresComponent,
    ProductsComponent,
    OffersComponent,
    OrdersComponent,
    ReviewsComponent,
    AlertComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    MatIconModule,
    HttpClientModule,
    NgxsModule.forRoot(AppState, {
      developmentMode: !environment.production
    }),
    HeaderModule
  ],  
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
