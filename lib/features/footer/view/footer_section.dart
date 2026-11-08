import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_experience/core/services/link_service.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/core/ui/widgets/app_button.dart';
import 'package:your_experience/data/icon_mapper.dart';
import 'package:your_experience/features/footer/view_model/footer_vm.dart';

class FooterSection extends ConsumerWidget {
  final VoidCallback? onBackToTop;

  const FooterSection({super.key, this.onBackToTop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(footerVmProvider);
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.custom.textMuted,
    );
    return LayoutBuilder(
      builder: (context, c) => _layout(context, vm, muted, c.maxWidth < 640),
    );
  }

  Widget _layout(
    BuildContext context,
    FooterState vm,
    TextStyle? muted,
    bool isMobile,
  ) {
    final left = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.copyright('${DateTime.now().year}'),
          style: muted,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        AppSpacing.gapH(AppSpacing.xs),
        Text(
          context.l10n.builtWith,
          style: muted,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
      ],
    );

    final right = Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final c in vm.contacts)
          IconButton(
            tooltip: c.name,
            onPressed: () => LinkService.open(c.link),
            icon: iconWidget(
              c.iconName,
              size: AppLayout.iconSm + 2,
              color: context.custom.textMuted,
            ),
          ),
        if (onBackToTop != null) ...[
          AppSpacing.gapW(AppSpacing.sm),
          AppButton.ghost(
            label: context.l10n.backToTop,
            icon: const Icon(Icons.arrow_upward_rounded),
            iconAfter: true,
            onPressed: onBackToTop,
          ),
        ],
      ],
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.colors.outlineVariant)),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [right, AppSpacing.gapH(AppSpacing.md), left],
            )
          : Row(
              children: [
                Expanded(child: left),
                right,
              ],
            ),
    );
  }
}
