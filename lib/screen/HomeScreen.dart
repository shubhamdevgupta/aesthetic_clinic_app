import 'package:aesthetic_clinic_app/screen/BookingOverviewScreen.dart';
import 'package:aesthetic_clinic_app/service/Service.dart';
import 'package:aesthetic_clinic_app/screen/ServiceDetailScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../service/ServiceCard.dart';

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
    Service(
      name: 'Help',
      description: 'Rehydrate and replenish your body with IV nutrients.',
      benefits: ['Energy boost', 'Quick hydration', 'Immune support'],
      price: '₹2999',
      icon: Icons.help,
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
      backgroundColor: const Color(0xFFEFBBBE),
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
                  return GridView.builder(
                    itemCount: services.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return ServiceCard(service: services[index]);
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
                  backgroundColor: Colors.pinkAccent,
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
