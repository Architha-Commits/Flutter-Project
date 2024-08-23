import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/auth/Crud/notes_methods.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  TextEditingController controller = TextEditingController();
  NotesMethods notesMethods = NotesMethods();
  void showPopUp({String? docId}) {
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
                    if (docId == null) {
                      notesMethods.createNote(controller.text);

                      Fluttertoast.showToast(msg: "Notes created successfully");
                    } else {
                      notesMethods.updateNote(docId, controller.text);

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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showPopUp,
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: notesMethods.getNotes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List notesList = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = notesList[index];
                      String docId = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 3,
                        child: ListTile(
                          title: Text(data["note"]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    notesMethods.deleteNote(docId);
                                    Fluttertoast.showToast(
                                        msg: "Notes Deleted successfully");
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () => showPopUp(docId: docId),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text("No Notes..."),
                );
              }
            }));
  }
}
