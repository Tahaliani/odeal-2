import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Select, Store } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { Account, AccountState, AccountStateModel } from 'src/app/store';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  loginForm: FormGroup;
  @Select(AccountState) AccountState: Observable<AccountStateModel> | undefined;
  isLoggedIn: boolean = false;

  constructor(private formBuilder: FormBuilder, private store: Store, private router: Router) {
    
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required,Validators.minLength(8)]],
    });

    this.AccountState?.subscribe(
      a => {
        this.isLoggedIn = a.isAuthenticated;
        // console.log(this.isLoggedIn);
        if (this.isLoggedIn) {
          this.router.navigate(['dashboard']);
        }
      }
    ) 
  }

  ngOnInit() {
    this.loginForm.updateValueAndValidity()
  }

  handleLogin() {
    // console.log("Logging in", this.loginForm.value);
    let payload = {
      email : this.loginForm.value.email,
      password: this.loginForm.value.password
    }
    this.store.dispatch(new Account.Login(payload))
  }
}
