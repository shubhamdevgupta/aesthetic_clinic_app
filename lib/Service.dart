import 'package:flutter/cupertino.dart';

class Service {
  final String name;
  final String description;
  final List<String> benefits;
  final String price;
  final IconData icon;

  Service({
    required this.name,
    required this.description,
    required this.benefits,
    required this.price,
    required this.icon,
  });
}
