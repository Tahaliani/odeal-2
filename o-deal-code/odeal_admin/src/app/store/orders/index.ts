import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { Order } from 'src/app/models/Order';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class OrderStateModel {
  Orders: Array<Models.Document> = [];
}

export namespace Orders {
  /** Actions */
  export class Fetch {
    static readonly type = '[Order] FetchOrders';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[Order] AddOrder';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[Order] UpdateOrder';
    constructor(
      public payload: {
        documentId: string;
        data: Order;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[Order] DeleteOrder';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<OrderStateModel>({
  name: 'Order',
  defaults: {
    Orders: [],
  },
})
@Injectable()
export class OrderState {
  @Selector()
  static getOrders(state: OrderStateModel) {
    return state.Orders;
  }

  @Action(Orders.Fetch)
  async fetchOrders(
    { setState, dispatch }: StateContext<OrderStateModel>,
    action: Orders.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Orders = await Api.DB().listDocuments(
        environment.APP_DATABASE_ID,
        environment.ORDER_COLLECTION_ID,
        [
            // Query.equal("restaurant_id",data.restaurant_id)
        ]
      );
      setState({
        Orders: Orders.documents,
      });
    } catch (e: any) {
      // console.log('Failed to fetch Orders');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Orders.Add)
  async addOrder(
    { patchState, getState, dispatch }: StateContext<OrderStateModel>,
    action: Orders.Add
  ) {
    try {
      let { data } = action.payload;
      let Order = await Api.DB().createDocument(
        environment.APP_DATABASE_ID,
        environment.ORDER_COLLECTION_ID,
        'unique()',
        data
      );
      const Orders = getState().Orders;
      patchState({
        Orders: [...Orders, Order],
      });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new order!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add Order');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Orders.Update)
  async updateOrder(
    { patchState, getState, dispatch }: StateContext<OrderStateModel>,
    action: Orders.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedOrder = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.ORDER_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let OrderList = [...getState().Orders];
      const index = OrderList.findIndex(
        (Order) => Order.$id === updatedOrder.$id
      );
      if (index !== -1) {
        OrderList[index] = updatedOrder;
        patchState({
          Orders: OrderList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "Order Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update Order');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Orders.Delete)
  async deleteOrder(
    { patchState, getState, dispatch }: StateContext<OrderStateModel>,
    action: Orders.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.ORDER_COLLECTION_ID,
        documentId
      );
      let Orders = getState().Orders;
      Orders = Orders.filter((Order) => Order.$id !== documentId);
      patchState({
        Orders,
      });
    } catch (e: any) {
      // console.log('Failed to delete Order');
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