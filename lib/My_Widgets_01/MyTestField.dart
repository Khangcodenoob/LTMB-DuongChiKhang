import "package:flutter/material.dart";

class MyTestField extends StatelessWidget{
  const MyTestField ({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              /*
              TestField là widget cho phép người dùng nhập văn bản từ bàn phím
              đây là thành phần thiết yếu trong hầu hết các ứng dụng
              từ biểu mẫu đăng nhập , tra cứu  đến nhập liệu trong các úng dựng phức tạp
               */
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập vào họ vs tên của bạn ",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Example@gmail.com",
                  helperText: "Nhập vào email cá nhân",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  filled: true,
                  fillColor: Colors.greenAccent
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhập vào số điện thoại của bạn",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngày Sinh",
                  hintText: "Nhập vào ngày sinh của bạn",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),

              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật Khẩu",
                  hintText: "Nhập vào mật khẩu của bạn",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                obscureText: true,
                obscuringCharacter: '*',
              ),

              SizedBox(height: 30,),
              TextField(
                onChanged: (value){
                  print("Đăng nhập: $value");
                },
                onSubmitted: (value){
                  print("Đã hoàn thành nội dung: $value");
                },
                decoration: InputDecoration(
                  labelText: "Câu hỏi bí mật",

                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                obscureText: true,
                obscuringCharacter: '*',
              ),
            ],
          ),
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