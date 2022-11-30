import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'favorite_card.dart';
import 'restaurant_model.dart';
import 'restaurant_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Restaurant'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          SizedBox(
            height: 710,
            child:ListView.builder(
              itemCount: favoriteDataList.length,
              itemBuilder: (context,index) {
                final restaurant = RestaurantModel.favoriteRestaurantByIndex(index);
                //final restaurant = RestaurantModel.getRestaurantByIndex(4*i+index);
                return FavoriteCard(
                  image: Image.asset(restaurant.imagePath),
                  title: restaurant.title,
                  plot: restaurant.plot,
                );
              },
            ),
          ),

        ],
      )
    );
  }
}
