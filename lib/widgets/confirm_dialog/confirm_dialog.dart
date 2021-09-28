import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String _title;
  final String _message;

  ConfirmDialog(this._title, this._message);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(_title),
      contentPadding: EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 0),
      buttonPadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.only(right: 10, bottom: 10),
      insetPadding: EdgeInsets.all(25),
      content: Container(
        width: screenSize.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_message),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
