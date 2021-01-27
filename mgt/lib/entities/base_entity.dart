import 'package:mgt/entities/page_data.dart';
import 'package:mgt/generated/json/base/json_convert_content.dart';
import 'package:mgt/generated/json/base/json_field.dart';

class BaseEntity<T,S> with JsonConvert<BaseEntity<T,S>>  {
  String result;
  String message;
  String messagetype;
  S data;
  PageData<T> pagedata;
}