import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_coin/repositories/abstract_cerrencies_lrepository.dart';
import 'package:multi_coin/theme/widgets/change_theme_button.dart';

import 'package:package_info_plus/package_info_plus.dart';

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

  String _version = '';
  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      _version = version;
    });
  }

  @override
  void initState() {
    _cryptoListBloc.add(LoadCerrenciesList());
    super.initState();
    _getVersion();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies List'),
      ),
      endDrawer: Drawer(
        backgroundColor: theme.cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Settings',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 0, 50, 100),
              child: Row(
                children: [
                  Text(
                    'Светлый',
                    style: theme.textTheme.bodyMedium,
                  ),
                  ChangeThemeButtonWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Text(
                  'App Version: $_version',
                  style: theme.textTheme.labelSmall,
                ),
              ),
            )
          ],
        ),
      ),
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
                      style: theme.textTheme.bodyMedium,
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
    );
  }
}
