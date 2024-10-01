import 'package:ezone/core/classes/request.dart';

searchReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
