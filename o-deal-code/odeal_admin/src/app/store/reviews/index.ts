import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { Review } from 'src/app/models/Review';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class ReviewStateModel {
  Reviews: Array<Models.Document> = [];
}

export namespace Reviews {
  /** Actions */
  export class Fetch {
    static readonly type = '[Review] FetchReviews';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[Review] AddReview';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[Review] UpdateReview';
    constructor(
      public payload: {
        documentId: string;
        data: Review;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[Review] DeleteReview';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<ReviewStateModel>({
  name: 'Review',
  defaults: {
    Reviews: [],
  },
})
@Injectable()
export class ReviewState {
  @Selector()
  static getReviews(state: ReviewStateModel) {
    return state.Reviews;
  }

  @Action(Reviews.Fetch)
  async fetchReviews(
    { setState, dispatch }: StateContext<ReviewStateModel>,
    action: Reviews.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Reviews = await Api.DB().listDocuments(
        environment.APP_DATABASE_ID,
        environment.REVIEW_COLLECTION_ID,
        [
            // Query.equal("restaurant_id",data.restaurant_id)
        ]
      );
      setState({
        Reviews: Reviews.documents,
      });
    } catch (e: any) {
      // console.log('Failed to fetch Reviews');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Reviews.Add)
  async addReview(
    { patchState, getState, dispatch }: StateContext<ReviewStateModel>,
    action: Reviews.Add
  ) {
    try {
      let { data } = action.payload;
      let Review = await Api.DB().createDocument(
        environment.APP_DATABASE_ID,
        environment.REVIEW_COLLECTION_ID,
        'unique()',
        data
      );
      const Reviews = getState().Reviews;
      patchState({
        Reviews: [...Reviews, Review],
      });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new review!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add Review');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Reviews.Update)
  async updateReview(
    { patchState, getState, dispatch }: StateContext<ReviewStateModel>,
    action: Reviews.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedReview = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.REVIEW_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let ReviewList = [...getState().Reviews];
      const index = ReviewList.findIndex(
        (Review) => Review.$id === updatedReview.$id
      );
      if (index !== -1) {
        ReviewList[index] = updatedReview;
        patchState({
          Reviews: ReviewList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "Review Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update Review');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Reviews.Delete)
  async deleteReview(
    { patchState, getState, dispatch }: StateContext<ReviewStateModel>,
    action: Reviews.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.REVIEW_COLLECTION_ID,
        documentId
      );
      let Reviews = getState().Reviews;
      Reviews = Reviews.filter((Review) => Review.$id !== documentId);
      patchState({
        Reviews,
      });
    } catch (e: any) {
      // console.log('Failed to delete Review');
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