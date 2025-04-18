import 'package:flutter/material.dart';
import '../db/NoteDatabaseHelper.dart';
import '../model/Note.dart';
import '../api/NoteAPIService.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _tagInputController; // Controller cho việc nhập tag
  late List<String> _tags; // Danh sách các tag đã thêm
  late int _priority;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
    _tagInputController = TextEditingController();
    _tags = List.from(widget.note.tags ?? []);
    _priority = widget.note.priority;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagInputController.dispose();
    super.dispose();
  }

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
      Note updNote = Note(
        id: widget.note.id,
        title: _titleController.text,
        content: _contentController.text,
        priority: _priority,
        createdAt: widget.note.createdAt,
        modifiedAt: DateTime.now(),
        tags: _tags, // Sử dụng danh sách tags đã thêm
        color: "#FFFFFF",
      );
      await NoteDatabaseHelper.instance.updateNote(updNote);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa Ghi chú'),
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