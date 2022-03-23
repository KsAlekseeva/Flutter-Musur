import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';

class SearchRoute extends StatefulWidget {
  const SearchRoute({Key? key}) : super(key: key);

  @override
  State<SearchRoute> createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      child: Builder(builder: (context) {
        return Column(
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
                        color: AppColors.darkBlue),
                  ),
                  Text(
                    'Поиск',
                    style: TextStyle(
                        color: AppColors.darkBlue,
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
        );
      }),
    );
  }
}
