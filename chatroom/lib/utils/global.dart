import 'package:demo/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

String key = "AIzaSyD47uaaEkZEkfdUzDeGPRMCig7cg8gDDN0";
FirebaseAuth fauth = FirebaseAuth.instance;
final FirebaseDatabase fdb = FirebaseDatabase.instance;
User? currentFirebaseUser;
UserModel userModel = UserModel();
