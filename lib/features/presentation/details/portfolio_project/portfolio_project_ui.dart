import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:your_experience/features/presentation/details/portfolio_project/portfolio_project_state.dart';
import 'package:your_experience/features/presentation/home/home_ui.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';
import 'package:your_experience/utility/shared/widgets/body_widget/button_inkwell.dart';

import 'portfolio_project_logic.dart';

class PortfolioProjectUi extends StatelessWidget {
  static const String namePath = '/portfolio-project';

  PortfolioProjectUi({super.key});

  final logic = Get.find<PortfolioProjectLogic>();
  final state = Get.find<PortfolioProjectLogic>().state;

  @override
  Widget build(BuildContext context) {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const NeverScrollableScrollPhysics(),
          body: SingleChildScrollView(
          child: ResponsiveRowColumn(
            columnPadding: EdgeInsets.symmetric(
                horizontal: isSmallerThanDesktop ? 16 : Get.width * .1,
                vertical: 24),
            columnSpacing: isSmallerThanDesktop ? 24 : 60,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.start,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                columnFlex: 0,
                child: Row(
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
                        onPress: () => Get.until(
                            (route) => route.settings.name == HomeUi.namePath)),
                    26.zw,
                    Text(
                      state.portfolio.timeCreated,
                      textAlign: TextAlign.start,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        height: 0,
                        color: Get.textTheme.bodyMedium!.color!.withOpacity(.5),
                      ),
                    ),
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
                      title: 'Expertise', desc: state.portfolio.expertise),
                  titleDesc(
                      title: 'Platforms', desc: state.portfolio.platforms),
                  titleDesc(
                      title: 'Deliverables',
                      desc: state.portfolio.deliverables),
                  titleDesc(title: 'Website', desc: state.portfolio.website),
                ],
              )),
              ResponsiveRowColumnItem(
                child: SizedBox(
                  width: double.infinity,
                  height: Get.height * (isSmallerThanDesktop ? .5 : .9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      state.portfolio.imageDashboard,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(child: list())
            ],
          ),
        ), headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { return []; },),
    );
  }

  Widget list() {
    final isSmallerThanDesktop =
        ResponsiveBreakpoints.of(Get.context!).smallerThan(DESKTOP);
    return ListView.builder(
      controller: state.scrollController,
      shrinkWrap: true,
      itemCount: createList().length,
      itemBuilder: (context, index) {
        final item = createList()[index];
        return Column(
          children: [
            24.zh,
            StickyHeader(
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
                            minWidth: isSmallerThanDesktop ? 0 : Get.width * .4)),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\nNam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.\nAt vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. ",
                        textAlign: TextAlign.justify,
                        style: Get.textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 24.pxToDouble,
                        ),
                      ),
                    ),
                  ],
                )),
            12.zh,
            const Divider(height: 2)
          ],
        );
      },
    );
  }

  List<StickyValue> createList() {
    return [
      StickyValue(title: 'Project Overview', desc: state.portfolio.overview),
      StickyValue(title: 'Execution', desc: state.portfolio.execution),
      StickyValue(title: 'Results', desc: state.portfolio.result),
    ];
  }

  Widget titleDesc({required String title, required String desc}) {
    final isWebsite = title == 'Website';
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.bodyLarge!.copyWith(),
          ),
          6.zh,
          Text(
            isWebsite ? 'Visit Website' : desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
                color: Get.textTheme.bodyMedium!.color!.withOpacity(.7),
                decoration: isWebsite ? TextDecoration.underline : null),
          ),
        ],
      ),
    );
  }
}
