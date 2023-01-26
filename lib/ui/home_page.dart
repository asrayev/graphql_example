import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/countries_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CountriesBloc, CountriesState>(
        listener: (context, state){},
            builder: (context, state){
          if (state is CountryInProgress){
            return const CircularProgressIndicator();
          }
          if (state is CountryLoadSuccess){
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: state.countries.length,
                  itemBuilder: (context, index){
                    return Text("${state.countries[index].name}");

              }),
            );
          }
          if (state is CountryLoadFailure){
            return const Text("Fail");
          }
          else {
            return const Text("Bilmadim");
          }


     }
    ),
      )
    );
  }
}
