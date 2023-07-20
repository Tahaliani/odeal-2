import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/pages/auth/login/login.component';
import { DashboardComponent } from './components/pages/dashboard/dashboard/dashboard.component';
import { AuthGuard } from './helpers/auth-guard.guard';
import { UsersComponent } from './components/pages/dashboard/users/users.component';
import { StoresComponent } from './components/pages/dashboard/stores/stores.component';
import { ProductsComponent } from './components/pages/dashboard/products/products.component';
import { OffersComponent } from './components/pages/dashboard/offers/offers.component';
import { OrdersComponent } from './components/pages/dashboard/orders/orders.component';
import { ReviewsComponent } from './components/pages/dashboard/reviews/reviews.component';

const routes: Routes = [
  { path: '', component: LoginComponent, pathMatch: 'full',title:"Login - O'Deal"},
  { path: 'dashboard', component: DashboardComponent, pathMatch: 'full',title:"Dashboard - O'Deal" , canActivate: [AuthGuard] },
  { path: 'users', component: UsersComponent, pathMatch: 'full',title:"Users - O'Deal" , canActivate: [AuthGuard] },
  { path: 'stores', component: StoresComponent, pathMatch: 'full',title:"Stores - O'Deal" , canActivate: [AuthGuard] },
  { path: 'products', component: ProductsComponent, pathMatch: 'full',title:"Products - O'Deal" , canActivate: [AuthGuard] },
  { path: 'offers', component: OffersComponent, pathMatch: 'full',title:"Offers - O'Deal" , canActivate: [AuthGuard] },
  { path: 'orders', component: OrdersComponent, pathMatch: 'full',title:"Orders - O'Deal" , canActivate: [AuthGuard] },
  { path: 'reviews', component: ReviewsComponent, pathMatch: 'full',title:"Reviews - O'Deal" , canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
