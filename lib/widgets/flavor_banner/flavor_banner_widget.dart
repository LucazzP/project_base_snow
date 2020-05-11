import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../config/flavor_config.dart';
import '../../widgets/custom_alert_dialog/custom_alert_dialog.dart';
import '../../models/banner_config_model.dart';

class FlavorBannerWidget extends StatelessWidget {
  final Widget child;
  final BannerConfigModel bannerConfig = BannerConfigModel(
    bannerName: FlavorConfig.name,
    bannerColor: FlavorConfig.color,
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
      onLongPress: () => CustomAlertDialog.deviceInfo(
          Modular.navigatorKey.currentState.overlay.context),
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
