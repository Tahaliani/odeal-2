import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Offer } from 'src/app/models/Offer';
import { Product } from 'src/app/models/Product';
import { Shop } from 'src/app/models/Shop';
import { OfferState, Offers, ProductState, Products, ShopState, Shops } from 'src/app/store';

@Component({
  selector: 'app-offers',
  templateUrl: './offers.component.html',
  styleUrls: ['./offers.component.scss']
})
export class OffersComponent {

  addOfferForm: FormGroup;
  offerPop: boolean = false;
  public id:string = "";
  public name:string = "";


  @Select (OfferState.getOffers) offers$: Observable<Offer[]> | undefined;
  @Select (ShopState.getShops) shops$: Observable<Shop[]> | undefined;
  @Select (ProductState.getProducts) products$: Observable<Product[]> | undefined;
  constructor(private store:Store,private formBuilder: FormBuilder ) {
  
    this.store.dispatch(new Shops.Fetch({"data":""}));
    this.store.dispatch(new Offers.Fetch({"data":""}));
    this.store.dispatch(new Products.Fetch({"data":""}));

    this.addOfferForm = this.formBuilder.group({
      store: [''],
      name: [''],
      description: [''],
      discount: [''],
      discount_type:[''],
      other_offer:[''],
      start_time:[''],
      start_date:[''],
      end_time:[''],
      end_date:[''],
      weekdays:[''],
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

    this.store.dispatch(new Offers.Add({ data}));
    this.offerPop = !this.offerPop;
  }

  
}
