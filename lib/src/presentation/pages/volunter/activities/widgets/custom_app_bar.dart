import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final TextEditingController? controller;
  final VoidCallback changeSearching;
  final RxBool isSearching;
  final FocusNode? focusNode;
  final ValueChanged<String> onChanged;

  const CustomAppBar({
    Key? key,
    required this.changeSearching,
    required this.controller,
    required this.isSearching,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ObxValue<RxBool>(
        (isSearching) => isSearching()
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  focusNode: focusNode,
                  controller: controller,
                  onChanged: onChanged,
                  style: const TextStyle(
                    color: Palette.accent,
                    fontFamily: 'Lato',
                  ),
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'search activities...',
                  ),
                ),
              )
            : const Text('Activities'),
        isSearching,
      ),
      actions: [
        ObxValue<RxBool>(
          (isSearching) => IconButton(
            icon: isSearching()
                ? const Icon(
                    Icons.close,
                  )
                : const Icon(
                    Icons.search,
                  ),
            onPressed: changeSearching,
          ),
          isSearching,
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
