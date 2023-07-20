const sdk = require("node-appwrite");

module.exports = async function (req, res) {
  console.log("data");
  const client = new sdk.Client();

  // You can remove services you don't use
  const account = new sdk.Account(client);
  const users = new sdk.Users(client);

  client.setEndpoint('http://31.220.58.108:8081/v1');
  // client.setEndpoint('https://endpoint.odeal.shop/v1');

  client
    .setProject('63be9eb7dd5fe7dbc4f1')
    .setKey('8e0a2545f6726abedc6add9db0ed07309e560321b03fe7cb7b52b65d668059b39f16965c156b63e9c58c1894ba8e974b68152bac291e1e1d425a1ef810f44f3eebdac834397c071858457e8fe06f424816c4ace62ad522c4369d3c65369169d1aa40003ecb042ff49a0f0c6edd14ae0b1ae127feb792094eb05f35905ad304c7')
    .setSelfSigned(true)
    ;

  const reqData = JSON.parse(req.payload);

  console.log(reqData);


  try {
    
    user = await users.create(reqData.userId,reqData.email,reqData.phone,reqData.password,reqData.name);

    await users.updatePrefs(reqData.userId,reqData.prefs);
    res.json({"success":true});
  
  } catch (error) {
    res.json({"success":false,"error":error});
  }

};

// const app = require("./index.js");

// var res = {json:function(){}};
// res.json = function(json){
//   console.log(json);
// }

// app({payload:'{"userId":"636890e1817aceae19","email":"vendor@test.com","phone":"+919876543210","password":"test12345","name":"Test","prefs":{"type":"vendor"}}'},res);

// console.log(app);