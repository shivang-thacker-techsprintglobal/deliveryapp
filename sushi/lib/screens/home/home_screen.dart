import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/app_colors.dart';
import '../../widgets/app_strings.dart';
import '../../services/auth_service.dart';
import '../../models/user_model.dart';
import '../../models/offer_model.dart';
import '../../widgets/offer_card.dart';
import '../menu/menu_screen.dart';
import '../cart/cart_screen.dart';
import '../order_now/order_now_screen.dart';
import '../orders/my_orders_screen.dart';
import '../favorites/favorites_screen.dart';
import '../profile/profile_screen.dart';
import '../info/about_us_screen.dart';
import '../info/contact_us_screen.dart';
import 'offer_items_screen.dart';
import '../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  UserModel? _userData;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (doc.exists && mounted) {
        setState(() {
          _userData = UserModel.fromJson(doc.data()!);
        });
      }
    }
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Sushi Delivery';
      case 1:
        return 'Order Now';
      case 2:
        return 'My Orders';
      case 3:
        return 'Menu';
      case 4:
        return 'Favorites';
      case 5:
        return 'My Cart';
      case 6:
        return 'My Account';
      case 7:
        return 'About Us';
      case 8:
        return 'Contact Us';
      default:
        return 'Sushi Delivery';
    }
  }

  Widget _getContent() {
    switch (_currentIndex) {
      case 0:
        return const HomeContent();
      case 1:
        return const OrderNowScreen(isShell: true);
      case 2:
        return const MyOrdersScreen(isShell: true);
      case 3:
        return const MenuScreen(isShell: true);
      case 4:
        return const FavoritesScreen(isShell: true);
      case 5:
        return const CartScreen(isShell: true);
      case 6:
        return const ProfileScreen(isShell: true);
      case 7:
        return const AboutUsScreen(isShell: true);
      case 8:
        return const ContactUsScreen(isShell: true);
      default:
        return const HomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppBar(
        title: _currentIndex == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/brand_logo.jpg',
                      height: 34,
                      width: 34,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sushi Delivery',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : Text(_getTitle()),
        leading: _currentIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => _currentIndex = 0),
              ),
      ),
      drawer: _buildDrawer(),
      body: _getContent(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.home_outlined, AppStrings.menuHome, 0),
                _buildDrawerItem(Icons.shopping_bag_outlined, 'Order Now', 1),
                _buildDrawerItem(Icons.list_alt_outlined, 'My Orders', 2),
                _buildDrawerItem(Icons.restaurant_menu, 'Menu', 3),
                _buildDrawerItem(Icons.favorite_border, AppStrings.menuFavorites, 4),
                _buildDrawerItem(Icons.shopping_cart_outlined, AppStrings.menuCart, 5),
                _buildDrawerItem(Icons.person_outline, 'My Account', 6),
                const Divider(),
                _buildDrawerItem(Icons.info_outline, 'About Us', 7),
                _buildDrawerItem(Icons.contact_support_outlined, 'Contact Us', 8),
                ListTile(
                  leading: const Icon(Icons.logout, color: AppColors.vermillion),
                  title: const Text(AppStrings.logout),
                  onTap: _handleLogout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56, left: 20, bottom: 24, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.ink,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.gold, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: _userData?.image != null
                  ? CachedNetworkImage(
                      imageUrl: _userData!.image!,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset('assets/images/userpng.png', width: 64),
                      errorWidget: (context, url, error) => Image.asset('assets/images/userpng.png', width: 64),
                    )
                  : Image.asset('assets/images/userpng.png', width: 64),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _userData?.name ?? 'Guest User',
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            _userData?.email ?? '',
            style: GoogleFonts.sourceSans3(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    final selected = _currentIndex == index;
    return ListTile(
      leading: Icon(icon, color: selected ? AppColors.vermillion : AppColors.gray),
      title: Text(
        title,
        style: GoogleFonts.sourceSans3(
          color: selected ? AppColors.vermillion : AppColors.ink,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }

  void _handleLogout() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<OfferModel> _offers = [];
  bool _isLoadingOffers = true;

  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  void _loadOffers() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('offers').get();
      if (mounted) {
        setState(() {
          _offers = snapshot.docs.map((doc) => OfferModel.fromJson(doc.data(), doc.id)).toList();
          _isLoadingOffers = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoadingOffers = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/home_banner.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(color: AppColors.ink),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        AppColors.ink.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today’s kitchen',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Handcrafted sushi, ready for delivery',
                        style: GoogleFonts.sourceSans3(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 8),
            child: Text(
              'Special offers',
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: _isLoadingOffers
                ? const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _offers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.82,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final offer = _offers[index];
                      return OfferCard(
                        offer: offer,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OfferItemsScreen(offer: offer)),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
