import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> fetchedProducts = [];
  bool isLoading = true;
  String? errorMessage;

  final List<Map<String, String>> dummyCategories = const [
    {'name': 'Electronics', 'image': 'https://picsum.photos/200/200?random=11'},
    {'name': 'Jewelery', 'image': 'https://picsum.photos/200/200?random=12'},
    {'name': 'Men\'s Clothing', 'image': 'https://picsum.photos/200/200?random=13'},
    {'name': 'Women\'s Clothing', 'image': 'https://picsum.photos/200/200?random=14'},
    {'name': 'Mobiles', 'image': 'https://picsum.photos/200/200?random=15'},
    {'name': 'Shoes', 'image': 'https://picsum.photos/200/200?random=16'},
    {'name': 'Home', 'image': 'https://picsum.photos/200/200?random=17'},
    {'name': 'Beauty', 'image': 'https://picsum.photos/200/200?random=18'},
  ];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          fetchedProducts = data['products'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load products: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load products: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flipkart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner section
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.blue.shade100,
              child: Image.network(
                'https://picsum.photos/800/300',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(child: Text('Special Sale - Up to 50% Off', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(height: 10),
            
            // Categories Horizontal List
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                itemBuilder: (context, index) {
                  final category = dummyCategories[index];
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(category['image']!),
                          child: const Icon(Icons.category, color: Colors.transparent), // Hidden by default
                        ),
                        const SizedBox(height: 5),
                        Text(category['name']!, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            
            // Products List
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? const Center(child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ))
                  : errorMessage != null
                      ? Center(child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                      ))
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: fetchedProducts.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final product = fetchedProducts[index];
                            final priceInINR = (product['price'] * 82).toInt();
                            
                            return Card(
                              color: Colors.white,
                              elevation: 2,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          product['thumbnail'] ?? '',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 50, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(product['title'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                                        Text('₹$priceInINR', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xFF2874F0),
                                              foregroundColor: Colors.white,
                                            ),
                                            onPressed: () {},
                                            child: const Text('Add to Cart'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
