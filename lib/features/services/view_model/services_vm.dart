import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/services_data.dart';

part 'services_vm.g.dart';

@immutable
class ServicesState {
  final List<ServicesData> items;

  const ServicesState({required this.items});
}

@riverpod
class ServicesVm extends _$ServicesVm {
  @override
  ServicesState build() => ServicesState(items: PortfolioData.getServices());
}
