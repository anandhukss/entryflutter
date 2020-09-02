import 'package:flutter/material.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/otp': (context) => Otp(),
      }));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _validate() {
      var number = numberController.text;
      if (number.length < 10) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              "Please enter 10 digit number",
              style: TextStyle(
                  color: Colors.red[700], fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else {
        Navigator.pushNamed(context, '/otp');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Center(
                child: Icon(
              Icons.image,
              size: 100.0,
            )),
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 330.0,
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: TextStyle(fontSize: 20.0),
                decoration: new InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: "Enter your mobile number",
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RawMaterialButton(
              onPressed: _validate,
              elevation: 2.0,
              fillColor: Colors.black87,
              child: Icon(
                Icons.arrow_forward,
                size: 35.0,
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
