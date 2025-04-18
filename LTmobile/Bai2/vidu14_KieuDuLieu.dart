void main(){
  //int: la kieu so nguyen
  int x = 100;

  //double: la kieu so thuc
  double y = 100.5;

  //num : co the la so nguyen, co the la so thuc
  num z = 10;
  num t = 10.75;
  
  // Chuyen chuỗi sang số nguyên
  var one = int.parse('1'); 
  print(one==1?'True':'False'); 

  // Chuyen chuoi sang so thuc
  var onePointOne = double.parse('1.1');
  print(onePointOne==1.1);

  //So nguyen sang chuoi
  String oneAsString = 1.toString();
  print(oneAsString);

  // So thuc sang chuoi
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
}