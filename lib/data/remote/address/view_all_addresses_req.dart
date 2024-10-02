import 'package:ezone/core/classes/request.dart';

viewAllAddressesReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
