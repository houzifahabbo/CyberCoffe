import 'package:flutter/material.dart';
import '../../../../product/constants/color_scheme.dart';

class FilterButtonsListView extends StatefulWidget {
  double phoneWidth, phoneHeight;
  FilterButtonsListView(this.phoneWidth, this.phoneHeight, {Key? key})
      : super(key: key);

  @override
  State<FilterButtonsListView> createState() => _FilterButtonsListViewState();
}

class _FilterButtonsListViewState extends State<FilterButtonsListView> {
  int selectedIndex = 0;
  onSelected(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: filterLabel.length,
        separatorBuilder: (context, index) => SizedBox(
          width: widget.phoneWidth * 0.03,
        ),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColorScheme.shadow,
                  backgroundColor:
                  selectedIndex != null && selectedIndex == index
                      ? AppColorScheme.buttonGrey
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(color: AppColorScheme.buttonGrey)),
              onPressed: () => onSelected(index),
              child: Container(
                margin:
                EdgeInsets.symmetric(horizontal: widget.phoneWidth * 0.02),
                child: Text(filterLabel[index],
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColorScheme.mainAppDarkestGrey,
                    )),
              ));
        });
  }
}

List<String> filterLabel = [
  "Çok Satanlar",
  "Yiyecek",
  "Yeniler",
  "Kahveler",
];

