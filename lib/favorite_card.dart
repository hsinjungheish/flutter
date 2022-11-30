import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
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
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
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
