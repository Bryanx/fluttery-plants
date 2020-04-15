import 'package:flutter/cupertino.dart';
import 'package:fluttering_plants/common/color_util.dart';

///
/// Container for editable text
///
class CustomEditableText extends StatelessWidget {
  final style;
  final text;
  final controller;
  final Function(String val) onChanged;

  CustomEditableText({this.style, this.text, this.onChanged})
      : controller = new TextEditingController(text: text);

  @override
  Widget build(BuildContext context) {
    // this prevents the cursor from jumping to the start upon selection
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    return Flexible(
        child: EditableText(
      backgroundCursorColor: ColorUtil.primaryColor,
      cursorColor: ColorUtil.primaryColor,
      maxLines: 1,
      controller: controller,
      onChanged: onChanged,
      style: style,
      focusNode: FocusNode(),
    ));
  }
}
