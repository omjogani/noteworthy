import 'package:flutter/material.dart';

class SettingMenuBar extends StatelessWidget {
  const SettingMenuBar({
    super.key,
    required this.settingMenuList,
  });
  final List<SettingMenuBarTile> settingMenuList;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54, width: 1),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFFa5a5a5).withOpacity(1),
              offset: const Offset(3, 6),
              blurRadius: 13,
              spreadRadius: -10,
            ),
          ],
        ),
        child: Column(
          children: settingMenuList,
        ),
      ),
    );
  }
}

class SettingMenuBarTile extends StatefulWidget {
  const SettingMenuBarTile({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final bool isSelected;
  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  State<SettingMenuBarTile> createState() => _SettingMenuBarTileState();
}

class _SettingMenuBarTileState extends State<SettingMenuBarTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool isHoverNew) {
        setState(() {
          isHover = isHoverNew;
        });
      },
      onTap: () => widget.onPressed(),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        width: 200.0,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.grey.shade200
              : isHover
                  ? Colors.grey.shade100
                  : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? Colors.white
                    : isHover
                        ? Colors.white
                        : null,
                border: widget.isSelected
                    ? Border.all(color: Colors.black45)
                    : isHover
                        ? Border.all(color: Colors.grey.shade300)
                        : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                widget.icon,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              widget.text,
            ),
          ],
        ),
      ),
    );
  }
}
