import 'package:flutter/material.dart';

class DialogCustom extends Dialog {
  final Widget widget;

  const DialogCustom({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: widget,
    );
  }
}
