import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/assets/colors/app_colors.dart';
import 'package:test_task/assets/images/app_images.dart';
import 'package:test_task/ui/home_screen/home_screen_controller.dart';
import 'package:test_task/ui/home_screen/widgets/home_screen_dialogs.dart';
import 'package:test_task/ui/home_screen/widgets/refresh_button.dart';
import 'package:test_task/ui/home_screen/widgets/wifi_list_item.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.18),
          child: Row(
            children: [
              // Left side: Logo
              Expanded(
                flex: 2,
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.logo,
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                width: 0,
                color: AppColors.darkGrey,
              ),
              // Right side: Content
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context)!.get_started_text,
                        style: GoogleFonts.lato(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      // Wi-Fi list
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                            itemCount: controller.displayedWiFiNames.length,
                            itemBuilder: (context, index) {
                              final bool hasLock = controller
                                      .displayedWiFiNames[index]
                                      .contains('WIFI') ||
                                  controller.displayedWiFiNames[index]
                                      .contains('Guest');
                              return WifiListItem(
                                hasLock: hasLock,
                                title: controller.displayedWiFiNames[index],
                                onTap: () {
                                  if (hasLock) {
                                    HomeScreenDialogs.showCreateDialog(
                                      context: context,
                                      wlanName:
                                          controller.displayedWiFiNames[index],
                                    ).whenComplete(
                                        () => controller.clearPasswordState());
                                  } else {
                                    controller.moveItemToTop(index);
                                    controller.showSuccessSnackbar();
                                  }
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      // Refresh button
                      RefreshButton(
                        onTap: controller.generateRandomWiFiList,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
