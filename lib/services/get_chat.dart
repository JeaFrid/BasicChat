import 'dart:async';
import 'package:basic_chat/variables/home.dart';
import 'package:basic_chat/widget/message.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> getChatFun(BuildContext context) async {
  await CosmosFirebase.getUID().then(
    (uid) async {
      await CosmosFirebase.getOnce("users").then(
        (users) {
          CosmosFirebase.dataChanged(
            reference: "chat",
            onDataChanged: (element) {
              List<String> gotValue = element as List<String>;
              String gotUID = gotValue[0].replaceAll('"', "");
              String gotTag = gotValue[1];
              String gotName = "";
              String gotMessage = gotValue[2];
              String gotTimestamp = gotValue[3];
              String gotType = gotValue[4];
              gotTimestamp = gotTimestamp.substring(10, 16);
              for (List<String> singleUsers in users) {
                if ('"$gotUID"' == singleUsers[singleUsers.length - 1]) {
                  gotName = singleUsers[0];
                }
              }
              if (gotUID == uid) {
                if (gotType == "message") {
                  messageList.value.add(
                    message(
                      context,
                      true,
                      gotName,
                      gotMessage,
                      gotTimestamp,
                      gotTag,
                    ),
                  );
                } else {
                  messageList.value.add(
                    image(
                      context,
                      true,
                      gotName,
                      gotMessage,
                      gotTimestamp,
                      gotTag,
                    ),
                  );
                }
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                messageList.notifyListeners();
              } else {
                if (gotType == "message") {
                  messageList.value.add(
                    message(
                      context,
                      false,
                      gotName,
                      gotMessage,
                      gotTimestamp,
                      gotTag,
                    ),
                  );
                } else {
                  messageList.value.add(
                    image(
                      context,
                      false,
                      gotName,
                      gotMessage,
                      gotTimestamp,
                      gotTag,
                    ),
                  );
                }

                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                messageList.notifyListeners();
              }
            },
          );
        },
      );
    },
  );
}
