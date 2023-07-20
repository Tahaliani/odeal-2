import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { Product } from 'src/app/models/Product';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class ProductStateModel {
  Products: Array<Models.Document> = [];
}

export namespace Products {
  /** Actions */
  export class Fetch {
    static readonly type = '[Product] FetchProducts';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[Product] AddProduct';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[Product] UpdateProduct';
    constructor(
      public payload: {
        documentId: string;
        data: Product;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[Product] DeleteProduct';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<ProductStateModel>({
  name: 'Product',
  defaults: {
    Products: [],
  },
})
@Injectable()
export class ProductState {
  @Selector()
  static getProducts(state: ProductStateModel) {
    return state.Products;
  }

  @Action(Products.Fetch)
  async fetchProducts(
    { setState, dispatch }: StateContext<ProductStateModel>,
    action: Products.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Products = await Api.DB().listDocuments(
        environment.APP_DATABASE_ID,
        environment.PRODUCT_COLLECTION_ID,
        [
            // Query.equal("restaurant_id",data.restaurant_id)
        ]
      );
      setState({
        Products: Products.documents,
      });
    } catch (e: any) {
      // console.log('Failed to fetch Products');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Products.Add)
  async addProduct(
    { patchState, getState, dispatch }: StateContext<ProductStateModel>,
    action: Products.Add
  ) {
    try {
      let { data } = action.payload;
      let Product = await Api.DB().createDocument(
        environment.APP_DATABASE_ID,
        environment.PRODUCT_COLLECTION_ID,
        'unique()',
        data
      );
      const Products = getState().Products;
      patchState({
        Products: [...Products, Product],
      });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new product!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add Product');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Products.Update)
  async updateProduct(
    { patchState, getState, dispatch }: StateContext<ProductStateModel>,
    action: Products.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedProduct = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.PRODUCT_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let ProductList = [...getState().Products];
      const index = ProductList.findIndex(
        (Product) => Product.$id === updatedProduct.$id
      );
      if (index !== -1) {
        ProductList[index] = updatedProduct;
        patchState({
          Products: ProductList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "Product Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update Product');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Products.Delete)
  async deleteProduct(
    { patchState, getState, dispatch }: StateContext<ProductStateModel>,
    action: Products.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.PRODUCT_COLLECTION_ID,
        documentId
      );
      let Products = getState().Products;
      Products = Products.filter((Product) => Product.$id !== documentId);
      patchState({
        Products,
      });
    } catch (e: any) {
      // console.log('Failed to delete Product');
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