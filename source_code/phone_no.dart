import 'package:flutter/material.dart';
import 'email.dart'; // Ensure this import is correct

// Custom TextEditingController to enforce the prefix rule
class PrefixEnforcingController extends TextEditingController {
  final String prefix;

  PrefixEnforcingController({required this.prefix}) {
    text = prefix;

    addListener(() {
      if (text.startsWith(prefix)) {
        selection = TextSelection.collapsed(offset: text.length);
      } else {
        text = prefix;
        selection = TextSelection.collapsed(offset: prefix.length);
      }
    });
  }
}

class PhoneNumberInputPage extends StatefulWidget {
  @override
  _PhoneNumberInputPageState createState() => _PhoneNumberInputPageState();
}

class _PhoneNumberInputPageState extends State<PhoneNumberInputPage> {
  final PrefixEnforcingController _phoneController =
      PrefixEnforcingController(prefix: "+91");

  void _submitPhoneNumber() {
    String phoneNumber = _phoneController.text.trim();

    // Validate phone number (assuming 10 digits after +91)
    if (phoneNumber.length == 13 && phoneNumber.startsWith("+91")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailSubmissionPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Phone Number'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please enter your phone number',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/f.jpg', // Ensure this image exists
                    width: 30,
                    height: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitPhoneNumber,
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 14.0),
                textStyle:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
              ),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PhoneNumberInputPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
