import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';

class PlantNotes extends StatelessWidget {
  final margin;

  const PlantNotes({Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text("Notes",
                style: TextStyle(
                  fontFamily: 'AlegreyaSans',
                  fontSize: 40,
                  color: ColorUtil.white,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Column(
            children: <Widget>[
              NoteItem(
                  date: "15 april 2020",
                  content: "Repotted the plant and pruned some excess leaves.",
                  isFirst: true,
                  isLast: false),
              NoteItem(
                  date: "15 april 2020",
                  content:
                      "Repotted the plant and pruned some excess leaves. Repotted the plant and pruned some excess leaves. Repotted the plant and pruned some excess leaves.",
                  isFirst: false,
                  isLast: false),
              NoteItem(
                  date: "15 april 2020",
                  content: "Repotted the plant and pruned some excess leaves.",
                  isFirst: false,
                  isLast: true),
            ],
          )
        ],
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final date;
  final content;
  final isLast;
  final isFirst;

  const NoteItem({Key key, this.date, this.content, this.isLast, this.isFirst})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 3),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: ColorUtil.white, shape: BoxShape.circle),
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: ColorUtil.primaryColor,
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(date,
                  style: TextStyle(
                    fontFamily: 'AlegreyaSans',
                    fontSize: 20,
                    color: ColorUtil.white,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ],
        ),
        NoteItemContent(content:content, isLast:isLast)
      ],
    );
  }
}

class NoteItemContent extends StatefulWidget {
  final isLast;
  final content;

  NoteItemContent({Key key, this.isLast, this.content}) : super(key: key);

  @override
  _NoteItemContentState createState() => _NoteItemContentState();
}

class _NoteItemContentState extends State<NoteItemContent> {
  var lineHeight = 0.0;

  @override
  void initState() {
    // Nasty way to get the height of the text wrap
    // and set the line to the same height
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() => lineHeight = context.size.height);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        !widget.isLast ? Container(
            width: 1,
            height: lineHeight,
            margin: EdgeInsets.only(left: 9),
            color: ColorUtil.white
        ) : Container(),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.only(top: 5, left: 30.0 + (widget.isLast ? 10 : 0), bottom: 30.0),
            child: Text(widget.content,
              style: TextStyle(
                fontFamily: 'AlegreyaSans',
                fontSize: 20,
                color: ColorUtil.white.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            )),
      ],
    );
  }
}