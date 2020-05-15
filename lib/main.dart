import 'package:flutter/material.dart';
import 'package:flutter_crud/providers/UserProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/User_Form.dart';
import 'package:flutter_crud/views/users_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
          },
        ));
  }
}
