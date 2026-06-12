import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/services_data.dart';

part 'services_vm.g.dart';

@immutable
class ServicesState {
  final List<ServicesData> items;
  final String title;
  final String description;

  const ServicesState({
    required this.items,
    required this.title,
    required this.description,
  });
}

@riverpod
class ServicesVm extends _$ServicesVm {
  @override
  ServicesState build() {
    final menu = PortfolioData.getMainMenu();
    final services = PortfolioData.getServices();
    final servicesMenu = menu.firstWhere((m) => m.widgetKey == 'services');
    return ServicesState(
      items: _listServices(services),
      title: servicesMenu.nameTab,
      description: servicesMenu.description,
    );
  }

  List<ServicesData> _listServices(List<ServicesData> originalList) {
    final newListLength = (originalList.length * 2) - 1;
    final newList = List<ServicesData>.filled(
      newListLength,
      const ServicesData(iconName: '', title: '', description: ''),
    );

    for (int i = 0; i < originalList.length; i++) {
      newList[i * 2] = originalList[i];
    }
    return newList;
  }
}
