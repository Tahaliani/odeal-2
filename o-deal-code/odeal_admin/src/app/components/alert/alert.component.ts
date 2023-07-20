import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngxs/store';
import { Alert, GlobalActions, GlobalState } from 'src/app/store';

@Component({
  selector: 'app-alert',
  templateUrl: './alert.component.html',
  styleUrls: ['./alert.component.scss'],
})
export class AlertComponent implements OnInit, OnDestroy {
  @Input() alert: Alert | null | undefined;
  timeout: any = null;

  constructor(private store: Store) {}

  ngOnInit(): void {
    this.timeout = setTimeout(() => {
      this.store.dispatch(
        new GlobalActions.setAlert({ show: false })
      );
    }, 3000);
  }

  update(){
    if(this.alert?.timeout == false){
      this.alert.update;
    }
  }

  dismissAlert() {
    this.store.dispatch(
      new GlobalActions.setAlert({ show: false })
    );

    this.timeout && clearTimeout(this.timeout);
  }

  ngOnDestroy(): void {
    clearTimeout(this.timeout);
  }
}
