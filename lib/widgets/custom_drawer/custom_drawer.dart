import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_task1_app/providers/theme_provider.dart';

part 'drawer_item.dart';

part 'model.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int index, _DrawerModel it)? onTapRegion;

  const CustomDrawer({Key? key, this.onTapRegion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hududlar",
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ListView.separated(
              itemCount: _items.length,
              separatorBuilder: (_, i) => const SizedBox(height: 12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return _DrawerItem(
                  icon: "assets/icons/${_items[i].title.toLowerCase()}.svg",
                  title: _items[i].title,
                  onTap: () => onTapRegion?.call(i, _items[i]),
                );
              },
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            _DrawerItem(
              icon: "assets/icons/share.svg",
              title: "Ulashish",
              onTap: () {
                Share.share(
                  "https://play.google.com/store/apps/details?id="
                  "com.abbos2101.weather_task1_app",
                  subject: "Obhavo Task1",
                );
              },
            ),
            const SizedBox(height: 10),
            _DrawerItem(
              icon: "assets/icons/theme.svg",
              title: ThemeProvider.of(context, listen: false).isLight
                  ? "Tun"
                  : "Kun",
              onTap: () => ThemeProvider.of(context, listen: false).change(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
