import 'package:flutter/material.dart';
import '../model/Note.dart';
import '../db/NoteDatabaseHelperr.dart';
import '../view/NoteItem.dart';
import '../view/NoteFrom.dart';
import '../view/NoteDetailSrceen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> _notes = [];
  List<Note> _filteredNotes = [];
  final NoteDatabaseHelper _dbHelper = NoteDatabaseHelper();
  bool isGridView = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
    _searchController.addListener(_filterNotes);
  }

  Future<void> _loadNotes() async {
    final notes = await _dbHelper.getAllNotes();
    setState(() {
      _notes = notes;
      _filteredNotes = notes;
      _filteredNotes.sort((a, b) => b.priority.compareTo(a.priority));
    });
  }

  void _filterNotes() async {
    String query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _filteredNotes = _notes;
      });
    } else {
      final filtered = await _dbHelper.searchNotes(query);
      setState(() {
        _filteredNotes = filtered;
      });
    }
  }

  Future<void> _addNote() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteForm()),
    );
    _loadNotes();
  }

  void _toggleViewMode() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 3:
        return Colors.red.shade100;
      case 2:
        return Colors.yellow.shade100;
      case 1:
        return Colors.green.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách Ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(dbHelper: _dbHelper),
              );
            },
          ),
          IconButton(icon: Icon(Icons.refresh), onPressed: _loadNotes),
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_on),
            onPressed: _toggleViewMode,
          ),
        ],
      ),

      body: _filteredNotes.isEmpty
          ? Center(child: Text('Không có ghi chú nào'))
          : isGridView
          ? GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _filteredNotes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final note = _filteredNotes[index];
          return NoteItem(
            note: note,
            color: _getPriorityColor(note.priority),
          );
        },
      )
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _filteredNotes.length,
        itemBuilder: (context, index) {
          final note = _filteredNotes[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NoteItem(
              note: note,
              color: _getPriorityColor(note.priority),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Tìm kiếm ghi chú
class CustomSearchDelegate extends SearchDelegate {
  final NoteDatabaseHelper dbHelper;

  CustomSearchDelegate({required this.dbHelper});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: dbHelper.searchNotes(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());

        if (snapshot.hasError)
          return Center(child: Text('Lỗi: ${snapshot.error}'));

        final notes = snapshot.data ?? [];

        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NoteDetailScreen(note: notes[index]),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
