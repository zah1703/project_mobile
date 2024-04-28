import 'package:flutter/material.dart';
import 'package:note_app/database/note_database.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/widgets/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  const AddEditNotePage({super.key, this.note});
  final Note? note;

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  late bool _isImportant;
  late int _number;
  late String _title;
  late String _description;
  final _formKey = GlobalKey<FormState>(); // validasi formnya
  var _isUpdateForm = false; // utk menentukan di state add/edit note

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isImportant = widget.note?.isImportant ?? false;
    _number = widget.note?.number ?? 0;
    _title = widget.note?.title ?? '';
    _description = widget.note?.description ?? '';
    _isUpdateForm = widget.note != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isUpdateForm ? 'Edit' : 'Add'),
        actions: [
          _buildButtonSave(),
        ],
      ),
      body: Form(
        key: _formKey,
        child: NoteFormWidget(
            isImportant: _isImportant,
            number: _number,
            title: _title,
            description: _description,
            onChangeIsImportant: (value) {
              setState(() {
                _isImportant = value;
              });
            },
            onChangeNumber: (value) {
              setState(() {
                _number = value;
              });
            },
            onChangeTitle: (value) {
              _title = value;
            },
            onChangeDescription: (value) {
              _description = value;
            }),
      ),
    );
  }

  Widget _buildButtonSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
          onPressed: () async {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              if (_isUpdateForm) {
                await _updateNote();
              } else {
                await _addNote();
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Save')),
    );
  }

  Future<void> _addNote() async {
    final note = Note(
        isImportant: _isImportant,
        number: _number,
        title: _title,
        description: _description,
        createdTime: DateTime.now());
    await NoteDatabase.instance.create(note);
  }

  Future<void> _updateNote() async {
    final updateNote = Note(
        id: widget.note?.id,
        isImportant: _isImportant,
        number: _number,
        title: _title,
        description: _description,
        createdTime: DateTime.now());
    await NoteDatabase.instance.updateNote(updateNote);
  }
}
