import { Component } from '@angular/core';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Offer } from 'src/app/models/Offer';
import { Order } from 'src/app/models/Order';
import { Product } from 'src/app/models/Product';
import { Shop } from 'src/app/models/Shop';
import { User } from 'src/app/models/User';
import { OfferState, Offers, OrderState, Orders, ProductState, Products, ShopState, Shops } from 'src/app/store';
import { UserState, Users } from 'src/app/store/users';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent {


  @Select (OrderState.getOrders) orders$: Observable<Order[]> | undefined;
  @Select (OfferState.getOffers) offers$: Observable<Offer[]> | undefined;
  @Select (ShopState.getShops) shops$: Observable<Shop[]> | undefined;
  @Select (ProductState.getProducts) products$: Observable<Product[]> | undefined;
  @Select (UserState.getUsers) users$: Observable<User[]> | undefined;
  constructor(private store:Store) {
  
    this.store.dispatch(new Orders.Fetch({"data":""}));
    this.store.dispatch(new Shops.Fetch({"data":""}));
    this.store.dispatch(new Offers.Fetch({"data":""}));
    this.store.dispatch(new Products.Fetch({"data":""}));
    this.store.dispatch(new Users.Fetch({"data":""}));
  }

}
