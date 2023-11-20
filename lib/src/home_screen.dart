import 'package:flutter/material.dart';
import 'package:state_management_sample/src/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          _HomeList(
            values: _controller.myValues,
            onTap: (index) {},
          ),
          _InputFooter(
            onTap: (text) {},
          )
        ],
      ),
    );
  }
}

class _HomeList extends StatelessWidget {
  final List<String> values;
  final Function(int) onTap;

  const _HomeList({required this.values, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return values.isEmpty
        ? const Center(
            child: Text('No available data'),
          )
        : Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (_, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 36,
                    child: CircleAvatar(
                      radius: 24,
                      child: Text(index.toString()),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => onTap.call(index),
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                  title: Text("Index: $index"),
                );
              },
              itemCount: 20,
            ),
          );
  }
}

class _InputFooter extends StatelessWidget {
  final Function(String) onTap;

  const _InputFooter({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    return Container(
      color: Theme.of(context).primaryColor.withAlpha(80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Type some text here",
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(60),
                  onTap: () {
                    onTap.call(inputController.text);
                    inputController.clear();
                  },
                  child: Ink(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
