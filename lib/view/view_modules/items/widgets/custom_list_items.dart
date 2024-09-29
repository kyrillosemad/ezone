import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/controller/items/items_cont.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';

class CustomListItems extends StatelessWidget {
  final ItemsCont controller;
  final ItemsModel itemsModel;
  final int index;

  const CustomListItems({
    Key? key,
    required this.controller,
    required this.itemsModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Lottie.asset("assets/lottie/loading.json", height: 100),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 60, color: Colors.red),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rating", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  Obx(() => IconButton(
                        onPressed: () {
                          controller.toggleFavorite(itemsModel.itemsId, index);
                        },
                        icon: controller.items[index]['favorite'] == 1
                            ? const Icon(
                                Icons.favorite,
                                color: AppColor.primaryColor,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: AppColor.primaryColor,
                              ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
