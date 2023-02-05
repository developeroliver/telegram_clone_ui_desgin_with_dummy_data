import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/data/contact_json.dart';
import 'package:telegram_app_ui_design/theme/colors.dart';
import 'package:telegram_app_ui_design/theme/size_config.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        "Contacts",
        style: TextStyle(
          color: kWhite,
          fontSize: getWidth(20.0),
        ),
      ),
      leading: IconButton(
        icon: Text(
          'Sort',
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
            Icons.add,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        hintText: "Search",
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
          SizedBox(height: getHeight(30.0)),
          getSectionIcons(),
          getContactLists(),
        ],
      ),
    );
  }

  Widget getSectionIcons() {
    List icons = [
      {
        "icon": CupertinoIcons.location_solid,
        "label": "Find People Nearby",
      },
      {
        "icon": CupertinoIcons.person_badge_plus_fill,
        "label": "Invite Friends",
      },
    ];

    return Padding(
      padding: EdgeInsets.only(left: getWidth(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          icons.length,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icons[index]["icon"],
                    color: kPrimary,
                    size: getWidth(28.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(10.0)),
                    child: Text(
                      icons[index]["label"],
                      style: TextStyle(
                        color: kPrimary,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(40.0),
                ),
                child: Divider(
                  thickness: 1,
                  color: kWhite.withOpacity(0.15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getContactLists() {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(12.0), bottom: getHeight(10.0)),
      child: Column(
        children: List.generate(
          contact_data.length,
          (index) => Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(contact_data[index]['img']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(12.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact_data[index]['name'],
                          style: TextStyle(
                            color: kWhite,
                            fontSize: getWidth(17.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: getHeight(2.0)),
                        Text(
                          contact_data[index]['is_online']
                              ? "online"
                              : contact_data[index]['seen'],
                          style: TextStyle(
                              color: contact_data[index]['is_online']
                                  ? kPrimary
                                  : kWhite.withOpacity(0.5),
                              fontSize: getWidth(13.0)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: getWidth(50.0)),
                child: Divider(
                  thickness: 1,
                  color: kWhite.withOpacity(0.15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
