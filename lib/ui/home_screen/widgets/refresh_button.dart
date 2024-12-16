import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/assets/colors/app_colors.dart';
import 'package:test_task/assets/icons/icons.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 10,
          right: 26,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(31),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.icSync,
              width: 33,
              height: 45,
            ),
            const SizedBox(width: 21),
            Text(
              AppLocalizations.of(context)!.refresh,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
