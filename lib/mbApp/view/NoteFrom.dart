import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../db/NoteDatabaseHelperr.dart';

class NoteForm extends StatefulWidget {
  final Note? note;

  NoteForm({this.note});

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final TextEditingController _tagInputController = TextEditingController(); // Controller cho việc nhập tag
  List<String> _tags = []; // Danh sách các tag đã thêm
  int _priority = 3;
  String? _color = 'FFFFFF';

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

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      _priority = widget.note!.priority;
      _color = widget.note!.color;
      _tags = List<String>.from(widget.note!.tags ?? []); // ko có dòng này tag mặc định là rỗng
    }
  }

  _saveNote() async {
    final note = Note(
      id: widget.note?.id,
      title: _titleController.text,
      content: _contentController.text,
      priority: _priority,
      createdAt: widget.note?.createdAt ?? DateTime.now(),
      modifiedAt: DateTime.now(),
      tags: _tags,
      color: _color,
    );

    if (widget.note == null) {
      await NoteDatabaseHelper().insertNote(note); //Nếu là mới thì thêm ghi chú
    } else {
      await NoteDatabaseHelper().updateNote(note); //Nếu là cũ thì sửa ghi chú và update
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Thêm Ghi chú' : 'Chỉnh sửa Ghi chú'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Tiêu đề'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Nội dung'),
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
            DropdownButton<int>(
              value: _priority,
              onChanged: (value) {
                setState(() {
                  _priority = value!;
                });
              },
              items: [
                DropdownMenuItem(value: 1, child: Text('Ưu tiên thấp', style: TextStyle(color: Colors.green))),
                DropdownMenuItem(value: 2, child: Text('Ưu tiên trung bình', style: TextStyle(color: Colors.yellow))),
                DropdownMenuItem(value: 3, child: Text('Ưu tiên cao', style: TextStyle(color: Colors.red))),
              ],
            ),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}
