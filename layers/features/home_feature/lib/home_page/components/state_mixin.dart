part of '../home_page.dart';

mixin _StateMixin<StatefulWidget> on State<HomePage> {
  late final ValueNotifier<bool> _isLocationEnabled;
  late final ValueNotifier<bool> _isBluetoothEnabled;
  late final ValueNotifier<String> _filter;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _filter = ValueNotifier('');
    _isLocationEnabled = ValueNotifier(false);
    _isBluetoothEnabled = ValueNotifier(false);
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _isBluetoothEnabled.dispose();
    _isLocationEnabled.dispose();
    _filter.dispose();
    super.dispose();
  }
}
