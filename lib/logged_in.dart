import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'google_sign_in_provider.dart';

final signOutProvider = StateProvider<void>((ref) {
  GoogleSignInProvider().logout();
});

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged in'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            SizedBox(height: 10),
            Text('Name: ' + user.displayName!),
            SizedBox(height: 10),
            Text('Email: ' + user.email!),
            ElevatedButton(
              onPressed: () {
                context.read(signOutProvider);
                // final provider =
                //     Provider.of<GoogleSignInProvider>(context, listen: false);
                // provider.logout();
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
