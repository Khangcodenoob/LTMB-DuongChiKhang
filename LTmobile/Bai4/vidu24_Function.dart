//Shift + Alt + A
/*
Dart là một ngôn ngữ thuần hướng đối tượng, vì vậy ngay cả các hàm cũng là đối
tượng và có kiểu Function
Điều này có nghãi là các hàm có thể được gán cho các biến hoặc truyền làm tham số cho một hàm khác.
typedef là một cách ngắn gọn để đặt tên cho một kiểu hàm.
*/

/*
Hàm là một khối lệnh thực hiện một tác vụ gì đó, khối lệnh này được dùng nhiều
lần nên tóm gọn chúng lại thành một hàm.
*/

double tinhtong(var a, double b, double c){
  return a + b + c;
}

//Sử dụng cú pháp rút gọn "=>"
double tingtong1(var a, double b, double c) => a + b + c;
// => expression là cách viết gọn của { return expression;}

/*
Lưu ý : Chỉ có biểu thức (expression) đứng đằng sau =>, không áp dụng cho câu
lệnh (statement).
Ví dụ: Ta không thể để if statement đằng sau => được. Tuy nhiên ta có thể sữ dụng condition ?
expr1 : expr2
*/

//Hàm với tên của tham số
//Khi gọi 1 hàm (function), ta có truyền giá trị thông qua biến paramName: value
String createFullName({String Ho ="", String chulot ="", String ten = ""}) {
  return Ho + " " + chulot + " " + ten;
}

//Tham số tuỳ chọn (có hay không cũng được)
/*
Các tham số tuỳ chọn trong hàm cho phép ta gọi hàm mà không cần cung cấp 
đầy tất cả các tham số. Khi các tham số tuỳ chọn không được cung cấp, chúng sẽ nhận 
giá trị null theo mặc định.
Để khai báo các tham số tuỳ chọn, ta sử dụng dấu ngoặc vuông[].
*/
double sum(double a, [double? b , double? c ,double? d]){
  var result = a;
  result += (b!=null) ? b : 0;
  result += (c!=null) ? c : 0;
  result += (d!=null) ? d : 0;
  return result;
}

//Hàm ẩn danh
/*
Trong dart, ta có thể tạo các hàm không có tên gọi là hàm ẩn danh, hau còn gọi là lambda hoặc closure
Chúng thường được sử dụng trong các ngữ cảnh mà ta không 
cần sữ dụng tên hàm, ví dụ như khi truyền hàm như tham số cho hàm khác.
Để tạo hàm ẩn danh, ta có thể sử dụng
*/



//Hàm main(): khởi đầu ứng dụng
void main() {
  print('Hello world!');
  var x = tinhtong(1, 10, 100);
  print(x);

  var y = tinhtong(1, 10, 100);
  print(y);
  
  var fn = createFullName(Ho: "Duong" , chulot: "Chi", ten: "Khang");
  print(fn);

  var fn1 = createFullName( chulot: "Chi", Ho: "Duong", ten: "Khang");
  print(fn1);

  var fn2 = createFullName(ten: "Khang",Ho: "Duong" , chulot: "Chi");
  print(fn2);

  print(sum(10));
  print(sum(10, 1));
  print(sum(10, 1, 2));
  print(sum(10, 1, 2, 3));
  //Cách 1
  var ham = (var a, var b){
    return a + b;
  };
  print(ham(1, 2));

  //Cách 2
  var ham2 = (var a, var b) => a + b;
  print(ham2(1, 2));
}  
