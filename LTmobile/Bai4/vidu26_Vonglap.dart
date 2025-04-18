void main(){
  //Vong lap for
  for (int i = 0; i <= 5; i++) {
    print(i);
  }

  //Iterable: List, Set
  //for-in
  var names = ["Duong", "Chi", "Khang"];
  for (var name in names) {
    print(name);
  }

  //Vòng lập While
  var i = 1;
  while (i <= 5) {
    print(i);
  }

  // VÒng lập do-while ( thực hiện ít nhất 1 lần)
  var x = 1;
  do {
    print(x);
    x++;
  } while (x <= 5);

  //break/countinue
  x = 1;
  do {
    print(x);
    x++;
    if (x == 3) break;
  } while (x <= 5);
  print("-------");
}