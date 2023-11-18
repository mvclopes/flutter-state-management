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
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

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
          _HomeList(values: _controller.myValues),
          _InputFooter(onTap: (newValue) => _controller.addNewValue(newValue))
        ],
      ),
    );
  }
}

class _HomeList extends StatelessWidget {
  final List<String> values;

  const _HomeList({required this.values});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: values.isEmpty
          ? const Center(
              child: Text('No available data'),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (_, index) {
                final firstWordLetter = values[index][0].toUpperCase();
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 36,
                    child: CircleAvatar(
                      radius: 24,
                      child: Text(firstWordLetter),
                    ),
                  ),
                  title: Text(values[index]),
                );
              },
              separatorBuilder: (_, index) {
                return Divider(
                  thickness: 2,
                  color: Colors.grey.shade200,
                );
              },
              itemCount: values.length,
            ),
    );
  }
}

class _InputFooter extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();
  final Function(String) onTap;

  _InputFooter({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withAlpha(80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: _inputController,
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
                    onTap.call(_inputController.text);
                    _inputController.clear();
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
