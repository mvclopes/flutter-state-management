class HomeController {
  final List<String> _myValues = List.generate(15, (index) => 'Index: $index');
  List<String> get myValues => _myValues;
}