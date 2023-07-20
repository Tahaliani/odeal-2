import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { Shop } from 'src/app/models/Shop';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class ShopStateModel {
  Shops: Array<Models.Document> = [];
}

export namespace Shops {
  /** Actions */
  export class Fetch {
    static readonly type = '[Shop] FetchShops';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[Shop] AddShop';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[Shop] UpdateShop';
    constructor(
      public payload: {
        documentId: string;
        data: Shop;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[Shop] DeleteShop';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<ShopStateModel>({
  name: 'Shop',
  defaults: {
    Shops: [],
  },
})
@Injectable()
export class ShopState {
  @Selector()
  static getShops(state: ShopStateModel) {
    return state.Shops;
  }

  @Action(Shops.Fetch)
  async fetchShops(
    { setState, dispatch }: StateContext<ShopStateModel>,
    action: Shops.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Shops = await Api.DB().listDocuments(
        environment.APP_DATABASE_ID,
        environment.SHOP_COLLECTION_ID,
        [
            // Query.equal("restaurant_id",data.restaurant_id)
        ]
      );
      setState({
        Shops: Shops.documents,
      });
    } catch (e: any) {
      // console.log('Failed to fetch Shops');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Shops.Add)
  async addShop(
    { patchState, getState, dispatch }: StateContext<ShopStateModel>,
    action: Shops.Add
  ) {
    try {
      let { data } = action.payload;
      let Shop = await Api.DB().createDocument(
        environment.APP_DATABASE_ID,
        environment.SHOP_COLLECTION_ID,
        'unique()',
        data
      );
      const Shops = getState().Shops;
      patchState({
        Shops: [...Shops, Shop],
      });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new product!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add Shop');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Shops.Update)
  async updateShop(
    { patchState, getState, dispatch }: StateContext<ShopStateModel>,
    action: Shops.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedShop = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.SHOP_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let ShopList = [...getState().Shops];
      const index = ShopList.findIndex(
        (Shop) => Shop.$id === updatedShop.$id
      );
      if (index !== -1) {
        ShopList[index] = updatedShop;
        patchState({
          Shops: ShopList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "Shop Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update Shop');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Shops.Delete)
  async deleteShop(
    { patchState, getState, dispatch }: StateContext<ShopStateModel>,
    action: Shops.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.SHOP_COLLECTION_ID,
        documentId
      );
      let Shops = getState().Shops;
      Shops = Shops.filter((Shop) => Shop.$id !== documentId);
      patchState({
        Shops,
      });
    } catch (e: any) {
      // console.log('Failed to delete Shop');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }
}