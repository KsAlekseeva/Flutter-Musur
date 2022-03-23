export 'welcome_manager.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeManager = ref.watch(welcomeManagerProvider);
    return ScreenScaffold(
      showDrawer: false,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 50, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/yoga.png',
                    height: 300,
                    width: 300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 60, left: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      color: const Color(0xFFB5CAE7),
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(32)),
                      depth: 10,
                      lightSource: LightSource.topLeft,
                      shadowLightColor: const Color(0xFFE1B2F2),
                      shadowDarkColor: const Color(0xFF5E64DD),
                    ),
                    child: const Text(
                      ' Welcome to \n     our app',
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: welcomeManager.markSeen,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
