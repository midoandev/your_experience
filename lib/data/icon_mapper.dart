import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Maps a string identifier from the data layer to an icon widget.
/// Keeps models free of Flutter imports.
Widget iconWidget(String name, {double size = 24, Color? color}) {
  final fa = _faIcons[name];
  if (fa != null) return FaIcon(fa, size: size, color: color);
  return Icon(
    _materialIcons[name] ?? Icons.code_rounded,
    size: size,
    color: color,
  );
}

const _faIcons = <String, FaIconData>{
  'github': FontAwesomeIcons.github,
  'linkedin': FontAwesomeIcons.linkedinIn,
  'twitter': FontAwesomeIcons.xTwitter,
  'telegram': FontAwesomeIcons.telegram,
  'web': FontAwesomeIcons.globe,
  'android': FontAwesomeIcons.googlePlay,
  'ios': FontAwesomeIcons.appStore,
};

const _materialIcons = <String, IconData>{
  'email': Icons.mail_outline_rounded,
  'design_services': Icons.design_services_outlined,
  'architecture': Icons.layers_outlined,
  'devices': Icons.devices_outlined,
  'rocket': Icons.rocket_launch_outlined,
  'cloud': Icons.cloud_outlined,
  'code': Icons.code_rounded,
};
