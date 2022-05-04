# flutter_sqlite

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```dart

  //Todo DatabaseHelper
  Future<int> save(MyDatabase testDatabase) async {
    Database db = await getDatabase();
    return db.insert(tbName, testDatabase.toMap());
  }
  //todo Home.dart
  void savedb() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    myDatabase = MyDatabase(
        name: nameController.text,
        address: addressController.text,
        phone: phoneController.text);
    int result = await databaseHelper.save(myDatabase);
    setState(() {});
    
  }
  
```dart
```yaml
  sqflite: ^2.0.2+1 
  
```# flutter_sqlite
