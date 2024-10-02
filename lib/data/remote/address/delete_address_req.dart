import 'package:ezone/core/classes/request.dart';

deleteAddressReq(link, data) {
  var res = Request().request(link, data);
  return res;
}
