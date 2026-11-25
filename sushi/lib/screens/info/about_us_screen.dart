import 'package:flutter/material.dart';
import '../../widgets/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  final bool isShell;
  const AboutUsScreen({super.key, this.isShell = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isShell
          ? null
          : AppBar(
              title: const Text('About Us'),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.lightOrange,
              elevation: 0,
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/layer_2_copy_5.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/layer_2.png', width: 100, height: 100),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoTile(
              'About Us',
              'Sushi is a delivery platform that brings fresh sushi from our kitchens to your door. Order as a customer, or join as a driver and deliver with us.',
            ),
            _buildInfoTile(
              'Our Mission',
              'Fast delivery, fresh food, and a simple experience for shoppers and drivers.',
            ),
            _buildInfoTile('Phone', '+20 100 000 0000'),
            _buildInfoTile('Email', 'support@sushi.app'),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/shopping_cart_background.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.lightOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          SelectableText(
            content,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
