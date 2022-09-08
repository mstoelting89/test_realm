import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/advicer/advicer_bloc.dart';
import 'advice_field.dart';
import 'custom_button.dart';
import 'error_message.dart';

class AdvicePageBody extends StatelessWidget {
  const AdvicePageBody({Key? key}) : super(key: key);

  static const advicerFieldKey = Key("advicerFieldKey");
  static const errorFieldKey = Key("errorFieldKey");
  static const initTextKey = Key("initTextKey");
  static const customButtonKey = Key("customButtonKey");

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: BlocBuilder<AdvicerBloc, AdvicerState>(
                    bloc: BlocProvider.of<AdvicerBloc>(context),
                    //..add(AdvicerRequestedEvent()), => für initiales Event
                    builder: (context, adviceState) {
                      if (adviceState is AdvicerInitial) {
                        return Text(
                          key: initTextKey,
                          "Your Advice is waiting for you!",
                          style: themeData.textTheme.headline1,
                        );
                      } else if (adviceState is AdvicerStateLoading) {
                        return CircularProgressIndicator(
                            color: themeData.colorScheme.secondary);
                      } else if (adviceState is AdvicerStateLoaded) {
                        return AdviceField(
                          key: advicerFieldKey,
                          advice: adviceState.advice,
                        );
                      } else if (adviceState is AdvicerStateError) {
                        return ErrorMessage(
                          key: errorFieldKey,
                          message: adviceState.message,
                        );
                      }
                      return const Placeholder();
                    },
                  )),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(
                  key: customButtonKey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
