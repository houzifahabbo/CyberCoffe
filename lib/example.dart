import 'package:flutter/material.dart';

//TODO add your PickTimeOrLocation widget and customezie it

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
              width: phoneWidth,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xffdfe4ec)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text("Paket alma zamanı"),
                trailing: TextButton(
                  onPressed: () {
                    print("clicked");
                  },
                  child: Text(
                    "Değiştir",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                leading: Icon(Icons.add),
              )),
        ),
      ),
    );
  }
}
