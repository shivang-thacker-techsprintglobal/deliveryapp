import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/item_model.dart';
import 'app_colors.dart';

class MenuItemTile extends StatelessWidget {
  final ItemModel item;
  final VoidCallback onTap;

  const MenuItemTile({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6E9EE)),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'image_${item.firebaseId}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: item.image ?? '',
                  width: 78,
                  height: 78,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 78,
                    height: 78,
                    color: AppColors.grayBackgroundProfileStrong,
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/welcome_hero.jpg',
                    width: 78,
                    height: 78,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description ?? '',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 12,
                      color: AppColors.gray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item.price?.toStringAsFixed(1) ?? '0.0'} EGP',
                    style: GoogleFonts.sourceSans3(
                      color: AppColors.vermillion,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
