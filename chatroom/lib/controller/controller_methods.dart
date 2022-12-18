import 'dart:async';
import 'package:demo/model/user_model.dart';
import 'package:demo/screens/logged_in_screens/home.dart';
import 'package:demo/screens/logged_out_screens/user_option.dart';
import 'package:demo/screens/splash_screen/splash_screen.dart';
import 'package:demo/utils/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerMethods extends GetxController {
  static ControllerMethods instance = Get.find();

  late Rx<User?> user;
  var authState = "".obs;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(fauth.currentUser);
    user.bindStream(fauth.userChanges());
    // retrieveUserDetails();
    ever(user, initialScreen);
  }

  static void signout() {
    FirebaseAuth.instance.signOut();
  }

  void initialScreen(User? user) {
    Get.to(() => const SplashScreen());
    Timer(const Duration(milliseconds: 3000), () {
      if (user == null) {
        Get.offAll(() => const UserOption());
      } else {
        Get.offAll(() => const HomePage());
      }
    });
  }

  //to recieve user details from db
  static void retrieveUserDetails() {
    currentFirebaseUser = fauth.currentUser;
    DatabaseReference ref =
        fdb.ref().child("Users").child(currentFirebaseUser!.uid);
    ref.onValue.listen((snap) {
      if (snap.snapshot.value != null) {
        userModel = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() {
      FirebaseDatabase.instance
          .ref()
          .child("Users")
          .child(fauth.currentUser!.uid)
          .set({
        "username": fauth.currentUser!.displayName,
        "email": fauth.currentUser!.email,
        "id": fauth.currentUser!.uid,
        "phone": fauth.currentUser!.phoneNumber,
        "userPic": fauth.currentUser!.photoURL,
      });
    });
  }

  //to check if the user is already exist in database or not
  // static Future isDocumentExist(String docID) async {
  //   var ref = fdb.ref().child("user_info").child(docID).get();
  //   ref.then((value) {
  //     if (value.exists) {
  //       Get.to(const HomePage());
  //       return true;
  //     } else {
  //       // Get.to(const ProfileDetail());
  //       return false;
  //     }
  //   });
  // }
}
