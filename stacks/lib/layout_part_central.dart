import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'widget_popover.dart';
import 'package:flutter/material.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

enum SelectedColor { Negre, Vermell, Verd, Blau }

class LayoutPartCentralState extends State<LayoutPartCentral> {
  SelectedColor _selectedColor = SelectedColor.Negre;

  Color _getColor() {
    switch (_selectedColor) {
      case SelectedColor.Negre:
        return Colors.black;
      case SelectedColor.Vermell:
        return Colors.red;
      case SelectedColor.Verd:
        return Colors.green;
      case SelectedColor.Blau:
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  void changeColor(SelectedColor color) {
    setState(() {
      _selectedColor = color;
    });
  }

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
                                changeColor(SelectedColor.Negre);
                                print("Opció 1 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Negre'),
                            ),
                            GestureDetector(
                              onTap: () {
                                changeColor(SelectedColor.Vermell);
                                print("Opció 2 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Vermell'),
                            ),
                            GestureDetector(
                              onTap: () {
                                changeColor(SelectedColor.Verd);
                                print("Opció 3 premuda");
                                WidgetPopover.hidePopover();
                              },
                              child: Text('Verd'),
                            ),
                            GestureDetector(
                              onTap: () {
                                changeColor(SelectedColor.Blau);
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
            children: [
              Text("Central",
                  style: TextStyle(
                    color: _getColor(),
                  ))
            ],
          ),
        ));
  }
}
