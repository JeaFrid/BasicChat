import 'package:basic_chat/services/get_chat.dart';
import 'package:basic_chat/services/select_img.dart';
import 'package:basic_chat/services/send_message.dart';
import 'package:basic_chat/theme/color.dart';
import 'package:basic_chat/variables/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getChatFun(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ChatApp",
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: textColor,
                  size: 25,
                ),
              ],
            ),
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: messageList,
            builder: (context, value, child) {
              return CosmosBody(
                scrollable: true,
                scrollDirection: Axis.vertical,
                children: value,
              );
            },
          )),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: width(context),
            decoration: BoxDecoration(
              color: cColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: chatMessageController,
                    cursorColor: defaultColor,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: "Mesaj yaz...",
                      hintStyle: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (chatMessageController.text.length > 5) {
                        sendMessageBtnVisible.value = true;
                      } else {
                        sendMessageBtnVisible.value = false;
                      }
                    },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: sendMessageBtnVisible,
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () async {
                        if (value == true) {
                          await sendMessage(context);
                        }
                      },
                      child: Opacity(
                        opacity: value == true ? 1 : 0.5,
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    selectImage(context);
                  },
                  child: const Icon(
                    Icons.attach_file,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
