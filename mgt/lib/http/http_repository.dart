import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mgt/entities/page_data.dart';
import 'package:mgt/http/app_exceptions.dart';
import 'api_response.dart';
import 'http_utils.dart';
import 'package:mgt/entities/base_entity.dart';
import 'package:mgt/entities/login_entity.dart';
import 'package:toast/toast.dart';

typedef _CallBack = void Function(dynamic data);

class HttpRepository {
  static bool dealData(BaseEntity baseEntity, BuildContext context,
      [_CallBack errorCallBack]) {
    if (baseEntity.result != '0000') {
      if (errorCallBack != null) {
        errorCallBack(baseEntity.message);
      } else {
        Toast.show(baseEntity.message, context);
      }
      return false;
    }
    return true;
  }

  static dealError(AppException exception, BuildContext context,
      [_CallBack errorCallBack]) {
    if (errorCallBack != null) {
      errorCallBack(exception.showMessage());
    } else {
      Toast.show(exception.showMessage(), context);
    }
  }

  static final String loginPath = "LiVEServiceLSH/ITaskLogin";

  static Future<PageData> login(String user, String pass,
      BuildContext context) async {
    try {
      Map<String, dynamic> param = Map();
      param["user"] = user;
      param["pass"] = pass;
      param["uid"] = "DA183A65-0864-4152-BD72-339697A1304C";
      param["ver"] = "3";
      param["app"] = "1";
      final response = await HttpUtils.get(loginPath, params: param);
      BaseEntity baseEntity =
      new BaseEntity().fromJson(json.decode(response.toString()));
      if (dealData(baseEntity, context)) {
        return baseEntity.pagedata;
      }
    } on DioError catch (e) {
      dealError(e.error, context);
    }
  }
}
