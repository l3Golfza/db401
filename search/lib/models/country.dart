import 'package:flutter/material.dart';

enum Continent {
  // ignore: constant_identifier_names
  Europe, Asia
}
class Country {
  static const _europe = <String>[
    'Russia',
    'Germany',
    'United Kingdom',
    'France',
    'Italy',
    'Spain',
    'Ukraine',
    'Poland',
    'Romania',
    'Netherlands',
    'Belgium',
    'Czech Republic (Czechia)',
    'Greece',
    'Portugal',
    'Sweden',
    'Hungary',
    'Belarus',
    'Austria',
    'Serbia',
    'Switzerland',
    'Bulgaria',
    'Denmark',
    'Finland',
    'Slovakia',
    'Norway',
    'Ireland',
    'Croatia',
    'Moldova',
    'Bosnia and Herzegovina',
    'Albania',
    'Lithuania',
    'North Macedonia',
    'Slovenia',
    'Latvia',
    'Estonia',
    'Montenegro',
    'Luxembourg',
    'Malta',
    'Iceland',
    'Andorra',
    'Monaco',
    'Liechtenstein',
    'San Marino',
    'Holy See',
  ];
  static const _asia = <String>[
    'China',
    'India',
    'Indonesia',
    'Pakistan',
    'Bangladesh',
    'Japan',
    'Philippines',
    'Vietnam',
    'Turkey',
    'Iran',
    'Thailand',
    'Myanmar',
    'South Korea',
    'Iraq',
    'Afghanistan',
    'Saudi Arabia',
    'Uzbekistan',
    'Malaysia',
    'Yemen',
    'Nepal',
    'North Korea',
    'Sri Lanka',
    'Kazakhstan',
    'Syria',
    'Cambodia',
    'Jordan',
    'Azerbaijan',
    'United Arab Emirates',
    'Tajikistan',
    'Israel',
    'Laos',
    'Lebanon',
    'Kyrgyzstan',
    'Turkmenistan',
    'Singapore',
    'Oman',
    'State of Palestine',
    'Kuwait',
    'Georgia',
    'Mongolia',
    'Armenia',
    'Qatar',
    'Bahrain',
    'Timor-Leste',
    'Cyprus',
    'Bhutan',
    'Maldives',
    'Brunei',
  ];

  final Continent continent;

  const Country(this.continent);

  List<ListTile> suggest(String prefix) {
    Iterable<String> src = (continent == Continent.Europe ? _europe : _asia).where((element) => element.toLowerCase().startsWith(prefix.toLowerCase()));
    List<ListTile> result = [];
    for(String item in src) {
      result.add(ListTile(
        title: Text(item)
      ));
    }
    return result;
  }
}