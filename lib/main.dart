import 'package:flutter/foundation.dart' show LicenseEntryWithLineBreaks, LicenseRegistry;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final latoLicense = await rootBundle.loadString('assets/fonts/Lato/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Lato'], latoLicense);

    final jetBrainsMonoLicense = await rootBundle.loadString('assets/fonts/JetBrainsMono/OFL.txt');
    yield LicenseEntryWithLineBreaks(['JetBrains Mono'], jetBrainsMonoLicense);
  });

  runApp(const ProviderScope(child: DartAstNodeViewer()));
}
