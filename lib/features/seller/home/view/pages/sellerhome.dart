import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  // Dummy product data - Replace with your actual product model and data source
  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'Product 1',
      'price': 99.99,
      'description': 'Description for Product 1',
      'image': 'assets/images/milk.jpg',
    },
    {
      'id': '2',
      'name': 'Product 2',
      'price': 99.99,
      'description': 'Description for Product 1',
      'image': 'assets/images/milk.jpg',
    },
    {
      'id': '3',
      'name': 'Product 3',
      'price': 99.99,
      'description': 'Description for Product 1',
      'image': 'assets/images/milk.jpg',
    },
    // Add more products here
  ];

  void _addProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _ProductFormPage(
          onSave: (product) {
            setState(() {
              _products.add(product);
            });
          },
        ),
      ),
    );
  }

  void _editProduct(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _ProductFormPage(
          product: _products[index],
          onSave: (product) {
            setState(() {
              _products[index] = product;
            });
          },
        ),
      ),
    );
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _products.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Dashboard',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Pallete.blueDarkColor,
      ),
      body: Column(
        children: [
          // Statistics Cards
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildStatCard('Total Products', _products.length.toString()),
                const SizedBox(width: 16),
                _buildStatCard('Active Listings', _products.length.toString()),
              ],
            ),
          ),
          // Product List
          Expanded(
            child: _products.isEmpty
                ? const Center(
                    child:
                        Text('No products available. Add your first product!'))
                : ListView.builder(
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: const Icon(Icons.image),
                          ),
                          title: Text(product['name']),
                          subtitle:
                              Text('\$${product['price'].toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editProduct(index),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteProduct(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        backgroundColor: Pallete.blueDarkColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  color: Pallete.blueDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductFormPage extends StatefulWidget {
  final Map<String, dynamic>? product;
  final Function(Map<String, dynamic>) onSave;

  const _ProductFormPage({Key? key, this.product, required this.onSave})
      : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<_ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.product?['name'] ?? '');
    _priceController =
        TextEditingController(text: widget.product?['price']?.toString() ?? '');
    _descriptionController =
        TextEditingController(text: widget.product?['description'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.product == null ? 'Add Product' : 'Edit Product',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.blueDarkColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter price';
                }
                if (double.tryParse(value!) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave({
                    'id': widget.product?['id'] ?? DateTime.now().toString(),
                    'name': _nameController.text,
                    'price': double.parse(_priceController.text),
                    'description': _descriptionController.text,
                    'image': widget.product?['image'] ?? '',
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.blueDarkColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Product',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
