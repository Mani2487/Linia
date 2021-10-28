import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:linia/assets/@assets.dart';
import 'package:linia/assets/media_sources.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pop(context);
  }

  MediaSources mediaSources = MediaSources();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome back, ',
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
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0),
                          context: context,
                          builder: (context) => Container(
                            height: 168,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10))),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(''),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff5D5FEF)),
                                      ),
                                      child: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                                verticalSpacer(verticalSpace: 10),
                                AppPrimaryButton(
                                  text: 'Sign out',
                                  onTap: () async {
                                    await _auth.signOut();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.settings_suggest_outlined,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpacer(verticalSpace: 20),
              Container(
                height: 220,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.8,
                    crossAxisCount: 2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, i) => RecentsCard(
                    title: mediaSources.title["recents"][i].toString(),
                    imageUrl: mediaSources.imageUrl["recents"][i].toString(),
                    onTap: () {
                      AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: mediaSources.url["recents"][i].toString(),
                      );
                      intent.launch();
                    },
                  ),
                ),
              ),
              verticalSpacer(verticalSpace: 10),
              CircleHeaderLogo(
                imageUrl:
                    'https://images-na.ssl-images-amazon.com/images/I/61wC4Zrvi9S.jpg',
                subtitle: 'More like',
                title: 'The power of habit',
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return SwipeableCard(
                      title: mediaSources.title["more_like"][i].toString(),
                      imageUrl:
                          mediaSources.imageUrl["more_like"][i].toString(),
                      onTap: () {
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: mediaSources.url["more_like"][i].toString(),
                        );
                        intent.launch();
                      },
                    );
                  },
                ),
              ),
              verticalSpacer(verticalSpace: 20),
              CircleHeaderLogo(
                imageUrl:
                    'https://i.pinimg.com/originals/75/ee/34/75ee345d0717586fa4b97114eed6a4a6.jpg',
                subtitle: 'More content from',
                title: 'Podcasts app',
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return SwipeableCard(
                      title: mediaSources.title["podcasts"][i].toString(),
                      imageUrl: mediaSources.imageUrl["podcasts"][i].toString(),
                      onTap: () {
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: mediaSources.url["podcasts"][i].toString(),
                        );
                        intent.launch();
                      },
                    );
                  },
                ),
              ),
              verticalSpacer(verticalSpace: 20),
              CircleHeaderLogo(
                imageUrl:
                    'https://cliply.co/wp-content/uploads/2019/04/371903520_SOCIAL_ICONS_YOUTUBE.png',
                subtitle: 'More content from',
                title: 'YouTube',
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return SwipeableCard(
                      title: mediaSources.title["youtube"][i].toString(),
                      imageUrl: mediaSources.imageUrl["youtube"][i].toString(),
                      onTap: () {
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: mediaSources.url["youtube"][i].toString(),
                        );
                        intent.launch();
                      },
                    );
                  },
                ),
              ),
              verticalSpacer(verticalSpace: 20),
            ],
          ),
        ),
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

class CircleHeaderLogo extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const CircleHeaderLogo(
      {Key? key, this.imageUrl = '', this.title = '', this.subtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.5,
            color: Colors.black12,
            offset: Offset(0, -4),
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      margin: const EdgeInsets.only(left: 5, right: 10),
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 20,
            backgroundColor: Colors.white,
          ),
          Container(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'SFPro',
                  fontSize: 10,
                  letterSpacing: 0.38,
                ),
              ),
              Text(
                title,
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
    );
  }
}

class SwipeableCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String imageUrl;

  const SwipeableCard(
      {Key? key, this.onTap, this.title = '', this.imageUrl = ''})
      : super(key: key);

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
                  imageUrl,
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
              title,
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
                imageUrl,
                fit: BoxFit.cover,
                width: 30,
                height: 56,
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
