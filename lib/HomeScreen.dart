import 'package:aesthetic_clinic_app/BookingOverviewScreen.dart';
import 'package:aesthetic_clinic_app/Service.dart';
import 'package:aesthetic_clinic_app/ServiceDetailScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Service> services = [
    Service(
      name: 'Dermatology',
      description: 'Professional skincare treatments for healthy glowing skin.',
      benefits: ['Acne treatment', 'Anti-aging care', 'Skin rejuvenation'],
      price: '₹1499',
      icon: Icons.spa,
    ),
    Service(
      name: 'Laser',
      description: 'Advanced laser treatments for hair removal and skin.',
      benefits: ['Permanent hair reduction', 'Skin tone improvement'],
      price: '₹2499',
      icon: Icons.flash_on,
    ),
    Service(
      name: 'Dental',
      description: 'Smile brighter with our advanced dental care services.',
      benefits: ['Teeth whitening', 'Braces', 'Implants'],
      price: '₹1999',
      icon: Icons.medical_services,
    ),
    Service(
      name: 'Hijama',
      description: 'Ancient therapy to detox and energize your body.',
      benefits: ['Improves circulation', 'Boosts immunity'],
      price: '₹899',
      icon: Icons.favorite,
    ),
    Service(
      name: 'IV Therapy',
      description: 'Rehydrate and replenish your body with IV nutrients.',
      benefits: ['Energy boost', 'Quick hydration', 'Immune support'],
      price: '₹2999',
      icon: Icons.local_hospital,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Aesthetic Clinic',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Hero Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/banner.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Services Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                  return GridView.builder(
                    itemCount: services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return ServiceCard(service: service);
                    },
                  );
                },
              ),
            ),
          ),

          // Booking Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BookingOverviewScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Quick Booking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServiceDetailsScreen(service: service),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(service.icon, size: 36, color: Colors.pinkAccent),
              const SizedBox(height: 10),
              Text(
                service.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
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
