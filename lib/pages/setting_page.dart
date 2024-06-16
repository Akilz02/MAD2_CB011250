import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test02/pages/profile_page.dart';
import 'package:test02/theme/theam_provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationEnabled = true;
  bool _isCheckboxVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: Text('Notification Settings'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10),
                _isCheckboxVisible ? Checkbox(
                  value: _notificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationEnabled = value!;
                    });
                  },
                ) : Container(),
                Icon(
                  _notificationEnabled ? Icons.notifications : Icons.notifications_off,
                  color: _notificationEnabled ? Colors.blue : Colors.grey,
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _notificationEnabled = !_notificationEnabled;
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.info),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            title: Text('Dark Mode'),
            trailing: MaterialButton(
              child: Text('ON/OFF'),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            trailing: Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
