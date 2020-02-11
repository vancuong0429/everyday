import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider{
  Firestore _firestore = Firestore.instance;

  Future<void> registerUser(String userId, String email, String name, String avatar) async{
    return _firestore.document("users/$userId")
        .setData({'email': email, 'name': name, 'avatar': avatar}, merge: true);
  }
}