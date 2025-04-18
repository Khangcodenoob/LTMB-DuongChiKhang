/*
 expr1 ? expr2 : expr3;
 Nếu expr1 đúng, trả về expr2, ngược lại, trả về expr3

 expr1 ?? expr2
 Nếu expr1 không null thì trả về giá trị của nó;
 ngược lại trả lại giá trị expr2
*/
void main () {
  var kiemtra = (100%2==0)? "100 la so chan": "100 la so le";
  print(kiemtra);

  var x = 100;
  var y = x ?? 50;
  print(y);

    int? z;
  z ??= 30;
  print(z);

}