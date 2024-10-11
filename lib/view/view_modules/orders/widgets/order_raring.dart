import 'package:ezone/controller/orders/orders_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/orders/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderRating extends StatelessWidget {
  final OrdersCont controller;
  final OrdersModel ordersModel;
  const OrderRating({super.key,required this.controller, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return RatingDialog(
              initialRating: 1.0,
              title: const Text(
                'Rating Order',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              message: const Text(
                'Tap a star to set your rating',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              starSize: 30,
              submitButtonText: 'Submit',
              commentHint: 'Any Comment ?',
              onCancelled: () {},
              submitButtonTextStyle:
                  const TextStyle(color: AppColor.primaryColor),
              onSubmitted: (response) {
                controller.orderRating(ordersModel.ordersId, response.rating,
                    response.comment, context);
              },
            );
          },
        );
      },
      color: AppColor.primaryColor,
      icon: const Icon(Icons.star_half_sharp),
      iconSize: 30,
    );
  }
}
