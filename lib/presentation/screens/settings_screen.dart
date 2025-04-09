import 'package:flutter/material.dart';
import 'package:chicken_mines/gen/assets.gen.dart';

import 'package:url_launcher/url_launcher_string.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.icons.bg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    child: Image.asset(
                      Assets.icons.clear.path,
                      width: 50,
                      height: 50,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black.withAlpha(40), blurRadius: 12, spreadRadius: 1),
                              ],
                            ),
                            child: Image.asset(
                              Assets.icons.terms.path,
                              width: 166,
                            ),
                          ),
                          onTap: () => launchUrlString('https://www.freeprivacypolicy.com/live/44d43eb4-a3cb-4471-a664-bc6368d5e062'),
                        ),
                        SizedBox(height: 80),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black.withAlpha(40), blurRadius: 12, spreadRadius: 1),
                              ],
                            ),
                            child: Image.asset(
                              Assets.icons.privacy.path,
                              width: 166,
                            ),
                          ),
                          onTap: () => launchUrlString('https://www.freeprivacypolicy.com/live/a85d3c00-f5ee-4888-ae7f-0da095d38523'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            )),
      ),
    );
  }
}
