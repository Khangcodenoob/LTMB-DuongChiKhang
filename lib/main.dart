import 'package:flutter/material.dart';
/*import 'My_Widgets_01/MyAppBar.dart';
import 'MyScaffold.dart';
import 'My_Widgets_01/MyText.dart';
import 'My_Widgets_01/MyContainer.dart';
import 'MyColumnAndRow.dart';
import 'My_Widgets_01/MyButton.dart';
import 'MyButton_2.dart';
import 'MyButton_3.dart';
import 'MyGestures.dart';
import 'MyTestField.dart';
import 'My_Widgets_01/MyTestField2.dart';

import 'My_widgets_02_form/f1_form_basics.dart';
import 'My_widgets_02_form/f2_form_TextFormField_Validate.dart';
import 'My_widgets_02_form/f3_form_Dropdown.dart';
import 'My_widgets_02_form/f4_Form_RadioBox.dart';
import 'My_widgets_02_form/f5_form_CheckBox.dart';
import 'My_widgets_02_form/f6_form_DatePicker.dart';
import 'My_widgets_02_form/f7_form_ScrollView.dart';
import 'My_widgets_02_form/f8_form_ImagePicker.dart';
*/
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:app_02/userMS_API (1)/view/UserListScreen.dart';
//import 'package:app_02/userMS_API (1)/view/LoginScreen.dart';

//import 'package:app_02/noteMS/view/NoteListScreen.dart';
import 'package:app_02/mbApp/view/NoteListScreen.dart';
void main() {
  runApp( MyApp());
}

// UserMS thường và noteMS
class MyApp extends StatelessWidget {
   const MyApp({super.key});

   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       ),
       home: NoteListScreen(),
     );
   }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
/*
// UserMS_API_v2

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý người dùng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const _AuthCheckWidget(),
    );
  }
}

// Widget riêng biệt để kiểm tra xác thực
class _AuthCheckWidget extends StatelessWidget {
  const _AuthCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (!snapshot.hasData) {
          return LoginScreen();
        }

        final prefs = snapshot.data!;
        final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

        if (isLoggedIn) {
          // Đã đăng nhập, chuyển đến màn hình danh sách người dùng
          return UserListScreen(
            onLogout: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              // Khởi động lại ứng dụng để quay lại màn hình đăng nhập
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    (route) => false,
              );
            },
          );
        } else {
          // Chưa đăng nhập, hiển thị màn hình đăng nhập
          return  LoginScreen();
        }
      },
    );
  }
}*/
