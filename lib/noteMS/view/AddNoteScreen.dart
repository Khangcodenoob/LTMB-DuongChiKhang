import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../api/NoteAPIService.dart';
import '../db/NoteDatabaseHelper.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _tagInputController = TextEditingController(); // Controller cho việc nhập tag
  List<String> _tags = []; // Danh sách các tag đã thêm
  int _priority = 3;

  void _addTag() {
    final String newTag = _tagInputController.text.trim();
    if (newTag.isNotEmpty && !_tags.contains(newTag)) {
      setState(() {
        _tags.add(newTag);
        _tagInputController.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  Future<void> _saveNote() async {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      if (_tags.isEmpty) {
        _tags.add("Không có tags");
      }
      Note newNote = Note(
        id: null,
        title: _titleController.text,
        content: _contentController.text,
        priority: _priority,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        tags: _tags, // Sử dụng danh sách tags đã thêm
        color: "#FFFFFF",
      );
      await NoteDatabaseHelper.instance.insertNote(newNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Tiêu đề'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Nội dung'),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            // Nhập tag và nút thêm
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagInputController,
                    decoration: InputDecoration(labelText: 'Nhập tag'),
                    onSubmitted: (value){
                      _addTag();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTag,
                ),
              ],
            ),
            SizedBox(height: 10),
            // Hiển thị các tag đã thêm
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) => Chip(
                label: Text(tag),
                backgroundColor: Colors.blue.shade100,
                deleteIcon: Icon(Icons.cancel),
                onDeleted: () => _removeTag(tag),
              )).toList(),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Mức độ ưu tiên: '),
                DropdownButton<int>(
                  value: _priority,
                  onChanged: (int? newValue) {
                    setState(() {
                      _priority = newValue ?? 3;
                    });
                  },
                  items: [
                    DropdownMenuItem(value: 1, child: Text('Cao')),
                    DropdownMenuItem(value: 2, child: Text('Trung bình')),
                    DropdownMenuItem(value: 3, child: Text('Thấp')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}