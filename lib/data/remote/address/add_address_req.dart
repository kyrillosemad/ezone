import 'package:ezone/core/classes/request.dart';

addAddressReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
