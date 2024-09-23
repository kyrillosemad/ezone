import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Status, Map>> crud(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(link), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var data = jsonDecode(response.body);
          return right(data);
        } else {
          print("KKK");
          return left(Status.serverFailure);
        }
      } else {
        return left(Status.internetFailure);
      }
    } catch (e) {
      print("error :$e");
      return left(Status.serverFailure);
    }
  }
}
