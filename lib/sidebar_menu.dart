import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {

  const SidebarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            buildHeader(
              onClicked: () {},
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Divider(color: Colors.white),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home_filled,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 15),
                  buildMenuItem(
                    text: 'Map',
                    icon: Icons.map,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 430),
                  const Divider(color: Colors.white),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17.0)),
      hoverColor: Colors.grey,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Row(
            children: const [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://www.pinclipart.com/picdir/middle/95-958614_man-icon-person-logo-png-clipart.png')),
              SizedBox(width: 20),
              Text(
                'Name',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
