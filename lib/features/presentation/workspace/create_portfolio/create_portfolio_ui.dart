import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/utility/shared/constants/number_helper.dart';

import 'create_portfolio_logic.dart';

class CreatePortfolioUi extends StatelessWidget {
  static const String namePath = '/create-portfolio';

  CreatePortfolioUi({super.key});

  final logic = Get.find<CreatePortfolioLogic>();
  final state = Get.find<CreatePortfolioLogic>().state;

  // StickyValue(title: 'Project Overview', desc: state.portfolio.overview),
  // StickyValue(title: 'Execution', desc: state.portfolio.execution),
  // StickyValue(title: 'Results', desc: state.portfolio.result),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // backgroundColor: const Color.from,RGBO(82, 170, 94, 1.0),
        tooltip: 'Save',
        onPressed: () {},
        child: const Icon(Icons.save, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              onTap: () => logic.tapToEditor(state.controlOverview.value),
              controller: state.controlOverview.value,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Project Overview',
              ),
            ),
            16.zh,
            TextFormField(
              onTap: () => logic.tapToEditor(state.controlExecution.value),
              controller: state.controlExecution.value,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Execution',
              ),
            ),
            16.zh,
            TextFormField(
              onTap: () => logic.tapToEditor(state.controlResult.value),
              controller: state.controlResult.value,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Results',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
