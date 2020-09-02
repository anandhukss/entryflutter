import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

void main() {
  runApp(Otp());
}

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[500],
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Please enter verification code sent to your number",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              )),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PinEntryTextField(
                  //showFieldAsBox: true,
                  fieldWidth: 40.0,
                  onSubmit: (String pin) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Pin"),
                            content: Text('Pin entered  $pin'),
                          );
                        }); //end showDialog()
                  }, // end onSubmit
                ), // end PinEntryTextField()
              ), // end Padding()
            ), // end Container()
          ],
        ),
      ),
    );
  }
}
