import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String login;
  final String avatarUrl;

  const UserWidget({
    required this.login,
    required this.avatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(login),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
    );
  }
}
