import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const songStyle = const TextStyle(
  fontFamily: 'STSONG',
);

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
                                      // fontWeight: FontWeight.w600,
                                      fontFamily: songStyle.fontFamily,
                                      color: Colors.white,
                                      fontSize: 50),
                                ),
                              ),
                              Text(
                                "LSH i-Vehicle System for Used Car",
                                style: TextStyle(
                                    fontFamily: songStyle.fontFamily,
                                    color: Colors.white54,
                                    fontSize: 25),
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
                                  fontFamily: songStyle.fontFamily,
                                  fontSize: 16,
                                  color: Color(0xff214a80)),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {},
                          ),
                        ),
                        Text(
                          "English",
                          style: TextStyle(
                              fontFamily: songStyle.fontFamily,
                              fontSize: 14,
                              color: Colors.white70),
                        )
                      ]),
                      Expanded(flex: 3, child: Container()),
                    ],
                  ),
                  Positioned(
                      right: 10,
                      bottom: padding.bottom + 10,
                      child: Text("V1.0.0",
                          style: TextStyle(
                              fontFamily: songStyle.fontFamily,
                              color: Colors.white,
                              fontSize: 14))),
                ])));
  }

  Widget _createInputView(bool isName) {
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
            child: Center(
              child: TextField(
                cursorColor: Color(0xff214a80),
                style: TextStyle(
                    fontFamily: songStyle.fontFamily,
                    fontSize: 14,
                    color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    hintText: isName ? "请输入用户名" : "请输入密码",
                    hintStyle: TextStyle(
                        fontFamily: songStyle.fontFamily,
                        color: Colors.white38)),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
