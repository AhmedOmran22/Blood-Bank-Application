import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            spacing: 16,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffffdada),
                radius: 20,
                child: Center(
                  child: Icon(
                    icon,
                    size: 20,
                  ),
                ),
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ),
        ),
        const Divider(
          thickness: .5,
          color: Colors.grey,
        ),
      ],
    );
  }
}
