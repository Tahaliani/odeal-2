import { Component } from '@angular/core';
import { Store } from '@ngxs/store';
import { Account } from 'src/app/store';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {

  constructor(private store: Store) {}
  
  public logout() {
    this.store.dispatch(new Account.Logout());
  }

}
