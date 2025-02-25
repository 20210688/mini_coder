import 'package:flutter/material.dart';
import 'package:mini_coder/Setting_Screen/rating_dialog.dart';


class  SettingScreen extends StatelessWidget {
  static const String routeName = 'SettingScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Color(0xFF2AAA8A),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Expanded(
              child: ListView(
                children: [
                  const SectionTitle("GENERAL"),
                  SettingsButton(
                    icon: Icons.notifications,

                    text: "Notifications",
                    onTap: () {},
                  ),
                  SettingsButton(
                    icon: Icons.logout,

                    text: "Log Out",
                    onTap: () {},
                  ),
                  const SectionTitle("FEEDBACK"),
                  SettingsButton(
                    icon: Icons.bug_report,

                    text: "Report A Bug",
                    onTap: () {},
                  ),
                  SettingsButton(
                    icon: Icons.send,
                    text: "Send Feedback",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => RatingDialog(
                          onSubmit: (rating, review) {
                            // Handle the rating and review
                            print('Rating: $rating, Review: $review');
                            Navigator.pop(context);
                          },
                          onClose: () => Navigator.pop(context),
                        ),
                      );
                    },

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}


class SettingsButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SettingsButton({required this.icon, required this.text, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

