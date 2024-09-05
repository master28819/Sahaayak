import 'package:flutter/material.dart';
import 'package:my_flutter_app/role.dart'; // Import the identification page

class Language {
  final String name;

  Language(this.name);
}

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  List<Language> languages = [
    Language('English'),
    Language('हिंदी'), // Hindi
    Language('ગુજરાતી'), // Gujarati
    Language('ਪੰਜਾਬੀ'), // Punjabi
    Language('اردو'), // Urdu
    Language('मराठी'), // Marathi
    Language('नेपाली'), // Nepali
    Language('తెలుగు'), // Telugu
    Language('മലയാളം'), // Malayalam
    Language('தமிழ்'), // Tamil
    Language('অসমীয়া'), // Assamese
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.orange
                            : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        languages[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to IdentificationPage on button press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdentificationPage(),
                  ),
                );
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
