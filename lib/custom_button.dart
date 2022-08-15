import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
     this.backgroundColor,
    required this.onPress,
     this.borderclr,
     this.shape,
  });

  final Widget title;
  final Color? backgroundColor;
  final Function onPress;
   var borderclr;
   var shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
shape: MaterialStateProperty.all(shape),
        side: MaterialStateProperty.all( borderclr ),
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
      onPressed: () {
        onPress();
      },
      child: title,
    );
  }
}
