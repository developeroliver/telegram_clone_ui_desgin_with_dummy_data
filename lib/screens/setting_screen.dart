import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/data/chats_json.dart';
import 'package:telegram_app_ui_design/data/setting_json.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(getHeight(60.0)),
      ),
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kBgColor,
      leading: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.qr_code,
          color: kPrimary,
          size: getWidth(28.0),
        ),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Text(
            "Edit",
            style: TextStyle(
              fontSize: getWidth(16.0),
              color: kPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: getHeight(90.0),
              height: getWidth(90.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(profile[0]['img']), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: getHeight(20.0)),
          Text(
            profile[0]['name'],
            style: TextStyle(
              fontSize: getWidth(24.0),
              color: kWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: getHeight(2.0)),
          Text(
            "+336 10 10 10 10 - @developpeur.olive",
            style: TextStyle(
              fontSize: getWidth(18.0),
              color: kWhite.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: getHeight(30.0)),
          getSectionOne(),
          SizedBox(height: getHeight(30.0)),
          getSectionTwo(),
          SizedBox(height: getHeight(30.0)),
          getSectionThree(),
          SizedBox(height: getHeight(30.0)),
        ],
      ),
    );
  }

  Widget getSectionOne() {
    return Column(
      children: List.generate(setting_section_one.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: kTextfieldColor),
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(10.0),
              right: getWidth(10.0),
              bottom: getWidth(8.0),
              top: getWidth(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: getWidth(30.0),
                          height: getHeight(30.0),
                          decoration: BoxDecoration(
                            color: setting_section_one[index]['color'],
                            borderRadius: BorderRadius.circular(
                              getWidth(8.0),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_one[index]['icon'],
                              color: kWhite,
                              size: getWidth(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: getWidth(12.0)),
                        Text(
                          setting_section_one[index]['text'],
                          style: TextStyle(
                            fontSize: getWidth(16.0),
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kWhite.withOpacity(0.2),
                      size: getWidth(15.0),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getSectionTwo() {
    return Column(
      children: List.generate(setting_section_two.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: kTextfieldColor),
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(10.0),
              right: getWidth(10.0),
              bottom: getWidth(8.0),
              top: getWidth(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: getWidth(30.0),
                          height: getHeight(30.0),
                          decoration: BoxDecoration(
                            color: setting_section_two[index]['color'],
                            borderRadius: BorderRadius.circular(getWidth(8.0)),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_two[index]['icon'],
                              color: kWhite,
                              size: getWidth(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: getWidth(12.0)),
                        Text(
                          setting_section_two[index]['text'],
                          style: TextStyle(
                            fontSize: getWidth(16.0),
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        getLangAndSticker(setting_section_two[index]['text']),
                        SizedBox(width: getHeight(5.0)),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kWhite.withOpacity(0.2),
                          size: getWidth(15.0),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  getLangAndSticker(value) {
    if (value == "Language") {
      return Text(
        "English",
        style: TextStyle(
          fontSize: getWidth(15.0),
          color: kWhite.withOpacity(0.5),
        ),
      );
    } else if (value == "Stickers and Emoji") {
      return Badge(
        backgroundColor: kPrimary,
        label: Text(
          "12",
          style: TextStyle(
            fontSize: getWidth(15.0),
            color: kWhite,
          ),
        ),
      );
    }
    return Container();
  }

  Widget getSectionThree() {
    return Column(
      children: List.generate(setting_section_three.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: kTextfieldColor),
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(10.0),
              right: getWidth(10.0),
              bottom: getWidth(8.0),
              top: getWidth(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: getWidth(30.0),
                          height: getHeight(30.0),
                          decoration: BoxDecoration(
                            color: setting_section_three[index]['color'],
                            borderRadius: BorderRadius.circular(getWidth(8.0)),
                          ),
                          child: Center(
                            child: Icon(
                              setting_section_three[index]['icon'],
                              color: kWhite,
                              size: getWidth(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: getWidth(12.0)),
                        Text(
                          setting_section_three[index]['text'],
                          style: TextStyle(
                            fontSize: getWidth(16.0),
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kWhite.withOpacity(0.2),
                      size: getWidth(15.0),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
