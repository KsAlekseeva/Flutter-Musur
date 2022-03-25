import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class PlayingRoute extends StatefulWidget {
  const PlayingRoute({Key? key}) : super(key: key);

  @override
  State<PlayingRoute> createState() => _PlayingRouteState();
}

class _PlayingRouteState extends State<PlayingRoute> {
  var seekValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, right: 33, left: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DrawerButton(),
                  const Text(
                    'Now playing',
                    style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                        depth: -3,
                        color: Color(0xFFBDF6F7),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(100)))),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: AppColors.darkBlue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 39, right: 33, left: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          depth: 10,
                          color: Color(0xFFBECDEA),
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(100)))),
                      child: Image.asset(
                        'assets/woman.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: Text(
                      'Confidence',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    'Sanctus real',
                    style: TextStyle(
                        color: Color(0xFF59628C),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 24,
                  ),
                  /*IconButton(
                      icon: Icon(addFavorite
                          .elementAt(index)
                          ? Icons.favourite
                          : Icons
                          .star_border_outlined),
                    onPressed: () {
                      favourites.add(data[index]);
                      setState(() {
                        addFavorite[index] =
                        !addFavorite[index];
                      });
                    },*/
                  SizedBox(width: 200),
                  Icon(
                    Icons.repeat,
                    size: 24,
                  ),
                  Icon(
                    Icons.shuffle,
                    size: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
              child: NeumorphicSlider(
                  height: 14,
                  value: seekValue,
                  min: 0,
                  max: 10,
                  onChanged: (double value) {
                    setState(() {
                      seekValue = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      color: Color(0xFFDDC0F3),
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: implement
                      },
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      color: AppColors.darkBlue,
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: implement
                      },
                      icon: const Icon(Icons.pause),
                      iconSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      color: const Color(0xFFDDC0F3),
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: implement
                      },
                      icon: const Icon(Icons.skip_next),
                      iconSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}