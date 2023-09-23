class Restaurant {
  int id;
  String food;
  String restaurantName;
  String image;
  double rating;
  int raters;

  Restaurant(this.id, this.food, this.restaurantName, this.image, this.rating,
      this.raters);

  static List<Restaurant> getSpecialOffers() {
    return <Restaurant>[
      Restaurant(1, 'Salad', 'American', 'salad.jpg', 4.8, 99),
      Restaurant(2, 'Lobsters', 'Chinese', 'Lobsters.jpg', 4.7, 47),
      Restaurant(3, 'Cookies', 'French ', 'Cookie.jpg', 4.9, 103),
      Restaurant(4, 'Pie', 'German', 'Pie.jpg', 4.4, 12),
    ];
  }

  static List<Restaurant> getPopularRestaurants() {
    return <Restaurant>[
      Restaurant(5, 'Lobsters', 'Chinese', 'salad.jpg', 4.7, 82),
      Restaurant(6, 'Family Bucket', 'Pakistan', 'FamilyBucket.jpg', 4.6, 88),
    ];
  }
}
