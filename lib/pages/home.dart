import 'package:flutter/material.dart';
import 'package:hngmobilestage2/components/notification.dart';
import 'package:hngmobilestage2/components/profile_item.dart';
import 'package:hngmobilestage2/pages/edit.dart';
import 'package:hngmobilestage2/service/user_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserData userData = UserData(
    fullname: 'Destiny Ayomah',
    slackname: 'Destiny Ayomah',
    github: '@destinyayomah',
    bio:
        'Full Stack Software Engineer, close on more than half a decade of experience.',
  );

  @override
  Widget build(BuildContext context) {
    customDialog(type, message) {
      dialogMessage('success', 'Cv Updated', context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Positioned(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Image(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.white54,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                left: 30,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 1,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(100, 50),
                  ),
                  onPressed: () async {
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit(userData: userData),
                      ),
                    );

                    if (updatedData != null) {
                      setState(() {
                        userData = updatedData;
                      });

                      customDialog('success', 'Cv Updated');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                    ),
                    child: Icon(
                      Icons.edit_square,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      userData.fullname,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 1,
                    color: Colors.white30,
                  ),
                  ProfileItem(
                    icon: Icons.person,
                    name: 'Full Name:',
                    value: userData.fullname,
                    type: 'icon',
                  ),
                  ProfileItem(
                    icon: const Image(
                      image: AssetImage('assets/images/slack.png'),
                    ),
                    name: 'Slack Username:',
                    value: userData.slackname,
                    type: 'image',
                  ),
                  ProfileItem(
                    icon: const Image(
                      image: AssetImage('assets/images/github.png'),
                    ),
                    name: 'GitHub Handle:',
                    value: userData.github,
                    type: 'image',
                  ),
                  ProfileItem(
                    icon: Icons.edit,
                    name: 'Bio:',
                    type: 'icon',
                    value: userData.bio,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
