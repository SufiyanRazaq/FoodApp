import 'package:flutter/material.dart';
import 'package:widgets/utils/model.dart';
import 'package:widgets/Views/details_page.dart';

class PopularRestaurants extends StatefulWidget {
  @override
  _PopularRestaurantsState createState() => _PopularRestaurantsState();
}

class _PopularRestaurantsState extends State<PopularRestaurants> {
  List<Restaurant> restaurants = Restaurant.getPopularRestaurants();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Restaurant restaurant = restaurants[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  restaurant: restaurant,
                ),
              ),
            ),
            child: Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                bottom: 10.0,
              ),
              color: Colors.grey.shade400,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade100,
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                              blurRadius: 8),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/${restaurant.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 5.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              restaurant.food,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              restaurant.restaurantName,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.green.shade800,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              '${restaurant.rating} ',
                            ),
                            Text(
                              '(${restaurant.raters})',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
