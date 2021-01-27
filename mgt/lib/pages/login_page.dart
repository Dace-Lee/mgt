import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mgt/entities/base_entity.dart';
import 'package:mgt/entities/login_entity.dart';
import 'package:mgt/entities/page_data.dart';
import 'package:toast/toast.dart';
import 'package:mgt/http/http_repository.dart';
import 'package:mgt/http/api_response.dart';
import 'package:mgt/http/http_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _account = "";
  String _psw = "";

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Material(
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    "images/login_bg.png",
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "UC LiVE i-Mgt",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                              ),
                              Text(
                                "LSH i-Vehicle System for Used Car",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 25),
                              ),
                            ],
                          )),
                      Column(children: [
                        _createInputView(true),
                        _createInputView(false),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 60, bottom: 20),
                          child: FlatButton(
                            height: 50,
                            minWidth: double.infinity,
                            color: Colors.white,
                            highlightColor: Colors.white,
                            colorBrightness: Brightness.dark,
                            child: Text(
                              "登录",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff214a80)),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              if (_account.length == 0) {
                                Toast.show("请输入用户名", context,
                                    gravity: Toast.CENTER);
                              } else if (_psw.length == 0) {
                                Toast.show("请输入密码", context,
                                    gravity: Toast.CENTER);
                              } else {
                                loginRequest();
                              }
                            },
                          ),
                        ),
                        Text(
                          "English",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ]),
                      Expanded(flex: 3, child: Container()),
                    ],
                  ),
                  Positioned(
                      right: 10,
                      bottom: padding.bottom + 10,
                      child: Text("V1.0.0",
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ])));
  }

  Widget _createInputView(bool isName) {
    print(">>>>>_createInputView " + (isName ? "account" : "psw"));
    String defaultStr = isName ? _account : _psw;
    var _controller = TextEditingController.fromValue(TextEditingValue(
        text: defaultStr,
        selection: TextSelection.fromPosition(
            TextPosition(offset: defaultStr.length))));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              isName ? "images/ic_login_name.png" : "images/ic_login_pwd.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover),
          Expanded(
              child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(color: Colors.white12),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (str) {
                    if (isName) {
                      setState(() {
                        _account = str;
                      });
                    } else {
                      setState(() {
                        _psw = str;
                      });
                    }
                  },
                  controller: _controller,
                  obscuringCharacter: "*",
                  obscureText: !isName,
                  keyboardType: isName
                      ? TextInputType.text
                      : TextInputType.visiblePassword,
                  cursorColor: Color(0xff214a80),
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      hintText: isName ? "请输入用户名" : "请输入密码",
                      hintStyle: TextStyle(color: Colors.white38)),
                )),
                Builder(builder: (context) {
                  if ((isName && _account.length > 0) ||
                      (!isName && _psw.length > 0)) {
                    return IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        ),
                        iconSize: 20,
                        onPressed: () {
                          if (isName) {
                            setState(() {
                              _account = "";
                            });
                          } else {
                            setState(() {
                              _psw = "";
                            });
                          }
                        });
                  } else {
                    return Text("");
                  }
                })
              ],
            ),
          ))
        ],
      ),
    );
  }

  void loginRequest() {
    HttpRepository.login(_account, _psw, context).then((value) {
      if (value != null) {
        if (value.data != null && value.data.length > 0) {
          if (value.data.length > 0) {
          } else {

          }
        } else {
          
        }
      }
    });
  }
}
