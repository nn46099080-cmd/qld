// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

final Set<String> _registeredViewTypes = <String>{};

bool get supportsAdsensePlatformView => true;

void registerAdsenseBannerViewFactory({
  required String viewType,
  required String clientId,
  required String slotId,
  required double width,
  required double height,
}) {
  if (_registeredViewTypes.contains(viewType)) return;
  _registeredViewTypes.add(viewType);

  ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
    final wrapper = html.DivElement()
      ..style.width = '100%'
      ..style.height = '${height}px'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.justifyContent = 'center'
      ..style.overflow = 'hidden'
      ..style.background = 'transparent';

    if (slotId.trim().isEmpty) {
      return wrapper;
    }

    final ad = html.Element.tag('ins')
      ..classes.add('adsbygoogle')
      ..style.display = 'inline-block'
      ..style.width = '${width}px'
      ..style.height = '${height}px';
    ad.setAttribute('data-ad-client', clientId);
    ad.setAttribute('data-ad-slot', slotId);
    ad.setAttribute('data-full-width-responsive', 'false');
    wrapper.append(ad);

    unawaited(
      Future<void>.delayed(Duration.zero, () {
        final script = html.ScriptElement()
          ..text = '''
try {
  (window.adsbygoogle = window.adsbygoogle || []).push({});
} catch (error) {
  console.warn('AdSense push failed:', error);
}
''';
        wrapper.append(script);
      }),
    );

    return wrapper;
  });
}
