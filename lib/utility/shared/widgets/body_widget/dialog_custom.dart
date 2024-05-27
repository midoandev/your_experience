import 'package:flutter/material.dart';

class DialogCustom extends Dialog {
  final Widget widget;

  const DialogCustom({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: widget,
    );
  }
}
