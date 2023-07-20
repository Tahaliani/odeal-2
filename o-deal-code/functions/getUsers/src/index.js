const sdk = require("node-appwrite");

module.exports = async function (req, res) {
  console.log("data");
  const client = new sdk.Client();

  // You can remove services you don't use
  const account = new sdk.Account(client);
  const users = new sdk.Users(client);
  const database = new sdk.Databases(client);

  const databaseId = "63ce1ab22370e19aa819";
  const productCollectionId = "63ce5edacd4514cb82ad";
  const offerCollectionId = "63ce5ee41e71d6446e46";


  client.setEndpoint('http://31.220.58.108:8081/v1');
  // client.setEndpoint('https://endpoint.odeal.shop/v1');

  client
    .setProject('63be9eb7dd5fe7dbc4f1')
    .setKey('8e0a2545f6726abedc6add9db0ed07309e560321b03fe7cb7b52b65d668059b39f16965c156b63e9c58c1894ba8e974b68152bac291e1e1d425a1ef810f44f3eebdac834397c071858457e8fe06f424816c4ace62ad522c4369d3c65369169d1aa40003ecb042ff49a0f0c6edd14ae0b1ae127feb792094eb05f35905ad304c7')
    .setSelfSigned(true)
    ;

  // const reqData = JSON.parse(req.payload);

  // console.log(reqData);


  try {
    
    // user = await users.create(reqData.userId,reqData.email,reqData.phone,reqData.password,reqData.name);

    // offers = await database.listDocuments(databaseId,offerCollectionId);
    users1 = await users.list();

    res.json({"success":true,"data":users1["users"]});
    // await users.updatePrefs(reqData.userId,reqData.prefs);
    // res.json({"success":true});
  
  } catch (error) {
    res.json({"success":false,"error":error});
  }

};

// const app = require("./index.js");

// var res = {json:function(){}};
// res.json = function(json){
//   console.log(json);
// }

// app({payload:'{}'},res);

// console.log(app);