import 'package:ezone/core/classes/request.dart';

emailVerifyCodeReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
