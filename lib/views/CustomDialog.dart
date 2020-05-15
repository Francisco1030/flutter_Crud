import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final String avatarUrl;
  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.avatarUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    const double padding = 16.0;
    const double avatarRadius = 150.0;
    final avatar = avatarUrl == null || avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
            radius: avatarRadius,
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: avatarRadius,
          );
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
            top: avatarRadius + padding,
            left: padding,
            right: padding,
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                )
              ]),
          child:
              Column(mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    )),
                SizedBox(height: 24.0),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text(buttonText),
                      textColor: Colors.purple,
                    ))
              ])),
      Positioned(
        left: padding,
        right: padding,
        child: avatar,
      )
    ]);
  }
}
