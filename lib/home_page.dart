import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'restaurant_card.dart';
import 'restaurant_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory = 'All';
  List<String> catelog = ['\n 義式料理\n', '\n 日本料理\n', '\n 台南小吃\n'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NCKU Restaurant'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/favorite');
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Text(' Category   ', style: TextStyle(fontSize: 25),),
                DropdownButton(
                    value: selectedCategory,
                    onChanged: (String? newCategory){
                      setState(() {
                        selectedCategory = newCategory;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                          value: 'All',
                          child: Text('All')
                      ),
                      DropdownMenuItem(
                          value: '義式料理',
                          child: Text('義式料理'),
                      ),
                      DropdownMenuItem(
                        value: '日本料理',
                        child: Text('日本料理'),
                      ),
                      DropdownMenuItem(
                        value: '台南小吃',
                        child: Text('台南小吃'),
                      )
                    ])
              ],
            ),
            if (selectedCategory == 'All')
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  var i=index;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text('${catelog[index]}',style:TextStyle(fontSize: 30), textAlign: TextAlign.left),
                      SizedBox(
                        height:250,
                        child:ListView.builder(
                          scrollDirection:Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context,index) {
                            final restaurant = RestaurantModel.getRestaurantByIndex(4*i+index);
                            return RestaurantCard(
                              image: Image.asset(restaurant.imagePath),
                              title: restaurant.title,
                              plot: restaurant.plot,
                            );
                          },
                        ),
                      ),

                    ],
                  );
                },
              ),
            )
            else if(selectedCategory == '義式料理')
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Text('\n\n義式料理',style:TextStyle(fontSize: 30), textAlign: TextAlign.left),
                        SizedBox(
                          height:250,
                          child:ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context,index) {
                              final restaurant = RestaurantModel.getRestaurantByIndex(index);
                              //final restaurant = RestaurantModel.getRestaurantByIndex(4*i+index);
                              return RestaurantCard(
                                image: Image.asset(restaurant.imagePath),
                                title: restaurant.title,
                                plot: restaurant.plot,
                              );
                            },
                          ),
                        ),

                      ],
                    );
                  },
                ),
              )
            else if(selectedCategory == '日本料理')
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text('\n\n日本料理',style:TextStyle(fontSize: 30), textAlign: TextAlign.left),
                          SizedBox(
                            height:250,
                            child:ListView.builder(
                              scrollDirection:Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context,index) {
                                final restaurant = RestaurantModel.getRestaurantByIndex(4+index);
                                //final restaurant = RestaurantModel.getRestaurantByIndex(4*i+index);
                                return RestaurantCard(
                                  image: Image.asset(restaurant.imagePath),
                                  title: restaurant.title,
                                  plot: restaurant.plot,
                                );
                              },
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                )
              else if(selectedCategory == '台南小吃')
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Text('\n\n台南小吃',style:TextStyle(fontSize: 30), textAlign: TextAlign.left),
                            SizedBox(
                              height:250,
                              child:ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context,index) {
                                  final restaurant = RestaurantModel.getRestaurantByIndex(8+index);
                                  //final restaurant = RestaurantModel.getRestaurantByIndex(4*i+index);
                                  return RestaurantCard(
                                    image: Image.asset(restaurant.imagePath),
                                    title: restaurant.title,
                                    plot: restaurant.plot,
                                  );
                                },
                              ),
                            ),

                          ],
                        );
                      },
                    ),
                  )
          ],
        )
    );
  }
}
