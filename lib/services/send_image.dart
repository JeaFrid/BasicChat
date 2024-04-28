import 'package:basic_chat/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> sendImage(BuildContext context, String image) async {
  String tag = CosmosRandom.randomTag();
  String uid = await CosmosFirebase.getUID();
  await CosmosFirebase.add(
    reference: "chat",
    tag: tag,
    value: [
      uid,
      tag,
      image,
      CosmosTime.getNowTimeString(),
      "image",
    ],
    onError: (e) {
      CosmosAlert.showMessage(
        context,
        "Opps...",
        e.toString(),
        backgroundColor: navColor,
        color: textColor,
      );
    },
    onSuccess: () {},
  );
}
