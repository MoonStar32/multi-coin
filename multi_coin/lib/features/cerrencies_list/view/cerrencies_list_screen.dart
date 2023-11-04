import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_coin/repositories/abstract_cerrencies_lrepository.dart';

import '../bloc/cerrencies_list_bloc.dart';
import '../widgets/cerrencies_tile.dart';

class CerrenciesListScreen extends StatefulWidget {
  const CerrenciesListScreen({
    super.key,
  });

  @override
  State<CerrenciesListScreen> createState() => _CerrenciesListScreenState();
}

class _CerrenciesListScreenState extends State<CerrenciesListScreen> {
  final _cryptoListBloc =
      CerrenciesListBloc(GetIt.I<AbstractCerrenciesRepository>());
  @override
  void initState() {
    _cryptoListBloc.add(LoadCerrenciesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Currencies Lsit')),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCerrenciesList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CerrenciesListBloc, CerrenciesListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CerrenciesListLoaded) {
              return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CerrenciesCoinTile(
                      coin: coin,
                    );
                  });
            }
            if (state is CerrenciesListLoadingFuilure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Somthing went wrong',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try again later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCerrenciesList());
                      },
                      child: const Text('Somthing went wrong'),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),

      // (_cryptoCoinsList == null)
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinsList!.length,
      //         separatorBuilder: (context, index) => const Divider(),
      //         itemBuilder: (context, i) {
      //           final coin = _cryptoCoinsList![i];
      //           return CryptoCoinTile(
      //             coin: coin,
      //           );
      //         }),
    );
  }
}
