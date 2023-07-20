// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  
  //appwrite core
  APP_ENDPOINT: "https://endpoint.odeal.shop/v1",
  APP_PROJECT: "63be9eb7dd5fe7dbc4f1",

  //appwrite DB
  APP_DATABASE_ID: "63ce1ab22370e19aa819",
  OFFER_COLLECTION_ID: "63ce5ee41e71d6446e46",
  ORDER_COLLECTION_ID: "63ce5eec7d61c9dd3f5d",
  PRODUCT_COLLECTION_ID: "63ce5edacd4514cb82ad",
  REVIEW_COLLECTION_ID: "63ce5ef997f2c39938f8",
  SHOP_COLLECTION_ID: "63ce5ed036462ee23199",
  USER_COLLECTION_ID: "64802e4a5415289640af",

  APP_API_SECRET: "d781abb99a409c9a8dfc6cb0aeebf8521a8a35d0e7c6b22150b8482e1cd19fca834303233e19e2e86c9e708aac44566ca332191da9bc9246d26bc2fffd54614be00f0fb7900b99295c05ced72395955c4092b82e084e2550dc7245cb8fb80641db60247d8c973046e6d90c62fbd5176397b6d09b8f12d99fde7d540417a76236"
};
  
  /*
   * For easier debugging in development mode, you can import the following file
   * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
   *
   * This import should be commented out in production mode because it will have a negative impact
   * on performance if an error is thrown.
   */
  // import 'zone.js/plugins/zone-error';  // Included with Angular CLI.