import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_intent_plus/android_intent.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  String url =
      'https://open.spotify.com/track/1p80LdxRV74UKvL8gnD7ky?si=oIWI7AjuRwmT-RTPPZw6VQ&utm_source=copy-link&context=spotify%3Aplaylist%3A37i9dQZF1EpztP46jHXBFf&dl_branch=1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Good morning, Sanjeev'),
            verticalSpacer(verticalSpace: 20),
            InkWell(
              onTap: () {
                AndroidIntent intent = AndroidIntent(
                  action: 'action_view',
                  data: url,
                );
                intent.launch();
              },
              child: SwipeableCard(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: null,
        onPressed: () async {
          await _auth.signOut();
          Navigator.pop(context);
        },
        child: Icon(Icons.logout_outlined),
      ),
    );
  }

  Container verticalSpacer({double verticalSpace = 0, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalSpace),
      child: child,
    );
  }
}

class SwipeableCard extends StatelessWidget {
  const SwipeableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: 180,
          // padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xffE5E5EA),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Text(
          'The subtle art of not giving a fuck',
          style: TextStyle(
            fontFamily: 'SFPro',
            fontSize: 15,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

class RecentsCard extends StatelessWidget {
  const RecentsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 180,
      // padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xffE5E5EA),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}
