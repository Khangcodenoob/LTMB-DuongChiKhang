/* 
Records là một kiểu dữ liệu tổng hợp (composite type) được giới thiệu trong dart 3.0
cho phép nhóm nhiều giá trị có kiểu khác nhau thành một đơn vị duy nhất 
Records là immutable - nghĩa là không thể thay đổi sau khi được tạo.
*/

void main() {
  var r = ('first', a: 2, 5, 10.5); //record

  //định nghĩa record có 2 giá trị
  var point = (123, 456);

  //định nghĩa person
  var person = (name: 'Alice', age: 30,5);

  //truy cập giá trị trong record
  //dùng chủ số

  print(point.$1); //123
  print(point.$2); //456
   print(person.$1); //5

  //dùng tên
  print(person.name); //Alice
  print(person.age); //30
}