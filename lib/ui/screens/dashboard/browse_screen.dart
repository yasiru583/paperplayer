import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paperplayer/data/models/genre_data.dart';
import 'package:paperplayer/ui/components/appbar.dart';
import 'package:paperplayer/ui/components/bottom_nav.dart';
import 'package:paperplayer/ui/components/main_drawer.dart';
import 'package:paperplayer/ui/components/user_drawer.dart';
import 'package:paperplayer/util/constants.dart';
import 'package:paperplayer/util/size_config.dart';

class BrowseScreen extends StatelessWidget {
  static const routeName = '/browse-screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Constants.backgroundColor,
        appBar: CommanAppBar(),
        drawer: MainDrawer(),
        endDrawer: UserDrawer(),
        bottomNavigationBar: BottomNav(2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSearchBox(context),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Browse',
                style: TextStyle(
                  color: Constants.darkTextColor,
                  fontFamily: 'HKGrostesk',
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children:
                      Constants().getGenreList().map((GenreData genreData) {
                    return Card(
                        color: genreData.color,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/genere.svg',
                                fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                genreData.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'HKGrostesk',
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                ),
                              ),
                            )
                          ],
                        ));
                  }).toList()),
            ),
          ],
        ));
  }

  Padding buildSearchBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            cursorColor: Theme.of(context).cursorColor,
            decoration: InputDecoration(
              hintText: 'Search for...',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
