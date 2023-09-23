class DeliveryLocations {
  int id;
  String location;

  DeliveryLocations(this.id, this.location);

  static List<DeliveryLocations> getDeliveryLocations() {
    return <DeliveryLocations>[
      DeliveryLocations(1, 'DHA road 1/15'),
      DeliveryLocations(2, 'Dubai road 9/30'),
      DeliveryLocations(3, 'Malir road 4'),
      DeliveryLocations(4, 'Defence 5th avenue'),
    ];
  }
}
