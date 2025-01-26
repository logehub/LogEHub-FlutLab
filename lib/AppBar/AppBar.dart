import 'package:flutter/material.dart';
import 'package:logehub/Classes/Entity/user.dart';
import 'package:logehub/main.dart';
import 'package:logehub/User/Login.dart';

class LogEHubAppBar extends StatefulWidget implements PreferredSizeWidget {
  LogEHubAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  Widget build(BuildContext context) {
    return Text(
      'Logistics Hub',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
        fontFamily: 'InkFree',
      ),
    );
  }
}

class _CustomAppBarState extends State<LogEHubAppBar> {
  TextEditingController txtUserName = TextEditingController();
  final LoginUser user = LoginUser();

  @override
  void initState() {
    //if (user.id.isEmpty) {
    //  getUser();
    //}
    super.initState();
  }

  _CustomAppBarState() {
    //if (user.id.isEmpty) {
    //  getUser();
    //}
  }

  getUser() async {
    /*if (user.id.isEmpty) {
      await UserFunctions().getUser(user).then((onValue) =>
          setState(() {
            txtUserName.text = user.name;
          }),
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    txtUserName.text = user.name;

    return AppBar(
      title: const Text(
        "Logistics Hub",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.brown,
      foregroundColor: Colors.white,
      leading: InkWell(
        child: Image.asset('assets/images/logo.jpg'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                if (user.id.isEmpty) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                } else {
                  //Do Nothing
                  //Navigator.push(
                  //    context,
                  //MaterialPageRoute(
                  //    builder: (context) => const ProfileScreen()));
                }
              },
              child: Row(children: [
                Text(txtUserName.text),
                const Icon(
                  Icons.account_box,
                  size: 26.0,
                  color: Colors.white,
                ),
              ]),
            )),
      ],
    );
  }
}
