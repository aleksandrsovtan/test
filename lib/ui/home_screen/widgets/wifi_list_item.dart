import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/assets/colors/app_colors.dart';
import 'package:test_task/ui/home_screen/data/icons_data.dart';

class WifiListItem extends StatelessWidget {
  const WifiListItem({
    super.key,
    required this.hasLock,
    required this.title,
    required this.onTap,
  });

  final bool hasLock;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              IconsData.getRandomIcon(hasLock),
              width: 50,
              height: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      );
}
