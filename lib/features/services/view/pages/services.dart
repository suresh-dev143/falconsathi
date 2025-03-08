import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services',style: TextStyle(color: Colors.white),),
        backgroundColor: Pallete.blueDarkColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
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
            imageUrl: 'assets/images/pipeline-cleaning.jpg', // Add your image
            price: '₹799',
          ),
          _buildServiceCard(
            context: context,
            title: 'RO Repairing & Installation',
            description:
                'Complete RO system maintenance, repair, and new installation services.',
            imageUrl: 'assets/images/ro-repair.jpg', // Add your image
            price: '₹599',
          ),
          _buildServiceCard(
            context: context,
            title: 'Overflow Sensor Installation',
            description:
                'Smart overflow prevention system installation for your water tanks.',
            imageUrl: 'assets/images/sensor.jpg', // Add your image
            price: '₹1499',
          ),
          _buildServiceCard(
            context: context,
            title: 'Server Tank Cleaning',
            description:
                'Thorough cleaning service for server tanks ensuring optimal performance.',
            imageUrl: 'assets/images/server-tank.jpg', // Add your image
            price: '₹1299',
          ),
          _buildServiceCard(
            context: context,
            title: 'AC Repairing',
            description:
                'Professional AC repair and maintenance services for all brands.',
            imageUrl: 'assets/images/ac-repair.jpg', // Add your image
            price: '₹899',
          ),
          _buildServiceCard(
            context: context,
            title: 'Fridge Repairing',
            description:
                'Expert refrigerator repair services for all makes and models.',
            imageUrl: 'assets/images/fridge-repair.jpg', // Add your image
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
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with error handling
          Container(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
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
                        // Add booking functionality
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => BookingPage(service: title),
                        // ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.blueDarkColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
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
}
