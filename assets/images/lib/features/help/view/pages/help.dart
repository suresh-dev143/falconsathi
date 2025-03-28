import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for help...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          const SizedBox(height: 24),

          // Quick Help Section
          const Text(
            'How can we help you?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _QuickHelpCard(
                icon: Icons.shopping_bag,
                title: 'Orders',
                onTap: () {
                  // Navigate to orders help
                },
              ),
              _QuickHelpCard(
                icon: Icons.payment,
                title: 'Payments',
                onTap: () {
                  // Navigate to payments help
                },
              ),
              _QuickHelpCard(
                icon: Icons.local_shipping,
                title: 'Shipping',
                onTap: () {
                  // Navigate to shipping help
                },
              ),
              _QuickHelpCard(
                icon: Icons.refresh,
                title: 'Returns',
                onTap: () {
                  // Navigate to returns help
                },
              ),
            ],
          ),
          const SizedBox(height: 32),

          // FAQ Section
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _FaqItem(
            question: 'How do I track my order?',
            answer:
                'You can track your order by going to the Orders section and clicking on the specific order. You\'ll find real-time tracking information there.',
          ),
          _FaqItem(
            question: 'What payment methods do you accept?',
            answer:
                'We accept credit cards, debit cards, PayPal, and various digital payment methods. All payments are processed securely.',
          ),
          _FaqItem(
            question: 'How can I return an item?',
            answer:
                'To return an item, go to your Orders section, select the order containing the item you wish to return, and follow the return instructions. Returns must be initiated within 30 days of delivery.',
          ),
          const SizedBox(height: 32),

          // Contact Section
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _ContactCard(
            icon: Icons.email,
            title: 'Email Support',
            subtitle: 'support@example.com',
            onTap: () {
              // Launch email client
            },
          ),
          _ContactCard(
            icon: Icons.phone,
            title: 'Phone Support',
            subtitle: '1-800-123-4567',
            onTap: () {
              // Launch phone dialer
            },
          ),
          _ContactCard(
            icon: Icons.chat,
            title: 'Live Chat',
            subtitle: 'Available 24/7',
            onTap: () {
              // Open chat window
            },
          ),
        ],
      ),
    );
  }
}

class _QuickHelpCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickHelpCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(answer),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
