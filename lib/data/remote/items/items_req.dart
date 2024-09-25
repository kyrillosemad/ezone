import 'package:ezone/core/classes/request.dart';

itemsReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
