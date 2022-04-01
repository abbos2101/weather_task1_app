part of 'custom_drawer.dart';

const _items = <_DrawerModel>[
  _DrawerModel("Toshkent", "tashkent"),
  _DrawerModel("Andijon", "andijan"),
  _DrawerModel("Buxoro", "bukhara"),
  _DrawerModel("Sirdaryo", "gulistan"),
  _DrawerModel("Jizzax", "jizzakh"),
  _DrawerModel("Qashqadaryo", "qarshi"),
  _DrawerModel("Navoiy", "navoiy"),
  _DrawerModel("Namangan", "namangan"),
  _DrawerModel("Nukus", "nukus"),
  _DrawerModel("Samarqand", "samarkand"),
  _DrawerModel("Surxandaryo", "termez"),
  _DrawerModel("Xorazm", "urgench"),
  _DrawerModel("Farg'ona", "fergana"),
];

class _DrawerModel {
  final String title;
  final String name;

  const _DrawerModel(this.title, this.name);
}
