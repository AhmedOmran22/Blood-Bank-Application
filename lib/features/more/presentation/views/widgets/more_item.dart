import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.color,
  });
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 2,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            spacing: 16,
            children: [
              CircleAvatar(
                backgroundColor: color ?? Theme.of(context).primaryColor,
                radius: 20,
                child: Center(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.white,
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
