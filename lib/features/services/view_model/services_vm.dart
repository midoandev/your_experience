import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/service_item.dart';

part 'services_vm.g.dart';

@immutable
class ServicesState {
  final List<ServiceItem> items;
  final String picture;
  final double pictureRatio;
  const ServicesState({
    required this.items,
    required this.picture,
    required this.pictureRatio,
  });
}

@riverpod
ServicesState servicesVm(Ref ref) => ServicesState(
  items: PortfolioData.getServices(),
  picture: PortfolioData.servicesPicture,
  pictureRatio: PortfolioData.servicesPictureRatio,
);
