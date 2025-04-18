import "package:flutter/material.dart";

class MyButton extends StatelessWidget{
  const MyButton({super.key});

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

      body: Center(child: Column(
          children: [
            SizedBox(height: 50,),
            //Elevate Button làm một button nổi với hiệu ứng đổ bóng
            //thường được sử dụng cho hành động chính trong ứng dụng
            ElevatedButton(
              onPressed: (){print("ElevateButton");},
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24),)),
            SizedBox(height: 20,),

            //TextButton là một button thẳng
            //,không có đổ bóng
            //thường dùng cho các hành động thứ yếu
            //hoặc trong các thành phần như Dialog, Card.
            TextButton(
                onPressed: (){print("TextButton");},
                child: Text("ElevatedButton", style: TextStyle(fontSize: 24),)),
            SizedBox(height: 20,),

            //OutlineButton là button có viên bao quanh
            //không có màu nền
            //phù hợp cho các thay thế.
            OutlinedButton(
                onPressed: (){print("OutlinedButton");},
                child: Text("ElevatedButton", style: TextStyle(fontSize: 24),)),

            //IconButton là button chỉ gồm icon không có văn bản,
            //thường dùng trong AppBar, ToolBar
            IconButton(
                onPressed: (){print(" IconButton");},
                icon: Icon(Icons.favorite)),

            //FloatingActionButton là button hình tròn nổi trên giao diện
            //thường dùng cho hành động chính của màn hình
            FloatingActionButton(
                onPressed: (){print("FloatingActionButton");},
                child: Icon(Icons.add)),
          ]
      )),

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