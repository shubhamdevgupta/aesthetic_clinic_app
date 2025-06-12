import 'package:aesthetic_clinic_app/BookingOverviewScreen.dart';
import 'package:aesthetic_clinic_app/Service.dart';
import 'package:aesthetic_clinic_app/ServiceDetailScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

  final List<String> bannerImages = [
    'assets/icons/dental.png',
    'assets/icons/derma.png',
    'assets/icons/laser.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Aesthetic Clinic',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          // Hero Banner with Carousel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider.builder(
              itemCount: bannerImages.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      bannerImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
          const SizedBox(height: 24),

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
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
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

          // Quick Booking Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BookingOverviewScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC1CC), // blush tone
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Quick Booking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
    return Material(
      color: Colors.white,
      elevation: 3,
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
            color: const Color(0xFFFFF9F9), // soft pastel base
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFFFE5EC),
                radius: 28,
                child: Icon(service.icon, size: 28, color: Colors.pinkAccent),
              ),
              const SizedBox(height: 12),
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
