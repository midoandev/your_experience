import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
import '../../workspace/create_portfolio/create_portfolio_ui.dart';
import 'portfolio_project_logic.dart';

class PortfolioProjectUi extends StatelessWidget {
  static const String namePath = '/portfolio-project';

  PortfolioProjectUi({super.key});

  final logic = Get.find<PortfolioProjectLogic>();
  final state = Get.find<PortfolioProjectLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        body: SingleChildScrollView(
          child: ResponsiveRowColumn(
            columnPadding: EdgeInsets.symmetric(
                horizontal: isSmallerThanDesktop ? 16 : 100, vertical: 24),
            columnSpacing: isSmallerThanDesktop ? 24 : 60,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.start,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonInkWell(
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.chevron_left,
                                size: 24,
                              ),
                            ),
                            onPress: () => Get.until((route) =>
                                route.settings.name == HomeUi.namePath)),
                        26.zw,
                        Text(
                          state.portfolio.timeCreated,
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w300,
                            height: 0,
                            color: Get.textTheme.bodyMedium!.color!
                                .withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: ButtonInkWell(
                          child: Container(
                            width: 12,
                            height: 12,
                            color: Colors.red,
                          ),
                          onPress: () =>
                              Get.toNamed(CreatePortfolioUi.namePath)),
                    )
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                  child: Text(
                state.portfolio.title,
                textAlign: TextAlign.start,
                style: Get.textTheme.displayLarge!.copyWith(
                  letterSpacing: 3,
                  height: 21.pxToDouble,
                ),
              )),
              ResponsiveRowColumnItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  titleDesc(
                      title: 'Framework', desc: state.portfolio.framework),
                  titleDesc(
                      title: 'Platforms', desc: state.portfolio.platformText),
                  titleDesc(
                      title: 'Categories', desc: state.portfolio.category),
                  titleDesc(
                      title: 'Visit',
                      desc: '',
                      customWidget: _visitWidget(state.portfolio.platforms)),
                ],
              )),
              ResponsiveRowColumnItem(
                child: ImageDefault(
                  assetImage: state.portfolio.imageDashboard,
                  height: Get.height * (isSmallerThanDesktop ? .5 : .9),
                  width: double.infinity,
                  borderCircular: 16,
                  boxFit: BoxFit.cover,
                ),
              ),
              ResponsiveRowColumnItem(
                  child: Column(
                children: [
                  list(),
                  const FooterUi(),
                ],
              ))
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
      ),
    );
  }

  Widget list() {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    return ListView.builder(
      controller: state.scrollController,
      shrinkWrap: true,
      itemCount: createList.length,
      itemBuilder: (context, index) {
        final item = createList[index];
        return Column(
          children: [
            const Divider(height: 2),
            24.zh,
            item.images != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.start,
                        style: Get.textTheme.displayMedium!.copyWith(
                          letterSpacing: 3,
                          height: 21.pxToDouble,
                        ),
                      ),
                      isSmallerThanDesktop ? 16.zh : 24.zh,
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: item.images!.length,
                          itemBuilder: (context, index) {
                            return ImageDefault(
                              assetImage: item.images![index],
                              height: 250,
                              width: 210,
                              borderCircular: 6,
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              boxFit: BoxFit.contain,
                            );
                          },
                        ),
                      )
                    ],
                  )
                : StickyHeader(
                    overlapHeaders: !isSmallerThanDesktop,
                    header: Text(
                      item.title,
                      textAlign: TextAlign.start,
                      style: Get.textTheme.displayMedium!.copyWith(
                        letterSpacing: 3,
                        height: 21.pxToDouble,
                      ),
                    ),
                    content: Row(
                      children: [
                        ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth:
                                    isSmallerThanDesktop ? 0 : Get.width * .4)),
                        Expanded(
                          child: HtmlWidget(
                            item.desc,
                            textStyle: Get.textTheme.bodyMedium!,
                          ),
                        ),
                      ],
                    )),
            12.zh,
          ],
        );
      },
    );
  }

  List<StickyValue> get createList {
    return [
      StickyValue(title: 'Project Overview', desc: state.portfolio.overview),
      StickyValue(title: 'Execution', desc: state.portfolio.execution),
      StickyValue(title: 'Results', desc: '', images: state.portfolio.images),
    ];
  }

  Widget titleDesc(
      {required String title, required String desc, Widget? customWidget}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.bodyLarge!.copyWith(),
          ),
          6.zh,
          customWidget ??
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Get.textTheme.bodyMedium!.color!.withOpacity(.7),
                ),
              ),
        ],
      ),
    );
  }

  Widget _visitWidget(List<Platforms> platforms) {
    final lastPlatform = platforms.last;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: platforms
          .map((e) => Row(
                children: [
                  ButtonInkWell(
                    onPress: () => logic.gotoAddress(e.linkUrl),
                    child: Icon(
                      e.iconUrl,
                      size: 16,
                      // color: Colors.white.withOpacity(.8),
                    ),
                  ),
                  lastPlatform.enumPlatform != e.enumPlatform
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(' | ',
                              style: Get.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Get.textTheme.bodyMedium!.color!
                                    .withOpacity(.7),
                              )),
                        )
                      : const SizedBox()
                ],
              ))
          .toList(),
    );
  }
}
