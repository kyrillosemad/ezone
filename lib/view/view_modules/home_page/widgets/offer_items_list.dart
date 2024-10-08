import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/controller/favorite/favorite_cont.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/offers/offers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomListOffersItems extends GetView<FavoriteCont> {
  final OffersModel offersModel;

  const CustomListOffersItems({
    Key? key,
    required this.offersModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imagesItems}/${offersModel.itemsImage}",
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Lottie.asset("assets/lottie/loading.json", height: 100),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, size: 60, color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    offersModel.itemsName!,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating", textAlign: TextAlign.center),
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star,
                              size: 15, color: Colors.amber);
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${offersModel.itemspricedisount} \$",
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                        ),
                      ),
                      Text(
                        "- ${offersModel.itemsDiscount} %",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
