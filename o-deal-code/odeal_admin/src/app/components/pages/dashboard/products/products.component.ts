import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Product } from 'src/app/models/Product';
import { Shop } from 'src/app/models/Shop';
import { ProductState, Products, ShopState, Shops } from 'src/app/store';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.scss']
})
export class ProductsComponent {

  addOfferForm: FormGroup;
  offerPop: boolean = false;
  public id:string = "";
  public name:string = "";

  @Select (ShopState.getShops) shops$: Observable<Shop[]> | undefined;
  @Select (ProductState.getProducts) products$: Observable<Product[]> | undefined;
  constructor(private store:Store,private formBuilder: FormBuilder) {
  
    this.store.dispatch(new Shops.Fetch({"data":""}));
    this.store.dispatch(new Products.Fetch({"data":""}));
    
    this.addOfferForm = this.formBuilder.group({
      store: [''],
      name: [''],
      description: [''],
      image:[''],
      price:[''],
      offerPrice:[''],
    });
  }

  

  addOfferPop(){
    this.offerPop = !this.offerPop;
  }

  addOffer(){
    const data = {
      name: this.addOfferForm.value.name,
      description: this.addOfferForm.value.description,
      restaurant_id: this.id,
    }

    this.store.dispatch(new Products.Add({ data}));
    this.offerPop = !this.offerPop;
  }

  
}
