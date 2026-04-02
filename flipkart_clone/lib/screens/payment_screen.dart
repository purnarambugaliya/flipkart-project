import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'UPI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount Payable:', style: TextStyle(fontSize: 16)),
                  Text('₹999', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Payment Options', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  const Divider(height: 1),
                  _buildPaymentOption(Icons.account_balance_wallet, 'UPI', 'Pay via Google Pay, PhonePe, Paytm'),
                  const Divider(height: 1),
                  _buildPaymentOption(Icons.credit_card, 'Credit / Debit / ATM Card', 'Add and secure your card'),
                  const Divider(height: 1),
                  _buildPaymentOption(Icons.account_balance, 'Net Banking', 'All major banks available'),
                  const Divider(height: 1),
                  _buildPaymentOption(Icons.money, 'Cash on Delivery', 'Pay via cash when order arrives'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF1A900),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            // Navigate to Order Success
          },
          child: Text('Pay ₹999 securely', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String title, String subtitle) {
    // ignore: deprecated_member_use
    return RadioListTile(
      value: title,
      groupValue: _selectedPaymentMethod,
      onChanged: (value) {
        setState(() {
          _selectedPaymentMethod = value.toString();
        });
      },
      title: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 34.0, top: 4.0),
        child: Text(subtitle, style: const TextStyle(fontSize: 12)),
      ),
      activeColor: Colors.blue,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
