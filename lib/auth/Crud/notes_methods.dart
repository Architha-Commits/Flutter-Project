import 'package:cloud_firestore/cloud_firestore.dart';

class NotesMethods {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  Future<void> createNote(String note) async {
    await notes.add({"note": note, "timestamp": DateTime.now()});
  }

  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy("timestamp", descending: false).snapshots();
    return notesStream;
  }

  Future<void> updateNote(String docID, String updatedNotes) async {
    await notes.doc(docID).update({
      "note": updatedNotes,
    });
  }

  Future<void> deleteNote(String docId) async {
    await notes.doc(docId).delete();
  }
}
