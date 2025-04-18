import 'dart:async';

/* 

Future là gì ?
Hãy tưởng tượng bạn gọi món ăn tại một nhà hàng:
+ Bạn đặt món ( gọi 1 hàm )
+ Nhân viên phụcvu5 nói " vâng, tôi sẽ mang món ăn đến sau"(nhận về 1 future)
+ Bạn có thể làm việc khác trong lúc chờ đợi (tiếp tực chạy code) khi món ăn được phục vụ (future hoàn thành)
, bạn có thể thưởng thức nó (sử dụng kết quả)

Future trong Dart cũng hoạt động tương tự. Đó là một cách làm việc với các tác vụ
mất thời gian mà không phải chờ đợi (ví dụ : tải dữ liệu từ Internet, đọc tệp).

Hiểu rõ về async/await
async và await là hai từ khoá đặc biệt trong Dart giúp làm việc với future dễ dành hơn.

Từ khoá async:
- Khi thêm từ async vào một hàm bạn đang nói với Dart: "Hàm này sẽ chứa code bất đồng bộ"
 
- Một hàm được đánh dấu async sẽ luôn luôn trả
về một Future (ngay cả khi bạn không khai báo nó)
 
*/
 
Future<String> layTen() async {
  return "Nguyen Van A";
}
 
/*
Từ khóa await
- await chỉ có thể được sử dụng bên trong một hàm async
Khi bạn đặt await trước một Future, Dart sẽ:
- Tạm dừng thực thi hàm tại dòng đó
- Đợi Future hoàn thành
- Trả về giá trị từ Future (không còn đóng gói trong Future nữa)
- Tiếp tục thực thi những dòng code còn lại
 
await biến đổi Future<T> thành giá trị T, giúp code dễ đọc hơn
 
*/


//Ham trả về Future
Future<String> taidulieu(){
  return Future.delayed(
    Duration(seconds: 2),
    () => "Dữ liệu đã tải xong"
  );
}

//Gọi hàm cách 1 
void hamChinh1(){
  print("Bắt đầu tải");
  Future<String> f =taidulieu();
  f.then((ketqua){
    print("Kết quaP: $ketqua");
  });
  print("Tiếp tục công việc khác");
}


//Gọi hàm cách 2
void hamChinh2() async {
  print("Bắt đầu tải"); //1
  String ketqua = await taidulieu();
  print("Kết quaP: $ketqua"); //2
  print("Tiếp tục công việc khác"); //3
}

void main(){
  hamChinh1();
  hamChinh2();
}