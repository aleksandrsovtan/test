import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/assets/colors/app_colors.dart';
import 'package:test_task/ui/home_screen/home_screen_controller.dart';
import 'package:test_task/ui/home_screen/widgets/password_text_field.dart';

class HomeScreenDialogs {
  static Future<void> showCreateDialog({
    required final BuildContext context,
    required final String wlanName,
  }) async {
    final HomeScreenController controller = Get.find<HomeScreenController>();
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (final BuildContext context) => Obx(
        () => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          backgroundColor: AppColors.white,
          content: SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? null
                : MediaQuery.of(context).size.width * 0.68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.connect_to_wifi,
                  style: GoogleFonts.lato(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.try_to_connect_text,
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      wlanName,
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.enter_your_password_text,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  AppLocalizations.of(context)!.password,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ),
                PasswordTextField(
                  onChanged: controller.onPasswordChanged,
                  onTap: controller.onPasswordVisibilityChanged,
                  hintText: '${AppLocalizations.of(context)!.password}...',
                  hidePassword: controller.isPasswordVisible.value,
                ),
                GestureDetector(
                  onTap: () {
                    controller.connectTapped();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.connect,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
