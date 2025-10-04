import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windich/extensions/string.dart';
import 'package:windich/generated/app_localizations.dart';
import 'package:windich/helper.dart';
import 'package:windich/log.dart';
import 'package:windich/providers/secure_storage_provider.dart';

Future<void> showKeyInputDialog(BuildContext context, WidgetRef ref) async {
  final localizations = AppLocalizations.of(context);

  bool isObscured = true;
  final keyController = TextEditingController();
  keyController.text = ref.read(secureStorageProvider);

  final result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(localizations?.enterKey ?? ''),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return TextField(
              controller: keyController,
              autofocus: true,
              obscureText: isObscured,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                label: Text("${localizations?.key ?? ''} *"),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.question_mark),
                      onPressed: () {
                        browseTo(localizations?.keyUrl ?? '');
                      },
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          keyController.clear();
                        });
                      },
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      icon: Icon(
                        isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations?.cancel ?? ''),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, keyController.text),
            child: Text(localizations?.save ?? ''),
          ),
        ],
      );
    },
  );

  FocusManager.instance.primaryFocus?.unfocus(); // dismiss keyboard

  if (result != null) {
    if (!context.mounted) return Future.error('Widget disposed');
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    scaffold.clearSnackBars();

    if (result.trim().isEmpty) {
      ref.read(secureStorageProvider.notifier).removeKey();
      scaffold.showSnackBar(
        SnackBar(
          content: Text(localizations?.keyRemoved ?? ''),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      log.debug(
        'key entered: ${result.scramble()}',
        name: 'showKeyInputDialog',
      );
      ref.read(secureStorageProvider.notifier).setKey(result);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(localizations?.keySaved ?? ''),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
