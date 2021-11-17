import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool hasLeading;
  final List<Widget> actions;

  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
    this.hasLeading = false,
    this.actions,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      leading: hasLeading
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/logo.png',
        width: 50,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
