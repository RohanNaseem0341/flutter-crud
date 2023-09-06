import 'package:flutter/material.dart';

class ToDOView extends StatefulWidget {
  const ToDOView({super.key});

  @override
  State<ToDOView> createState() => _ToDOViewState();
}

class _ToDOViewState extends State<ToDOView> {
  List<String> friendList = ['Qasim', 'Aqib', 'Saqib'];
  TextEditingController itemController = TextEditingController();
  TextEditingController updateItemController = TextEditingController();

  deleteItem(i) {
    setState(() {
      friendList.removeAt(i);
    });
  }

  updateItem(i) {
    setState(() {
      friendList[i] = updateItemController.text;
    });
    updateItemController.clear();
    Navigator.pop(context);
  }

  addItem() {
    setState(() {
      if (itemController.text.isNotEmpty) {
        friendList.add(itemController.text);
      }
      itemController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: itemController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your name',
          ),
        ),
      ),
      body:
          // Column(
          //   children: [
          //     GestureDetector(
          //       child: Container(
          //         height: 200,
          //         color : Colors.red,
          //       )
          //     )
          //   ],
          // ),
          ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, i) {
          return ListTile(
              title: Text('${i + 1}) Mr ${friendList[i]}'),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      // print(i);
                      deleteItem(i);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      updateItemController.text = friendList[i];
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Update Item'),
                            content: TextField(
                              controller: updateItemController,
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    updateItem(i);
                                    // print(friendList);
                                  },
                                  child: const Text('Update Item')),
                            ],
                          );
                        },
                      );
                      // print(i);
                      // updateItem(i);
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
          print(itemController.text);
        },
        child: const Text('Add'),
      ),
    );
  }
}
