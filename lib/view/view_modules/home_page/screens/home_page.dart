import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/functions/app_exit_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: Center(
            child: InkWell(
                onTap: () {
                  Get.offAllNamed(AppRoutes().signUp);
                },
                child: const Text("ko"))),
      ),
    );
  }
}
