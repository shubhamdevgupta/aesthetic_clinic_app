import 'package:aesthetic_clinic_app/screen/BookingOverviewScreen.dart';
import 'package:aesthetic_clinic_app/screen/ProfileScreen.dart';
import 'package:aesthetic_clinic_app/service/Service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../service/ServiceCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Service> services = [
    Service(
      name: 'Dermatology',
      description: 'Professional skincare treatments for healthy glowing skin.',
      fullDescription:
      'Professional skincare treatments for healthy glowing skin. Our dermatology services address acne, pigmentation, wrinkles, and much more using advanced techniques tailored to your skin type.',
      benefits: ['Acne treatment', 'Anti-aging care', 'Skin rejuvenation'],
      price: '₹1499',
      icon: Image.asset(
        'assets/icons/ic_a.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Service(
      name: 'Laser',
      description: 'Advanced laser treatments for hair removal and skin.',
      fullDescription:
      'Advanced laser treatments help with permanent hair reduction, skin resurfacing, and rejuvenation. Safe, painless, and effective for all skin types.',
      benefits: ['Permanent hair reduction', 'Skin tone improvement'],
      price: '₹2499',
      icon: Image.asset(
        'assets/icons/ic_b.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Service(
      name: 'Dental',
      description: 'Smile brighter with our advanced dental care services.',
      fullDescription:
      'Smile brighter with our advanced dental care. From routine cleanings to cosmetic procedures, our expert dentists ensure optimal oral health and confidence.',
      benefits: ['Teeth whitening', 'Braces', 'Implants'],
      price: '₹1999',
      icon: Image.asset('assets/icons/ic_c.png'),
    ),
    Service(
      name: 'Hijama',
      description: 'Ancient therapy to detox and energize your body.',
      fullDescription:
      'Hijama (cupping therapy) is a time-tested remedy that detoxifies the blood, improves circulation, and relieves pain, stress, and fatigue. Done by certified therapists.',
      benefits: ['Improves circulation', 'Boosts immunity'],
      price: '₹899',
      icon: Image.asset('assets/icons/ic_d.png'),
    ),
    Service(
      name: 'IV Therapy',
      description: 'Rehydrate and replenish your body with IV nutrients.',
      fullDescription:
      'IV Therapy delivers essential fluids, vitamins, and minerals directly into your bloodstream to enhance hydration, energy, and immune function quickly and efficiently.',
      benefits: ['Energy boost', 'Quick hydration', 'Immune support'],
      price: '₹2999',
      icon: Image.asset('assets/icons/ic_e.png'),
    ),
 /*   Service(
      name: 'Help',
      description: 'Reach out to us for personalized consultation and support.',
      fullDescription:
      'Have questions? Our team is here to assist you with tailored solutions and expert advice for your beauty, skincare, and wellness goals.',
      benefits: ['Consultation', 'Expert advice', 'Personalized care'],
      price: 'Free',
      icon: Icons.help,
    ),*/
  ];

  final List<String> bannerImages = [
    'assets/icons/dental.png',
    'assets/icons/derma.png',
    'assets/icons/laser.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/screen_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Important!
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person_rounded,
                        color: Colors.pinkAccent,size: 34,),
                    // Cart icon
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      );
                    },
                  )
                ],
              ),
            ],
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
              // Hero Banner
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
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => const BookingOverviewScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            final offsetAnimation = Tween<Offset>(
                              begin: const Offset(1.0, 0.0), // from right
                              end: Offset.zero,
                            ).animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
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
        ),
      ],
    );
  }
}
