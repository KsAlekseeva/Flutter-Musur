import 'package:flutter/material.dart';
import 'package:musur/musur.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    Key? key,
    required this.child,
    this.showDrawer = true,
    this.appBar,
  }) : super(key: key);

  final Widget child;
  final bool showDrawer;
  final ScreenAppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      drawer: showDrawer ? const DrawerWidget() : null,
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.mainGradient,
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

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreenAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget? trailing;

  static const _verticalPadding = 30.0;

  @override
  Size get preferredSize =>
      const Size.fromHeight(_verticalPadding * 2 + kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final systemTopPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: _verticalPadding + systemTopPadding,
        left: 30.0,
        right: 30.0,
        bottom: _verticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ??
              Opacity(
                opacity: 0.0,
                child: trailing,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: title,
          ),
          trailing ??
              Opacity(
                opacity: 0.0,
                child: leading,
              ),
        ],
      ),
    );
  }
}
