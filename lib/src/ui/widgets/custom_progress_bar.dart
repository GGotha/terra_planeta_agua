import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomProgressBar extends StatelessWidget {
  double value;

  CustomProgressBar({Key key, this.value}) : super(key: key);

  Animation<Color> buildColorLinearProgressIndicator(value) {
    if (value >= 0.7 && value <= 1) {
      return AlwaysStoppedAnimation(Colors.green);
    }
    if (value >= 0.5 && value <= 0.69) {
      return AlwaysStoppedAnimation(Colors.yellow);
    }
    if (value < 0.5) {
      return AlwaysStoppedAnimation(Colors.red);
    }

    return AlwaysStoppedAnimation(Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: value,
          valueColor: buildColorLinearProgressIndicator(value),
        ),
      ),
    );
  }
}
