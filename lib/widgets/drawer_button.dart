import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -3,
        color: const Color(0xFFAEDBEB),
        boxShape: NeumorphicBoxShape.roundRect(
          const BorderRadius.all(Radius.circular(100)),
        ),
      ),
      child: IconButton(
        onPressed: Scaffold.of(context).openDrawer,
        icon: const Icon(Icons.menu),
        iconSize: 30,
        color: AppColors.darkBlue,
      ),
    );
  }
}
