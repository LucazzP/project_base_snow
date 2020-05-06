import 'package:flutter/material.dart';
import 'package:project_sample_base/app/shared/config/flavor_config.dart';
import 'package:project_sample_base/app/shared/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import '../../models/banner_config_model.dart';

class FlavorBannerWidget extends StatelessWidget {
  final Widget child;
  final BannerConfigModel bannerConfig = BannerConfigModel(
    bannerName: FlavorConfig.instance.name,
    bannerColor: FlavorConfig.instance.color,
  );

  FlavorBannerWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction) return child;
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () => CustomAlertDialog.deviceInfo(context),
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: bannerConfig.bannerName.toUpperCase(),
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor,
          ),
        ),
      ),
    );
  }
}
