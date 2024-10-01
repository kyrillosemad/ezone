import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/controller/homepage/search_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  final SearchCont controller;
  final String search;
  const Search({
    super.key,
    required this.controller,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return HandlingDataView(
          reqStatus: controller.reqStatus.value,
          widget: ListView.builder(
              itemCount: controller.data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ItemsModel itemsModel =
                    ItemsModel.fromJson(controller.data[index]);
                return InkWell(
                  onTap: () {
                    controller.goToItemDetails(itemsModel);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLink.imagesItems}/${itemsModel.itemsImage}")),
                            Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text("${itemsModel.itemsName}"),
                                  subtitle: Text("${itemsModel.itemsDesc}"),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }));
    });
  }
}

