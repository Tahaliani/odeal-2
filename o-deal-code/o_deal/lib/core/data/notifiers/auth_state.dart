import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:o_deal/modules/authentication/ui/signup_successful.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../env/AppCred.dart';
import '../models/user.dart' as UserModel;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authstate extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late Functions function;
  bool _isLoggedIn = false;
  bool get IsLoggedIn => _isLoggedIn;
  late UserModel.User _user;
  UserModel.User get user => _user;
  String funerror = "";
  get _funerror => funerror;
  bool funstatus = false;
  get _funstatus => funerror;
  AppwriteException error = AppwriteException();
  AppwriteException get _error => error;
  bool _isLoaded = false;
  get isLoaded => _isLoaded;
  set setisLoaded(loaded) => _isLoaded;

  bool verification = false;
  bool _verificationSent = false;
  get verificationSent => _verificationSent;

  late String _verificationId;

  authstate() {
    _init();
  }

  _init() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId);
    account = Account(client);
    function = Functions(client);
    _isLoggedin();
  }

  _isLoggedin() async {
    _isLoaded = false;
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      verification = true;
      notifyListeners();
    } catch (e) {
      // error=e.toString();
      _isLoggedIn = false;
      notifyListeners();
    }

    _isLoaded = true;
  }

  logout() async {
    _isLoaded = false;
    notifyListeners();
    try {
      await account.deleteSessions();
      // print(res.toString());

      _verificationSent = false;
      verification = false;
      _isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    _isLoaded = true;
  }

  _getAccount() async {
    try {
      models.User res = await account.get();

      if (res.email != "") {
        return UserModel.User.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
    throw "Error";
  }

  editAccount(String? name, String? email, String? phone, String? password,
      Map<String, dynamic> preferences) async {
    _isLoaded = false;
    notifyListeners();
    try {
      if (name != null && name != _user.name) {
        Future result = account.updateName(name: name);
        result.then((value) {
          _user.name = name;
        });
      }
      if (email != null && email != _user.email) {
        Future result = account.updateEmail(email: email, password: password!);
        result.then((value) {
          _user.email = email;
        });
      }
      if (phone != null) {
        models.Preferences pref = models.Preferences(data: {'mobile': phone});
        Future result = account.updatePrefs(prefs: pref.data);
        result.then((value) {
          _user.preferences = pref;
        });
      }
      models.Preferences pref = models.Preferences(data: preferences);
      Future result = account.updatePrefs(prefs: pref.data);
      result.then((value) {
        _user.preferences = pref;
      });
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  appleLogin(BuildContext context) async {
    _isLoaded = false;
    notifyListeners();
    try {
      Future result = account.createOAuth2Session(
        provider: 'apple',
        // success: Appcred.endpoint + "/auth/oauth2/success",
        // failure: Appcred.endpoint + "/auth/oauth2/failure",
        scopes: [],
      );
      result.then((response) async {
        _user = await _getAccount();
        notifyListeners();

        if (_user.preferences.data.containsKey("type")) {
          if (_user.preferences.data["type"] == "vendor") {
            Navigator.pushReplacementNamed(context, Routes.dashboard)
                .then((value) {});
          } else {
            Navigator.pushReplacementNamed(context, Routes.radar)
                .then((value) {});
          }
        } else {
          Navigator.pushReplacementNamed(context, Routes.userVendorSelection)
              .then((value) {});
        }
      }).catchError((e) {
        // error = e;
        print(e);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
    _isLoaded = true;
  }

  googleLogin(BuildContext context) async {
    _isLoaded = false;
    notifyListeners();
    try {
      Future result = account.createOAuth2Session(
        provider: 'google',
        success: Appcred.endpoint + "/auth/oauth2/success",
        failure: Appcred.endpoint + "/auth/oauth2/failure",
        scopes: [],
      );
      result.then((response) async {
        _user = await _getAccount();
        notifyListeners();

        if (_user.preferences.data.containsKey("type")) {
          if (_user.preferences.data["type"] == "vendor") {
            Navigator.pushReplacementNamed(context, Routes.dashboard)
                .then((value) {});
          } else {
            Navigator.pushReplacementNamed(context, Routes.radar)
                .then((value) {});
          }
        } else {
          Navigator.pushReplacementNamed(context, Routes.userVendorSelection)
              .then((value) {});
        }
      }).catchError((e) {
        // error = e;
        print(e);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
    _isLoaded = true;
  }

  verifyOtp(BuildContext context, String otp, String userId,
      String phoneNumber) async {
    _isLoaded = false;
    notifyListeners();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        _isLoaded = true;
        verification = true;
        notifyListeners();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) {
              return user.preferences.data.containsKey("type")
                  ? user.preferences.data["type"] == "vendor"
                      ? const DashboardScreen()
                      : const RadarScreen()
                  : const UserVendorSelection();
            },
          ),
        );
        // print(value);
        // print(verification);
        notifyListeners();
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                e.message.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
        notifyListeners();
        print(e);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              e.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
      notifyListeners();
      print(e);
    }
  }

  sendOtp(String userId, String phoneNumber) async {
    _isLoaded = false;
    // notifyListeners();
    try {
      print(phoneNumber);
      // await Firebase.initializeApp();
      if (!_verificationSent) {
        _verificationSent = true;
        // await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNumber);

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: ((PhoneAuthCredential credential) {}),
          verificationFailed: ((error) {}),
          codeSent: ((verificationId, forceResendingToken) {
            _verificationId = verificationId;
            _isLoaded = true;
            notifyListeners();
          }),
          codeAutoRetrievalTimeout: ((verificationId) {}),
        );
        // notifyListeners();
      }

      // var data = '{"userId":"$userId","phone":"$phoneNumber"}';
      // await function
      //     .createExecution(
      //   functionId: Appcred.verificationFunction,
      //   data: data,
      // )
      //     .then(
      //   (respo) {
      //     print(respo.response);
      //     var r = jsonDecode(respo.response);
      //     if (r["success"]) {}
      //     _verificationSent = true;
      //     notifyListeners();
      //   },
      // );

      // Future token =
      //     account.createPhoneSession(userId: userId, phone: phoneNumber);
      // // _verificationSent = true;
      // token.then((response) {}).catchError((e) {
      //   _verificationSent = true;
      //   error = e;
      //   print(e);
      //   notifyListeners();
      // });

      // notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<bool> login(
      String email, String password, BuildContext context, bool? ret) async {
    _isLoaded = false;
    try {
      //TODO send OTP
      Future result =
          account.createEmailSession(email: email, password: password);
      result.then((response) async {
        _user = await _getAccount();
        notifyListeners();

        if (!verification) {
          Navigator.pushReplacementNamed(context, Routes.verification)
              .then((value) {});
        } else {
          if (_user.preferences.data.containsKey("type")) {
            if (_user.preferences.data["type"] == "vendor") {
              Navigator.pushReplacementNamed(context, Routes.dashboard)
                  .then((value) {});
            } else {
              Navigator.pushReplacementNamed(context, Routes.radar)
                  .then((value) {});
            }
          } else {
            Navigator.pushReplacementNamed(context, Routes.userVendorSelection)
                .then((value) {});
          }
        }
      }).catchError((e) {
        error = e;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                error.message.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
        print(e);
        notifyListeners();
      });
      // result.

    } catch (e) {
      // error=e;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              e.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }
    _isLoaded = true;

    if (ret!) {
      return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }

  signup(String name, String email, String password, String mobileno,
      var preferences, BuildContext context) async {
    _isLoaded = false;
    notifyListeners();
    try {
      final now = DateTime.now();
      var userid = now.microsecondsSinceEpoch.toString();
      var data =
          '{"userId":"$userid","email":"$email","phone":"$mobileno","password":"$password","name":"$name","prefs":$preferences}';
      await function
          .createExecution(
        functionId: Appcred.signupFunction,
        data: data,
      )
          .then((respo) {
        var r = jsonDecode(respo.response);
        if (r["success"]) {
          funstatus = r["success"];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupSuccessfulScreen(
                email: email,
                password: password,
              ),
            ),
          );
          // login(email, password, context);
        } else {
          funerror = r["error"]["response"]["message"];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  funerror,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
          // print(email);
          // print(funerror);
        }
      }).catchError((e) {
        print(e.response);
      });

      notifyListeners();
    } on AppwriteException catch (e) {
      error = e;
      print(e);
    }
    _isLoaded = true;
  }

  updateProfile(String? name, String? email, String? phone, String? password,
      Map<String, dynamic> preferences) async {
    _isLoaded = false;
    try {
      if (name != null && name != _user.name) {
        Future result = account.updateName(name: name);
        result.then((value) {
          _user.name = name;
        });
      }
      if (email != null && email != _user.email) {
        Future result = account.updateEmail(email: email, password: password!);
        result.then((value) {
          _user.email = email;
        });
      }
      if (phone != null) {
        models.Preferences pref = models.Preferences(data: {'mobile': phone});
        Future result = account.updatePrefs(prefs: pref.data);
        result.then((value) {
          _user.preferences = pref;
        });
      }
      models.Preferences pref = models.Preferences(data: preferences);
      Future result = account.updatePrefs(prefs: pref.data);
      result.then((value) {
        _user.preferences = pref;
      });

      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
