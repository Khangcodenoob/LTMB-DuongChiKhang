import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormBasicDemoSate();
}

class _FormBasicDemoSate extends State<FormBasicDemo>{
  //Sử dụng Global key để truy cập Form
  final _formkey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Cơ Bản"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        // Form là widget chứa và quản lý các trường nhập liệu
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Họ Và Tên",
                    hintText: "Nhập và tên của bạn",
                    border: OutlineInputBorder(),
                  ) ,
                  onSaved: (value){
                    _name = value;
                  },
                ),

                SizedBox(height: 20,),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()){
                        _formkey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Xin chào $_name"))
                        );
                      }
                    }, child: Text("Submit")),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      _formkey.currentState!.reset();
                      setState(() {
                        _name = null;
                      });
                    }, child: Text("Reset")),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}