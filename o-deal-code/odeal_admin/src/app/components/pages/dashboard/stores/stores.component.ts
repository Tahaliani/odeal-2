import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Shop } from 'src/app/models/Shop';
import { ShopState, Shops } from 'src/app/store';

@Component({
  selector: 'app-stores',
  templateUrl: './stores.component.html',
  styleUrls: ['./stores.component.scss']
})
export class StoresComponent {

  addOfferForm: FormGroup;
  offerPop: boolean = false;
  public id:string = "";
  public name:string = "";


  @Select (ShopState.getShops) shops$: Observable<Shop[]> | undefined;
  constructor(private store:Store,private formBuilder: FormBuilder) {
    this.store.dispatch(new Shops.Fetch({"data":""}));

    
    this.addOfferForm = this.formBuilder.group({
      name: [''],
      address: [''],
      contact: [''],
      category: [''],
      image: [''],
      decoration_image: [''],
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

    this.store.dispatch(new Shops.Add({ data}));
    this.offerPop = !this.offerPop;
  }


}
