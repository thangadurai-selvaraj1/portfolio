import 'package:alvin_portfolio_app/utils/ImageUrls.dart';
import 'package:alvin_portfolio_app/utils/SocialNetworkUrls.dart';
import 'package:alvin_portfolio_app/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'BlinkAnimation.dart';
import 'SocialRedirect.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Lottie.asset(
              ImageUrls.CODING_BG_ANIMATION,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
          Positioned(
            bottom: 30,
            child: Image.asset(
              ImageUrls.CODE_WITH_BRACKETS,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            right: 30,
            child: Image.asset(
              ImageUrls.CODE_WITH_TEXT,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            left: 8,
            child: Lottie.asset(
              ImageUrls.CODING_IN_OFFICE_ANIMATION,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(100),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    blurRadius: 20.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ], color: Colors.black, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Lottie.asset(
                            ImageUrls.CIRCULAR_BG_ANIMATION,
                            repeat: true,
                            width: 180,
                            height: 180,
                            reverse: true,
                            animate: true,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 41),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(80)),
                              child: Image.asset(
                                ImageUrls.ALVIN_LOGO,
                                width: 110,
                                height: 110,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlinkAnimation(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        children: <TextSpan>[
                          new TextSpan(
                              text: Strings.I_AM,
                              style: new TextStyle(
                                  fontFamily: "Merriweather",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          new TextSpan(
                              text: '\n${Strings.MOBILE_APP_DEVELOPER}',
                              style: new TextStyle(
                                  fontFamily: "Merriweather",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Strings.EXPERIENCED_TEXT,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Merriweather",
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              ImageUrls.EMAIL_PATH,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              Strings.MAIL_ID,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              ImageUrls.ANDROID_LOGO_PATH,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              ImageUrls.FLUTTER_LOGO_PATH,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Strings.CONNECT_WITH_ME,
                      style: TextStyle(
                          fontFamily: "Merriweather",
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SocialRedirect(
                            onPressed: () {
                              setState(() {
                                _launchURL(SocialNetworkUrls.INSTAGRAM);
                              });
                            },
                            toolTipName: Strings.INSTAGRAM,
                            imageUrl: ImageUrls.INSTA_PATH,
                          ),
                        ),
                        Flexible(
                          child: SocialRedirect(
                            onPressed: () {
                              setState(() {
                                _launchURL(SocialNetworkUrls.GIT_HUB);
                              });
                            },
                            toolTipName: Strings.GITHUB,
                            imageUrl: ImageUrls.GIT_HUB_PATH,
                          ),
                        ),
                        Flexible(
                          child: SocialRedirect(
                            onPressed: () {
                              setState(() {
                                _launchURL(SocialNetworkUrls.LINKED_IN);
                              });
                            },
                            toolTipName: Strings.LINKED_IN,
                            imageUrl: ImageUrls.LINKED_IN_PATH,
                          ),
                        ),
                        Flexible(
                          child: SocialRedirect(
                            onPressed: () {
                              setState(() {
                                _launchURL(SocialNetworkUrls.TWITTER);
                              });
                            },
                            toolTipName: Strings.TWITTER,
                            imageUrl: ImageUrls.TWITTER_PATH,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _launchURL(SocialNetworkUrls.RESUME_URL);
                        });
                      },
                      child: Text(
                        Strings.DOWNLOAD_MY_RESUME,
                        style: TextStyle(
                          fontFamily: "Merriweather",
                        ),
                      ),
                      padding: EdgeInsets.all(18),
                      splashColor: Colors.black,
                      hoverColor: Colors.orange,
                      hoverElevation: 10,
                      textColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orange)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
