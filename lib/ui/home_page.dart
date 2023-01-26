import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/countries_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    return Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.countries[index].name.length < 13 ? Text("${state.countries[index].name}", style: const TextStyle(color: Colors.white),) : Text("${state.countries[index].name}".substring(0,13), style: const TextStyle(color: Colors.white),),
                                Container(
                                  height: 25,
                                  width: 90,
                                  child:

                                  Image.network("https://countryflagsapi.com/png/${state.countries[index].code}")
                                      // :Image.network("https://countryflagsapi.com/png/white") ,
                                )

                              ],
                            ),
                          )),
                    );

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
