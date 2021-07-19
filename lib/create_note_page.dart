import 'package:flutter/material.dart';
import 'package:notes/widgets/button_widget.dart';

class CreateNotepage extends StatefulWidget {
  @override
  _CreateNotepageState createState() => _CreateNotepageState();
}

class _CreateNotepageState extends State<CreateNotepage> {
  var description = "";
  var textController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute
          .of(context)!
          .settings
          .arguments != null) {
        description = ModalRoute
            .of(context)!
            .settings
            .arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Note" : "Create Note"),
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: Icon(Icons.delete),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(
                  labelText: "Descrição"
              ),
            ),
            SizedBox(height: 32,),
            if (description.isNotEmpty)
              ButtonWidget(
                  title: 'Salvar',
                  onClick: () {
                    Navigator.pop(context, description);
                  },
              ),
          ],
        ),
      ),
    );
  }
}
