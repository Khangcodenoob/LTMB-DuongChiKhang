/*
 CHuỗi là một tập hợp ký tự UT-16
*/

void main(){
  var s1 = " Duong Chi Khang";
  var s2 = " VIE DCK";


  // Chèn giá trị của một biểu thức, biến vào trong chuỗi : $(...)
  double diemToan = 9.5;
  double diemVan = 8.5;
  var s3 = 'Xin chào $s1, bạn đạt tổng điểm là: ${diemToan+diemVan}';
  print(s3);

  //Tạo ra chuỗi nằm ở nhiều dòng
   var s4 = '''
    Dòng 1
    Dòng 2 
    Dòng 3 
  ''';

  var s5 = """
    Dòng 1
    Dòng 2 
    Dòng 3 
  """;

  var s6 = 'Đây là một đoạn \n văn bản !'; //\n xuống dòng
  print(s6);

  var s7 = r'Đây là một đoạn \n văn bản !'; //raw
  print(s7);

  var s8 = "Chuỗi 1 " + "CHuỗi 2";
  print(s8);

  var s9 =  'Chuỗi'
            "Này"
            "là một chuỗi";
  print(s9);
}
