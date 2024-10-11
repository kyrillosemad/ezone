import 'package:ezone/core/classes/status.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Status reqStatus;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.reqStatus,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    if (reqStatus == Status.internetFailure) {
      return Center(
        child: Lottie.asset("assets/lottie/offline.json", height: 170),
      );
    } else if (reqStatus == Status.serverFailure) {
      return Center(
        child: Lottie.asset("assets/lottie/server.json", height: 200),
      );
    } else if (reqStatus == Status.loading) {
      return Center(
        child: Lottie.asset("assets/lottie/loading.json", height: 140),
      );
    } else if (reqStatus == Status.success) {
      return widget;
    } else if (reqStatus == Status.empty) {
      return Center(
        child: Lottie.asset("assets/lottie/noData.json", height: 200),
      );
    } else {
      return Container();
    }
  }
}
