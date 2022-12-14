import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/src/models/user_model.dart';

class AuthenticationRepository {
  Future<UserCredential> createUser(String email, String password) {
    Future<UserCredential> user = FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<UserCredential> loginUser(String email, String password) {
    Future<UserCredential> user = FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<void> logout() async {
   await FirebaseAuth.instance.signOut();
  }

  Future<void> storeUserData(UserModel userModel) async{
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.doc(userModel.id).set(userModel.toJson());
  }
}
