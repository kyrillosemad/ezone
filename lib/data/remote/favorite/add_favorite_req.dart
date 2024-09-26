import 'package:ezone/core/classes/request.dart';

addFavoriteReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
