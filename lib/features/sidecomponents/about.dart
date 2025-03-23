import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Company Logo
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Company Name',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Established 2024',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Mission Statement
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Mission',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'To provide innovative solutions that enhance people\'s lives through technology and exceptional service.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Company Values
                  const Text(
                    'Our Values',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildValueCard(
                    icon: Icons.star,
                    title: 'Excellence',
                    description:
                        'We strive for excellence in everything we do.',
                  ),
                  _buildValueCard(
                    icon: Icons.handshake,
                    title: 'Integrity',
                    description:
                        'We conduct our business with the highest standards of integrity.',
                  ),
                  _buildValueCard(
                    icon: Icons.people,
                    title: 'Customer Focus',
                    description:
                        'Our customers are at the heart of everything we do.',
                  ),
                  _buildValueCard(
                    icon: Icons.lightbulb,
                    title: 'Innovation',
                    description:
                        'We continuously innovate to stay ahead of the curve.',
                  ),

                  const SizedBox(height: 24),

                  // Team Section
                  const Text(
                    'Our Team',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTeamMemberCard(
                          name: 'John Doe',
                          role: 'CEO',
                          imageUrl: 'https://example.com/john.jpg',
                        ),
                        _buildTeamMemberCard(
                          name: 'Jane Smith',
                          role: 'CTO',
                          imageUrl: 'https://example.com/jane.jpg',
                        ),
                        _buildTeamMemberCard(
                          name: 'Mike Johnson',
                          role: 'Design Lead',
                          imageUrl: 'https://example.com/mike.jpg',
                        ),
                        _buildTeamMemberCard(
                          name: 'Sarah Williams',
                          role: 'Marketing Director',
                          imageUrl: 'https://example.com/sarah.jpg',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Contact Information
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    icon: Icons.email,
                    title: 'Email',
                    content: 'contact@company.com',
                    onTap: () {
                      // Launch email client
                    },
                  ),
                  _buildContactItem(
                    icon: Icons.phone,
                    title: 'Phone',
                    content: '+1 (555) 123-4567',
                    onTap: () {
                      // Launch phone dialer
                    },
                  ),
                  _buildContactItem(
                    icon: Icons.location_on,
                    title: 'Address',
                    content: '123 Business Street, City, Country',
                    onTap: () {
                      // Open maps
                    },
                  ),

                  const SizedBox(height: 24),

                  // Social Media Links
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton(
                        icon: Icons.facebook,
                        onTap: () {
                          // Open Facebook
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.telegram,
                        onTap: () {
                          // Open Twitter
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.link,
                        onTap: () {
                          // Open LinkedIn
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.camera_alt,
                        onTap: () {
                          // Open Instagram
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String role,
    required String imageUrl,
  }) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            role,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(content),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
