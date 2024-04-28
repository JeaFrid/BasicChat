import 'package:basic_chat/services/send_image.dart';
import 'package:basic_chat/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> selectImage(BuildContext context) async {
  CosmosAlert.loadingIOS(context, color: textColor);
  try {
    await CosmosFirebase.imagePickAndStoreFireStorage().then(
      (value) {
        if (value == null) {
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          CosmosAlert.showCustomAlert(
            context,
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CosmosImage(
                      value,
                      width: width(context),
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    CosmosButton.button(
                      text: "Görseli Gönder",
                      padding: const EdgeInsets.all(10),
                      backgroundColor: navColor,
                      color: textColor,
                      onTap: () async {
                        await sendImage(context, value).then((value) {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    CosmosButton.button(
                      text: "Vazgeç",
                      padding: const EdgeInsets.all(10),
                      backgroundColor: navColor,
                      color: defaultColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
