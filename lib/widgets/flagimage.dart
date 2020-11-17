import 'package:flutter/material.dart';
import 'package:flags/models/country.dart';

typedef void MyCallback(String name);

class FlagImageWidget extends StatelessWidget {
  final String flag;
  final MyCallback onFlagSelected;

  FlagImageWidget({this.flag, this.onFlagSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onFlagSelected(flag);
        },
        child: Image(
          image: AssetImage("assets/" + flag +".png"),
          height: 60,
          width: 60,
        ),
      )
    );
  }
}
