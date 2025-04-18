import 'package:app_02/mbApp/db/NoteDatabaseHelperr.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Note.dart';
import '../view/NoteDetailSrceen.dart';
import '../view/NoteFrom.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Color color;

  NoteItem({required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    String createdAt = DateFormat('dd/MM/yyyy HH:mm').format(note.createdAt);
    String modifiedAt = DateFormat('dd/MM/yyyy HH:mm').format(note.modifiedAt);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoteDetailScreen(note: note)),
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 180), // Giới hạn chiều cao tối thiểu
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Tiêu đề
                Text(
                  note.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4),

                /// Nội dung (tối đa 2 dòng)
                Text(
                  note.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6),

                /// Mức độ ưu tiên
                Row(
                  children: [
                    Icon(
                      Icons.priority_high,
                      size: 20,
                      color: note.priority == 3
                          ? Colors.red
                          : (note.priority == 2 ? Colors.orange : Colors.green),
                    ),
                    SizedBox(width: 4),
                    Text('Ưu tiên: ${note.priority}'),
                  ],
                ),

                /// Tags
                if (note.tags != null && note.tags!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: -5,
                      children: note.tags!
                          .map((tag) => Chip(
                        label: Text(tag, style: TextStyle(fontSize: 12)),
                        backgroundColor: Colors.blue.shade50,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ))
                          .toList(),
                    ),
                  ),

                SizedBox(height: 6),

                /// Ngày tạo / sửa
                Text('Ngày tạo: $createdAt',
                    style: TextStyle(fontSize: 11, color: Colors.grey)),
                Text('Ngày sửa: $modifiedAt',
                    style: TextStyle(fontSize: 11, color: Colors.grey)),

                Spacer(), // Đẩy nút xuống dưới

                /// Nút sửa / xóa
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NoteForm(note: note)),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 20),
                      onPressed: () async {
                        bool confirm = await _showDeleteDialog(context);
                        if (confirm) {
                          await NoteDatabaseHelper().deleteNote(note.id!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Đã xóa ghi chú')),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc chắn muốn xóa ghi chú này?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Xóa'),
            ),
          ],
        );
      },
    ) ??
        false;
  }
}
