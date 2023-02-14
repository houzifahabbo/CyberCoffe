import 'package:flutter/material.dart';

class ProductDetailViewModel{
  int productQuantity = 0 ;
  int selectedIndex = 0;

  void increaseQuantity(){
    productQuantity++;
  }

  void decreaseQuantity(){
    productQuantity--;
    if(productQuantity < 0){
      productQuantity = 0;
    }
  }

  void onSelected(int index) {
    selectedIndex = index;
  }

  void navigateToPage(BuildContext context, String pageName) {
    Navigator.pushReplacementNamed(context, pageName);
  }
}