import 'package:ezone/core/classes/request.dart';

emailVerifyCodeForPasswordReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
