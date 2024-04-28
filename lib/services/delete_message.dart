import 'package:basic_chat/page/home.dart';
import 'package:basic_chat/theme/color.dart';
import 'package:basic_chat/variables/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> deleteMessage(BuildContext context, String id) async {
  String getID = id.replaceAll('"', "");
  CosmosFirebase.delete(
    'chat/"$getID"',
    () {
      messageList.value.clear();
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      messageList.notifyListeners();
      CosmosNavigator.pushNonAnimatedReplacement(
        context,
        const HomePage(),
      );
    },
    (e) {
      Navigator.pop(context);
      CosmosAlert.showMessage(
        context,
        "Opps...",
        e.toString(),
        backgroundColor: navColor,
        color: textColor,
      );
    },
  );
}
