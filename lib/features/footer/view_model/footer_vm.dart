import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/data/portfolio_data.dart';

part 'footer_vm.g.dart';

@immutable
class FooterState {
  final List<Contacts> contacts;

  const FooterState({required this.contacts});
}

@riverpod
class FooterVm extends _$FooterVm {
  @override
  FooterState build() {
    final contacts = PortfolioData.getContacts();
    return FooterState(contacts: contacts);
  }
}
