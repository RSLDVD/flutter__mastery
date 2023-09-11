import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final whatsAppUrl = Uri.parse('https://wa.me/+989354973634');
  final linkedInUrl =
      Uri.parse('https://www.linkedin.com/in/davood-rasooli-40006b179/');
  final gitHubUrl = Uri.parse('https://github.com/RSLDVD/');
  final telegramUrl =
      Uri.parse('tg://resolve?domain=105926720&first_name=DD&lang=en');


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
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Flutter ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
                children: const [
                  TextSpan(
                    text: 'Mastery ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD71313),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/ic_launcher192.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              "Explore, Learn, and Code!",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Dive into the world of Flutter widgets, packages, and code samples. Elevate your skills and understanding through hands-on experience.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Stay Curious, Keep Coding!",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 15),
            const Divider(thickness: 1),
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/2.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              "I'm Davood Rasooli, a Mobile App Developer and passionate enthusiast of the Flutter framework and Dart language.",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 45),
            const Text(
              'Join me on my journey!',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Color(0xFFC7BCA1),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: rsldvd@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      launchUrl(telegramUrl,
                          mode: LaunchMode.externalApplication);
                    });
                  }, //_handleWhatsAppButtonPress,
                  icon: SvgPicture.asset(
                    'assets/icons/icons8-telegram-app-500.svg',
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                    width: 70,
                    height: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      launchUrl(whatsAppUrl,
                          mode: LaunchMode.externalApplication);
                    });
                  }, //_handleWhatsAppButtonPress,
                  icon: SvgPicture.asset(
                    'assets/icons/icons8-whatsapp-250.svg',
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                    width: 70,
                    height: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      launchUrl(linkedInUrl,
                          mode: LaunchMode.externalApplication);
                    });
                  }, //_handleLinkedInButtonPress,
                  icon: SvgPicture.asset(
                    'assets/icons/linkedin-round-svgrepo-com.svg',
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                    width: 70,
                    height: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      launchUrl(gitHubUrl,
                          mode: LaunchMode.externalApplication);
                    });
                  }, //_handleGitHubButtonPress,
                  icon: SvgPicture.asset(
                    'assets/icons/github-142-svgrepo-com.svg',
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                    width: 70,
                    height: 70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
