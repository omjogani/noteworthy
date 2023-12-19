import 'package:flutter/material.dart';
import 'package:noteworthy/constants/font_styles.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:window_manager/window_manager.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  width: 40.0,
                  height: 40.0,
                  "assets/images/logo_compressed.png",
                ),
                const SizedBox(width: 10.0),
                Text(
                  "Noteworthy",
                  style: titleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NavBarList(
                  icon: CarbonIcons.home,
                  onPressed: () {},
                  isSelected: true,
                ),
                NavBarList(
                  icon: CarbonIcons.save,
                  onPressed: () {},
                  isSelected: false,
                ),
                NavBarList(
                  icon: CarbonIcons.search,
                  onPressed: () {},
                  isSelected: false,
                ),
                NavBarList(
                  icon: CarbonIcons.email,
                  onPressed: () {},
                  isSelected: false,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    CarbonIcons.subtract,
                  ),
                  onPressed: () async {
                    await windowManager.minimize();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.fullscreen_outlined,
                  ),
                  onPressed: () async {
                    if (await windowManager.isMaximized()) {
                      await windowManager.unmaximize();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CarbonIcons.close,
                  ),
                  onPressed: () async {
                    await windowManager.close();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavBarList extends StatefulWidget {
  const NavBarList({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });
  final IconData icon;
  final Function onPressed;
  final bool isSelected;

  @override
  State<NavBarList> createState() => _NavBarListState();
}

class _NavBarListState extends State<NavBarList> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () => widget.onPressed(),
        onHover: (bool isHoveredNew) {
          setState(() {
            isHovered = isHoveredNew;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Column(
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isSelected || isHovered
                  ? Colors.deepPurple
                  : Colors.black,
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 4.0,
              width: 4.0,
              decoration: BoxDecoration(
                color:
                    widget.isSelected ? Colors.deepPurple : Colors.transparent,
                borderRadius: BorderRadius.circular(4.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
