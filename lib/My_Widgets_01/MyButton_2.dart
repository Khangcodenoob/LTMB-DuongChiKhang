import "package:flutter/material.dart";

class MyButton_2 extends StatelessWidget{
  const MyButton_2 ({super.key});

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
              onPressed: (){
                print("ElevateButton");},
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                //màu nền
                backgroundColor: Colors.green,
                //màu của nội dung bên trong
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
                //padding
                padding:  EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                elevation:15,
              )
            ),
            //Chọn thêm ít nhất 1 dạng nút nhấn khác để thiết kế
            SizedBox(height: 30,),

            // Text Button (nút dạng văn bản)
            TextButton(
              onPressed: () {
                print("TextButton");
              },
              child: Text("TextButton", style: TextStyle(fontSize: 24)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
            
            
            //InkWell, không phải là một button,nhưng có cho phép tạo hiệu ứng
            //gợn sóng ( ripple, effect)
            // khi nhấn vào bất kì widget nào
            SizedBox(height: 30,),//khoảng cách giữa các nút
            InkWell(
              onTap:(){
                print("InkWell được nhấn!");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text("Button tuỳ chỉnh với InkWell"),
              ),
            )
            
            
            
          ],
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