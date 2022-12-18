import 'package:demo/screens/logged_in_screens/message.dart';
import 'package:demo/utils/drawer.dart';
import 'package:demo/utils/global.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text("Hello ${fauth.currentUser!.displayName}"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FirebaseAnimatedList(
          query: fdb.ref().child("Users"),
          itemBuilder: (context, snap, a, index) {
            Map map = snap.value as Map;
            if (snap.key == fauth.currentUser!.uid) {
              return Container();
            } else {
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(map["userPic"]),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    title: Text(map["username"]),
                    subtitle: Text(map["email"]),
                    trailing: const Icon(Icons.message),
                    onTap: () {
                      Get.to(Inbox(
                        name: map["username"],
                        uid: snap.key,
                      ));
                    },
                  ),
                  const Divider(
                    thickness: 1.2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
