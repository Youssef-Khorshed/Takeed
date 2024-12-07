import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flghtRequestModel.dart';

class Appstrings {
  static String airPortsSuggestions({required String keyword}) =>
      'http://api.taiiar.com/api/v1/air/utilities/airport-city-localized-search-by-keyword?keyword=$keyword';

  static String searchFlights(
          {required String originLocationCode,
          required String destinationLocationCode,
          required String departureDate,
          required String returnDate,
          required String adults,
          required String currencyCode,
          required String children,
          required String infants,
          required String max}) =>
'ADD your API'
  static String createFilghtUrl =
'App your API';
  static Map<String, dynamic> createFilghtParameters(
          {required FlightRequest flightRequest,
          required List<Travelers> travelers,
          required Remarks remarks,
          required List<Contacts> contacts,
          required TicketingAgreement ticketingAgreement}) =>
      {
        "data": {
          "type": "<string>",
          "flightOffers": [flightRequest.toJson()],
          "travelers": [for (var element in travelers) element.toJson()],
          "remarks": remarks.toJson(),
          "contacts": [for (var contract in contacts) contract.toJson()],
          "ticketingAgreement": ticketingAgreement.toJson()
        }
      };

  static Map<String, List<String>> routes = {
    'ACV': ['UA', 'TP'], // Arcata-Eureka
    'ORY': ['TP', 'AF', 'BA'], // Paris Orly
    'SFO': ['UA', 'AA', 'DL', 'VX'], // San Francisco
    'LIS': ['TP', 'AF', 'LH', 'IB'], // Lisbon
    'JFK': ['AA', 'DL', 'BA', 'VS'], // New York JFK
    'LAX': ['AA', 'DL', 'UA', 'WN'], // Los Angeles
    'CDG': ['AF', 'DL', 'VA', 'KL'], // Paris Charles de Gaulle
    'ORD': ['UA', 'AA', 'DL', 'SW'], // Chicago O'Hare
    'DFW': ['AA', 'DL', 'WN'], // Dallas/Fort Worth
    'ATL': ['DL', 'AA', 'WN'], // Atlanta
    'MIA': ['AA', 'DL', 'IB'], // Miami
    'YYZ': ['AC', 'WS', 'DL'], // Toronto Pearson
    'LHR': ['BA', 'AA', 'VS'], // London Heathrow
    'HND': ['NH', 'JL', 'DL'], // Tokyo Haneda
    'NRT': ['NH', 'JL', 'AA'], // Tokyo Narita
    'SYD': ['QF', 'VA', 'NZ'], // Sydney
    'AKL': ['NZ', 'QF', 'VA'], // Auckland
    'CUN': ['AA', 'DL', 'UA'], // Cancun
    'BOS': ['AA', 'DL', 'WN'], // Boston
    'BKK': ['TG', 'QR', 'EK'], // Bangkok
    'SIN': ['SQ', 'JL', 'QF'], // Singapore
    'DXB': ['EK', 'EY', 'GF'], // Dubai
    'HKG': ['CX', 'UA', 'NH'], // Hong Kong
    'SVO': ['SU', 'AY'], // Moscow Sheremetyevo
    'FCO': ['AZ', 'AF', 'BA'], // Rome Fiumicino
    'MAD': ['IB', 'AF', 'LH'], // Madrid
    'BRU': ['SN', 'AF', 'BA'], // Brussels
    'ZRH': ['LX', 'AF', 'BA'], // Zurich
    'MUC': ['LH', 'AA', 'DL'], // Munich
    'WAW': ['LO', 'LH'], // Warsaw
    'IST': ['TK', 'LH', 'AF', 'BA'], // Istanbul
    'DEL': ['AI', 'UA', 'DL'], // Delhi
    'BOM': ['AI', 'BA', 'EK'], // Mumbai
    'KUL': ['MH', 'AA', 'QF'], // Kuala Lumpur
    'CPT': ['BA', 'AF', 'KL'], // Cape Town
    'JNB': ['SA', 'BA', 'KL'], // Johannesburg
    'ADD': ['ET', 'LX'], // Addis Ababa
    'MNL': ['PR', 'JL', 'NH'], // Manila
    'CGK': ['GA', 'NH', 'QF'], // Jakarta
    'ICN': ['KE', 'UA', 'NH'], // Seoul Incheon
    'TPE': ['CI', 'BR', 'NH'], // Taipei
    'HNL': ['HA', 'AA'], // Honolulu
    'LAS': ['AA', 'DL', 'WN'], // Las Vegas
    'PHX': ['AA', 'DL'], // Phoenix
    // Middle East Routes
    'DOH': ['QR', 'WY', 'GF'], // Doha
    'BAH': ['GF', 'BA', 'RJ'], // Bahrain
    'MCT': ['WY', 'AF', 'EY'], // Muscat
    'AMM': ['RJ', 'DL', 'BA'], // Amman
    'TLV': ['LY', 'AA', 'UA'], // Tel Aviv
    'KWI': ['KU', 'QR', 'EY'], // Kuwait City
    'RUH': ['SV', 'QR'], // Riyadh
    'JED': ['SV', 'EY', 'QR'], // Jeddah
    'MED': ['SV', 'EY', 'QR'], // Madinah
    'SHJ': ['G9', 'EK'], // Sharjah
    'AUH': ['EY', 'QR'], // Abu Dhabi
    'AAN': ['FI', 'EY'], // Al Ain
    'BHD': ['GF'], // Bahrain
    'SCT': ['PK', 'GK'], // Skardu
    'ISB': ['PK', 'EY', 'SV'], // Islamabad
    'LHE': ['PK', 'EY'], // Lahore
    'DAC': ['BG', 'TK'], // Dhaka
    'CMB': ['UL', 'AI'], // Colombo
    'KBL': ['WY', 'TK'], // Kabul
    'DMM': ['SV', 'QR'], // Dammam
    'JUI': ['SV', 'EY'], // Jizan
    'RAK': ['AT', 'UX'], // Marrakech
    'TUN': ['TU', 'LH'], // Tunis
    'CMN': ['AT', 'IB'], // Casablanca
    'ALG': ['AH', 'BA'], // Algiers
    'TLN': ['AF', 'AZ'], // Toulouse
    'BEY': ['ME', 'QR'], // Beirut
    'DAM': ['SY', 'RJ'], // Damascus
    'SYY': ['KH', 'EY'], // Al Sayed
    'BHG': ['GF', 'BA'], // Bahrain
    // Egypt Routes
    'CAI': ['MS', 'AA', 'EY'], // Cairo
    'HRG': ['MS', 'TU', 'NL'], // Hurghada
    'SSH': ['MS', 'TU', 'RY'], // Sharm El Sheikh
    'LXR': ['MS', 'FZ', 'WY'], // Luxor
    'ASW': ['MS', 'AT'], // Aswan
    'PTN': ['MS', 'TL'], // Port Said
    'SME': ['MS', 'FZ'], // Suez
    'ALY': ['MS', 'FZ'], // Alexandria
    'DMT': ['MS', 'FZ'], // Damietta
    // Saudi Arabia Routes
    'AHB': ['SV', 'FZ'], // Abha
    'GIZ': ['SV', 'FZ'], // Gizan
    'TUU': ['SV', 'WY'], // Turaif
    'QTY': ['SV', 'FZ'], // Qatif
    'HOF': ['SV', 'WY'], // Hofuf
    'NEA': ['SV', 'FZ'], // Neom Bay
    'BHH': ['SV', 'FZ'], // Al Bahah
    'YEN': ['SV', 'FZ'], // Yenbo
    // Additional airlines and routes can be added here
  };
  static Map<String, String> airlineCodes = {
    'AA': 'American Airlines',
    'AE': 'American Eagle',
    'AF': 'Air France',
    'AG': 'Avianca El Salvador',
    'AI': 'Air India',
    'AK': 'Alaska Airlines',
    'AM': 'Aeroméxico',
    'AN': 'Anguilla Air Services',
    'AS': 'Alaska Airlines',
    'AT': 'Royal Air Maroc',
    'AV': 'Avianca',
    'AY': 'Finnair',
    'AZ': 'Alitalia',
    'B6': 'JetBlue Airways',
    'BA': 'British Airways',
    'BD': 'bmi British Midland',
    'BE': 'Flybe',
    'BF': 'Blue Islands',
    'BG': 'Biman Bangladesh Airlines',
    'BH': 'Bahrain Air',
    'BI': 'Royal Brunei Airlines',
    'BR': 'EVA Air',
    'BS': 'Bahamasair',
    'BT': 'airBaltic',
    'BX': 'Air Busan',
    'C3': 'Cargolux',
    'CA': 'Air China',
    'CB': 'Cambodia Angkor Air',
    'CC': 'Air Tahiti',
    'CE': 'Chadian Air Transport',
    'CI': 'China Airlines',
    'CM': 'Copa Airlines',
    'CO': 'Continental Airlines',
    'CX': 'Cathay Pacific',
    'D7': 'AirAsia X',
    'DA': 'Delta Air Lines',
    'DD': 'Nok Air',
    'DL': 'Delta Air Lines',
    'DN': 'Danish Air Transport',
    'DZ': 'Aero Mongolia',
    'EA': 'Eastern Air Lines',
    'EK': 'Emirates',
    'ET': 'Ethiopian Airlines',
    'EY': 'Etihad Airways',
    'F9': 'Frontier Airlines',
    'FI': 'Icelandair',
    'FL': 'AirTran Airways',
    'FM': 'Shanghai Airlines',
    'FR': 'Ryanair',
    'GA': 'Garuda Indonesia',
    'G8': 'GoAir',
    'GF': 'Gulf Air',
    'GQ': 'Sky Regional Airlines',
    'GY': 'Guyana Airways',
    'H4': 'Hainan Airlines',
    'HA': 'Hawaiian Airlines',
    'HL': 'Hellas Air',
    'IB': 'Iberia',
    'IG': 'Alitalia',
    'IS': 'Icelandair',
    'JA': 'Japan Airlines',
    'JL': 'Japan Airlines',
    'JP': 'Adria Airways',
    'K1': 'Jetstar Japan',
    'KQ': 'Kenya Airways',
    'LA': 'LATAM Airlines',
    'LH': 'Lufthansa',
    'LO': 'LOT Polish Airlines',
    'LY': 'El Al',
    'MA': 'Malta Air',
    'MH': 'Malaysia Airlines',
    'MK': 'Air Mauritius',
    'MS': 'EgyptAir',
    'MU': 'China Eastern Airlines',
    'NH': 'All Nippon Airways (ANA)',
    'NL': 'Norse Atlantic Airways',
    'NX': 'Cebu Pacific',
    'NZ': 'Air New Zealand',
    'O6': 'Olympic Air',
    'OS': 'Austrian Airlines',
    'OU': 'Croatia Airlines',
    'OZ': 'Asiana Airlines',
    'P2': 'Papua New Guinea Airlines',
    'PX': 'Air Niugini',
    'QF': 'Qantas',
    'QR': 'Qatar Airways',
    'RB': 'Sudan Airways',
    'RG': 'Varig',
    'RJ': 'Royal Jordanian',
    'S7': 'Siberia Airlines',
    'SK': 'Scandinavian Airlines',
    'SL': 'Thai Lion Air',
    'SQ': 'Singapore Airlines',
    'SU': 'Aeroflot',
    'SV': 'Saudia',
    'TA': 'Tunisair',
    'TK': 'Turkish Airlines',
    'TP': 'TAP Air Portugal',
    'TS': 'Air Transat',
    'UA': 'United Airlines',
    'UX': 'Air Europa',
    'VA': 'Virgin Australia',
    'VS': 'Virgin Atlantic',
    'W6': 'Wizz Air',
    'WN': 'Southwest Airlines',
    'WY': 'Oman Air',
    'XZ': 'Flynas',
    'ZM': 'Zambezi Airlines',
    'AC': 'Air Canada',
    'AB': 'Air Berlin',
    'AD': 'Azul Brazilian Airlines',
    'AH': 'Air Algérie',
    'B2': 'Belavia',
    'C5': 'Chad Air',
    'D0': 'Danish Air Transport',
    'D8': 'Dart Airlines',
    'E1': 'E1 Airlines',
    'F4': 'Fastjet',
    'G5': 'Gulf Air',
    'H2': 'Horizon Air',
    'I6': 'Iceland Express',
    'J8': 'JetAmerica',
    'K5': 'Kansai Airlines',
    'K7': 'KLM Cityhopper',
    'M3': 'Mango Airlines',
    'MF': 'Xiamen Airlines',
    'P8': 'Palestinian Airlines',
    'R1': 'Royal Air Maroc',
    'S5': 'Siberia Airlines',
    'TB': 'TUI fly Belgium',
    'U2': 'easyJet',
    'VY': 'Vueling',
    'WS': 'WestJet',
    'ZY': 'Sky Airlines',
    'XJ': 'Thai Airways International',
    // Additional airlines can be added here
  };
}
