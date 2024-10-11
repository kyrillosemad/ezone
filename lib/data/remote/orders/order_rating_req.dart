import 'package:ezone/core/classes/request.dart';

orderRatingReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
