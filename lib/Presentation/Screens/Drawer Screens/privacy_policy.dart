import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Privacy & Policy'),
      ),
      body: const SingleChildScrollView(
        padding:EdgeInsets.all(10) ,
          child: Column(
        children: [Text(
            
            "Flutter Mastery  Privacy Policy\n\n"
            "This Privacy Policy outlines the types of personal information collected, used, and disclosed by us, when you use our mobile application Flutter Mastery  . By using the App, you agree to the practices described in this policy.\n",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
          Text(
            "1. Information Collection and Use:\n\n"
            "a. Personal Information:\n"
            "We may collect certain personal information that you provide to us voluntarily when you use the App, such as your name, email address, and profile picture. We may use this information to personalize your experience, provide customer support, and communicate with you about our services.\n\n"
            "b. Usage Data:\n"
            "We automatically collect certain information about your device and usage of the App, including but not limited to your device type, operating system, IP address, and usage patterns. This information helps us understand how users interact with the App and improve our services.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "2. Information Sharing:\n\n"
            "We do not sell, rent, or share your personal information with third parties for their marketing purposes. However, we may share your information in the following circumstances:\n\n"
            "- With service providers who assist us in operating the App and providing services to you.\n"
            "- In response to legal requests or proceedings, or to protect our rights, privacy, safety, or property, or that of others.\n"
            "- In connection with a business transaction, such as a merger, acquisition, or sale of assets.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "3. Data Security:\n\n"
            "We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no data transmission over the internet or stored on a server can be guaranteed to be 100% secure.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "4. Your Choices:\n\n"
            "You can opt out of receiving promotional emails from us by following the instructions in those emails. Please note that even if you opt out of receiving promotional communications, we may still send you non-promotional messages.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "5. Changes to this Policy:\n\n"
            "We may update this Privacy Policy from time to time to reflect changes to our practices or for other operational, legal, or regulatory reasons. We will notify you of any material changes by posting the updated policy on the App.\n",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          Text(
            "If you have any questions about this Privacy Policy, please contact us at [rsldvd@gmail.com].",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          ),
          ],
      )),
    );
  }
}
