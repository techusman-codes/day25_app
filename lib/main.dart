import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_app/dafaults/defaults.dart';
// import 'package:navigation_app/dafaults/defaults.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    const Center(
      child: Text('Inbox'),
    ),
    const Center(
      child: Text('Started'),
    ),
    const Center(
      child: Text('Sent'),
    ),
    const Center(
      child: Text('Drafts'),
    ),
    const Center(
      child: Text('Trash'),
    ),
    const Center(
      child: Text('Spam'),
    ),
  ];

  Function updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Navigation Bar',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: pages[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/drawer.jpg'),
                ),
              ),
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Usman Umar Garba',
                    style: GoogleFonts.sanchez(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'ugarba202@gmail.com',
                    style: GoogleFonts.sanchez(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppDraweTitle(index: 0, onTap: updateState(0)),
                  AppDraweTitle(
                    index: 1,
                    onTap: updateState(1),
                  ),
                  AppDraweTitle(
                    index: 2,
                    onTap: updateState(2),
                  ),
                  AppDraweTitle(
                    index: 3,
                    onTap: updateState(3),
                  ),
                  AppDraweTitle(
                    index: 4,
                    onTap: updateState(4),
                  ),
                  AppDraweTitle(
                    index: 5,
                    onTap: updateState(5),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const AppDrawerDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Bravpuls Technologies',
                      style: GoogleFonts.sanchez(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Defaults.drawerItemSelectedColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Version 1.0.0',
                      style: GoogleFonts.sanchez(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppDrawerDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      thickness: 2,
      color: Defaults.drawerItemColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDraweTitle extends StatelessWidget {
  const AppDraweTitle({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}
