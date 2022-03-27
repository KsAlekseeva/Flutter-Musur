import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:musur/musur.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  void _popToHomeAndPush(String route) {
    _goHome();
    context.pushNamed(route);
  }

  void _goHome() {
    // close drawer
    Navigator.of(context).pop();
    context.goNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.mainGradient,
          ),
          child: ListView(
            children: [
              const _DrawerAppTitle(),
              _DrawerItemTile(
                text: 'Избранное',
                icon: Icons.favorite_border,
                onTap: () => _popToHomeAndPush(Routes.favourites),
              ),
              _DrawerItemTile(
                text: 'Поиск',
                icon: Icons.search,
                onTap: () => _popToHomeAndPush(Routes.search),
              ),
              _DrawerItemTile(
                text: 'Мой плейлист',
                icon: Icons.person_outline,
                onTap: _goHome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerAppTitle extends StatelessWidget {
  const _DrawerAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text(
        MusurConfig.appTitle,
        style: TextStyle(
          color: AppColors.darkBlue,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _DrawerItemTile extends StatelessWidget {
  const _DrawerItemTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.darkBlue,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: AppColors.darkBlue,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: onTap,
    );
  }
}
