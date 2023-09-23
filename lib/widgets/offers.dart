import 'package:flutter/material.dart';
import 'package:widgets/utils/model.dart';
import 'package:widgets/Views/details_page.dart';

class SpecialOffers extends StatefulWidget {
  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  List<Restaurant> restaurants = Restaurant.getSpecialOffers();
  late Restaurant _restaurant;
  double _overallRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          _restaurant = restaurants[index];
          bool specialColor = index == 0 || index == 2;
          bool applyBoxShadow = index == 0;
          List<Color> backgroundColors = [
            const Color.fromARGB(255, 139, 188, 82),
            const Color(0xFFCDC9B0),
            const Color(0xFF648873),
            const Color.fromARGB(255, 231, 150, 115),
          ];

          Color itemBackgroundColor =
              backgroundColors[index % backgroundColors.length];

          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  restaurant: restaurants[index],
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 10.0,
              ),
              child: Container(
                height: 230.0,
                width: 95.0,
                margin: const EdgeInsets.only(
                  right: 15.0,
                ),
                decoration: BoxDecoration(
                  color: itemBackgroundColor,
                  borderRadius: BorderRadius.circular(_overallRadius),
                  boxShadow: applyBoxShadow
                      ? [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                            blurRadius: 8.0,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(_overallRadius),
                          topLeft: Radius.circular(_overallRadius),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                              'assets/images/${_restaurant.image}',
                              height: 120,
                              width: 95.0,
                              fit: BoxFit.cover,
                            ),
                            if (index == 0)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        bottom: 15.0,
                        top: 10.0,
                        right: 3.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _restaurant.food,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: specialColor ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            _restaurant.restaurantName,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: specialColor ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color:
                                    specialColor ? Colors.white : Colors.black,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                '${_restaurant.rating} ',
                                style: TextStyle(
                                  color: specialColor
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                '(${_restaurant.raters})',
                                style: TextStyle(
                                  color: specialColor
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
