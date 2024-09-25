import 'package:ezone/core/classes/request.dart';

resetPasswordReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
