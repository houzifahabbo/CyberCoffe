import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter/material.dart';

import '../app_bar/app_bar_view_model.dart';
class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar("Ürün Detayı"),
        body: Column(
            children:[
            Image.asset(ImageConstants.hazelnutCoffee)
    ]),
    );
  }
}
