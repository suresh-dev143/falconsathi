import 'package:falconsathi/features/cart/view/pages/cart.dart';
import 'package:falconsathi/features/product/view/pages/searchproduct.dart';
import 'package:falconsathi/features/product/view/pages/view_product.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'All',
      'icon': Icons.apps,
      'color': const Color(0xFF4A90E2),
    },
    {
      'name': 'Fruits',
      'icon': Icons.apple,
      'color': const Color(0xFFE25B4A),
    },
    {
      'name': 'Vegetables',
      'icon': Icons.eco,
      'color': const Color(0xFF4AE25B),
    },
    {
      'name': 'Dairy',
      'icon': Icons.egg_alt,
      'color': const Color(0xFFFFB74D),
    },
    {
      'name': 'Beverages',
      'icon': Icons.local_drink,
      'color': const Color(0xFF9C27B0),
    },
    {
      'name': 'Snacks',
      'icon': Icons.bakery_dining,
      'color': const Color(0xFFFF7043),
    },
  ];

  // Sample products data
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Fresh Red Apple',
      'image':
          'https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Fruits',
      'inStock': true,
      'rating': 4.5,
    },
    {
      'name': 'Organic Carrots',
      'image':
          'https://www.greendna.in/cdn/shop/products/basket-carrots-close-up-37641_1024x1024@2x.jpg?v=1632668896',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Fruits',
      'inStock': true,
      'rating': 4.5,
    },
    {
      'name': 'Organic Carrots',
      'image':
          'https://www.greendna.in/cdn/shop/products/basket-carrots-close-up-37641_1024x1024@2x.jpg?v=1632668896',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Fruits',
      'inStock': true,
      'rating': 4.5,
    },
    {
      'name': 'Fresh Orange',
      'image': 'https://cdn.britannica.com/24/174524-050-A851D3F2/Oranges.jpg',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Fruits',
      'inStock': true,
      'rating': 4.5,
    },
    {
      'name': 'Green Spinach',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/766/grapes-main-1506688521.jpg?resize=640:*',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Vegetables',
      'inStock': true,
      'rating': 4.5,
    },
    {
      'name': 'Green Spinach',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/766/grapes-main-1506688521.jpg?resize=640:*',
      'price': 4.99,
      'offerPrice': 3.99,
      'unit': 'kg',
      'category': 'Vegetables',
      'inStock': true,
      'rating': 4.5,
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    var filteredProducts = selectedCategory == 'All'
        ? products
        : products
            .where((product) => product['category'] == selectedCategory)
            .toList();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Products'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
        ],
      ),
      body: Row(
        children: [
          // Categories sidebar
          Container(
            width: 80,
            color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category['name'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category['name'];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? category['color']
                                : category['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            category['icon'],
                            color:
                                isSelected ? Colors.white : category['color'],
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['name'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? category['color']
                                : Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Products grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.40,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasOffer = product['offerPrice'] != null;
    final discount = hasOffer
        ? ((product['price'] - product['offerPrice']) / product['price'] * 100)
            .round()
        : 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product['image'],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (hasOffer)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$discount% OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    Text(
                      ' ${product['rating']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${hasOffer ? product['offerPrice'] : product['price']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    if (hasOffer) ...[
                      const SizedBox(width: 4),
                      Text(
                        '\$${product['price']}',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
