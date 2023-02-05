import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/data/chats_json.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';
import 'package:telegram_app_ui_design/widgets/custom_bubble_chat.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.img,
  });
  final String name;
  final String img;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kGreyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: kPrimary,
          ),
        ),
        title: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(
                  color: kWhite,
                  fontSize: getWidth(17.0),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'last seen recently',
              style: TextStyle(
                color: kWhite.withOpacity(0.4),
                fontSize: getWidth(12.0),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(10.0)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.img),
            ),
          )
        ],
      ),
      body: getBody(),
      bottomNavigationBar: getBottom(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(top: getHeight(20.0), bottom: getHeight(20.0)),
      children: List.generate(
        messages.length,
        (index) => CustomBubbleChat(
          isMe: messages[index]['isMe'],
          message: messages[index]['message'],
          time: messages[index]['time'],
          isLast: messages[index]['isLast'],
        ),
      ),
    );
  }

  Widget getBottom() {
    return Container(
      height: getHeight(80.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kGreyColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(getWidth(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/attach.png',
              width: getWidth(24.0),
              color: kPrimary,
            ),
            SizedBox(width: getWidth(5.0)),
            Expanded(
              child: Container(
                height: getHeight(32.0),
                decoration: BoxDecoration(
                  color: kBgColor,
                  borderRadius: BorderRadius.circular(
                    getWidth(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    cursorColor: kPrimary,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: kWhite.withOpacity(0.5),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: getWidth(5.0)),
            Padding(
              padding: EdgeInsets.only(top: getHeight(3.0)),
              child: Icon(
                Icons.mic_rounded,
                color: kPrimary,
                size: getHeight(26.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
