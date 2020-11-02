import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Designs"),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: Colors.blue,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: Text("Hola Mundo"),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "JF",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Expanded(
              child: _OptionsList(),
            )
          ],
        ),
      ),
    );
  }
}
