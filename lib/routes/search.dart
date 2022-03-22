

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/routes/my_playlist.dart';

class SearchRoute extends StatefulWidget {
  const SearchRoute({Key? key}) : super(key: key);

  @override
  State<SearchRoute> createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    var seekValue = 0.0;
    return Scaffold(
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: [
                    Color(0xFFE1B2F2),
                    Color(0xFFA2C3E1),
                    Color(0xFFC1FFFB),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 39, right: 160, left: 33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              depth: -3,
                              color: Color(0xFFAEDBEB),
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
                        Text('Поиск', style: TextStyle(
                            color: Color(0xFF313D69),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: LimitedBox(
                      maxWidth: 320,
                      child: CupertinoSearchTextField(
                        placeholder: "Введите название песни",
                        onSubmitted: (value) {
                          setState(() {
                            var text = value;
                          });
                        },
                      ),
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