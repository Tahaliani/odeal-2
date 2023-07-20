import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Actions, Select, Store } from '@ngxs/store';
import { Observable, of } from 'rxjs';
import { Account, Alert, GlobalState } from './store';

@Component({
  selector: 'app-root',
  template: '<router-outlet></router-outlet>\
  <app-alert *ngIf="(alert | async)?.show" [alert]="alert | async"></app-alert>\
',
  styleUrls: []
})
export class AppComponent {
  title = 'sizifi-fashion-web';
  loading$: Observable<boolean> = of(false);
  
  @Select(GlobalState.getAlert) alert: Observable<Alert> | undefined;
  
  constructor(private actions: Actions, private store: Store,private route: ActivatedRoute, private router: Router) {
    this.store.dispatch(new Account.FetchAccount());
  }

}
