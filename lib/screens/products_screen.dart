import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

/// Products Screen
/// 
/// Bu ekran ürün katalogunu gösterir.
class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartItemsCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (cartItemsCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$cartItemsCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _sampleProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: _sampleProducts[index]);
        },
      ),
    );
  }
}

/// Sample products for demonstration
/// Gerçek uygulamada bu veriler API'den gelecek
final List<Product> _sampleProducts = [
  const Product(
    id: '1',
    name: 'Wireless Headphones',
    description: 'High-quality wireless headphones with noise cancellation',
    price: 299.99,
    imageUrl: 'https://example.com/headphones.jpg',
    category: 'Electronics',
    rating: 4.5,
    stock: 25,
    tags: ['electronics', 'audio', 'wireless'],
  ),
  const Product(
    id: '2',
    name: 'Smart Watch',
    description: 'Advanced smartwatch with health monitoring features',
    price: 199.99,
    imageUrl: 'https://example.com/smartwatch.jpg',
    category: 'Electronics',
    rating: 4.3,
    stock: 15,
    tags: ['electronics', 'wearable', 'fitness'],
  ),
  const Product(
    id: '3',
    name: 'Coffee Mug',
    description: 'Premium ceramic coffee mug with ergonomic design',
    price: 24.99,
    imageUrl: 'https://example.com/mug.jpg',
    category: 'Home & Kitchen',
    rating: 4.8,
    stock: 50,
    tags: ['kitchen', 'ceramic', 'coffee'],
  ),
  const Product(
    id: '4',
    name: 'Running Shoes',
    description: 'Comfortable running shoes for daily exercise',
    price: 89.99,
    imageUrl: 'https://example.com/shoes.jpg',
    category: 'Sports',
    rating: 4.2,
    stock: 30,
    tags: ['sports', 'shoes', 'running'],
  ),
  const Product(
    id: '5',
    name: 'Laptop Stand',
    description: 'Adjustable laptop stand for better ergonomics',
    price: 49.99,
    imageUrl: 'https://example.com/laptop-stand.jpg',
    category: 'Office',
    rating: 4.6,
    stock: 20,
    tags: ['office', 'ergonomic', 'laptop'],
  ),
  const Product(
    id: '6',
    name: 'Water Bottle',
    description: 'Insulated stainless steel water bottle',
    price: 19.99,
    imageUrl: 'https://example.com/bottle.jpg',
    category: 'Sports',
    rating: 4.4,
    stock: 40,
    tags: ['sports', 'hydration', 'stainless-steel'],
  ),
];