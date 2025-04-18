import "package:flutter/material.dart";

class MyText extends StatelessWidget{
  const MyText({super.key});

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
            const SizedBox(height: 50,),
            const Text("Duong Chi Khang"),
            const SizedBox(height: 20,),

            const Text(
              "Xin chao cac ban dang hoc lap trinh flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.5,
              ),
            ),
            const Text(
              "Flutter là một SDK phát triền ứng dụng di động nguồn mở được tạo ra bởi Google. Nó được sử dụng",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1.5,
              ),

            ),
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