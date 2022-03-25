import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class FavouritesRoute extends StatefulWidget {
  const FavouritesRoute({Key? key}) : super(key: key);

  @override
  State<FavouritesRoute> createState() => _FavouritesRouteState();
}

class _FavouritesRouteState extends State<FavouritesRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, right: 150, left: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DrawerButton(),
                  Text(
                    'Избранное',
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, right: 20, left: 20),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 2),
                itemBuilder: (BuildContext context, int index) {
                  return const TrackTile();
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
