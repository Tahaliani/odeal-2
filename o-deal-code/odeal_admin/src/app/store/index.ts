// Inside the root 'index.ts' file of our store, eg - store/index.ts
import { GlobalState } from './global'
import { AccountState } from './account';
import { OfferState } from './offers';
import { OrderState } from './orders';
import { ProductState } from './products';
import { ReviewState } from './reviews';
import { ShopState } from './shops';
import { UserState } from './users';


// Still allow other modules to take what they need, eg action & selectors
export * from './account';
export * from './global'
export * from './offers'
export * from './orders'
export * from './products'
export * from './reviews'
export * from './shops'


// rolls up our states into one const
export const AppState = [AccountState, GlobalState, OfferState,OrderState,ProductState,ReviewState,ShopState,UserState];