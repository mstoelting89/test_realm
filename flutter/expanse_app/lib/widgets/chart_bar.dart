import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(Key key, this.label, this.spendingAmountPerc, this.spendingAmountTotal): super(key: key);

  final String label;
  final double spendingAmountPerc;
  final double spendingAmountTotal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 20,
        child: FittedBox(child: Text('\$${spendingAmountTotal.toStringAsFixed(0)}'))
      ),
      const SizedBox(height: 4,),
      SizedBox(
        height: 60,
        width: 10,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(220, 220, 220, 1),
            ),
          ),
          FractionallySizedBox(
            heightFactor: spendingAmountPerc,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
        ],
      ),
      ),
      const SizedBox(height: 4,),
      Text(label)
    ],);
  }
}
