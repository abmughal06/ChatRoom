import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/global.dart';

// ignore: must_be_immutable
class Inbox extends StatelessWidget {
  Inbox({super.key, this.name, this.uid});
  String? name;
  String? uid;

  final messageController = TextEditingController();
  sendMessage() {
    Map msgMap = {
      "msg": messageController.text.trim(),
      "time": DateTime.now().toString(),
      "senderID": fauth.currentUser!.uid.toString(),
      "senderName": fauth.currentUser!.displayName.toString(),
      "recieverID": uid.toString(),
      "recieverName": name.toString(),
    };
    DatabaseReference ref = fdb.ref().child("chats");
    ref.push().set(msgMap);
    messageController.clear();
  }

  var sent = false.obs;
  var recieved = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(name!.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: FirebaseAnimatedList(
                  query: fdb.ref().child("chats"),
                  itemBuilder: (context, snap, i, index) {
                    Map map = snap.value as Map;
                    if (map["senderID"] == fauth.currentUser!.uid &&
                        map["recieverID"] == uid) {
                      return Container(
                        margin: const EdgeInsets.only(left: 160, bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade500,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          map["msg"].toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (map["recieverID"] == fauth.currentUser!.uid &&
                        map["senderID"] == uid) {
                      return Container(
                        margin: const EdgeInsets.only(right: 160),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          map["msg"].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  // height: 45,
                  child: TextFormField(
                    controller: messageController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 30, top: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      floatingLabelStyle: const TextStyle(color: Colors.white),
                      hintText: "Enter message to send",
                    ),
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      sendMessage();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
