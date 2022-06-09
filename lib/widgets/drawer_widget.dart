import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zakat_frontend/presentation/screens/favourite_zakat_requests_view.dart';
// import 'package:zakat_frontend/presentation/screens/my_zakat_requests_view.dart';
// import 'package:zakat_frontend/presentation/screens/zakat_requests.dart';
import 'package:zakat_frontend/session/session_cubit.dart';
import 'package:zakat_frontend/zakat_in_islam/hadith_of_zakat_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = "John Doe";
    final email = "johndoe@email.com";
    final urlImage =
        "https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg";
    return Drawer(
      // backgroundColor: Color(0xff6a0129),
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: [
            buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => {}),
            const SizedBox(
              height: 48,
            ),
            //  buildMenuItem(text: "Home", icon: Icons.home_outlined,onClicked: selectedItem(context,0)),

            // const SizedBox(
            //   height: 16,
            // ),
            buildMenuItem(
                text: "Home",
                icon: Icons.list,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: "My Requests",
                icon: Icons.list,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: "Favourite Requests",
                icon: Icons.list,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: "Ayah and Hadith",
                icon: Icons.list,
                onClicked: () => selectedItem(context, 0)),
            // buildMenuItem(text: "Favorites", icon: Icons.favorite_border),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
                text: "Logout",
                icon: Icons.logout_outlined,
                onClicked: () => selectedItem(context, 1))
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hover = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hover,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
    // case 0:
    //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => ZakatRequestView()));
    //   break;
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HadithOfZakatView()));
        break;
      case 1:
        BlocProvider.of<SessionCubit>(context).signOut();
        break;
      case 2:
        Navigator.of(context);
            // .push(MaterialPageRoute(builder: (_) => MyZakatRequestView()));
        break;
      case 3:
        Navigator.of(context);
            // .push(MaterialPageRoute(builder: (_) => ZakatRequestView()));
        break;
      case 4:
        Navigator.of(context);
            // .push(MaterialPageRoute(builder: (_) => FavouriteZakatRequestView()));
        break;
    }
  }

  buildHeader(
      {String? urlImage,
        required String name,
        required String email,
        required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage!)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            )
          ]),
        ),
      );
}