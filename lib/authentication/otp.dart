import 'package:ecom/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Image.asset("assets/Page-1.png"),
            SizedBox(
              height: 15,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter OTP send to + 91 9356942975",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't you recieve to OTP? ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  Text(
                    " Resend OTP",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 10, 109, 25),
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Container(
                height: 50,
                width: 250,
                child: Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 10, 109, 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
