// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:mini_coder/levels/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
final zerourls=[ 'https://www.youtube.com/watch?v=g1J4181W8ss','https://www.youtube.com/watch?v=HGvv7aMyC-s','https://www.youtube.com/watch?v=Wchru8alhaE',
// list 1
  'https://www.youtube.com/watch?v=_O9cNYzIKsg&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=1','https://www.youtube.com/watch?v=y5Twae7jr5Q&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=2',
  'https://www.youtube.com/watch?v=XSZ2Tnbb05c&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=3','https://www.youtube.com/watch?v=2NFDVfXaxZ8&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=4',
  'https://www.youtube.com/watch?v=RLVFkN74KwQ&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=5','https://www.youtube.com/watch?v=rjKQtY_fd7k&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=6',
  'https://www.youtube.com/watch?v=IOf4wx-L3A0&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=7','https://www.youtube.com/watch?v=PGgdjYwA990&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=8',
  'https://www.youtube.com/watch?v=4eeOiN0TBOc&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=9','https://www.youtube.com/watch?v=wPq9FwQ3pbo&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=10',
  'https://www.youtube.com/watch?v=dy-UC0-fDuM&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=11','https://www.youtube.com/watch?v=xx_XF0ol8fA&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=12',
  'https://www.youtube.com/watch?v=UsGraLDw4M4&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=13','https://www.youtube.com/watch?v=P5q0LOdfVKY&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=14',
  'https://www.youtube.com/watch?v=hGahTfLft9I&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=15','https://www.youtube.com/watch?v=ijx0WqxNxvI&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=16',
  'https://www.youtube.com/watch?v=k8QIplKt2r8&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=17','https://www.youtube.com/watch?v=A96TaITEPwc&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=18',
  'https://www.youtube.com/watch?v=ouTkTN-SMKU&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=19','https://www.youtube.com/watch?v=HuhZuNHwG5Q&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=20',
  'https://www.youtube.com/watch?v=0gysB_SVyEE&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=21','https://www.youtube.com/watch?v=Mb50bQ5RsUk&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=22',
  'https://www.youtube.com/watch?v=TN2yqDszSnw&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=23','https://www.youtube.com/watch?v=z8y_eTP9Js0&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=24',
  'https://www.youtube.com/watch?v=SiTSq2h1EaQ&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=25','https://www.youtube.com/watch?v=k10nTuCngP4&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=26',
  'https://www.youtube.com/watch?v=6UWac5e0tPA&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=27','https://www.youtube.com/watch?v=kXDtRKN7qmE&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=28',
  'https://www.youtube.com/watch?v=ubFB2VjbtRU&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=29','https://www.youtube.com/watch?v=uQxWhT351sM&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=30',
  'https://www.youtube.com/watch?v=_X7MyHD3pFY&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=31','https://www.youtube.com/watch?v=oZ4rx3l3v5M&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=32',
  'https://www.youtube.com/watch?v=PGgMlHKGhh0&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=33','https://www.youtube.com/watch?v=29vK1vMR97Q&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=34',
  'https://www.youtube.com/watch?v=6L3wN3U1Q_4&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=35','https://www.youtube.com/watch?v=ZHh6gkFA3kA&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=36',
  'https://www.youtube.com/watch?v=Qxg9G9QcA7E&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=37','https://www.youtube.com/watch?v=Bdb8kiSmJio&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=38',
  'https://www.youtube.com/watch?v=_7evi2XexSg&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=39','https://www.youtube.com/watch?v=Jj6WS6SwQTg&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=40',
  'https://www.youtube.com/watch?v=4fUvbLKWYkk&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=41','https://www.youtube.com/watch?v=aAeyHcGVgVw&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=42',
  'https://www.youtube.com/watch?v=rF2XnIwqOMs&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=43','https://www.youtube.com/watch?v=qTh9DnZZ4I8&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=44',
  'https://www.youtube.com/watch?v=sMR7n2OBZp4&list=PLV0jK_U88PfQAOv4ABqKxTY7QKN8PhdST&index=45',
//list 2
  'https://www.youtube.com/watch?v=vqhRy6ABbJs&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=1','https://www.youtube.com/watch?v=hI83ip_NejY&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=2',
  'https://www.youtube.com/watch?v=cegfNkSDHrI&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=3','https://www.youtube.com/watch?v=YbARkFqcAWw&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=4',
  'https://www.youtube.com/watch?v=578hB0E6y4o&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=5','https://www.youtube.com/watch?v=s0pJXkTsi3k&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=6',
  'https://www.youtube.com/watch?v=lirPykkNL9o&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=7','https://www.youtube.com/watch?v=1i7OnF7FVxY&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=8',
  'https://www.youtube.com/watch?v=3Du6_WKt47g&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=9','https://www.youtube.com/watch?v=TF9XAoxQ-hA&list=PLxlGPLijthUKhJr0WXp_JFXcfYfdNkYDX&index=10',
// videos
  'https://www.youtube.com/watch?v=Xpk67YzOn5w','https://www.youtube.com/watch?v=INEtYZqtjTo'

];
class levelzero_videos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget thubmnail(){
      return Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        color: Colors.green,child: Text("thumbnail"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level Zero Videos'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2AAA8A),
        elevation: 0,
      ),
      body:
                  Row(
                    children: [
                      Expanded(child: ListView.builder (itemCount:zerourls.length,itemBuilder: (context , index){
                        final videoID= YoutubePlayer.convertUrlToId(zerourls[index]);
                        return   InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>playerScreen(videoId: videoID)));
                            },
                            child:
                            Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)));
                      })),
                    ],
                  ),
      );
  }
}