import 'package:flexio_kvl/theme/flexio_theme.dart';
import 'package:flexio_kvl/util/locale/localization.dart';
import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class SimpleProviderWidget extends BaseThemeProviderWidget<FlexioTheme, Localization> {
  const SimpleProviderWidget({
    Widget Function(BuildContext context, FlexioTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, FlexioTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
