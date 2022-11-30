import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

List<String> favoriteDataList = [];
List<String> favoriteImageList = [];

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.plot,
  }) : super(key: key);

  final Image image;
  final String title;
  final String plot;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            FavoriteButton(
                              isFavorite: false,
                              valueChanged: (_isFavorite) {
                                print('Is Favorite : $_isFavorite');
                                if(_isFavorite){
                                  favoriteDataList.add(title);
                                  var str = image.toString() ;
                                  var strs = str.split("\"");
                                  favoriteImageList.add(strs[1]);
                                }else{
                                  for(int i = 0; i < favoriteDataList.length; i++) {
                                    if(favoriteDataList[i] == title) {
                                      favoriteDataList.remove(favoriteDataList[i]);
                                      favoriteImageList.remove(favoriteImageList[i]);
                                    }
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text('\n'),
                      Flexible(
                        flex: 3,
                        child: image,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
