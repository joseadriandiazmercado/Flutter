import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stan Lee'),
        actions: [
            Container(
              margin:const EdgeInsets.only(right: 5) ,
              child: const CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              child: Text('SL'),
              ),
            ),
         ],
       ),
      body: const Center(
         child: CircleAvatar(maxRadius: 100,
          backgroundImage: NetworkImage('https://images.mubicdn.net/images/cast_member/23806/cache-3373-1600241193/image-w856.jpg?size=800x') ,
         )
      ),
    );
  }
}