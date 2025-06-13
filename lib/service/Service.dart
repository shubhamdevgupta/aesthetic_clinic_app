import 'package:flutter/cupertino.dart';

class Service {
  final String name;
  final String description; // Short version
  final String fullDescription; // Full version for expanded state
  final List<String> benefits;
  final String price;
  final IconData icon;

  Service({
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.benefits,
    required this.price,
    required this.icon,
  });
}
