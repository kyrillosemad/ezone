import 'package:ezone/core/classes/request.dart';

checkEmailForPasswordResetReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
