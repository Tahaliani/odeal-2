import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { User } from 'src/app/models/User';
import { UserState, Users } from 'src/app/store/users';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent {
  
  addOfferForm: FormGroup;
  offerPop: boolean = false;
  public id:string = "";
  public name:string = "";
  @Select (UserState.getUsers) users$: Observable<User[]> | undefined;
  constructor(private store:Store,private formBuilder: FormBuilder ) {
  
    this.store.dispatch(new Users.Fetch({"data":""}));
    
    this.addOfferForm = this.formBuilder.group({
      name: [''],
      email: [''],
      phone: [''],
      password: [''],
      role: ['']
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

    this.store.dispatch(new Users.Add({ data}));
    this.offerPop = !this.offerPop;
  }

}
