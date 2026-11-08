import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/tech_group.dart';

part 'tech_stack_vm.g.dart';

@immutable
class TechStackState {
  final List<TechGroup> groups;
  const TechStackState({required this.groups});
}

@riverpod
class TechStackVm extends _$TechStackVm {
  @override
  TechStackState build() =>
      TechStackState(groups: PortfolioData.getTechStack());
}
