import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFB8E6D3), // Light mint green background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Message bubble
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFCCF4E6), // Green message bubble
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Yes button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    _performLogout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27B18A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // No button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Just close dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27B18A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performLogout(BuildContext context) {
    // Clear any stored user data (uncomment and modify as needed)
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.clear();
    // });

    // Navigate to login screen and clear entire navigation stack
    Navigator.of(context).pushNamedAndRemoveUntil(
      'Login', // Your login screen route
          (Route<dynamic> route) => false,
    );
  }
}

// Helper function to show the dialog
void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (BuildContext context) {
      return const LogoutDialog();
    },
  );
}

// Example usage in your app
class ExampleUsage extends StatelessWidget {
  const ExampleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => showLogoutDialog(context),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the app!'),
            SizedBox(height: 20),
            // You can also add a logout button in the body
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showLogoutDialog(context),
        icon: const Icon(Icons.logout),
        label: const Text('Logout'),
      ),
    );
  }
}