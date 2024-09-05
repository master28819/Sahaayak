import 'package:flutter/material.dart';
import 'Language_select.dart'; // Ensure this import is pointing to the correct file

class EmailSubmissionPage extends StatefulWidget {
  @override
  _EmailSubmissionPageState createState() => _EmailSubmissionPageState();
}

class _EmailSubmissionPageState extends State<EmailSubmissionPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _submitEmail() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email submitted: $email')),
      );

      // Navigate to the LanguageSelectionPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Enter your email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              Spacer(), // Ensures button is positioned at the bottom
              ElevatedButton(
                onPressed: _submitEmail,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
