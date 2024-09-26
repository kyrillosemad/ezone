import 'package:ezone/core/classes/request.dart';

removeFromFavoriteReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
