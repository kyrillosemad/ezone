import 'package:ezone/core/classes/request.dart';

deleteFavoriteReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
