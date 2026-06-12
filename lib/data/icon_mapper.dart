import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget iconWidget(String name, {double size = 24, Color? color}) {
  switch (name) {
    case 'github':
      return FaIcon(FontAwesomeIcons.github, size: size, color: color);
    case 'linkedin':
      return FaIcon(FontAwesomeIcons.linkedinIn, size: size, color: color);
    case 'twitter':
      return FaIcon(FontAwesomeIcons.twitter, size: size, color: color);
    case 'telegram':
      return FaIcon(FontAwesomeIcons.telegram, size: size, color: color);
    case 'web':
      return FaIcon(FontAwesomeIcons.globe, size: size, color: color);
    case 'android':
      return FaIcon(FontAwesomeIcons.googlePlay, size: size, color: color);
    case 'ios':
      return FaIcon(FontAwesomeIcons.appStore, size: size, color: color);
    case 'email':
      return Icon(Icons.mail_outlined, size: size, color: color);
    case 'design_services':
      return Icon(Icons.design_services, size: size, color: color);
    case 'touch_app':
      return Icon(Icons.touch_app, size: size, color: color);
    case 'lightbulb':
      return Icon(Icons.lightbulb, size: size, color: color);
    case 'code':
      return Icon(Icons.code, size: size, color: color);
    default:
      return Icon(Icons.code, size: size, color: color);
  }
}
