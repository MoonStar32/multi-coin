import 'package:flutter/material.dart';
import 'cerrenciesListApp.dart';
import 'package:get_it/get_it.dart';
import 'repositories/abstract_cerrencies_lrepository.dart';
import 'repositories/cerrencies_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCerrenciesRepository>(
      () => CerrenciesRepository());
  runApp(const CerrenciesListApp());
}
