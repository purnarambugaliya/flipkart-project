import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('User Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('user@gmail.com', style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildProfileOption(Icons.shopping_bag_outlined, 'My Orders', 'View all orders'),
          const Divider(height: 1),
          _buildProfileOption(Icons.favorite_border, 'Wishlist', 'Your saved items'),
          const Divider(height: 1),
          _buildProfileOption(Icons.location_on_outlined, 'Saved Addresses', 'Manage addresses'),
          const Divider(height: 1),
          _buildProfileOption(Icons.payment, 'Saved Cards & Wallet', 'Manage payment methods'),
          const SizedBox(height: 10),
          _buildProfileOption(Icons.settings_outlined, 'Account Settings', 'Profile details, Password'),
          const Divider(height: 1),
          _buildProfileOption(Icons.help_outline, 'Help Center', 'FAQs and Support'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                // Return to login screen
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: const Text('Log Out', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, String subtitle) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
