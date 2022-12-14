import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/src/helpers/storage_helper.dart';
import 'package:notesapp/src/helpers/storage_key.dart';

import 'package:notesapp/src/models/task_model.dart';

class TaskRepository {
  createTask(TaskModel taskModel) async {
    String? uid = await StorageHelper.readData(StorageKey.userId.name);
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc("$uid")
        .collection("tasks");
    reference.add(taskModel.toJson());
  }

 Future<QuerySnapshot> getAllTasks() async {
    String? uid = await StorageHelper.readData(StorageKey.userId.name);
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc("$uid")
        .collection("tasks");
    QuerySnapshot snapshot = await reference.get();
    return snapshot;
  }

  editTask(TaskModel updatedTask) async {
    String? uid = await StorageHelper.readData(StorageKey.userId.name);
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc("$uid")
        .collection("tasks");
    reference.doc("${updatedTask.id}").update(updatedTask.toJson());
  }

  deleteTask(TaskModel updatedTask) async {
    String? uid = await StorageHelper.readData(StorageKey.userId.name);
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc("$uid")
        .collection("tasks");
    reference.doc("${updatedTask.id}").delete();
  }
}
