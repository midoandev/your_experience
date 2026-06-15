import 'package:flutter/material.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_radius.dart';

class DomainChips extends StatelessWidget {
  const DomainChips({super.key});

  @override
  Widget build(BuildContext context) {
    const chips = [
      'AI Chat',
      'Fintech',
      'Telemedicine',
      'E-Commerce',
      'Real-time',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: chips
            .map(
              (chip) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: context.custom.bgTag,
                  border: Border.all(
                    color: context.custom.borderAccent,
                    width: 0.5,
                  ),
                  borderRadius: AppRadius.circularSm,
                ),
                child: Text(
                  chip,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
