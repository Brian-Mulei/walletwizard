import 'package:flutter/material.dart';


class SlickButton extends StatefulWidget {
final  String name;
  final VoidCallback tap;
  final Color borderColor;
    const SlickButton({Key? key,required this.name,required this.tap,required this.borderColor}) : super(key: key);

  @override
  State<SlickButton> createState() => _SlickButtonState();
}

class _SlickButtonState extends State<SlickButton> {
  @override
  Widget build(BuildContext context) {
    ColorScheme theme =Theme.of(context).colorScheme;

    return MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 2,
              color: widget.borderColor
          ),
          borderRadius: BorderRadius.circular(5)
      ),

      child: Text(widget.name),
      onPressed: () {
        widget.tap();

      },
    );
  }
}
