import 'package:ezone/core/classes/request.dart';

homePageDataReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
