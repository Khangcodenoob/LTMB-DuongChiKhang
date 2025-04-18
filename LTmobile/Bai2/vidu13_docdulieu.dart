import 'dart:io';

void main() {
  
  stdout.write('Enter your name:');
  String name = stdin.readLineSync()!;
  
  stdout.write('Enter your age:');
  int age = int.parse(stdin.readLineSync()!);
  
  print("Hello $name, you are $age years old.");
}