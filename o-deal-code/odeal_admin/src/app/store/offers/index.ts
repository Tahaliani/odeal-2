import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { Offer } from 'src/app/models/Offer';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class OfferStateModel {
  Offers: Array<Models.Document> = [];
}

export namespace Offers {
  /** Actions */
  export class Fetch {
    static readonly type = '[Offer] FetchOffers';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[Offer] AddOffer';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[Offer] UpdateOffer';
    constructor(
      public payload: {
        documentId: string;
        data: Offer;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[Offer] DeleteOffer';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<OfferStateModel>({
  name: 'Offer',
  defaults: {
    Offers: [],
  },
})
@Injectable()
export class OfferState {
  @Selector()
  static getOffers(state: OfferStateModel) {
    return state.Offers;
  }

  @Action(Offers.Fetch)
  async fetchOffers(
    { setState, dispatch }: StateContext<OfferStateModel>,
    action: Offers.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Offers = await Api.DB().listDocuments(
        environment.APP_DATABASE_ID,
        environment.OFFER_COLLECTION_ID,
        [
            // Query.equal("restaurant_id",data.restaurant_id)
        ]
      );
      setState({
        Offers: Offers.documents,
      });
    } catch (e: any) {
      // console.log('Failed to fetch Offers');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Offers.Add)
  async addOffer(
    { patchState, getState, dispatch }: StateContext<OfferStateModel>,
    action: Offers.Add
  ) {
    try {
      let { data } = action.payload;
      let Offer = await Api.DB().createDocument(
        environment.APP_DATABASE_ID,
        environment.OFFER_COLLECTION_ID,
        'unique()',
        data
      );
      const Offers = getState().Offers;
      patchState({
        Offers: [...Offers, Offer],
      });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new offer!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add Offer');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Offers.Update)
  async updateOffer(
    { patchState, getState, dispatch }: StateContext<OfferStateModel>,
    action: Offers.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedOffer = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.OFFER_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let OfferList = [...getState().Offers];
      const index = OfferList.findIndex(
        (Offer) => Offer.$id === updatedOffer.$id
      );
      if (index !== -1) {
        OfferList[index] = updatedOffer;
        patchState({
          Offers: OfferList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "Offer Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update Offer');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Offers.Delete)
  async deleteOffer(
    { patchState, getState, dispatch }: StateContext<OfferStateModel>,
    action: Offers.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.OFFER_COLLECTION_ID,
        documentId
      );
      let Offers = getState().Offers;
      Offers = Offers.filter((Offer) => Offer.$id !== documentId);
      patchState({
        Offers,
      });
    } catch (e: any) {
      // console.log('Failed to delete Offer');
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