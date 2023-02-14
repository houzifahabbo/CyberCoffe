import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/shimmer_view.dart';
import 'package:coffee/storage_service.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_model.dart';
import 'package:coffee/view/product_detial/view_model/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../app_bar/app_bar_view.dart';

class ProductDetailView extends StatefulWidget {
  final ProductModel product;
  const ProductDetailView({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  ProductDetailViewModel model = ProductDetailViewModel();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    final StorageServices storage = StorageServices();

    return Scaffold(
        appBar: mainAppBarWithLeading("Ürün Detayı", context),
        body: FutureBuilder(
            future: storage.downloadURL(widget.product.image!),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 230,
                        height: 230,
                        decoration:
                            const ShapeDecoration(shape: CircleBorder()),
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.contain,
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            widget.product.description!,
                            style: const TextStyle(
                                color: AppColorScheme.mainAppDarkerGrey,
                                height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30) +
                                      const EdgeInsets.only(top: 40),
                              child: Text('${widget.product.price!}TL',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                quantity(phoneWidth, model),
                                sizeButtons()
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColorScheme.mainAppGreen,
                                  padding: EdgeInsets.symmetric(
                                      vertical: phoneWidth * 0.05,
                                      horizontal: phoneHeight * 0.1),
                                ),
                                child: const Center(child: Text("Satın Al")),
                              ),
                            )
                          ],
                        ),
                      ))
                ]);
              }
              return shimmer();
            }));
  }

  Widget sizeButtons() {
    return SizedBox(
        height: 50,
        width: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            itemCount: size.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  model.onSelected(index);
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: model.selectedIndex == index
                            ? AppColorScheme.mainAppDarkGreen
                            : AppColorScheme.buttonGrey,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                    color: model.selectedIndex == index
                        ? AppColorScheme.mainAppDarkGreen.withOpacity(0.3)
                        : AppColorScheme.mainAppSoftGrey,
                  ),
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(size[index]),
                ),
              );
            }));
  }

  Widget quantity(phoneWidth, ProductDetailViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20) + const EdgeInsets.only(left: 20, right: 10),
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColorScheme.buttonGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              model.decreaseQuantity();
              setState(() {});
            },
            icon: const Icon(
              Icons.remove,
              color: AppColorScheme.mainAppDarkerGrey,
              size: 25,
            ),
            hoverColor: Colors.red,
          ),
          Text(
            "${model.productQuantity}",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColorScheme.mainAppDarkerGrey),
          ),
          IconButton(
              onPressed: () {
                model.increaseQuantity();
                setState(() {});
              },
              icon: const Icon(Icons.add,
                  color: AppColorScheme.mainAppDarkerGrey, size: 25))
        ],
      ),
    );
  }

  Widget shimmer() {
    return Container(
      color: AppColorScheme.backgroundGrey,
      child: Column(children: [
        const Expanded(
            flex: 5,
            child: ShimmerView.circular(
              height: 230,
              width: 230,
            )),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerView.rectangular(
                  height: 30,
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                ShimmerView.rectangular(height: 15),
                SizedBox(
                  height: 5,
                ),
                ShimmerView.rectangular(height: 15),
                SizedBox(
                  height: 5,
                ),
                ShimmerView.rectangular(height: 15),
                SizedBox(
                  height: 5,
                ),
                ShimmerView.rectangular(height: 15),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                      child: ShimmerView.rectangular(
                        height: 50,
                        width: 200,
                      ))
                ],
              ),
            ))
      ]),
    );
  }
}

List<String> size = [
  ImageConstants.tallSizeIcon,
  ImageConstants.grandeSizeIcon,
  ImageConstants.ventiSizeIcon,
];

// GestureDetector(
// child: Container(
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// border: Border.all(color: AppColorScheme.mainAppDarkGreen,width: 1.5),
// borderRadius: BorderRadius.circular(5),
// color: AppColorScheme.mainAppSoftGrey
// ),
// alignment: Alignment.center,
// //padding: const EdgeInsets.only(top: 5,left: 3),
// child: SvgPicture.asset(ImageConstants.tallSizeIcon)
// )
//
// ),
// GestureDetector(
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(color: AppColorScheme.buttonGrey,width: 1.5),
// borderRadius: BorderRadius.circular(5),
// color: AppColorScheme.mainAppSoftGrey
// ),
// height: 50,
// width: 50,
// alignment: Alignment.center,
// padding: const EdgeInsets.only(top:5,left: 3),
// child: SvgPicture.asset(ImageConstants.grandeSizeIcon),
// //),
// ),
// ),
// GestureDetector(
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(color: AppColorScheme.buttonGrey,width: 1.5),
// borderRadius: BorderRadius.circular(5),
// color: AppColorScheme.mainAppSoftGrey
// ),
// height: 50,
// width: 50,
// alignment: Alignment.center,
// child: SvgPicture.asset(ImageConstants.ventiSizeIcon),
// //),
// ),
// ),
