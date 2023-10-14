import 'package:cupertino_base/layout_part_right.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'layout_part_left.dart';
import 'layout_part_central.dart';
import 'widget_sidebar.dart';

class LayoutDesktop extends StatefulWidget {
  //const LayoutDesktop({super.key});
  const LayoutDesktop({Key? key});
  @override
  State<LayoutDesktop> createState() => _LayoutDesktopState();
}

class _LayoutDesktopState extends State<LayoutDesktop> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return WidgetSidebars(
        isSidebarLeftVisible: appData.isSidebarLeftVisible,
        isSidebarRightVisible: appData.isSidebarRightVisible,
        left: const LayoutPartLeft(),
        central: const LayoutPartCentral(),
        right: const LayoutPartRight());
  }
}
