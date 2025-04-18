import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../view/NoteFrom.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết Ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Mở màn hình chỉnh sửa ghi chú
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteForm(note: note),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tiêu đề: ${note.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Nội dung: ${note.content}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Thời gian tạo: ${note.createdAt}'),
            Text('Thời gian sửa: ${note.modifiedAt}'),
            SizedBox(height: 10),
            Text('Ưu tiên: ${note.priority}'),
            if (note.tags!.isNotEmpty) ...[
              Text('Tags:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: note.tags!.map((tag) => Chip(
                  label: Text(tag),
                  backgroundColor: Colors.blue.shade100,
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
