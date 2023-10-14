import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'widget_popover.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    GlobalKey _settingsButtonKey = GlobalKey();

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: appData
                      .toggleSidebarLeft, // hace que la barra salga de un lado
                  child: Icon(
                    CupertinoIcons.sidebar_left, // contenido de menu
                    color: appData.isSidebarLeftVisible
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.black,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),
              const SizedBox(width: 16),
            ],
          ),
          //middle: Text("hola"),
          /*
          middle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.settings, color: CupertinoColors.black),
              SizedBox(
                  width:8), // Ajusta el espacio entre el icono y el texto si es necesario
            ],
          ),
          */

          middle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                key: _settingsButtonKey,
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  WidgetPopover.showPopover(
                      context: context,
                      key: _settingsButtonKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Opció 1 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Negre'),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Opció 2 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Vermell'),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Opció 3 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Verd'),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Opció 4 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Blau'),
                            ),
                          ],
                        ),
                      ));
                },
                child: const Icon(
                  CupertinoIcons.settings,
                  color: CupertinoColors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ],
          ),

          trailing: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: appData
                  .toggleSidebarRight, // hace que la barra salga de un lado
              child: Icon(
                CupertinoIcons.sidebar_right, // contenido de menu
                color: appData.isSidebarRightVisible
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Central")],
          ),
        ));
  }
}
