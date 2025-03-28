import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        name: 'Fruits',
        icon: Icons.apple,
        color: Colors.red.shade100,
        iconColor: Colors.red,
      ),
      Category(
        name: 'Vegetables',
        icon: Icons.eco,
        color: Colors.green.shade100,
        iconColor: Colors.green,
      ),
      Category(
        name: 'Dairy',
        icon: Icons.egg,
        color: Colors.yellow.shade100,
        iconColor: Colors.orange,
      ),
      Category(
        name: 'Meat',
        icon: Icons.restaurant,
        color: Colors.brown.shade100,
        iconColor: Colors.brown,
      ),
      Category(
        name: 'Beverages',
        icon: Icons.local_drink,
        color: Colors.blue.shade100,
        iconColor: Colors.blue,
      ),
      Category(
        name: 'Snacks',
        icon: Icons.cookie,
        color: Colors.purple.shade100,
        iconColor: Colors.purple,
      ),
      Category(
        name: 'Bakery',
        icon: Icons.bakery_dining,
        color: Colors.orange.shade100,
        iconColor: Colors.orange.shade800,
      ),
      Category(
        name: 'Frozen',
        icon: Icons.ac_unit,
        color: Colors.lightBlue.shade100,
        iconColor: Colors.lightBlue,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(category: categories[index]);
      },
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final Color iconColor;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.iconColor,
  });
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                category.icon,
                color: category.iconColor,
                size: 32,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
