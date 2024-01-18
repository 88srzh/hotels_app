import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 2) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 1)}-');
      if (newValue.selection.end >= 2) {
        selectionIndex += 1;
      }
    }
    if (newTextLength >= 5) {
      newText.write('${newValue.text.substring(1, usedSubstringIndex = 4)}-');
      if (newValue.selection.end >= 5) {
        selectionIndex++;
      }
    }
    if (newTextLength >= 8) {
      newText.write('${newValue.text.substring(4, usedSubstringIndex = 7)}-');
      if (newValue.selection.end >= 8) {
        selectionIndex++;
      }
    }
    if (newTextLength >= 9) {
      newText.write('${newValue.text.substring(7, usedSubstringIndex = 9)}-');
      if (newValue.selection.end >= 9) {
        selectionIndex++;
      }
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(9, usedSubstringIndex = 11));
      // if (newValue.selection.end >= 12) {
      //   selectionIndex++;
      // }
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
