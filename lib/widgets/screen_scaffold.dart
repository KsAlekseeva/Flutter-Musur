import 'package:flutter/material.dart';
import 'package:musur/musur.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    Key? key,
    required this.child,
    this.showDrawer = true,
  }) : super(key: key);

  final Widget child;
  final bool showDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer ? const DrawerWidget() : null,
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: [
                    Color(0xFFE1B2F2),
                    Color(0xFFA2C3E1),
                    Color(0xFFC1FFFB)
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
