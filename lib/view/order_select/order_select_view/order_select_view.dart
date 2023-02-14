import 'package:coffee/core/extensions/context_extensions.dart';
import 'package:coffee/database.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/app_bar/app_bar_view.dart';
import 'package:coffee/view/order_select/order_select_view/filter_buttons.dart';
import 'package:coffee/view/order_select/order_select_view/product_details_card.dart';
import 'package:coffee/view/order_select/order_select_view_model/order_select_view_model.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../product/constants/color_scheme.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return StreamProvider<List<ProductModel>?>.value(
        initialData: null,
        value: DataBaseService().products,
        child: Scaffold(
            appBar: mainAppBar("Sipariş Yarat"),
            body: Padding(
                padding: context.paddingNormalVertical,
                //EdgeInsets.symmetric(vertical: context.padd),
                child: Column(children: [
                  gelAlSecimiCard(phoneHeight, phoneWidth),
                  const SizedBox(height: 10),
                  menuCard(phoneHeight, phoneWidth),
                ]))));
  }

  Widget menuCard(double phoneHeight, double phoneWidth) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                vertical: phoneHeight * 0.01, horizontal: phoneWidth * 0.04),
            child: const Text(
              "Menu",
              style: TextStyle(
                  color: AppColorScheme.mainAppDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
            width: phoneWidth * 0.9,
            height: 40,
            child: FilterButtonsListView(phoneWidth, phoneHeight)),
        SizedBox(
            width: phoneWidth * 0.9,
            height: phoneHeight * 0.48,
            child: ProductCard(phoneWidth, phoneHeight)),
      ]),
    ));
  }
}

Widget timeIcon = SvgPicture.asset(ImageConstants.timeIcon);
Widget addressIcon = SvgPicture.asset(ImageConstants.addressIcon);

Widget gelAlSecimiCard(double phoneHeight, double phoneWidth) {
  return Container(
    height: phoneHeight * 0.25,
    width: phoneWidth,
    color: Colors.white,
    child: Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Gel Al Seçimi",
                style: TextStyle(
                    color: AppColorScheme.mainAppDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
        ),
        pickTimeOrLocationCards(
            pickTimeOrLocation: PickTimeOrLocation(
                icon: timeIcon,
                addTitle: true,
                text: "13:00",
                phoneHeight: phoneHeight,
                phoneWidth: phoneWidth)),
        const SizedBox(height: 15),
        pickTimeOrLocationCards(
            pickTimeOrLocation: PickTimeOrLocation(
                icon: addressIcon,
                addTitle: false,
                text: "Kadıköy, İstanbul",
                phoneHeight: phoneHeight,
                phoneWidth: phoneWidth))
      ],
    ),
  );
}

Widget pickTimeOrLocationCards(
    {required PickTimeOrLocation pickTimeOrLocation}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      width: pickTimeOrLocation.phoneWidth,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: const Color(0xffdfe4ec)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: [
        if (pickTimeOrLocation.addTitle)
          (Container(
            padding: const EdgeInsets.only(top: 10, left: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Paketinizi alma zamznı",
              style: TextStyle(color: Color(0xff6f8094)),
            ),
          )),
        ListTile(
            title: Text(pickTimeOrLocation.text,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColorScheme.mainAppDark,
                    fontWeight: FontWeight.bold)),
            trailing: TextButton(
              onPressed: () {
                print("clicked");
              },
              child: const Text('Değiştir',
                  style: TextStyle(
                      color: AppColorScheme.mainAppDarkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            leading: pickTimeOrLocation.icon),
      ]),
    ),
  );
}
