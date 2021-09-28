import 'package:flutter/material.dart';
import 'package:todo_app/utils/validator.dart';

class TodoDialog extends StatefulWidget {
  const TodoDialog({Key? key, required note}) : super(key: key);

  @override
  _TodoDialogState createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  var _formKey = GlobalKey<FormState>();
  var _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        "Todo",
        textAlign: TextAlign.center,
      ),
      insetPadding: EdgeInsets.all(25),
      contentPadding: EdgeInsets.only(left: 35, top: 10, right: 35, bottom: 0),
      buttonPadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.only(right: 0, bottom: 15, top: 15),
      content: Container(
        width: screenSize.width,
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: Validator.validateNote,
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Note..."),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenSize.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ),
            Container(
              width: screenSize.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    Navigator.pop(context, _textEditingController.text);
                  },
                  child: Text("Done")),
            ),
          ],
        ),
      ],
    );
  }
}
