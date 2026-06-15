import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_detail_vm.g.dart';

@immutable
class PortfolioDetailState {
  final ProjectsData portfolio;

  const PortfolioDetailState({required this.portfolio});
}

@riverpod
class PortfolioDetailVm extends _$PortfolioDetailVm {
  @override
  PortfolioDetailState build(ProjectsData data) {
    return PortfolioDetailState(portfolio: data);
  }
}
