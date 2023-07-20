import { Injectable } from '@angular/core';
import { Action, Selector, State, StateContext } from '@ngxs/store';

export type Alert = {
  message?: string;
  color?: string;
  show?: boolean;
  timeout?: boolean;
  update?: any;
};

export class GlobalStateModel {
  alert: Alert | null | undefined;
}

export namespace GlobalActions {
  export class setAlert {
    static readonly type = '[Alert] SetAlert';
    constructor(public payload: Alert) {}
  }
  export class showUpdate {
    static readonly type = '[Alert] ShowUpdate';
    constructor(public payload: Alert) {}
  }
}

@State<GlobalStateModel>({
  name: 'global',
  defaults: {
    alert: null,
  },
  
})
@Injectable()
export class GlobalState {
  @Selector()
  static getAlert(state: GlobalStateModel) {
    return state.alert;
  }

  @Action(GlobalActions.setAlert)
  setAlert(
    { patchState }: StateContext<GlobalStateModel>,
    action: GlobalActions.setAlert
  ) {    
    let alert = action.payload;
    console.log("Setting alert ", alert);
    if (alert.timeout != false) {
      patchState({
        alert: alert,
      });
    }
  }

  @Action(GlobalActions.showUpdate)
  showUpdate(
    { patchState }: StateContext<GlobalStateModel>,
    action: GlobalActions.showUpdate
  ){
    let alert = action.payload;
    console.log("Setting alert ", alert);
    patchState({
      alert: alert,
    });
  }
}