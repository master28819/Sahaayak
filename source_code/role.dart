import 'package:flutter/material.dart';

class IdentificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to LanguageSelectionPage
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              'How do you identify?',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildOptionButton(
              'I\'m hard of hearing',
              'assets/images/hard_hearing.jpg',
              screenWidth,
              context,
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildOptionButton(
              'I\'m Deaf',
              'assets/images/Deaf.jpg',
              screenWidth,
              context,
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildOptionButton(
              'I\'m hearing',
              'assets/images/hearing.jpg',
              screenWidth,
              context,
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildOptionButton(
              'I\'m testing for someone else',
              'assets/images/else.jpg',
              screenWidth,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
      String text, String imagePath, double screenWidth, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        minimumSize: Size(screenWidth * 0.9, 60),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // Define actions when each button is pressed
        print('$text button pressed');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
          Image.asset(
            imagePath,
            height: screenWidth * 0.08,
            width: screenWidth * 0.08,
          ),
        ],
      ),
    );
  }
}
