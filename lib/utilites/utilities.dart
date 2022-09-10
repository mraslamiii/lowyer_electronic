import 'package:flutter/cupertino.dart';

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}


String?  errorText (TextEditingController controller ,int lenght){


  // at any time, we can get the text from _controller.value.text
  final text = controller.value.text;
  // Note: you can do your own custom validation here
  // Move this logic this outside the widget for more testable code
  if (text.isEmpty) {
    return 'این پارامتر اجباری میباشد';
  }
  if (text.length < lenght) {
    return 'مقدار وارد شده معتبر نمیباشد';
  }
  // return null if the text is valid
  return null;
}

