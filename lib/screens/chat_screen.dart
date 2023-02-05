import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_app_ui_design/data/chats_json.dart';
import 'package:telegram_app_ui_design/screens/chat_detail_screen.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getHeight(60.0)),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kGreyColor,
      title: Text(
        "Chats",
        style: TextStyle(
          color: kWhite,
          fontSize: getWidth(20.0),
        ),
      ),
      leading: IconButton(
        icon: Text(
          'Edit',
          style: TextStyle(
            color: kPrimary,
            fontSize: getWidth(16.0),
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            LineIcons.edit,
            size: getWidth(26.0),
            color: kPrimary,
          ),
        )
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: getHeight(68.0),
            decoration: const BoxDecoration(
              color: kGreyColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(getWidth(15.0)),
              child: Column(
                children: [
                  Container(
                    height: getHeight(38.0),
                    decoration: BoxDecoration(
                      color: kBgColor,
                      borderRadius: BorderRadius.circular(getWidth(10.0)),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: kWhite,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: kWhite.withOpacity(0.3),
                        ),
                        hintText: "Search for messages or users",
                        hintStyle: TextStyle(
                          color: kWhite.withOpacity(0.3),
                          fontSize: getWidth(17.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: getHeight(20.0)),
          getListChats(),
        ],
      ),
    );
  }

  Widget getListChats() {
    return Column(
      children: List.generate(
        chat_data.length,
        (index) => Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(12.0),
                  right: getHeight(5.0),
                  bottom: getHeight(10.0)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ChatDetailScreen(
                        name: chat_data[index]['name'],
                        img: chat_data[index]['img'],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(chat_data[index]['img']),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: getWidth(12.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat_data[index]['name'],
                              style: TextStyle(
                                color: kWhite,
                                fontSize: getWidth(17.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: getHeight(2.0)),
                            Text(
                              chat_data[index]["text"],
                              style: TextStyle(
                                  color: kWhite.withOpacity(0.5),
                                  fontSize: getWidth(13.0)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          chat_data[index]['date'],
                          style: TextStyle(
                            color: kWhite.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: getHeight(5.0)),
                        chat_data[index]['badge'] > 0
                            ? Badge(
                                label: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                      chat_data[index]['bagde'].toString()),
                                ),
                                backgroundColor: kPrimary,
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(60.0)),
              child: Divider(
                thickness: 1,
                color: kWhite.withOpacity(0.15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
