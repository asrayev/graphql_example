import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../data/api/country_api_client.dart';
import '../data/models/country_model.dart';
part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {

  CountriesBloc({required CountryApiClient countryApiClient})
      : _countryApiClient = countryApiClient,
        super(CountryInProgress()) {
    on<CountryFetchStarted>(_onCountryFetchStarted);
  }

  final CountryApiClient _countryApiClient;

  Future<void> _onCountryFetchStarted(CountryFetchStarted event, Emitter<CountriesState> emit) async {
    emit(CountryInProgress());
    try {
      print("0000000");
      final countries = await _countryApiClient.getCountries();
      print("111111111");
      emit(CountryLoadSuccess(countries: countries));
      print("22222");
    } catch (error) {
      print("EEEERRRRROOOOORRR: $error}");
      emit(CountryLoadFailure());
    }
  }


}
