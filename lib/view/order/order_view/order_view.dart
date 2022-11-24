import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/order/order_view_model/order_view_model.dart';
import 'package:coffee/view/order/order_view_model/product_details_card.dart';
import 'package:coffee/view/order/order_view_model/filter_buttons.dart';
import '../../../../product/constants/color_scheme.dart';
import 'package:coffee/view/view_model/app_bar/app_bar_view_model.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  Widget timeIcon = SvgPicture.asset(ImageConstants.timeIcon);
  Widget addressIcon = SvgPicture.asset(ImageConstants.addressIcon);

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    final double scale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: mainAppBar("Sipariş Yarat"),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: phoneHeight * 0.02),
            child: Column(children: [
              gelAlSecimiCard(phoneHeight, phoneWidth),
              SizedBox(height: phoneHeight * 0.01),
              menuCard(phoneHeight, phoneWidth),
            ])));
  }

  Expanded menuCard(double phoneHeight, double phoneWidth) {
    return Expanded(
      child: Container(
        height: phoneHeight*0.5,
        width: phoneWidth,
        color: Colors.white,
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: phoneHeight * 0.02,
                      bottom: phoneHeight * 0.01,
                      left: phoneWidth * 0.04),
                  child: const Text(
                    "Menu",
                    style: TextStyle(
                        color: AppColorScheme.mainAppDarkestGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))),
          SizedBox(
            width: phoneWidth * 0.9,
            height: phoneHeight * 0.05,
            child: FilterButtonsListView(phoneWidth,phoneHeight)
        ),
          SizedBox(
              width: phoneWidth*0.898,
              height: phoneHeight * 0.49,
              child: ProductCard(phoneWidth,phoneHeight)),
  ]),
    ));
  }
  
  Container gelAlSecimiCard(double phoneHeight, double phoneWidth) {
    return Container(
      height: phoneHeight * 0.26,
      width: phoneWidth,
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    top: phoneHeight * 0.02,
                    bottom: phoneHeight * 0.01,
                    left: phoneWidth * 0.04),
                child: const Text(
                  "Gel Al Seçimi",
                  style: TextStyle(
                      color: AppColorScheme.mainAppDarkestGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
          PickTimeOrLocation(icon: timeIcon, addTitle: true, text: "13:00"),
          PickTimeOrLocation(icon: addressIcon, addTitle: false, text: "Kadıköy, İstanbul"),
        ],
      ),
    );
  }
}
