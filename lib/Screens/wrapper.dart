import 'package:flutter/material.dart';
import 'package:brew_crew/Screens/Home/home.dart';
import 'package:brew_crew/Screens/Authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import '../Models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
