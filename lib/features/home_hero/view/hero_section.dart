import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:your_experience/core/theme/app_colors.dart';
import 'package:your_experience/core/theme/app_layout.dart';
import 'package:your_experience/core/theme/app_text_styles.dart';
import 'package:your_experience/core/theme/responsive.dart';
import 'package:your_experience/features/home_hero/view_model/hero_vm.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(heroVmProvider);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.only(top: 60, bottom: AppLayout.statTopPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow
          Text('// flutter & mobile developer', style: AppTextStyles.eyebrow),
          AppLayout.gapH12,

          // Hero name
          RichText(
            text: TextSpan(
              text: "Hi, I'm ",
              style: AppTextStyles.heroName,
              children: [
                TextSpan(
                  text: vm.profile.hiIam,
                  style: AppTextStyles.heroNameAccent,
                ),
              ],
            ),
          ),
          AppLayout.gapH8,

          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              vm.profile.descriptionIam,
              style: AppTextStyles.heroDesc,
              maxLines: isMobile ? 3 : 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AppLayout.gapH20,

          // CTA row
          Row(
            children: [
              _ButtonPrimary(onPressed: _viewCv, child: const Text('View CV')),
              AppLayout.gapW10,
              _ButtonGhost(onPressed: () {}, child: const Text('Contact')),
            ],
          ),

          // Divider + Stat row
          Padding(
            padding: const EdgeInsets.only(top: AppLayout.statTopPad),
            child: Column(
              children: [
                const Divider(
                  color: AppColors.border,
                  thickness: AppLayout.dividerThick,
                ),
                AppLayout.gapH20,
                Wrap(
                  spacing: AppLayout.statGapH,
                  runSpacing: 8,
                  children: [
                    _StatItem(number: '5+', label: 'years experience'),
                    _StatItem(number: '10+', label: 'projects shipped'),
                    _StatItem(number: '3', label: 'platforms'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _viewCv() async {
    try {
      final htmlContent = await rootBundle.loadString('assets/cv/cv.html');
      final blob = html.Blob(<String>[htmlContent], 'text/html');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, 'CV - Agus Rakhmadi Mido');
    } catch (e) {
      debugPrint('CV load error: $e');
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
        Text(number, style: AppTextStyles.statNumber),
        Text(label, style: AppTextStyles.statLabel),
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
        backgroundColor: AppColors.blue600,
        foregroundColor: AppColors.blue100,
        padding: const EdgeInsets.symmetric(
          vertical: AppLayout.btnPadV,
          horizontal: AppLayout.btnPadH,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.btnRadius),
        ),
        elevation: 0,
        textStyle: AppTextStyles.btnPrimary,
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
        side: const BorderSide(
          color: AppColors.border,
          width: AppLayout.cardBorder,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppLayout.btnPadV,
          horizontal: AppLayout.btnPadH,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.btnRadius),
        ),
        textStyle: AppTextStyles.btnGhost,
      ),
      child: child,
    );
  }
}
