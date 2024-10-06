import 'package:ezone/core/classes/request.dart';

orderDetailsReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
