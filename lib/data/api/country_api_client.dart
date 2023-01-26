import 'package:graphql/client.dart';
import '../models/country_model.dart';
import '../queries/queries.dart' as queries;
class GetJobsRequestFailure implements Exception {}

class CountryApiClient {
  const CountryApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory CountryApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return CountryApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }


  final GraphQLClient _graphQLClient;

  Future<List<CountryModel>> getCountries() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getCountries)),
    );
    if (result.hasException) throw GetJobsRequestFailure();
    final data = result.data?['countries'] as List;
    print("SUCCESS DATA:${result.data.toString()}");
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}