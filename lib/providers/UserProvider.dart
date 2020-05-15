import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/Dummy_users.dart';
import 'package:flutter_crud/models/User.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _itens = {...DUMMY_USERS};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byId(int index) {
    return _itens.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      _itens.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
        id,
        () => User(
          id: id,
          avatarUrl: user.avatarUrl,
          email: user.email,
          name: user.name,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }
}
