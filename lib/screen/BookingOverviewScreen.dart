import 'package:aesthetic_clinic_app/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class BookingOverviewScreen extends StatefulWidget {
  const BookingOverviewScreen({super.key});

  @override
  State<BookingOverviewScreen> createState() => _BookingOverviewScreenState();
}

class _BookingOverviewScreenState extends State<BookingOverviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedService;

  final List<String> services = [
    'Dermatology',
    'Laser',
    'Dental',
    'Hijama',
    'IV Therapy',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 90)),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState(() => selectedTime = picked);
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          backgroundColor: Colors.transparent, // Make scaffold transparent
          appBar: AppBar(
            title: const Text('Book Appointment'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth > 600;

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isTablet ? 500 : double.infinity,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'Select Service',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(thickness: 2.0),
                          // Service dropdown
                          DropdownButtonFormField<String>(
                            value: selectedService,
                            hint: const Text(
                              'Select Service', // 👈 Displayed as placeholder
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.medical_services,
                                color: Colors.pinkAccent,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.95),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
                              ),
                            ),
                            dropdownColor: Colors.white,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            items: services.map((service) {
                              return DropdownMenuItem(
                                value: service,
                                child: Text(service),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() => selectedService = value),
                            validator: (value) => value == null ? 'Please select a service' : null,
                          ),
                          const SizedBox(height: 16),

                          // Date picker
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.pinkAccent),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              tileColor: Colors.white,
                              title: Text(
                                selectedDate != null
                                    ? 'Date: ${selectedDate!.toLocal().toString().split(' ')[0]}'
                                    : 'Select Date',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: const Icon(Icons.calendar_today,color: Colors.pinkAccent,),
                              onTap: _pickDate,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Time picker
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.pinkAccent), // ✅ Pink border
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: Text(
                                selectedTime != null
                                    ? 'Time: ${selectedTime!.format(context)}'
                                    : 'Select Time',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(Icons.access_time, color: Colors.pinkAccent),
                              onTap: _pickTime,
                            ),
                          ),
                          const SizedBox(height: 16),

// Name field
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
                              ),
                            ),
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),

// Phone number
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.pinkAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Required';
                              if (value.length < 10) return 'Enter valid phone number';
                              return null;
                            },
                          ),

                          const SizedBox(height: 30),

                          // Submit button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: _submit,
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  void _submit() {
    if (_formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null &&
        selectedService != null) {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage('assets/icons/screen_bg.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.pinkAccent, size: 60),
                const SizedBox(height: 16),
                const Text(
                  "Booking Confirmed",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "You booked $selectedService on ${selectedDate!.toLocal().toString().split(' ')[0]} at ${selectedTime!.format(context)}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                    );
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
    }
  }

}
