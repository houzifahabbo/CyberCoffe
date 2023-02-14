import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/app_bar/app_bar_view.dart';
import 'package:coffee/view/order_select/order_select_view/order_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({Key? key}) : super(key: key);
  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: mainAppBarWithLeading('Sipariş Detayı', context),
      body: Column(
        children: [
          const SizedBox(
            height: 7,
          ),
          gelAlSecimiCard(phoneHeight, phoneWidth),
          const SizedBox(
            height: 7,
          ),
          Expanded(flex: 7, child: menuList()),
          const SizedBox(
            height: 7,
          ),
          Expanded(flex: 5, child: payingMethod()),
          Expanded(flex: 2, child: payButton(context,"Öde")),
        ],
      ),
    );
  }
}

Widget menuList() {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Sipariş Listesi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColorScheme.mainAppDark),
            ),
            InkWell(
                child: Text("Add more",
                    style: TextStyle(
                        color: AppColorScheme.mainAppDarkGreen,
                        decoration: TextDecoration.underline)))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child:null// ProductCardGetter(0, false),
        ),
        const Divider(
          thickness: 2,
          color: AppColorScheme.buttonGrey,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total",
                style: TextStyle(
                    color: AppColorScheme.mainAppDark,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text("20,00 TL",
                  style: TextStyle(
                      color: AppColorScheme.mainAppDark,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
        )
      ],
    ),
  );
}

Widget payingMethod() {
  return Container(
      color: Colors.white,
      //padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 20),
      child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 20),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                       const Text(
                        "Ödeme Şekli",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColorScheme.mainAppDark),
                    ),
                      SizedBox(
                        height: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: Colors.transparent),
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Text(
                                'Yükleme Yap',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColorScheme.mainAppDarkGreen),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: AppColorScheme.mainAppDarkGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
            ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: Svg(ImageConstants.starbucksLogo),
                          alignment: Alignment.centerLeft),
                      color: AppColorScheme.mainAppGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10, left: 20),
                              child: Text("Toplam Param",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("55,35 TL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ])),
                Container(
                  height: 100,
                  width: 170,
                  decoration: BoxDecoration(
                    color: AppColorScheme.buttonGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(right: 60, top: 20),
                          child: Text("Kredi\nBanka Kartı",
                              style: TextStyle(
                                  color: AppColorScheme.mainAppDarkerGrey,
                                  fontSize: 16))),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 37),
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                shape: BoxShape.circle),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 17),
                            height: 37,
                            width: 37,
                            decoration: const BoxDecoration(
                                color: AppColorScheme.lightGrey,
                                shape: BoxShape.circle),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ]));
}

void navigateToPage(BuildContext context, String pageName) {
  Navigator.pushNamed(context,pageName);
}

Widget payButton(BuildContext context, String label) {
  return Container(
      decoration: BoxDecoration(
      color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColorScheme.shadow.withOpacity(0.2),
              blurRadius: 30)
        ],
      ),
      child: Container(
        height: 55,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal:20),
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              if(label=="Öde"){
                navigateToPage(context, '/orderComplete');
              }
              else{
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.mainAppGreen,
            ),
            child: Center(child: Text(label,style: const TextStyle(fontWeight: FontWeight.bold),)),
          )));
}
