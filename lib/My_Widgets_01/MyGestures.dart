import "package:flutter/material.dart";

class MyGestures extends StatelessWidget{
  const MyGestures ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("App_02"),
        backgroundColor: Colors.yellow,
        elevation: 4,
        actions: [
          IconButton(
              onPressed: (){print("b1");},
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){print("b2");},
              icon: Icon(Icons.abc)
          ),
          IconButton(
              onPressed: (){print("b3");},
              icon: Icon(Icons.more_vert)
          ),
        ],

      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            // GestureDetector - bắt được các sự kiện
            GestureDetector(
              onTap: (){
                print("Nội dung được tab !");
              },
              onDoubleTap: (){
                print("Nội dung được tab 2 cái !");
              },
              onPanUpdate: (details){
                print('Kéo - di chuyển: ${details.delta}');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text("Chạm vào tôi!!"),),
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){print("Pressed");},
        child: const Icon(Icons.add_ic_call),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),

      ]),
    );
  }
}