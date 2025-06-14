
import 'package:aesthetic_clinic_app/service/Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/ServiceDetailScreen.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // ✅ Remove blocking background
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServiceDetailsScreen(service: service),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.7), // ✅ Soft overlay
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFFFE5EC),
                radius: 36,
                child: Icon(service.icon, size: 36, color: Colors.pinkAccent),
              ),
              const SizedBox(height: 12),
              Text(
                service.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}