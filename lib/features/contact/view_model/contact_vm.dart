import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/contacts.dart';

part 'contact_vm.g.dart';

@immutable
class ContactState {
  final String email;
  final List<Contacts> socials;
  final String avatarAsset;
  final String name;
  final String role;

  const ContactState({
    required this.email,
    required this.socials,
    required this.avatarAsset,
    required this.name,
    required this.role,
  });
}

@riverpod
class ContactVm extends _$ContactVm {
  @override
  ContactState build() => ContactState(
    email: PortfolioData.email,
    socials: PortfolioData.getContacts()
        .where((c) => c.iconName != 'email')
        .toList(),
    avatarAsset: PortfolioData.getMainProfile().imageIam.url,
    name: PortfolioData.getMainProfile().hiIam,
    role: PortfolioData.getMainProfile().iam,
  );
}
