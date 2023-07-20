import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';
import { Models, Query } from 'appwrite';
import { User } from 'src/app/models/User';
import { Api } from 'src/app/helpers/api';
import { GlobalActions } from '../global';
import { environment } from 'src/environments/environment';

/** State Model */
export class UserStateModel {
  Users: Array<any> = [];
}

export namespace Users {
  /** Actions */
  export class Fetch {
    static readonly type = '[User] FetchUsers';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Add {
    static readonly type = '[User] AddUser';
    constructor(
      public payload: { data: any }
    ) { }
  }

  export class Update {
    static readonly type = '[User] UpdateUser';
    constructor(
      public payload: {
        documentId: string;
        data: User;
        read: string[];
        write: string[];
      }
    ) { }
  }

  export class Delete {
    static readonly type = '[User] DeleteUser';
    constructor(public payload: { documentId: string }) { }
  }
}

@State<UserStateModel>({
  name: 'User',
  defaults: {
    Users: [],
  },
})
@Injectable()
export class UserState {
  @Selector()
  static getUsers(state: UserStateModel) {
    return state.Users;
  }

  @Action(Users.Fetch)
  async fetchUsers(
    { setState, dispatch }: StateContext<UserStateModel>,
    action: Users.Fetch
  ) {
    let { data } = action.payload;
    // console.log("fetchin");
    try {
      // await Api.Account
      let Users = await Api.Functions().createExecution(
        environment.USER_COLLECTION_ID,
        '{}'
      );
      let data = JSON.parse(Users.response);
      setState({
        Users:  data["data"],
      });

    } catch (e: any) {
      console.log('Failed to fetch Users');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Users.Add)
  async addUser(
    { patchState, getState, dispatch }: StateContext<UserStateModel>,
    action: Users.Add
  ) {
    try {
      let { data } = action.payload;
      // let User = await Api.DB().createDocument(
      //   environment.APP_DATABASE_ID,
      //   environment.USER_COLLECTION_ID,
      //   'unique()',
      //   data
      // );
      const Users = getState().Users;
      // patchState({
      //   Users: [...Users, User],
      // });

      dispatch(
        new GlobalActions.setAlert({
          message: "Added new user!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to add User');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Users.Update)
  async updateUser(
    { patchState, getState, dispatch }: StateContext<UserStateModel>,
    action: Users.Update
  ) {
    let { documentId, data, read, write } = action.payload;
    try {
      let updatedUser = await Api.DB().updateDocument(
        environment.APP_DATABASE_ID,
        environment.USER_COLLECTION_ID,
        documentId,
        data,
        []
      );
      let UserList = [...getState().Users];
      const index = UserList.findIndex(
        (User) => User.$id === updatedUser.$id
      );
      if (index !== -1) {
        UserList[index] = updatedUser;
        patchState({
          Users: UserList,
        });
      }

      dispatch(
        new GlobalActions.setAlert({
          message: "User Updated!",
          show: true,
          color: 'green',
        })
      );
    } catch (e: any) {
      // console.log('Failed to update User');
      dispatch(
        new GlobalActions.setAlert({
          message: e.message,
          show: true,
          color: 'red',
        })
      );
    }
  }

  @Action(Users.Delete)
  async deleteUser(
    { patchState, getState, dispatch }: StateContext<UserStateModel>,
    action: Users.Delete
  ) {
    let { documentId } = action.payload;
    try {
      await Api.DB().deleteDocument(
        environment.APP_DATABASE_ID,
        environment.USER_COLLECTION_ID,
        documentId
      );
      let Users = getState().Users;
      Users = Users.filter((User) => User.$id !== documentId);
      patchState({
        Users,
      });
    } catch (e: any) {
      // console.log('Failed to delete User');
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