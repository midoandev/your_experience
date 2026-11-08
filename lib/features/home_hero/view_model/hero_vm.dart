import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/models/main_profile.dart';
import 'package:your_experience/models/projects_data.dart';

part 'hero_vm.g.dart';

@immutable
class HeroState {
  final MainProfile profile;
  final List<Contacts> socials;
  final String portraitAsset;
  final int years;
  final int appsShipped;

  /// Project with the most Google Play installs (null if none listed).
  final ProjectsData? topApp;

  const HeroState({
    required this.profile,
    required this.socials,
    required this.portraitAsset,
    required this.years,
    required this.appsShipped,
    required this.topApp,
  });

  /// Asset path of the CV page (served by Flutter web under `assets/`).
  String get cvAssetPath => profile.buttonIam.url;
}

@riverpod
class HeroVm extends _$HeroVm {
  @override
  HeroState build() {
    final projects = PortfolioData.getProjects();
    final withInstalls = projects.where((p) => p.installs.isNotEmpty).toList()
      ..sort((a, b) => b.installsCount.compareTo(a.installsCount));
    return HeroState(
      profile: PortfolioData.getMainProfile(),
      socials: PortfolioData.getContacts()
          .where((c) => c.iconName != 'email')
          .toList(),
      portraitAsset: PortfolioData.portraitImage,
      years: PortfolioData.yearsExperience,
      appsShipped: projects.length,
      topApp: withInstalls.isEmpty ? null : withInstalls.first,
    );
  }
}
