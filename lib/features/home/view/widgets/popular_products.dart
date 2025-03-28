import 'package:flutter/material.dart';
import '../../model/product.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample popular products data
    final List<Product> popularProducts = [
      Product(
        id: '1',
        name: 'Fresh Bananas',
        imageUrl:
            'https://nutritionsource.hsph.harvard.edu/wp-content/uploads/2018/08/bananas-1354785_1920.jpg',
        price: 2.99,
        quantity: 1,
        unit: 'kg',
        category: 'Fruits',
        isPopular: true,
        rating: 4.5,
        numberOfRatings: 128,
        stockAvailable: 75,
      ),
      Product(
        id: '2',
        name: 'Red Tomatoes',
        imageUrl:
            'https://idsb.tmgrup.com.tr/2015/01/25/HaberDetay/1422217702151.jpg',
        price: 3.49,
        quantity: 500,
        unit: 'g',
        category: 'Vegetables',
        isPopular: true,
        rating: 4.3,
        numberOfRatings: 96,
        stockAvailable: 60,
      ),
      Product(
        id: '3',
        name: 'Fresh Oranges',
        imageUrl:
            'https://cdn.britannica.com/24/174524-050-A851D3F2/Oranges.jpg',
        price: 4.99,
        quantity: 1,
        unit: 'kg',
        category: 'Fruits',
        isPopular: true,
        rating: 4.7,
        numberOfRatings: 156,
        stockAvailable: 45,
      ),
      Product(
        id: '4',
        name: 'Green Spinach',
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/766/grapes-main-1506688521.jpg?resize=640:*',
        price: 2.49,
        quantity: 250,
        unit: 'g',
        category: 'Vegetables',
        isPopular: true,
        rating: 4.4,
        numberOfRatings: 89,
        stockAvailable: 30,
      ),
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: popularProducts.length,
      itemBuilder: (context, index) {
        return PopularProductCard(product: popularProducts[index]);
      },
    );
  }
}

class PopularProductCard extends StatelessWidget {
  final Product product;

  const PopularProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 100,
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
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 20,
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
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.numberOfRatings})',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
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
