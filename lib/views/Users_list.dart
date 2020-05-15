import 'package:flutter/material.dart';
import 'package:flutter_crud/components/User_tile.dart';
import 'package:flutter_crud/providers/UserProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              })
        ],
      ),
      body: ListView.builder(
        itemCount: userProvider.count,
        itemBuilder: (context, index) => UserTile(userProvider.byId(index)),
      ),
    );
  }
}
