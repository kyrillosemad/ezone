import 'package:ezone/core/classes/request.dart';

viewFavoriteReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
