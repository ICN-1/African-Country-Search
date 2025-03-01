import 'package:flutter/material.dart';

class CountryDetailsTile extends StatelessWidget {
  const CountryDetailsTile({
    super.key,
    required this.label,
    required this.detail,
  });

  final String label, detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          softWrap: true,
        ),
        const SizedBox(width: 8.0),
        Text(
          detail,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          softWrap: true,
        ),
      ],
    );
  }
}
