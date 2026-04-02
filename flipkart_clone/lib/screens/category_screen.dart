import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 100,
            color: Colors.white,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  color: index == 0 ? Colors.blue.shade50 : Colors.white,
                  child: ListTile(
                    title: Text(
                      'Cat $index',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://picsum.photos/200?random=${index + 20}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                          child: Text(
                            'Item $index', 
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
