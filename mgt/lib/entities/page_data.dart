import 'package:mgt/generated/json/base/json_convert_content.dart';

class PageData<T> with JsonConvert<PageData<T>> {
  int total;
  List<T> data;
}