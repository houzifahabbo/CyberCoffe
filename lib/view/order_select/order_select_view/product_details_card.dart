import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee/core/extensions/context_extensions.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_details_card_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/color_scheme.dart';

class ProductCard extends StatelessWidget {
  double phoneWidth, phoneHeight;
  ProductCard(this.phoneWidth, this.phoneHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: phoneHeight * 0.025,),
      shrinkWrap: false,
      padding: EdgeInsets.symmetric(vertical: phoneHeight * 0.025),
      scrollDirection: Axis.vertical,
      itemCount: details.length,
      itemBuilder: (context, index) {
        return ProductCardGetter(index: index, phoneWidth:phoneWidth, phoneHeight: phoneHeight);
      },
    );
  }
}

class ProductCardGetter extends StatefulWidget {
  int index;
  double phoneWidth, phoneHeight;
  ProductCardGetter({required this.index, required this.phoneWidth, required this.phoneHeight, Key? key,}) : super(key: key);

  @override
  State<ProductCardGetter> createState() => _ProductCardGetterState();
}

class _ProductCardGetterState extends State<ProductCardGetter> {
  ProductDetailsCardViewModel model = ProductDetailsCardViewModel();

  @override
  Widget build(BuildContext context) {
    ProductDetails instance = details[widget.index];

    return Row(children: [
      Image.asset(instance.productPhoto),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: widget.phoneWidth * 0.05),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productNameText(instance),
                productPriceText(instance),
                const SizedBox(height: 7),
                if (model.isHidden)
                  (addProductButton(context.width,model))
                else
                  quantityAndSize(context.width,model)
              ]
          ),
        ),
      )
    ]);
  }
  Widget productNameText(ProductDetails instance) {
    return AutoSizeText(
      instance.productName,
      maxLines: 1,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget productPriceText(ProductDetails instance) {
    return Text(
      instance.productPrice,
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget addProductButton(phoneWidth,ProductDetailsCardViewModel model) {
    return Container(
      padding: EdgeInsets.only(left: phoneWidth * 0.385),
      alignment: Alignment.bottomRight,
      height: 30,
      child: ElevatedButton(
          onPressed: () {
            model.increaseQuantity();
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.mainAppGreen),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: phoneWidth * 0.02),
              child: const Text("Ekle", style: TextStyle(fontSize: 16)))),
    );
  }

  Widget quantityAndSize(phoneWidth,ProductDetailsCardViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 105,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorScheme.buttonGrey,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  model.decreaseQuantity();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.remove,
                  color: AppColorScheme.mainAppDarkerGrey,
                  size: 15,
                ),
                hoverColor: Colors.red,
              ),
              Text(
                "${model.productQuantity}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColorScheme.mainAppDarkerGrey),
              ),
              IconButton(
                  onPressed: () {
                    model.increaseQuantity();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add,
                      color: AppColorScheme.mainAppDarkerGrey, size: 15))
            ],
          ),
        ),
        DropDownMenu(widget.phoneWidth),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorScheme.mainAppGreen,
          ),
          child: IconButton(
              onPressed: () {
                print("c");
              },
              icon: const Icon(Icons.check, color: Colors.white, size: 15)),
        )
      ],
    );
  }
}

class DropDownMenu extends StatefulWidget {
  double phoneWidth;
  DropDownMenu(this.phoneWidth, {Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: AppColorScheme.buttonGrey,
        borderRadius: BorderRadius.circular(5),
      ),
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
            style: const TextStyle(
                color: AppColorScheme.mainAppDarkerGrey,
                fontWeight: FontWeight.bold),
            selectedItemBuilder: (BuildContext context) {
              return dropDownMenuItems.map((String value) {
                return Align(
                  child: Text(
                    dropdownValue,
                    style: const TextStyle(
                        color: AppColorScheme.mainAppDarkerGrey),
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
}
