import 'package:flutter/cupertino.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';

class PlantTextHero extends StatelessWidget {
  final bool editableText;
  final String title;
  final String subTitle;
  final Function(String val) onTitleChanged;
  final Function(String val) onSubTitleChanged;

  const PlantTextHero(
      {Key key,
      this.editableText,
      this.title,
      this.subTitle,
      this.onTitleChanged,
      this.onSubTitleChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 20),
          child: getTextWidget(title, onTitleChanged, 36, FontWeight.w500,
              ColorUtil.headerColor),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: getTextWidget(subTitle, onSubTitleChanged, 20, FontWeight.w500,
              ColorUtil.lighten(ColorUtil.headerColor, .25)),
        ),
      ],
    );
  }

  getTextWidget(String title, Function(String val) onChanged, double fontSize,
      FontWeight weight, Color color) {
    var textStyle = TextStyle(
      fontFamily: 'AlegreyaSans',
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
    );
    if (editableText) {
      return new CustomEditableText(
          text: title, style: textStyle, onChanged: onChanged);
    } else {
      return Text(title, style: textStyle);
    }
  }
}
