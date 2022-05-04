import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/my_database.dart';

import 'database/database_helper.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MyDatabase myDatabase;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void savedb() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    myDatabase = MyDatabase(
        name: nameController.text,
        address: addressController.text,
        phone: phoneController.text);
    int result = await databaseHelper.save(myDatabase);
    setState(() {});
    if (result > 0) {
      print('ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<MyDatabase>>(
            future: databaseHelper.getAllData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(snapshot.data[index].name),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data[index].address),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data[index].phone)
                              ],
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    savedb();
                  },
                  child: const Text('Save')),
            ],
          ),
        )
      ],
    );
  }
}
