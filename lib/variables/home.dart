import 'package:flutter/material.dart';


TextEditingController chatMessageController = TextEditingController();
ValueNotifier<bool> sendMessageBtnVisible = ValueNotifier(false);
ValueNotifier<List<Widget>> messageList = ValueNotifier<List<Widget>>([]);
