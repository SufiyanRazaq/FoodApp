import 'package:flutter/material.dart';
import 'package:widgets/utils/locations.dart';
import 'package:widgets/widgets/popular_res.dart';
import 'package:widgets/widgets/offers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<DeliveryLocations> _locations =
      DeliveryLocations.getDeliveryLocations();
  late List<DropdownMenuItem<DeliveryLocations>> _dropDownMenuItems;
  late DeliveryLocations _deliveryLocation;

  final _controller = TextEditingController();

  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems(_locations);
    _deliveryLocation = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<DeliveryLocations>> buildDropDownMenuItems(
      List<DeliveryLocations> locations) {
    List<DropdownMenuItem<DeliveryLocations>> items = [];

    for (DeliveryLocations deliveryLocation in locations) {
      items.add(
        DropdownMenuItem<DeliveryLocations>(
          value: deliveryLocation,
          child: Text(
            deliveryLocation.location,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return items;
  }

  void onChangeDropdownItem(DeliveryLocations? selectedLocation) {
    setState(() {
      _deliveryLocation = selectedLocation!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Container(
                height: 50.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => print('menu drawer pressed'),
                      child: Container(
                        width: 60.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade400,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.menu,
                            color: Colors.white.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Delivery to',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        Container(
                          height: 35.0,
                          child: DropdownButton(
                            value: _deliveryLocation,
                            items: _dropDownMenuItems,
                            onChanged: onChangeDropdownItem,
                            underline: Container(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: _buildSearchField(
                context,
                _controller,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                'Special offers',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 240.0,
              child: SpecialOffers(),
            ),
            Container(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                'Popular Restaurants',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  height: 400.0,
                  child: PopularRestaurants(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSearchField(
    BuildContext context, TextEditingController controller) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        size: 17.0,
      ),
      labelText: 'e.x Chicken, Pasta...',
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}
