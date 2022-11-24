import 'package:coffee/core/extensions/context_extensions.dart';
import 'package:coffee/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../product/constants/color_scheme.dart';

class ProductCard extends StatefulWidget {
  double phoneWidth, phoneHeight;
  ProductCard(this.phoneWidth, this.phoneHeight, {Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: widget.phoneHeight * 0.025,
      ),
      shrinkWrap: false,
      padding: EdgeInsets.symmetric(vertical: widget.phoneHeight * 0.025),
      scrollDirection: Axis.vertical,
      itemCount: details.length,
      itemBuilder: (context, index) {
        return productCardGetter(index, widget.phoneWidth, widget.phoneHeight);
      },
    );
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
productCardGetter(int index, double phoneWidth, double phoneHeight) {
  ProductDetails instance = details[index];
  return SizedBox(
      height: phoneHeight * 0.11,
      child: Row(children: [
        Image.asset(instance.productPhoto),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: phoneWidth * 0.05),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              productNameText(instance),
              productPriceText(instance),
              //const Spacer(),
              quantityAndSize(phoneWidth, phoneHeight)
              //addProductButton(phoneWidth, phoneHeight)
            ]),
          ),
        )
      ]));
}

Row quantityAndSize(double phoneWidth, double phoneHeight) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        color: AppColorScheme.buttonGrey,
        height: phoneHeight * 0.043,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.remove,color: AppColorScheme.mainAppDarkerGrey,)),
            const Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColorScheme.mainAppDarkerGrey),),
            IconButton(onPressed: (){}, icon: Icon(Icons.add,color: AppColorScheme.mainAppDarkerGrey,)),
          ],
        ),
      ),
      DropDownMenu(phoneWidth),
     Container(
       height: phoneHeight*0.043,
          width: phoneWidth*0.10,
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.mainAppGreen
            ),
            onPressed: () {},
            child: SvgPicture.asset(ImageConstants.checkIcon),
          ),
        )

    ],
  );
}

Container addProductButton(double phoneWidth, double phoneHeight) {
  return Container(
    padding: EdgeInsets.only(left: phoneWidth * 0.385),
    alignment: Alignment.bottomRight,
    height: phoneHeight * 0.043,
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColorScheme.mainAppGreen),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: phoneWidth * 0.02),
            child: const Text("Ekle", style: TextStyle(fontSize: 16)))),
  );
}

Text productPriceText(ProductDetails instance) {
  return Text(
    instance.productPrice,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text productNameText(ProductDetails instance) {
  return Text(
    instance.productName,
    maxLines: 2,
    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  );
}

class DropDownMenu extends StatefulWidget {
  double phoneWidth;
  DropDownMenu(this.phoneWidth,{Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = 'Tall';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.043,
      //widget.phoneHeight * 0.043,
      decoration: BoxDecoration(
          color: AppColorScheme.buttonGrey,
          borderRadius: BorderRadius.circular(5),),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: AppColorScheme.buttonGrey,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColorScheme.mainAppDarkerGrey,
            ),
            borderRadius: BorderRadius.circular(5),
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            selectedItemBuilder: (BuildContext context) {
              return dropDownMenuItems.map((String value) {
                return Align(
                  child: Text(
                    dropdownValue,
                    style: const TextStyle(color: AppColorScheme.mainAppDarkerGrey),
                  ),
                );
              }).toList();
            },
            items:
            dropDownMenuItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  List<String> dropDownMenuItems = [
    'Tall',
    'Grande',
    'Venti',
    'Short',
  ];

}
