import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

typedef void LoadCompleted(Result result);

class Result {
  
  Result({this.data});
  
  final dynamic data;
}

class Loader {

  static String position = 'position';
  static String company = 'company';
  static String message = 'message';

  static dynamic loadList({String code, LoadCompleted completed}) async {
    rootBundle.loadString('data/${code}_list.json').then((value) {
      dynamic data = json.decode(value);
      if (completed != null) completed(Result(data: data));
    }, onError: (err) {
      print('load \'data/${code}_list.json error\' \n err: $err');
      if (completed != null) completed(null);
    });
    
  }
}
