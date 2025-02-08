import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';
import 'package:mini_coder/Setting_Screen/setting_screen.dart';
import 'package:mini_coder/levels/levelzero_videos.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePage(), // Fixed: HomePage() instead of HomeScreen()
          ProfileScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60,
        items: <Widget>[
          Icon(Icons.home,
              size: 30,
              color: _currentIndex == 0 ? Colors.black : Colors.white),
          Icon(Icons.person,
              size: 30,
              color: _currentIndex == 1 ? Colors.black : Colors.white),
          Icon(Icons.settings,
              size: 30,
              color: _currentIndex == 2 ? Colors.black : Colors.white),
        ],
        color: Color(0xFF2AAA8A),
        buttonBackgroundColor: Color(0xFF2AAA8A),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: onTabTapped,
        letIndexChange: (index) => true,
      ),
    );
  }
}

// Home Page Content
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Coder'),
        centerTitle: true,
        backgroundColor: Color(0xFF2AAA8A),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                bool isLocked = index != 0;
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LevelzeroVideos()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Level $index is locked!')),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Color(0xFF2AAA8A),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Level $index',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Icon(isLocked ? Icons.lock : Icons.lock_open,
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
