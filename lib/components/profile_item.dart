import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final dynamic icon;
  final String name;
  final String value;
  final String type;
  const ProfileItem({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              type == 'icon'
                  ? Icon(
                      icon,
                      color: Colors.white70,
                      size: 30,
                    )
                  : icon,
              const SizedBox(width: 10),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Divider(
          thickness: 1,
          color: Colors.white30,
        ),
      ],
    );
  }
}
