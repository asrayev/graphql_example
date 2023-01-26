part of 'countries_bloc.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountryInProgress extends CountriesState {}

class CountryLoadSuccess extends CountriesState{
  final List<CountryModel> countries;
  CountryLoadSuccess({required this.countries});
}

class CountryLoadFailure extends CountriesState {}
