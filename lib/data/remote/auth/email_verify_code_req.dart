import 'package:ezone/core/classes/crud.dart';

emailVerifyCodeReq(link, data) {
  var res = Crud().crud(link, data);
  return res;
}
