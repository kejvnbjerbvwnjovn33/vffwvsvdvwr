import 'package:flutter/material.dart';
import 'package:chicken_mines/gen/assets.gen.dart';


class PauseDialog extends StatelessWidget {
  const PauseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 24, 42, 0.6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55),
            child: Image.asset(
              Assets.icons.pauseLbl.path,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: Image.asset(Assets.icons.play.path,width: 50,height: 50,),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
