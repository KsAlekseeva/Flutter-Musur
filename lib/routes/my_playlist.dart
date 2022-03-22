import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/routes/favourites.dart';
import 'package:musur/routes/now_playing.dart';
import 'package:musur/routes/search.dart';

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({Key? key}) : super(key: key);

  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              height: 900,
              width: 500,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight,
                      colors: [
                    Color(0xFFE1B2F2),
                    Color(0xFFA2C3E1),
                    Color(0xFFC1FFFB)
                  ])),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 145, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              depth: -2,
                              color: Color(0xFFaedbeb),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.all(Radius.circular(100)))),
                          child: IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(Icons.menu),
                              iconSize: 30,
                              color: Color(0xFF313D69)),
                        ),
                        Text(
                          "My song",
                          style: TextStyle(
                              color: Color(0xFF313D69),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
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
                              color: Color(0xFFBDF6F7),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.all(Radius.circular(250)))),
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
                      children: [
                        Text(
                          "Мои песни",
                          style: TextStyle(
                              color: Color(0xFF313D69),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, right: 55, left: 65),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const Divider(
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
                                color: Color(0xFF313D69),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Icon(Icons.favorite),
                        )*/
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight,
                      colors: [
                        Color(0xFFE1B2F2),
                        Color(0xFFA2C3E1),
                        Color(0xFFC1FFFB)
                      ])),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Musur',
                    style: TextStyle(
                        color: Color(0xFF313D69),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border, color: Color(0xFF313D69),),
                  title: Text(
                    'Избранное',
                    style: TextStyle(
                        color: Color(0xFF313D69),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => FavouritesRoute(),
                    ),);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search,color: Color(0xFF313D69),),
                  title: Text(
                    'Поиск',
                    style: TextStyle(
                        color: Color(0xFF313D69),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => SearchRoute(),
                    ),);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_outline, color: Color(0xFF313D69)),
                  title: Text(
                    'Мой плейлист',
                    style: TextStyle(
                        color: Color(0xFF313D69),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "My playlist");

                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class TrackTile extends StatefulWidget {
  const TrackTile({Key? key}) : super(key: key);

  @override
  _TrackTileState createState() => _TrackTileState();
}

class _TrackTileState extends State<TrackTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
      onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PlayingRoute()),
    );
      },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                  depth: 4,
                  color: Color(0xFFCEBEEE),
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(100)))),
              child: IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 30,
                  color: Color(0xFF313D69)),
            ),
            Text(
              "My song",
              style: TextStyle(
                  color: Color(0xFF313D69),
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  depth: -2,
                  color: Color(0xFFCEBEEE),
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(100)))),
              child: IconButton(
                  onPressed: (){
                  },
                  icon: const Icon(Icons.favorite),
                  iconSize: 30,
                  color: Color(0xFF313D69)),
            ),

          ],
        ),
      ),
    );
  }
}
