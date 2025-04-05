import 'package:flutter/material.dart';
import '../../model/product.dart';

class ExclusiveDeals extends StatelessWidget {
  const ExclusiveDeals({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample exclusive deals data
    final List<Product> exclusiveDeals = [
      Product(
        id: '1',
        name: 'Fresh Apples',
        imageUrl:
            'https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg',
        price: 5.99,
        offerPrice: 3.99,
        quantity: 1,
        unit: 'kg',
        category: 'Fruits',
        hasExclusiveDeal: true,
        stockAvailable: 50,
        offerValidUntil: DateTime.now().add(const Duration(days: 2)),
      ),
      Product(
        id: '2',
        name: 'Organic Carrots',
        imageUrl:
            'https://www.greendna.in/cdn/shop/products/basket-carrots-close-up-37641_1024x1024@2x.jpg?v=1632668896',
        price: 3.99,
        offerPrice: 2.49,
        quantity: 500,
        unit: 'g',
        category: 'Vegetables',
        hasExclusiveDeal: true,
        stockAvailable: 30,
        offerValidUntil: DateTime.now().add(const Duration(days: 1)),
      ),
      // Add more exclusive deals as needed
    ];

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: exclusiveDeals.length,
        itemBuilder: (context, index) {
          final product = exclusiveDeals[index];
          return ExclusiveDealCard(product: product);
        },
      ),
    );
  }
}

class ExclusiveDealCard extends StatelessWidget {
  final Product product;

  const ExclusiveDealCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 140,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey.shade400,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${product.discountPercentage.round()}% OFF',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.quantity}${product.unit}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${product.offerPrice?.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (product.offerValidUntil != null)
                  _buildTimeRemaining(product.offerValidUntil!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRemaining(DateTime endTime) {
    final remaining = endTime.difference(DateTime.now());
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes % 60;

    return Row(
      children: [
        const Icon(
          Icons.timer,
          size: 16,
          color: Colors.red,
        ),
        const SizedBox(width: 4),
        Text(
          'Ends in ${hours}h ${minutes}m',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
