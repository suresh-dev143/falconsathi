import 'package:flutter/material.dart';

class Order {
  final String id;
  final String date;
  final String status;
  final double total;
  final List<String> items;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.items,
  });
}

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  // Sample data - In a real app, this would come from an API or database
  final List<Order> orders = [
    Order(
      id: 'ORD-001',
      date: '2024-03-20',
      status: 'Delivered',
      total: 99.99,
      items: ['Item 1', 'Item 2', 'Item 3'],
    ),
    Order(
      id: 'ORD-002',
      date: '2024-03-19',
      status: 'In Transit',
      total: 149.99,
      items: ['Item 4', 'Item 5'],
    ),
    Order(
      id: 'ORD-003',
      date: '2024-03-18',
      status: 'Processing',
      total: 79.99,
      items: ['Item 6'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        elevation: 2,
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text('No orders found'),
            )
          : ListView.builder(
              itemCount: orders.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(order: order);
              },
            ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  Color _getStatusColor() {
    switch (order.status.toLowerCase()) {
      case 'delivered':
        return Colors.green;
      case 'in transit':
        return Colors.blue;
      case 'processing':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ${order.id}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(
                    order.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getStatusColor(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Date: ${order.date}'),
            const SizedBox(height: 8),
            const Text(
              'Items:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text('• $item'),
                )),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total: \$${order.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
