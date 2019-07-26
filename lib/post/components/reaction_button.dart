 import 'package:flutter/material.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';

class PageReactiveButton extends StatefulWidget {
  @override
  _PageReactiveButtonState createState() => _PageReactiveButtonState();
}

class _PageReactiveButtonState extends State<PageReactiveButton> {
  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/like.gif',
      code: 'liker',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/haha.gif',
      code: 'haha',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/love.gif',
      code: 'love',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/sad.gif',
      code: 'sad',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/wow.gif',
      code: 'wow',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/reaction_images/angry.gif',
      code: 'angry',
    ),
  ];

  String facebook;
  int reactionCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReactiveButton(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            color: Colors.white,
          ),
          width: 80.0,
          height: 40.0,
          child: Center(
              child: facebook == null
                  ? Row(
                      children: <Widget>[
                        Image.asset('assets/reaction_images/like_icon.jpg'),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: Text(
                            'Like',
                          ),
                        )
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/reaction_images/$facebook.png',
                          width: 32.0,
                          height: 32.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text('$reactionCount'),
                        ),
                      ],
                    )),
        ),

        icons: _facebook, //_flags,
        onTap: () {
          print('TAP');
        },
        onSelected: (ReactiveIconDefinition button) {
          setState(() {
            facebook = button.code;
            reactionCount = 1;
          });
        },
        iconWidth: 32.0,
      ),
    );
  }
}
