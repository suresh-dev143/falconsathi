import 'package:falconsathi/features/services/view/widgets/booking.dart';
import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Services',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.blueDarkColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildServiceCard(
            context: context,
            title: 'Water Tank Cleaning',
            description:
                'Professional water tank cleaning service ensuring hygiene and safety of your water storage.',
            imageUrl: 'assets/images/water-tank-cleaning.jpg', // Add your image
            price: '₹999',
          ),
          _buildServiceCard(
            context: context,
            title: 'Pipeline Cleaning',
            description:
                'Expert pipeline cleaning service to maintain smooth water flow and prevent blockages.',
            imageUrl: 'assets/images/pipeline.jpeg', // Add your image
            price: '₹799',
          ),
          _buildServiceCard(
            context: context,
            title: 'RO Repairing & Installation',
            description:
                'Complete RO system maintenance, repair, and new installation services.',
            imageUrl: 'assets/images/ro.png', // Add your image
            price: '₹599',
          ),
          _buildServiceCard(
            context: context,
            title: 'Overflow Sensor Installation',
            description:
                'Smart overflow prevention system installation for your water tanks.',
            imageUrl: 'assets/images/alarm.jpg', // Add your image
            price: '₹1499',
          ),
          _buildServiceCard(
            context: context,
            title: 'Sewer Tank Cleaning',
            description:
                'Thorough cleaning service for server tanks ensuring optimal performance.',
            imageUrl: 'assets/images/sewer-tank.jpeg', // Add your image
            price: '₹1299',
          ),
          _buildServiceCard(
            context: context,
            title: 'AC Repairing',
            description:
                'Professional AC repair and maintenance services for all brands.',
            imageUrl: 'assets/images/ac-service.jpg', // Add your image
            price: '₹899',
          ),
          _buildServiceCard(
            context: context,
            title: 'Fridge Repairing',
            description:
                'Expert refrigerator repair services for all makes and models.',
            imageUrl: 'assets/images/fridge-repairing.jpg', // Add your image
            price: '₹699',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required String title,
    required String description,
    required String imageUrl,
    required String price,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with error handling
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.home_repair_service,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Starting from $price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Pallete.blueDarkColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showBookingPopup(context, title);
                        print('Booking for $title initiated');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.blueDarkColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBookingPopup(BuildContext context, String serviceName) {
    final formKey = GlobalKey<FormState>();
    String name = '';
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Book $serviceName Service"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name Input
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Your Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onChanged: (value) => name = value,
                    ),

                    const SizedBox(height: 12),

                    // Date Picker
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedDate == null
                                ? "Pick a date"
                                : "${selectedDate!.toLocal()}".split(' ')[0],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Time Picker
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedTime == null
                                ? "Pick a time"
                                : selectedTime!.format(context),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedTime = picked;
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate() &&
                    selectedDate != null &&
                    selectedTime != null) {
                  final bookingDateTime = DateTime(
                    selectedDate!.year,
                    selectedDate!.month,
                    selectedDate!.day,
                    selectedTime!.hour,
                    selectedTime!.minute,
                  );

                  // You can now use bookingDateTime however you'd like
                  print("Booking confirmed: $name on $bookingDateTime");

                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select both date and time")),
                  );
                }
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
