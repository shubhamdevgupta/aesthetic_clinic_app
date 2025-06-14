import 'package:flutter/cupertino.dart';

class Service {
  final String name;
  final String description;
  final String fullDescription;
  final List<String> benefits;
  final String price;
  final Widget icon; // <-- Changed from Icon to Widget

  Service({
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.benefits,
    required this.price,
    required this.icon,
  });
}
