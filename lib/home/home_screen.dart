
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/levels/levelzero_videos.dart';



class HomeScreen  extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LevelScreen(),
    );
  }
}
GlobalKey<CurvedNavigationBarState>_curvednavigationkey=GlobalKey();
class LevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar (

        key: _curvednavigationkey ,
        index:0,
        height: 65.0,
        items: [
          Icon(Icons.home,size: 33,color: Colors.black,),
          Icon(Icons.person,size: 33,color: Colors.black,),
          Icon(Icons.settings,size: 33,color: Colors.black,)

        ],
        color:const Color(0xFF2AAA8A) ,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {

        },

      ),
      appBar: AppBar(
        title: const Text('Mini Coder'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2AAA8A),
        elevation: 0,
      ),


      body:
      Container(
        color: Colors.greenAccent[50],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of levels
                itemBuilder: (context, index) {
                  bool isLocked = index != 0; // Only Level 0 is unlocked
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LevelzeroVideos(),
                          ),
                        );
                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Level $index is locked!'),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: const Color(0xFF2AAA8A),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Level $index',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                isLocked ? Icons.lock : Icons.lock_open,
                                color: Colors.black,
                              ),
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

      ),

    );

  }
}