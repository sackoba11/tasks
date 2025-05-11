// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'task_model.dart';

// class TaskService {
//   final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');

//   // Create a new task in Firestore
//   Future<void> createTask(Task task) async {
//     try {
//       await taskCollection.doc(task.id).set(task.toMap());
//       print('Task created successfully.');
//     } catch (e) {
//       print('Failed to create task: $e');
//     }
//   }

//   // Get a single task by ID
//   Future<Task?> getTaskById(String id) async {
//     try {
//       DocumentSnapshot snapshot = await taskCollection.doc(id).get();
//       if (snapshot.exists) {
//         return Task.fromMap(snapshot.data() as Map<String, dynamic>);
//       }
//       return null;
//     } catch (e) {
//       print('Failed to get task: $e');
//       return null;
//     }
//   }

//   // Get all tasks
//   Future<List<Task>> getAllTasks() async {
//     try {
//       QuerySnapshot snapshot = await taskCollection.get();
//       return snapshot.docs.map((doc) => Task.fromMap(doc.data() as Map<String, dynamic>)).toList();
//     } catch (e) {
//       print('Failed to get tasks: $e');
//       return [];
//     }
//   }

//   // Update a task
//   Future<void> updateTask(Task task) async {
//     try {
//       await taskCollection.doc(task.id).update(task.toMap());
//       print('Task updated successfully.');
//     } catch (e) {
//       print('Failed to update task: $e');
//     }
//   }

//   // Delete a task
//   Future<void> deleteTask(String id) async {
//     try {
//       await taskCollection.doc(id).delete();
//       print('Task deleted successfully.');
//     } catch (e) {
//       print('Failed to delete task: $e');
//     }
//   }
// }
