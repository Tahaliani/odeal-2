import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { Api } from './api';
import { Select } from '@ngxs/store';
import { AccountState, AccountStateModel } from '../store';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {

  loaded = false;
  account : any;
  
  @Select(AccountState) AccountState: Observable<AccountStateModel> | undefined;

  constructor(private router: Router) {
    this.AccountState?.subscribe(
      a => {
        
        // console.log(a.account);
        this.account = a;
        // this.isLoggedIn = a.isAuthenticated;
      }
    )
  }

  async canActivate(): Promise<boolean> {
    if(this.account.isAuthenticated ){
      return true;
    } 
    return await Api.Account().get()
      .then((isAuthenticated) => {
        if (!isAuthenticated) {
          this.router.navigate(['/login']);
          return false;
        } else {
          this.loaded = false;
          return true;
        }
      })
      .catch(() => {
        this.router.navigate(['/login']);
        return false;
      });
  }
}