import 'package:flutter/material.dart';
import 'package:windig/common.dart';
import 'package:windig/generated/app_localizations.dart';
import 'package:windig/helper.dart';

String _getLegalese() {
  final int currentYear = DateTime.now().year;

  final prefix = (Common.appStartYear == currentYear)
      ? ''
      : '${Common.appStartYear}-';

  return '\u00a9 $prefix$currentYear by lttl.dev';
}

class AppIconSmall extends StatelessWidget {
  const AppIconSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(children: [Image.asset('assets/icon/icon-small.png')]),
    );
  }
}

Future<void> showWindigAboutDialog(BuildContext context) async {
  final localizations = AppLocalizations.of(context);
  final language = Localizations.localeOf(context).languageCode;

  final aboutDialog = AboutDialog(
    applicationName: Common.appName,
    applicationVersion: "v${Common.appVersion} (Build #${Common.buildNumber})",
    applicationIcon: AppIconSmall(),
    applicationLegalese: _getLegalese(),
    children: [
      Logo(),
      Text(
        textAlign: TextAlign.center,
        '\n${localizations?.motto ?? ''}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontStyle: FontStyle.italic,
        ),
      ),
      Wrap(
        children: [
          TextButton(
            onPressed: () => browseTo('${Url.disclaimer}_$language'),
            child: Text(
              localizations?.disclaimer ?? '',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.primary,
                decorationColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          TextButton(
            onPressed: () => browseTo('${Url.privacy}_$language'),
            child: Text(
              localizations?.privacyPolicy ?? '',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.primary,
                decorationColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    ],
  );

  showAboutDialog(
    context: context,
    children: [
      ...aboutDialog.children!,
      Padding(
        padding: const EdgeInsets.only(top: Style.space),
        child: Text(
          aboutDialog.applicationLegalese ?? '',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
    applicationName: aboutDialog.applicationName,
    applicationVersion: aboutDialog.applicationVersion,
    applicationIcon: aboutDialog.applicationIcon,
    applicationLegalese:
        null, // Prevent default legalese rendering in both, about dialog and view licenses dialog
  );
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        browseTo(Url.dev);
      },
      child: Image.asset('assets/images/logo.png', height: Style.bigSpace),
    );
  }
}

Future<void> showAlertDialogOK(
  BuildContext context,
  String title,
  String content,
) async {
  final localizations = AppLocalizations.of(context);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[Text(content)]),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(localizations?.ok ?? 'OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
