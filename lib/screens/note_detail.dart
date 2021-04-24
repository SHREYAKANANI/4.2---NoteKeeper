import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NoteDetail extends StatefulWidget {
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High','Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String> (
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: textStyle,
                value: 'Low',
                onChanged: (ValueSelectedbyUser) {
                  setState(() {
                    debugPrint('User selected $ValueSelectedbyUser');
                  });
                }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something changed in title Text Field');
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  )

                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    )

                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Colors.purple,
                       onPrimary: Colors.white,
                     ),
                      child: Text(
                        'SAVE',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                       setState(() {
                         debugPrint("Save button clicked");
                       });
                      },
                    ) ),
                Container(width: 5.0),
                Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete button clicked");
                        });
                      },
                    ) )
              ],
            )
            )
          ],
        )
      )
    );
  }
}
