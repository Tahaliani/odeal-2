import { Component } from '@angular/core';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Order } from 'src/app/models/Order';
import { Product } from 'src/app/models/Product';
import { Shop } from 'src/app/models/Shop';
import { OrderState, Orders, ProductState, Products, ShopState, Shops } from 'src/app/store';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.scss']
})
export class OrdersComponent {

  @Select (OrderState.getOrders) orders$: Observable<Order[]> | undefined;
  @Select (ShopState.getShops) shops$: Observable<Shop[]> | undefined;
  @Select (ProductState.getProducts) products$: Observable<Product[]> | undefined;
  constructor(private store:Store) {
  
    this.store.dispatch(new Orders.Fetch({"data":""}));
    this.store.dispatch(new Shops.Fetch({"data":""}));
    this.store.dispatch(new Products.Fetch({"data":""}));
  }

}
