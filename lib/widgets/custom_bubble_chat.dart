import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';

class CustomBubbleChat extends StatelessWidget {
  const CustomBubbleChat({
    super.key,
    required this.isMe,
    required this.message,
    required this.time,
    required this.isLast,
  });
  final bool isMe;
  final String message;
  final String time;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      if (!isLast) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  left: getWidth(20.0),
                  right: getWidth(20.0),
                  bottom: getWidth(2.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(getWidth(6.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getWidth(8.0),
                      right: getWidth(8.0),
                      top: getWidth(5.0),
                      bottom: getWidth(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                              fontSize: getWidth(16.0), color: kWhite),
                        ),
                        SizedBox(height: getHeight(3.0)),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: getWidth(12.0),
                            color: kWhite.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                  padding: EdgeInsets.only(
                    left: getWidth(20.0),
                    right: getWidth(14.0),
                    bottom: getWidth(10.0),
                  ),
                  child: Bubble(
                    nip: BubbleNip.rightBottom,
                    color: kPrimary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                              fontSize: getWidth(16.0), color: kWhite),
                        ),
                        SizedBox(height: getWidth(3.0)),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: getWidth(12.0),
                            color: kWhite.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }
    } else {
      if (!isLast) {
        return Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  left: getWidth(20.0),
                  right: getWidth(20.0),
                  bottom: getWidth(2.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: kGreyColor,
                    borderRadius: BorderRadius.circular(getWidth(6.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(fontSize: 16, color: kWhite),
                        ),
                        SizedBox(height: getHeight(3.0)),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: kWhite.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          children: [
            Flexible(
              child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 14, bottom: 10),
                  child: Bubble(
                    nip: BubbleNip.rightBottom,
                    color: kGreyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(fontSize: 16, color: kWhite),
                        ),
                        SizedBox(height: getHeight(3.0)),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: getWidth(12.0),
                              color: kWhite.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }
    }
  }
}
