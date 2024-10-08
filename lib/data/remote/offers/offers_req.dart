import 'package:ezone/core/classes/request.dart';

offersReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
