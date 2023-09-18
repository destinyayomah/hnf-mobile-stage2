import 'package:flutter/material.dart';
import 'package:hngmobilestage2/service/user_data.dart';

class Edit extends StatelessWidget {
  final UserData userData;
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _slacknameController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  Edit({super.key, required this.userData}) {
    _fullnameController.text = userData.fullname;
    _slacknameController.text = userData.slackname;
    _githubController.text = userData.github;
    _bioController.text = userData.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(0, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit_square,
                  color: Colors.black,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(color: Colors.white38),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _slacknameController,
                decoration: InputDecoration(
                  hintText: 'Slack Username',
                  hintStyle: const TextStyle(color: Colors.white38),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      image: AssetImage('assets/images/slack.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _githubController,
                decoration: InputDecoration(
                  hintText: 'GitHub',
                  hintStyle: const TextStyle(color: Colors.white38),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      image: AssetImage('assets/images/github.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _bioController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Bio',
                  hintStyle: const TextStyle(color: Colors.white38),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                onPressed: () {
                  userData.fullname = _fullnameController.text;
                  userData.slackname = _slacknameController.text;
                  userData.github = _githubController.text;
                  userData.bio = _bioController.text;
                  Navigator.pop(context, userData);
                },
                child: const Text(
                  'SAVE',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
