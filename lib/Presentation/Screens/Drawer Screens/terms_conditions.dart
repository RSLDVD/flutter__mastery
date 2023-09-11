import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Terms & Conditions'),
      ),
      body: const SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
            "Flutter Mastery  Terms & Conditions\n\n"
            "By downloading, installing, or using Flutter Mastery  , you agree to be bound by these Terms and Conditions. If you do not agree with these Terms, do not use the App.\n",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
          Text(
            "1. License:\n\n"
            "Subject to your compliance with these Terms, We grants you a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial purposes. You may not sublicense, modify, distribute, or create derivative works based on the App.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "2. User Content:\n\n"
            "You are solely responsible for any content you submit, transmit, or display through the App. You grant [Your Company Name] a worldwide, royalty-free license to use, reproduce, modify, adapt, publish, translate, and distribute your content for the purpose of operating and improving the App.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "3. Prohibited Conduct:\n\n"
            "You agree not to:\n\n"
            "- Use the App for any illegal, harmful, or unauthorized purpose.\n"
            "- Interfere with the operation of the App or disrupt its servers.\n"
            "- Attempt to gain unauthorized access to the App or its related systems.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "4. Termination:\n\n"
            "We reserves the right to suspend or terminate your access to the App at any time for violations of these Terms or for any other reason without prior notice.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "5. Disclaimer:\n\n"
            "The App is provided \"as is\" and We makes no warranties regarding its accuracy, reliability, or availability. You use the App at your own risk.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "6. Limitation of Liability:\n\n"
            "To the extent permitted by law, We shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or related to the use of the App.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "7. Changes to Terms:\n\n"
            "We may update these Terms from time to time. We will notify you of any material changes by posting the updated Terms within the App.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "If you have any questions about these Terms, please contact us at [rsldvd@gmail.com].",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
           
              
              
            ],
          )),
    );
  }
}
