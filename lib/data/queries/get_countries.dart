const getCountries = '''
  query GetCountries() {
    countries {
    name
    native
    capital
    emoji
    currency
    }
  }
''';