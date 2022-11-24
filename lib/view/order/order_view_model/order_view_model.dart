import 'package:flutter/material.dart';
import '../../../../product/constants/color_scheme.dart';

class PickTimeOrLocation extends StatefulWidget {
  String text;
  bool addTitle;
  Widget icon;

  PickTimeOrLocation({Key? key, required this.icon, required this.text, required this.addTitle}) : super(key: key);

  @override
  State<PickTimeOrLocation> createState() => _PickTimeOrLocationState();
}

class _PickTimeOrLocationState extends State<PickTimeOrLocation> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: phoneHeight * 0.01),
        child: Container(
            height: widget.addTitle ? phoneHeight * 0.08 : phoneHeight * 0.07,
            width: phoneWidth * 0.925,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xffdfe4ec)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: phoneWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.addTitle)
                    (Padding(
                        padding: EdgeInsets.only(top: phoneHeight * 0.015, bottom: phoneHeight * 0.01),
                        child: const Text(
                          "Paketinizi alma zamznı",
                          style: TextStyle(color: Color(0xff6f8094)),
                        )))
                  else
                    (Padding(padding: EdgeInsets.only(top: phoneHeight * 0.01, bottom: phoneHeight * 0.01))),
                  Row(
                    children: [
                      widget.icon,
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(left: phoneWidth * 0.04),
                          child: Text(
                            widget.text,
                            style:
                                const TextStyle(fontSize: 16, color: AppColorScheme.mainAppDarkestGrey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                            onTap: () {},
                            child: const Text('Değiştir',
                                style: TextStyle(color: AppColorScheme.mainAppDarkGreen, fontWeight: FontWeight.bold, fontSize: 16))),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
