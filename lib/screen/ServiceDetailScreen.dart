import 'package:aesthetic_clinic_app/screen/BookingOverviewScreen.dart';
import 'package:aesthetic_clinic_app/service/Service.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final Service service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔹 Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/screen_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 🔸 Foreground content
        Scaffold(
          backgroundColor: Colors.transparent, // ✅ Make scaffold see-through
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black87,
            centerTitle: true,
            title: Text(
              service.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔘 Icon Banner
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFFFE5EC),
                        child: Icon(service.icon, size: 36, color: Colors.pinkAccent),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // 📄 Description
                    Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          service.description,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ✅ Benefits
                    const Text(
                      'Benefits',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...service.benefits.map(
                          (benefit) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, size: 20, color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                benefit,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 💰 Price
                    Text(
                      'Price: ${service.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 📅 Book Now
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BookingOverviewScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.calendar_month_rounded, color: Colors.white),
                        label: const Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
