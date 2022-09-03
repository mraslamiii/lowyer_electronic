import 'package:flutter/cupertino.dart';

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
