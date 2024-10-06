import 'package:ezone/core/classes/request.dart';

ordersReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
