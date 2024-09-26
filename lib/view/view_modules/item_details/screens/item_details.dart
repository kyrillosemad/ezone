import 'package:ezone/view/view_modules/item_details/widgets/item_price_and_count.dart';
import 'package:ezone/view/view_modules/item_details/widgets/sub_item_list.dart';
import 'package:ezone/view/view_modules/item_details/widgets/top_Item_details_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {},
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: ListView(children: [
          const TopItemDetailsPage(),
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("laptop",
                  style: TextStyle(
                      fontSize: 40,
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ItemPriceAndCount(
                  onAdd: () {}, onRemove: () {}, price: "200.0", count: "2"),
              const SizedBox(
                height: 25,
              ),
              Text(
                  "gre;gjdsljblrefmvl;fdmbfd;smb;lfehujyhfghjsnfliesngilresjgfdbfdjgilrjhgpfjbhir;jghrjrlbijdfbnhltrjnglok;jgbfrokgijblnriogkjrnblokrjinbhkliofilgrokbjilkgrliokgjilr;bkorjinbberilgnerlogrejkngresnkgerngbers",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(height: 10),
              const SubItemList()
            ]),
          )
        ]));
  }
}
