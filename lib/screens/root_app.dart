import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/screens/chat_screen.dart';
import 'package:telegram_app_ui_design/screens/contact_screen.dart';
import 'package:telegram_app_ui_design/screens/setting_screen.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  List iconsItems = [
    CupertinoIcons.person_crop_circle_fill,
    CupertinoIcons.chat_bubble_2_fill,
    CupertinoIcons.settings_solid,
  ];

  List textItems = [
    "Contacts",
    "Chats",
    "Setttings",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBgColor,
      bottomNavigationBar: bottomBar(),
      body: content(),
    );
  }

  Widget content() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactScreen(),
        ChatScreen(),
        SettingScreen(),
      ],
    );
  }

  Widget bottomBar() {
    return Container(
      height: getHeight(90.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kGreyColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(30.0),
          vertical: getHeight(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            iconsItems.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  index == 1
                      ? Badge(
                          label: const Text(
                            '3',
                            style: TextStyle(color: kWhite),
                          ),
                          child: Icon(
                            iconsItems[index],
                            size: getWidth(30.0),
                            color: pageIndex == index
                                ? kPrimary
                                : kWhite.withOpacity(0.5),
                          ),
                        )
                      : Icon(
                          iconsItems[index],
                          size: getWidth(30.0),
                          color: pageIndex == index
                              ? kPrimary
                              : kWhite.withOpacity(0.5),
                        ),
                  SizedBox(height: getHeight(3.0)),
                  Text(
                    textItems[index],
                    style: TextStyle(
                      color: pageIndex == index
                          ? kPrimary
                          : kWhite.withOpacity(0.5),
                      fontSize: getWidth(11.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
