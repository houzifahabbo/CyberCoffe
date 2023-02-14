import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/app_bar/app_bar_view.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_details_card_view_model.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:coffee/database.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  bool showCurrentOrder = false;
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
          backgroundColor: AppColorScheme.backgroundGrey,
        appBar: mainAppBar("Starbucks"),
        body:  Stack(children: [
            Column(children: [
              Container(
                margin: const EdgeInsets.all(30),
                height: 140,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: Svg(ImageConstants.starbucksLogo),
                        alignment: Alignment.centerLeft),
                    color: AppColorScheme.mainAppGreen,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppColorScheme.shadow.withOpacity(0.5),
                          blurRadius: 30)
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 38) + EdgeInsets.only(top: 50, bottom: 5),
                          child: const Text("Toplam Param",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("55,35",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent),
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text(
                                  'Yükleme Yap',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.arrow_forward_sharp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SleekCircularSlider(
                          initialValue: 6,
                          max: 15,
                          innerWidget: (percentage) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: ImageIcon(Svg(ImageConstants.cupIconBig),
                                      size: 70,
                                      color: AppColorScheme.mainAppDarkGreen),
                                ),
                                Text(
                                  "${percentage.toInt()}/15",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColorScheme.mainAppDarkGreen),
                                )
                              ],
                            );
                          },
                          appearance: CircularSliderAppearance(
                            animDurationMultiplier: 2.5,
                              infoProperties: InfoProperties(
                                  bottomLabelStyle: const TextStyle(fontSize: 20)),
                              customWidths: CustomSliderWidths(
                                trackWidth: 8,
                                progressBarWidth: 13,
                              ),
                              angleRange: 300,
                              startAngle: 120,
                              customColors: CustomSliderColors(
                                  trackColor: AppColorScheme.mainAppDarkGreen
                                      .withOpacity(0.6),
                                  progressBarColor: AppColorScheme.mainAppDarkGreen,
                                  dotColor: Colors.transparent,
                                  hideShadow: true)),
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              yildizandcup(
                                  "Yıldız bakiyesi", 0, ImageConstants.starIcon),
                              yildizandcup(
                                  "İkram içecek", 0, ImageConstants.cupIcon),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppColorScheme.buttonGrey),
                                child: const Text(
                                  "Detaylar",
                                  style: TextStyle(
                                      color: AppColorScheme.mainAppDarkerGrey),
                                )),
                          )
                        ],
                      )
                    ]),
              ),
              SizedBox(height: 20,),
              if(showCurrentOrder)(orderDetails()),
            ]),
            DraggableScrollableSheet(
                initialChildSize:showCurrentOrder ?0.25:0.53,
                maxChildSize: 1,
                minChildSize:showCurrentOrder ?0.25:0.53,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: const Offset(0, 15),
                              color: AppColorScheme.shadow.withOpacity(0.4),
                              blurRadius: 30)
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    height: double.infinity,
                    width: phoneWidth,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 6,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColorScheme.buttonGrey)),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(horizontal: 20) +
                                const EdgeInsets.only(top: 10, bottom: 20),
                            child: const Text(
                              "Kampanyalar",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColorScheme.mainAppDark,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          child: ListView.separated(
                              controller: scrollController,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 25),
                              scrollDirection: Axis.vertical,
                              itemCount: details.length,
                              itemBuilder: (context, index) {
                                return offersView(index,phoneWidth);
                              }),
                        ),
                      ],
                    ),
                  );
                })
          ]),
        );
  }
}

Widget yildizandcup(String label, int quantity, String icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage(icon),
              color: icon == ImageConstants.starIcon
                  ? AppColorScheme.gold
                  : AppColorScheme.mainAppDarkGreen,
              size: 30,
            ),
            const SizedBox(width: 10,),
            Text(
              "$quantity",
              style: const TextStyle(
                  color: AppColorScheme.mainAppDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
        Text(
          label,
          style: const TextStyle(
              color: AppColorScheme.mainAppDark,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ],
    ),
  );
}

Widget offersView(int index,double phoneWidth) {
  return Column(
      children: [
        Container(
          width: 350,
          height: 150,
          decoration: const BoxDecoration(
              color: Colors.red,

              borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Image.asset(ImageConstants.offer,fit: BoxFit.fill,),
        ),
        SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Text(
                  "Lorem Ipsum",
                  style:
                      TextStyle(fontSize: 16, color: AppColorScheme.mainAppDark),
                ),

              Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet gravida quam aliquam aenean fermentum non accumsan.",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColorScheme.mainAppDark.withOpacity(0.7))),
            ],
          ),
        ),
      ],
  );
}

Widget orderDetails(){
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    width: 400,
    height: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sipariş Detayı",style: TextStyle(color: AppColorScheme.mainAppDark,fontSize: 18,fontWeight: FontWeight.bold),),
        Row(
          children: [
            Container(
              width: 185,
              padding: const EdgeInsets.only(top: 20,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(ImageConstants.hazelnutCoffee)),
              SizedBox(
                height: 50,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hazelnut Coffee",style: TextStyle(color: AppColorScheme.mainAppDark,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 150,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Adet: 2",style: TextStyle(color: AppColorScheme.mainAppDark)),
                          Text("Boyut: Venti",style: TextStyle(color: AppColorScheme.mainAppDark))
                        ]),
                    )
                      ],
                    ),
              ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Mağaza Adresi",style: TextStyle(color: AppColorScheme.grey)),
              Text("Alma Zamını",style: TextStyle(color: AppColorScheme.grey))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ImageIcon(AssetImage(ImageConstants.locationIcon)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kozyatağı Kadıköy-(6.7km)",style: TextStyle(color: AppColorScheme.mainAppDark,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ImageIcon(Svg(ImageConstants.timeIcon)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("13:00",style: TextStyle(color: AppColorScheme.mainAppDark,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
