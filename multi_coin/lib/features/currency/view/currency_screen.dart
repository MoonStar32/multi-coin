import 'package:flutter/material.dart';
import 'package:multi_coin/features/currency/widgets/cerrencies_tile.dart';
import 'package:multi_coin/repositories/models/cerrencies_model.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyCoin? coin;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
        args != null && args is CurrencyCoin, "'You must provide String args");

    coin = args as CurrencyCoin;
    setState(() {
      super.didChangeDependencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coin'),
        ),
        body: Column(
          children: [
            BaseCard(
                child: Center(
              child: BaseCard(
                child: Center(
                  child: Text(
                    '${coin!.sense}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )),
            BaseCard(
                child: Center(
              child: BaseCard(
                child: Center(
                  child: Text(
                    '${coin!.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )),
            BaseCard(
              child: Center(
                child: Text(
                  '${coin!.price} \₽',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';

// import '../../../repositories/cerrencies.dart';
// import '../bloc/currency_details_bloc.dart';

// class CurrencyScreen extends StatefulWidget {
//   const CurrencyScreen({
//     super.key,
//     this.coin,
//   });

//   final CurrencyCoin? coin;

//   @override
//   State<CurrencyScreen> createState() => _CurrencyScreenState();
// }

// class _CurrencyScreenState extends State<CurrencyScreen> {
//   CurrencyCoin? coin;

//   final _coinDetailsBloc = CurrencyCoinDetailsBloc(
//     GetIt.I<AbstractCerrenciesRepository>(),
//   );

//   @override
//   void initState() {
//     _coinDetailsBloc.add(LoadCurrencyCoinDetails(currencyCode: CurrencyCoin.coi));
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     final args = ModalRoute.of(context)?.settings.arguments;
//     assert(
//         args != null && args is CurrencyCoin, 'You must provide String args');
//     coin = args as CurrencyCoin;
//     _coinDetailsBloc.add(LoadCurrencyCoinDetails(currencyCode: coin!.name));
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<CurrencyCoinDetailsBloc, CurrencyCoinDetailsState>(
//         bloc: _coinDetailsBloc,
//         builder: (context, state) {
//           if (state is CurrencyCoinDetailsLoaded) {
//             final coin = state.coinDetails;
//             final coinDetails = coin.sense;
//             return Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 160,
//                     width: 160,
//                     child: Text(coin.name),
//                   ),
//                   const SizedBox(height: 24),
//                   Text(
//                     coin.name,
//                     style: const TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     child: Center(
//                       child: Text(
//                         '${coin.price} \$',
//                         style: const TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

// class _DataRow extends StatelessWidget {
//   const _DataRow({
//     required this.title,
//     required this.value,
//   });

//   final String title;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(width: 140, child: Text(title)),
//         const SizedBox(width: 32),
//         Flexible(
//           child: Text(value),
//         ),
//       ],
//     );
//   }
// }
