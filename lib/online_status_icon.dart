import 'package:flutter/material.dart';

class OnlineStatusIcon extends StatelessWidget {
  final bool isOnline;
  final VoidCallback? onTap;
  final bool loading;
  const OnlineStatusIcon({
    Key? key,
    required this.isOnline,
    this.onTap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: loading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              isOnline ? Icons.cloud : Icons.cloud_off,
              color: isOnline ? Colors.blue : Colors.grey,
            ),
      tooltip: isOnline ? 'Online' : 'Offline',
      onPressed: loading ? null : onTap,
    );
  }
}
