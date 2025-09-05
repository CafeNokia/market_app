import 'package:flutter/material.dart';
import 'package:market_app/common/helpers/theme/index.dart';

class CAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  final bool hideBack;
  const CAppbar({
    this.title,
    this.hideBack = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      leading: hideBack ? null : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode ? Colors.white : const Color.fromARGB(30, 35, 31, 31),
            shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        )
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}