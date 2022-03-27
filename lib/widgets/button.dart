import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class ButtonBase extends StatelessWidget {
  const ButtonBase({
    Key? key,
    this.color,
    this.convex = false,
    this.child,
  }) : super(key: key);

  final Color? color;
  final bool convex;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: convex ? 4 : -3,
        color: color,
        boxShape: NeumorphicBoxShape.roundRect(
          const BorderRadius.all(Radius.circular(100)),
        ),
      ),
      child: child,
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      color: const Color(0xFFAEDBEB),
      child: IconButton(
        onPressed: Scaffold.of(context).openDrawer,
        icon: const Icon(Icons.menu),
        iconSize: 30,
        color: AppColors.darkBlue,
      ),
    );
  }
}

class PopButton extends StatelessWidget {
  const PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      color: const Color(0xFFBDF6F7),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        iconSize: 30,
        color: AppColors.darkBlue,
      ),
    );
  }
}
