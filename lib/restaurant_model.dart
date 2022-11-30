import 'restaurant.dart';
import 'restaurant_card.dart';
import 'package:http/http.dart' as http;
class RestaurantModel {
  static const imagePathes = <String>[
    'lib/image/is.png',
    'lib/image/italyKitchen.png',
    'lib/image/s1815.png',
    '',
    'lib/image/fudao.png',
    'lib/image/fulian.png',
    'lib/image/onesushi.png',
    '',
    'lib/image/fish.png',
    'lib/image/month.png',
    'lib/image/hwd.png',
    '',
  ];

  static const titles = <String>[
    'is義式餐廳',
    '饗義廚房',
    'S1815',
    '',
    '福島壽司',
    '府連壽司',
    '一坪壽司',
    '',
    '七海魚皮',
    '當月麵店',
    '上海好味道小籠湯包',
    '',
  ];

  static const ItalyImagePathes = <String>[
    'lib/image/is.png',
    'lib/image/italyKitchen.png',
    'lib/image/s1815.png',
    '',
  ];

  static const ItalyTitles = <String>[
    'is義式餐廳',
    '饗義廚房',
    'S1815',
    '',
  ];

  static String plot = 'sdfadfajsd;fljasd;lfjasd;';

  static Restaurant getRestaurantByIndex(int index) {
    return Restaurant(
      imagePath: imagePathes[index],
      title: titles[index],
      plot: plot,
    );
  }
  static Restaurant getItalyRestaurantByIndex(int index) {
    return Restaurant(
      imagePath: ItalyImagePathes[index],
      title: ItalyTitles[index],
      plot: plot,
    );
  }
  static Restaurant favoriteRestaurantByIndex(int index) {
    return Restaurant(
      imagePath: favoriteImageList[index],
      title: favoriteDataList[index],
      plot: plot,
    );
  }
  static Future<List<Restaurant>> getRestaurant(String? selectedCategory) async{
    final headers = {
      'content-type': "application/x-www-form-urlencoded",
      'X-RapidAPI-Key': "2084ce6b4dmsh7af1e04a3ca60c9p10506djsn6dd1fabe326a",
      'X-RapidAPI-Host': "worldwide-restaurants.p.rapidapi.com"
    };
    final res = await http.get(
      Uri.parse('https://worldwide-restaurants.p.rapidapi.com/search'),
      headers: headers,
    );
  }
}
