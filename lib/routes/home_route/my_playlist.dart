import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({Key? key}) : super(key: key);

  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      child: Builder(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 145, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -2,
                      color: const Color(0xFFaedbeb),
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                      iconSize: 30,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const Text(
                    "My song",
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 33, left: 33),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      color: const Color(0xFFBDF6F7),
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(250)),
                      ),
                    ),
                    child: Image.asset(
                      'assets/headphones.png',
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 33, left: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Мои песни",
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, right: 55, left: 65),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return TrackTile();
                },
                shrinkWrap: true,
                itemCount: 5,
                /*ListTile(
                          leading: Icon(Icons.play_arrow),
                          title: Text(
                            "New Track",
                            style: TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Icon(Icons.favorite),
                        )*/
              ),
            ),
          ],
        );
      }),
    );
  }
}
