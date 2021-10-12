import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_intent_plus/android_intent.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pop(context);
  }

  String url = 'https://youtu.be/pJu5xmVaGQs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      'Good morning, ',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 20,
                        letterSpacing: 0.38,
                      ),
                    ),
                    Text(
                      'Sanjeev',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.38,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(verticalSpace: 20),
              // ConstrainedBox(
              //   constraints: BoxConstraints(maxHeight: 355, minHeight: 56.0),
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: 1.9,
              //       // crossAxisSpacing: 2,
              //       // mainAxisSpacing: 2,
              //     ),
              //     itemCount: 6,
              //     itemBuilder: (context, index) => RecentsCard(),
              //   ),
              // ),
              Wrap(
                spacing: 0.5,
                runSpacing: 5,
                children: [
                  RecentsCard(
                    onTap: () {
                      AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: url,
                      );
                      intent.launch();
                    },
                  ),
                  RecentsCard(),
                  RecentsCard(),
                  RecentsCard(),
                  RecentsCard(),
                  RecentsCard(),
                ],
              ),
              verticalSpacer(verticalSpace: 20),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/61wC4Zrvi9S.jpg',
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More like',
                          style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 10,
                            letterSpacing: 0.38,
                          ),
                        ),
                        Text(
                          'The power of habit',
                          style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.38,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SwipeableRow(),
              verticalSpacer(verticalSpace: 20),
              SwipeableRow(),
              verticalSpacer(verticalSpace: 20),
              SwipeableRow(),
              verticalSpacer(verticalSpace: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _auth.signOut();
            Navigator.pop(context);
          },
          child: Icon(Icons.logout_outlined)),
    );
  }

  Container verticalSpacer({double verticalSpace = 0, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalSpace),
      child: child,
    );
  }
}

class SwipeableRow extends StatelessWidget {
  const SwipeableRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.only(left: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SwipeableCard(),
          SwipeableCard(),
          SwipeableCard(),
          SwipeableCard(),
          SwipeableCard(),
          SwipeableCard(),
        ],
      ),
    );
  }
}

class SwipeableCard extends StatelessWidget {
  final void Function()? onTap;

  const SwipeableCard({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/81AEdFBqDjL.jpg',
                  fit: BoxFit.cover,
                  // alignment: Alignment.topCenter,
                  height: 180,
                  width: 180,
                ),
              ),
              height: 180,
              width: 180,
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
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            width: 180,
            child: Text(
              'How to stop worrying and start living',
              style: TextStyle(
                fontFamily: 'SFPro',
                fontSize: 15,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function()? onTap;
  const RecentsCard({
    Key? key,
    this.onTap,
    this.imageUrl =
        'https://images-na.ssl-images-amazon.com/images/I/51AffTW1D6L._SX324_BO1,204,203,200_.jpg',
    this.title = 'The subtle art of not giving a fuck',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
              child: Image.network(
                // 'https://images-na.ssl-images-amazon.com/images/I/51AffTW1D6L._SX324_BO1,204,203,200_.jpg',
                imageUrl,
                fit: BoxFit.cover, width: 30, height: 56,
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              width: 10,
            ),
            Container(
              width: 125,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
