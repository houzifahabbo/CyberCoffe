import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/app_bar/app_bar_view.dart';
import 'package:coffee/view/order_detail/order_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OrderCompleteView extends StatefulWidget {
  const OrderCompleteView({Key? key}) : super(key: key);

  @override
  State<OrderCompleteView> createState() => _OrderCompleteViewState();
}

class _OrderCompleteViewState extends State<OrderCompleteView> {
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColorScheme.backgroundGrey,
      appBar: mainAppBar("Sipariş Tamamlandı"),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 45),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(ImageConstants.success),
                    ),
                    const Text(
                      "Bizden sipariş verdiğiniz için\nteşekkürler!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColorScheme.mainAppDark),
                    )
                  ],
                ),
              )),
          Expanded(flex: 5, child: rewards()),
          Expanded(flex: 1, child: payButton(context, "Kapat")),
        ],
      ),
    );
  }
}

Widget rewards() {
  return Container(
    color: Colors.white,
    width: double.maxFinite,
    child: Column(
      children: [
        Container(
          height: 150,
          width: 350,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColorScheme.buttonGrey),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    //color:Colors.red,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15) +
                          const EdgeInsets.only(left: 15, right: 6),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Tebrikler",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColorScheme.mainAppDark),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColorScheme.mainAppDarkGreen,
                                  borderRadius: BorderRadius.circular(4)),
                              height: 30,
                              width: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      '+ 2',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    ImageIcon(
                                      AssetImage(ImageConstants.starIcon),
                                      color: AppColorScheme.gold,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 265,
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset(ImageConstants.hazelnutCoffee)),
                        SizedBox(
                          height: 60,
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Bizden 2 puan kazandın",
                                style: TextStyle(
                                    color: AppColorScheme.mainAppDark,
                                    fontSize: 16),
                              ),
                              Text(
                                "Hazelnut Coffee",
                                style: TextStyle(
                                    color: AppColorScheme.mainAppDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
              color: AppColorScheme.buttonGrey,
              borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 15)+ const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Best sellers to best sellers increased",
                style:
                    TextStyle(color: AppColorScheme.mainAppDark, fontSize: 14),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      height: 10,
                      width: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const LinearProgressIndicator(
                          color: AppColorScheme.mainAppDarkGreen,
                          backgroundColor: AppColorScheme.mainAppSoftGrey,
                          value: 7 / 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const ImageIcon(
                      AssetImage(ImageConstants.starIcon),
                      color: AppColorScheme.mainAppDarkGreen,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '7/10',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.mainAppDarkGreen),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
