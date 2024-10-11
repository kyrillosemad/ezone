// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class TopItemDetailsPage extends StatelessWidget {
  ItemsModel itemsModel = ItemsModel();
  TopItemDetailsPage({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: AppColor.secondColor),
        ),
        Positioned(
            top: 50.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                height: 200,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    Lottie.asset("assets/lottie/loading.json", height: 100),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 60, color: Colors.red),
              ),
            ))
      ],
    );
  }
}
