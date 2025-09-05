import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CThemeCubit extends HydratedCubit<ThemeMode> {
  CThemeCubit(): super(ThemeMode.system);

  void updateTheme(ThemeMode mode) => emit(mode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    throw UnimplementedError();
  }
}