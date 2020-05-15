import 'package:flutter/material.dart';
import 'package:flutter_crud/models/User.dart';
import 'package:flutter_crud/providers/UserProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/CustomDialog.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );

    return ListTile(
      leading: IconButton(
          icon: avatar,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => CustomDialog(
                buttonText: 'Fechar',
                description: user.email,
                title: user.name,
                avatarUrl: user.avatarUrl,
              ),
            );
          }),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.amber,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                }),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir usuário'),
                      content: Text(
                          'Tem certeza que vai excluir ' + user.name + '?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Não'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ).then((confimed) {
                    if (confimed) {
                      Provider.of<UserProvider>(context, listen: false)
                          .remove(user);
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
