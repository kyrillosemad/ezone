import 'package:ezone/core/classes/crud.dart';

homePageDataReq(link, data) {
  var res = Crud().crud(link, data);
  return res;
}
