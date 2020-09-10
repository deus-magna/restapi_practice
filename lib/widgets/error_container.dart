import 'package:flutter/material.dart';
import 'package:restapi_practice/widgets/primary_button.dart';

class ErrorContainer extends StatelessWidget {

  const ErrorContainer({
    Key key,
    @required this.context,
    @required this.img,
    @required this.title,
    @required this.message,
    @required this.buttonText,
    @required this.onPressed,
    @required this.heightMultiplier,
  }) : super(key: key);

  final BuildContext context;
  final String img;
  final String title;
  final String message;
  final String buttonText;
  final Function onPressed;
  final double heightMultiplier;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image(
                image: AssetImage(img),
                fit: BoxFit.cover,
                height: size.height * heightMultiplier),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 40),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 40),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 30),
              margin: EdgeInsets.symmetric(
                  horizontal: 40),
              child: PrimaryButton(
                title: buttonText,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}