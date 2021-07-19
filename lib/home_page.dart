import 'package:flutter/material.dart';
import 'package:notes/widgets/button_widget.dart';
import './widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              CardWidget(
                title: notes[i],
                onClick: () async {
                  var response = await Navigator.pushNamed(
                    context,
                    "/create-note",
                    arguments: notes[i],
                  );

                  if (response != null) {
                    var description = response as String;
                    if (description.isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i] = description;
                    }

                    setState(() {});
                  }
                },
              ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton.icon(
            onPressed: () async {
              var description =
                  await Navigator.pushNamed(context, "/create-note");
              if (description != null) {
                notes.add(description as String);
                setState(() {});
              }
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.purple,
              shadowColor: Colors.black,
              elevation: 10,
            ),
          )
        ],
      ),
    );
  }
}
