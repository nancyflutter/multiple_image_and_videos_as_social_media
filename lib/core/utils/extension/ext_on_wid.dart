import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget dismissKeyboard() {
    return GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(), child: this);
  }

  Widget addGesture(VoidCallback onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  Widget toCenter() => Center(child: this);
}
