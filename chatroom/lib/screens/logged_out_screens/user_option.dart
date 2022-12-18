import 'package:demo/controller/controller_methods.dart';
import 'package:flutter/material.dart';

class UserOption extends StatelessWidget {
  const UserOption({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "chatroom".toUpperCase(),
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
                const Text(
                  "   Your network\nis your net worth",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 7),
                ElevatedButton.icon(
                  onPressed: () {
                    ControllerMethods.signInWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * .8, 42),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  label: const Text("Continue with Google"),
                  icon: Image.asset(
                    "assets/google.png",
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
