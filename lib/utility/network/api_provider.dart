import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ApiProvider {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
  Reference storageRef = FirebaseStorage.instance.ref();

  ApiProvider();

  final ref = FirebaseDatabase.instance.ref();

  Future<String> newKey(String path) async {
    try {
      var response = databaseRef.child(path).push().key ?? '';
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DataSnapshot> getData(String path) async {
    try {
      var response = await databaseRef.child(path).get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> writeNewData(String path, Map<String, dynamic> data) async {
    try {
      var response = await databaseRef.child(path).set(data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateData(String path, Map<String, dynamic> data) async {
    try {
      var response = await databaseRef.child(path).update(data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Reference getImage(path) => storageRef.child(path);
}
