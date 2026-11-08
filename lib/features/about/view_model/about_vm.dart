import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'about_vm.g.dart';

@immutable
class AboutState {
  /// Small head-and-shoulders photo (same crop as the contact card).
  final String photoAsset;
  final String name;
  final String role;
  final String bio;
  final int years;
  final int liveApps;

  /// Project with the most Google Play installs (null if none listed).
  final ProjectsData? topApp;

  const AboutState({
    required this.photoAsset,
    required this.name,
    required this.role,
    required this.bio,
    required this.years,
    required this.liveApps,
    required this.topApp,
  });
}

@riverpod
class AboutVm extends _$AboutVm {
  @override
  AboutState build() {
    final projects = PortfolioData.getProjects();
    final profile = PortfolioData.getMainProfile();
    final withInstalls = projects.where((p) => p.installs.isNotEmpty).toList()
      ..sort((a, b) => b.installsCount.compareTo(a.installsCount));
    return AboutState(
      photoAsset: profile.imageIam.url,
      name: profile.hiIam,
      role: profile.iam,
      bio: profile.descriptionIam,
      years: PortfolioData.yearsExperience,
      // Derived from data so the numbers can never drift from the projects.
      liveApps: projects.where((p) => p.isLive).length,
      topApp: withInstalls.isEmpty ? null : withInstalls.first,
    );
  }
}
