/*
BÀI TẬP: Cấu trúc dữ liệu trong Dart
====================================
Bài 1: List
 
Có bao nhiêu cách để khai báo một List trong đoạn code? Liệt kê và giải thích từng cách.
Cho List ['A', 'B', 'C']. Viết code để:
 
Thêm phần tử 'D' vào cuối List
Chèn phần tử 'X' vào vị trí thứ 1
Xóa phần tử 'B'
In ra độ dài của List
 
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar list = [1, 2, 3, 4, 5];
list.removeWhere((e) => e % 2 == 0);
print(list);
 
Giải thích sự khác nhau giữa các phương thức:
 
remove() và removeAt()
add() và insert()
addAll() và insertAll()
 
 
====================================
Bài 2: Set
 
Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
Cho hai Set:
 
dartCopyvar set1 = {1, 2, 3};
var set2 = {3, 4, 5};
Tính kết quả của:
 
Union (hợp)
Intersection (giao)
Difference (hiệu) của set1 với set2
 
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
print(mySet.length);
 
 
 
====================================
Bài 3: Map
 
Viết code để thực hiện các yêu cầu sau với Map:
 
dartCopyMap<String, dynamic> user = {
  'name': 'Nam',
  'age': 20,
  'isStudent': true
};
 
Thêm email: 'nam@gmail.com'
Cập nhật age thành 21
Xóa trường isStudent
Kiểm tra xem Map có chứa key 'phone' không
 
 
So sánh hai cách truy cập giá trị trong Map:
 
dartCopyuser['phone']
user['phone'] ?? 'Không có số điện thoại'
 
Viết một hàm nhận vào một Map và in ra tất cả các cặp key-value, mỗi cặp trên một dòng.
 
 
====================================
Phần 4: Runes
 
Runes được sử dụng để làm gì? Cho ví dụ cụ thể.
Viết code để:
 
 
Tạo một Runes chứa ký tự emoji cười 😀
Chuyển đổi Runes đó thành String
In ra số lượng điểm mã của Runes
 
*/

// Bài 1: List
void listOperations() {
  List<String> list = ['A', 'B', 'C'];
  
  list.add('D'); // Thêm 'D' vào cuối
  list.insert(1, 'X'); // Chèn 'X' vào vị trí thứ 1
  list.remove('B'); // Xóa phần tử 'B'
  
  print("List sau khi cập nhật: $list");
  print("Độ dài của List: ${list.length}");

  var numbers = [1, 2, 3, 4, 5];
  numbers.removeWhere((e) => e % 2 == 0);
  print("Danh sách sau khi loại bỏ số chẵn: $numbers");
}

// Bài 2: Set
void setOperations() {
  var set1 = {1, 2, 3};
  var set2 = {3, 4, 5};

  print("Hợp: ${set1.union(set2)}");
  print("Giao: ${set1.intersection(set2)}");
  print("Hiệu: ${set1.difference(set2)}");

  var mySet = Set.from([1, 2, 2, 3, 3, 4]);
  print("Số phần tử trong Set: ${mySet.length}");
}

// Bài 3: Map
void mapOperations() {
  Map<String, dynamic> user = {
    'name': 'Khang',
    'age': 21,
    'isStudent': true
  };

  user['email'] = 'pebaoan.bh@gmail.com';
  user['age'] = 21;
  user.remove('isStudent');
  
  print("Map sau khi cập nhật: $user");
  print("Map có chứa key 'phone' không? ${user.containsKey('phone')}");

  print("Truy xuất giá trị của 'phone': ${user['phone'] ?? 'Không có số điện thoại'}");
}

void printMap(Map<dynamic, dynamic> map) {
  map.forEach((key, value) {
    print('$key: $value');
  });
}

// Bài 4: Runes
void runeOperations() {
  Runes emoji = Runes('\u{1F600}'); // 😀
  String emojiStr = String.fromCharCodes(emoji);

  print("Emoji: $emojiStr");
  print("Số điểm mã trong Runes: ${emoji.length}");
}

void main() {
  listOperations();
  print("----------------------------");
  setOperations();
  print("----------------------------");
  mapOperations();
  print("----------------------------");
  runeOperations();
}
