import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/ui/extensions/context_ext.dart';
import 'package:your_experience/core/ui/tokens/app_spacing.dart';
import 'package:your_experience/features/home_hero/view_model/hero_vm.dart';

class HeroSection extends ConsumerStatefulWidget {
  const HeroSection({super.key});

  @override
  ConsumerState<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(heroVmProvider);

    return Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.xxl + AppSpacing.sm,
        bottom: AppLayout.statTopPad,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow
          Text(
            context.l10n.heroEyebrow,
            style: context.textTheme.labelSmall!.copyWith(
              fontSize: 11,
              letterSpacing: 0.8,
            ),
          ),
          AppLayout.gapH12,

          // Hero name
          RichText(
            text: TextSpan(
              text: context.l10n.greetingHi,
              style: context.textTheme.displayLarge,
              children: [
                TextSpan(
                  text: vm.profile.hiIam,
                  style: context.textTheme.displayLarge!.copyWith(
                    color: context.custom.blue400,
                  ),
                ),
              ],
            ),
          ),
          AppLayout.gapH8,

          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              'Crafting production-ready mobile apps across Flutter, React Native, and Android Native — from architecture to store release.',
              style: context.textTheme.bodyMedium,
              maxLines: null,
            ),
          ),
          AppLayout.gapH20,

          // CTA row
          Row(
            children: [
              _ButtonPrimary(
                onPressed: () => _viewCv(context),
                child: Text(context.l10n.downloadCv),
              ),
              AppLayout.gapW10,
              _ButtonGhost(
                onPressed: () => _openContact(context),
                child: Text(context.l10n.contact),
              ),
            ],
          ),

          // Divider + Stat row
          Padding(
            padding: const EdgeInsets.only(top: AppLayout.statTopPad),
            child: Column(
              children: [
                Divider(
                  color: context.colors.outlineVariant,
                  thickness: AppLayout.dividerThick,
                ),
                AppLayout.gapH20,
                Wrap(
                  spacing: AppLayout.statGapH,
                  runSpacing: 8,
                  children: [
                    _StatItem(
                      number: '7+',
                      label: context.l10n.yearsExperience,
                    ),
                    _StatItem(number: '6', label: 'live on stores'),
                    _StatItem(number: '4', label: 'domains'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openContact(BuildContext context) async {
    final uri = Uri.parse('mailto:agusrahmadimido@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _viewCv(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
    try {
      final htmlContent = await rootBundle.loadString('assets/cv/cv.html');
      if (context.mounted) Navigator.of(context).pop();
      final blob = html.Blob(<String>[htmlContent], 'text/html');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, 'CV - Agus Rakhmadi Mido');
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.errorOccurred)));
      }
    }
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: context.textTheme.headlineSmall),
        Text(label, style: context.textTheme.bodySmall),
      ],
    );
  }
}

class _ButtonPrimary extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const _ButtonPrimary({this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primary,
        foregroundColor: context.custom.blue100,
        padding: const EdgeInsets.symmetric(
          vertical: AppLayout.btnPadV,
          horizontal: AppLayout.btnPadH,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.btnRadius),
        ),
        elevation: 0,
        textStyle: context.textTheme.labelLarge,
      ),
      child: child,
    );
  }
}

class _ButtonGhost extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const _ButtonGhost({this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: context.colors.outlineVariant,
          width: AppLayout.cardBorder,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppLayout.btnPadV,
          horizontal: AppLayout.btnPadH,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.btnRadius),
        ),
        textStyle: context.textTheme.labelLarge,
      ),
      child: child,
    );
  }
}
