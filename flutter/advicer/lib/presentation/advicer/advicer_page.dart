import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/application/theme/theme_service.dart';
import 'package:advicer/presentation/advicer/widgets/advice_field.dart';
import 'package:advicer/presentation/advicer/widgets/advice_page_body.dart';
import 'package:advicer/presentation/advicer/widgets/custom_button.dart';
import 'package:advicer/presentation/advicer/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Visibility(
            visible: !Provider.of<ThemeService>(context).useSystemTheme,
            child: Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false).toggleTheme();
                }),
          ),
          const Text("System: "),
          Switch(
              value: Provider.of<ThemeService>(context).useSystemTheme,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleUseSystemTheme();
              }),
        ],
        title: Text(
          "Advicer",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: const AdvicePageBody(),
    );
  }
}
