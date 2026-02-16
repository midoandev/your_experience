import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import '../../../utility/shared/constants/common.dart';
import 'footer_logic.dart';

class FooterUi extends GetView<FooterLogic> {
  const FooterUi({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = controller;
    final state = logic.state;
    // Pastikan variabel ini diakses melalui context agar reaktif terhadap ukuran layar
    final bool isSmallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        40.zh,
        const Divider(thickness: 2),
        16.zh,
        ResponsiveRowColumn(
          rowSpacing: 80,
          columnSpacing: 40,
          columnVerticalDirection: VerticalDirection.down,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          // Gunakan padding yang lebih aman agar tidak mendorong konten keluar layar
          rowPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          columnPadding: EdgeInsets.all(isSmallerThanDesktop ? 16 : 32),
          layout: isSmallerThanDesktop
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              // Pada mode Row, kita beri flex 1 agar seimbang dengan kolom Pages
              rowFlex: isSmallerThanDesktop ? 0 : 1,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  // Gunakan maxWidth yang lebih fleksibel
                  maxWidth: isSmallerThanDesktop ? double.infinity : 550,
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColor.withValues(alpha: .5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Penting agar tidak memaksa tinggi maksimal
                    children: [
                      Text(
                        'Let’s Build Something Great Together',
                        textAlign: TextAlign.start,
                        style: Get.textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          // Perbaiki tinggi baris agar teks tidak bertumpuk jika wrapping
                          height: 1.2,
                          letterSpacing: 2,
                        ),
                      ),
                      12.zh,
                      Text(
                        "Looking for a dedicated mobile developer to bring your project to life? I am currently open to new professional opportunities and collaborations. I focus on building functional, high-quality applications tailored to your needs.",
                        textAlign: TextAlign.justify,
                        style: Get.textTheme.labelLarge!.copyWith(
                          color: Colors.white.withValues(alpha: .8),
                          height: 1.5,
                        ),
                      ),
                      16.zh,
                      Obx(() {
                        return Wrap( // Gunakan Wrap agar ikon sosmed pindah baris jika layar sempit
                          spacing: 16,
                          runSpacing: 16,
                          children: state.itemsContacts.map((element) {
                            return ButtonInkWell(
                              onPress: () => logic.gotoAddress(element.link),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  element.icon,
                                  size: 20,
                                  color: Colors.white.withValues(alpha: .8),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: isSmallerThanDesktop ? 0 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pages',
                    style: Get.textTheme.titleLarge!.copyWith(
                      height: 1.2,
                    ),
                  ),
                  24.zh,
                  // Menggunakan Wrap untuk daftar menu agar aman jika font besar
                  Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: logic.logicMain.state.menu
                            .sublist(0, (logic.logicMain.state.menu.length - 1).clamp(0, 100))
                            .map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              e.nameTab,
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Get.textTheme.bodyMedium!.color!
                                    .withValues(alpha: .7),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        24.zh,
        const Divider(thickness: 2),
        8.zh,
        Text(
          '© 2024 Mido. All rights reserved.',
          textAlign: TextAlign.center,
          style: Get.textTheme.titleMedium!,
        ),
        16.zh,
      ],
    );
  }
}