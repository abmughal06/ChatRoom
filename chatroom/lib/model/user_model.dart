import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? uid;
  String? username;
  String? userPic;
  String? phone;
  String? email;

  UserModel({
    this.uid,
    this.email,
    this.phone,
    this.userPic,
    this.username,
  });

  UserModel.fromSnapshot(DataSnapshot snap) {
    uid = snap.key;
    username = (snap.value as dynamic)["username"];
    email = (snap.value as dynamic)["email"];
    userPic = (snap.value as dynamic)["userPic"];
    uid = (snap.value as dynamic)["id"];
  }
}
