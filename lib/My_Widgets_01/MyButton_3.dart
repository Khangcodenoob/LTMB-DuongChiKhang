import "package:flutter/material.dart";

class MyButton_3 extends StatelessWidget{
  const MyButton_3 ({super.key});

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
            //Khoa nút nhấn
            ElevatedButton(
              onPressed: null, // khoá nút lại
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


            SizedBox(height: 50,),
            //Khoa nút nhấn
            ElevatedButton(
                onPressed: (){print("Pressed");},
                onLongPress: (){print("LongPress");},
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


            SizedBox(height: 30,),//khoảng cách giữa các nút
            InkWell(
              onTap:(){
                print("InkWell được nhấn!");
              },
              onDoubleTap:(){
                print("InkWell được hai nhấn liên tiếp!");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text("Button tuỳ chỉnh với InkWell"),
              ),
            ),

            SizedBox(height: 50,),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              label: Text("Yêu thích"),
            ),
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