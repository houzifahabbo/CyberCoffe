import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_model.dart';
import 'package:coffee/view/product_detial/view/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductDetailsCardViewModel {
  int productQuantity = 0 ;
  bool isHidden=true;

  void navigateToPage(BuildContext context, ProductModel productModel) {
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailView(product: productModel)));
  }

  void increaseQuantity(){
    if(productQuantity==0){
      isHidden = !isHidden;
    }
    productQuantity++;
  }

  void decreaseQuantity(){
    if(productQuantity == 1){
      isHidden = !isHidden;
    }
    productQuantity--;
  }
}

class ProductDetails {
  String productPhoto, productName,productPrice;
  ProductDetails(this.productPhoto, this.productName, this.productPrice);
}

List<ProductDetails> details = [
  ProductDetails(ImageConstants.hazelnutCoffee, "Hazelnut Coffee", "20 TL"),
  ProductDetails(ImageConstants.caramelFrappucino, "Caramel Frappucino", "20 TL"),
  ProductDetails(ImageConstants.mochaFrappuccino, "Mocha Frappuccino", "20 TL"),
  ProductDetails(ImageConstants.espressoFrappuccino, "Espresso Frappuccino", "20 TL"),
];

List<String> dropDownMenuItems = [
  'Tall',
  'Grande',
  'Venti',
];
String dropdownValue = 'Tall';
