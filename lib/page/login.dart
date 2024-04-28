import 'package:basic_chat/page/register.dart';
import 'package:basic_chat/services/login.dart';
import 'package:basic_chat/theme/color.dart';
import 'package:basic_chat/variables/login.dart';
import 'package:basic_chat/variables/register.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          const Spacer(),
          Icon(
            Icons.fingerprint,
            color: defaultColor,
            size: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
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
                      Icon(
                        Icons.alternate_email_sharp,
                        color: textColor,
                        size: 23,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: loginEmailController,
                          cursorColor: defaultColor,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: "E-Posta",
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
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                      Icon(
                        Icons.lock_outline,
                        color: textColor,
                        size: 23,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: passwordVisibleIcon,
                          builder: (context, value, child) {
                            return TextField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  passwordVisibleIcon.value == Icons.visibility
                                      ? true
                                      : false,
                              controller: loginPasswordController,
                              cursorColor: defaultColor,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: "Parola",
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
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      ValueListenableBuilder(
                        valueListenable: passwordVisibleIcon,
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              if (passwordVisibleIcon.value ==
                                  Icons.visibility) {
                                passwordVisibleIcon.value =
                                    Icons.visibility_off;
                              } else {
                                passwordVisibleIcon.value = Icons.visibility;
                              }
                            },
                            child: Icon(
                              value,
                              color: textColor.withOpacity(0.6),
                              size: 23,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await loginServices(
                context,
                loginEmailController.text,
                loginPasswordController.text,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: width(context),
              decoration: BoxDecoration(
                color: navColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Giriş Yap",
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              CosmosNavigator.pushFromLeftToRight(
                context,
                const Register(),
                transitionDuration: const Duration(milliseconds: 400),
              );
            },
            child: Text(
              "Hesabınız yok mu? Kayıt Olun!",
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "JeaFriday | 2024",
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.4),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
