import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/Hive/hive_notes_methods.dart';

class HiveNotesScreen extends StatefulWidget {
  const HiveNotesScreen({super.key});

  @override
  State<HiveNotesScreen> createState() => _HiveNotesScreenState();
}

class _HiveNotesScreenState extends State<HiveNotesScreen> {
  TextEditingController controller = TextEditingController();
  HiveNotesMethods hiveNotesMethods = HiveNotesMethods();
  void showPopUp({int? index}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: controller,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (index == null) {
                      hiveNotesMethods.createNote(controller.text);
                      setState(() {});
                      Fluttertoast.showToast(msg: "Notes created successfully");
                    } else {
                      hiveNotesMethods.updateNote(index, controller.text);
                      setState(() {});
                      Fluttertoast.showToast(msg: "Notes updated successfully");
                    }
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<String> noteList = hiveNotesMethods.getNotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Crud"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showPopUp,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: ListTile(
                title: Text(noteList[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          hiveNotesMethods.deleteNote(index);
                          setState(() {});
                          Fluttertoast.showToast(
                              msg: "Notes Deleted successfully");
                        },
                        icon: const Icon(Icons.delete)),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => showPopUp(index: index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
