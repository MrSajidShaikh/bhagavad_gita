import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/lang_provider.dart';
import '../../provider/theme_provider.dart';
import '../screen/home_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Avtar Profile'),
            accountEmail: const Text('+91 70965 84269'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/img/pic.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            title: Text(
              (langProvider.isLangModel.isLang != false)
                  ? "Hindi To English"
                  : "English To Hindi",
            ),
            subtitle: const Text("Click for Change Language"),
            trailing: Card(
              elevation: 10,
              child: IconButton(
                onPressed: () {
                  langProvider.changeLang();
                },
                icon: (langProvider.isLangModel.isLang == false)
                    ? Image(
                  color: (themeProvider.themeModel.isLight == false)
                      ? Colors.white
                      : Colors.black,
                  width: 59,
                  image: const AssetImage(
                    'assets/img/hindi.png',
                  ),
                )
                    : Image(
                  color: (themeProvider.themeModel.isLight == false)
                      ? Colors.white
                      : Colors.black,
                  width: 59,
                  image: const AssetImage(
                    'assets/img/en.png',
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              (themeProvider.themeModel.isLight == false)
                  ? "Dark To Light"
                  : "Light To Dark",
            ),
            subtitle: const Text("Click for Change Theme"),
            trailing: Card(
              elevation: 10,
              child: IconButton(
                onPressed: () {
                  themeProvider.changeTheme();
                },
                icon: (themeProvider.themeModel.isLight == false)
                    ? const Icon(
                  Icons.light_mode,
                )
                    : const Icon(
                  Icons.dark_mode,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
