import 'package:ezone/core/classes/request.dart';

checkoutReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
