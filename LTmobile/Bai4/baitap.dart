/*
Câu 1 : Viết một đoạn mã dart để khai báo các kiểu dữ liệu khác nhau như số nguyên,
số thực, chuỗi kí tự và boolean. Sau đó, in giá trị của các biến này ra console để xem kết quả

Câu 2: Viết một hàm trong Dart tên là calculateSum nhận vào hai tham số số nguyên
 và trả về tổng của chúng. Gọi hàm này trong chương trình chính và in kết quả ra màn hình.

 */

//Bài làm
void main() {
  // Câu 1: Khai báo các kiểu dữ liệu khác nhau
  int soNguyen = 10; // Số nguyên
  double soThuc = 5.5; // Số thực
  String chuoiKyTu = "Xin chào, Dart!"; // Chuỗi ký tự
  bool laDung = true; // Kiểu Boolean

  // In giá trị của các biến ra màn hình
  print("Số nguyên: $soNguyen");
  print("Số thực: $soThuc");
  print("Chuỗi ký tự: $chuoiKyTu");
  print("Giá trị boolean: $laDung");

  // Câu 2: Gọi hàm calculateSum và in kết quả
  int tong = calculateSum(7, 3);
  print("Tổng của 7 và 3 là: $tong");
}

// Hàm tính tổng hai số nguyên
int calculateSum(int a, int b) {
  return a + b;
}
