import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';
import 'package:your_experience/features/presentation/details/portfolio_project/portfolio_project_state.dart';
import 'package:your_experience/features/presentation/home/home_ui.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/image_default.dart';

import '../../../../utility/shared/constants/common.dart';
import '../../footer/footer_ui.dart';
import 'portfolio_project_logic.dart';

class PortfolioProjectUi extends StatelessWidget {
  static const String namePath = '/portfolio-project';

  PortfolioProjectUi({super.key});

  final logic = Get.find<PortfolioProjectLogic>();
  final state = Get.find<PortfolioProjectLogic>().state;

  @override
  Widget build(BuildContext context) {
    final bool isSmallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveRowColumn(
              columnPadding: EdgeInsets.symmetric(
                horizontal: isSmallerThanDesktop ? 16 : 100,
                vertical: 24,
              ),
              columnSpacing: isSmallerThanDesktop ? 24 : 40,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              layout: ResponsiveRowColumnType.COLUMN,
              children: [
                // Bagian Back Button & Date
                ResponsiveRowColumnItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ButtonInkWell(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back_ios_new, size: 20),
                            ),
                            onPress: () => Get.back(),
                          ),
                          16.zw,
                          Text(
                            state.portfolio.timeCreated,
                            style: Get.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Get.textTheme.bodyMedium!.color!
                                  .withValues(alpha: .5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Judul & Icon
                ResponsiveRowColumnItem(
                  child: Wrap(
                    // Gunakan Wrap agar aman di layar sempit
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      ImageDefault(
                        assetImage: state.portfolio.imageIcon,
                        height: 48,
                        width: 48,
                        borderCircular: 8,
                        boxFit: BoxFit.contain,
                      ),
                      Text(
                        state.portfolio.title,
                        style: Get.textTheme.displayLarge!.copyWith(
                          letterSpacing: 2,
                          fontSize: isSmallerThanDesktop ? 28 : 40,
                        ),
                      ),
                    ],
                  ),
                ),

                // Info Detail (Framework, Platforms, etc) - RAWAN OVERFLOW
                ResponsiveRowColumnItem(
                  child: Wrap(
                    // Ganti Row dengan Wrap
                    spacing: 32,
                    runSpacing: 24,
                    children: [
                      titleDesc(
                        title: 'Framework',
                        desc: state.portfolio.framework,
                      ),
                      titleDesc(
                        title: 'Platforms',
                        desc: state.portfolio.platformText,
                      ),
                      titleDesc(
                        title: 'Categories',
                        desc: state.portfolio.category,
                      ),
                      titleDesc(
                        title: 'Visit',
                        desc: '',
                        customWidget: _visitWidget(
                          platforms: state.portfolio.platforms,
                          isExpired: state.portfolio.isExpired,
                        ),
                      ),
                    ],
                  ),
                ),

                // Hero Image
                ResponsiveRowColumnItem(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Visibility(
                      visible: state.portfolio.imageDashboard.isNotEmpty,
                      replacement: Container(
                        width: double.infinity,
                        height: Get.height * (isSmallerThanDesktop ? .4 : .7),
                        color: Colors.grey.shade200,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/vector/not_found_image.svg',
                          ),
                        ),
                      ),
                      child: ImageDefault(
                        assetImage: state.portfolio.imageDashboard,
                        height: Get.height * (isSmallerThanDesktop ? .4 : .7),
                        width: double.infinity,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // List Content
                ResponsiveRowColumnItem(child: list(isSmallerThanDesktop)),
              ],
            ),
            const FooterUi(),
          ],
        ),
      ),
    );
  }

  Widget list(bool isSmallerThanDesktop) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: createList.length,
      itemBuilder: (context, index) {
        final item = createList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 48),
            if (item.images != null) ...[
              Text(item.title, style: Get.textTheme.displayMedium),
              24.zh,
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.images!.length,
                  itemBuilder: (context, imgIndex) => ImageDefault(
                    assetImage: item.images![imgIndex],
                    width: 250,
                    borderCircular: 8,
                    padding: const EdgeInsets.only(right: 16),
                    boxFit: BoxFit.contain,
                    height: Get.height * (isSmallerThanDesktop ? .4 : .7),
                  ),
                ),
              ),
            ] else
              StickyHeader(
                overlapHeaders: !isSmallerThanDesktop,
                header: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(item.title, style: Get.textTheme.displayMedium),
                ),
                content: ResponsiveRowColumn(
                  layout: isSmallerThanDesktop
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1, // Beri ruang kosong di kiri pada desktop
                      child: const SizedBox(),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.desc!.top,
                            textAlign: TextAlign.justify,
                            style: Get.textTheme.bodyMedium,
                          ),
                          16.zh,
                          ...item.desc!.body.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("• "),
                                  Expanded(
                                    child: Text(
                                      e,
                                      style: Get.textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (item.desc!.bottom.isNotEmpty) ...[
                            16.zh,
                            Text(
                              item.desc!.bottom,
                              style: Get.textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            40.zh,
          ],
        );
      },
    );
  }

  List<StickyValue> get createList {
    return [
      StickyValue(title: 'Project Overview', desc: state.portfolio.overview),
      StickyValue(title: 'Execution', desc: state.portfolio.execution),
    ];
  }

  Widget titleDesc({
    required String title,
    required String desc,
    Widget? customWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        8.zh,
        customWidget ??
            Text(
              desc,
              style: Get.textTheme.bodyMedium!.copyWith(
                color: Get.textTheme.bodyMedium!.color!.withValues(alpha: .7),
              ),
            ),
      ],
    );
  }

  Widget _visitWidget({
    required List<Platforms> platforms,
    required bool isExpired,
  }) {
    if (isExpired) return const Text('No longer available');
    if (platforms.isEmpty) return const Text('Not available yet');

    return Wrap(
      // Gunakan Wrap agar ikon tidak overflow
      spacing: 8,
      children: platforms
          .map(
            (e) => ButtonInkWell(
              onPress: () => logic.gotoAddress(e.linkUrl),
              child: Icon(e.iconUrl, size: 20),
            ),
          )
          .toList(),
    );
  }
}
