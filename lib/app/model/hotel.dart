import 'package:intl/intl.dart';

class Hotel {
  final String name;
  final String city;
  final String address;
  final int grade;
  final int price;
  final String image;
  final HotelType type;

  Hotel({
    required this.name,
    required this.city,
    required this.address,
    required this.grade,
    required this.price,
    required this.image,
    this.type = HotelType.hotel,
  });

  String getPrice() {
    var f = NumberFormat.currency(locale: "en_US", symbol: "IDR ", decimalDigits: 0);
    return f.format(price);
  }
}

enum HotelType { hotel, villa }

List<Hotel> initialHotel() => [
      Hotel(
        name: "favehotel Braga",
        city: "Bandung",
        address: "Jl. Braga No. 99-101",
        grade: 3,
        price: 739200,
        image: "favehotel-braga.jpeg",
      ),
      Hotel(
        name: "favehotel Hyper Square Bandung",
        city: "Bandung",
        address: "Paskal Hyper Square, Jl. Pasir Kaliki No. 25 - 27",
        grade: 3,
        price: 540000,
        image: "favehotel-hyper-square.jpeg",
      ),
      Hotel(
        name: "favehotel Premier Cihampelas",
        city: "Bandung",
        address: "Jl. Cihampelas No.129, Cipaganti",
        grade: 3,
        price: 832000,
        image: "favehotel-cihampelas.jpeg",
      ),
      Hotel(
        name: "favehotel Gatot Subroto Jakarta",
        city: "Jakarta",
        address: "Jl. Kartika Candra, Karet Semanggi",
        grade: 3,
        price: 504700,
        image: "favehotel-gatot.jpeg",
      ),
      Hotel(
        name: "favehotel PGC Cililitan",
        city: "Jakarta",
        address: "Jl. Mayjen Sutoyo No.76, RT.2/RW.13, Cililitan",
        grade: 3,
        price: 404629,
        image: "favehotel-pgc.jpeg",
      ),
      Hotel(
        name: "The Alana Hotel & Conference Center",
        city: "Bogor",
        address: "Jl. Ir H Juanda No.76, Citaringgul",
        grade: 4,
        price: 1562500,
        image: "alana-sentul.jpg",
      ),
      Hotel(
        name: "The Alana Yogyakarta Hotel & Convention",
        city: "Yogyakarta",
        address: "Jl. Palagan Tentara Pelajar No.KM.7",
        grade: 4,
        price: 810000,
        image: "alana-yogya.jpeg",
      ),
      Hotel(
        name: "ASTON Pasteur",
        city: "Bandung",
        address: "Jl. Dr. Djunjunan No.162",
        grade: 4,
        price: 1051650,
        image: "aston-pasteur.jpeg",
      ),
      Hotel(
        name: "ASTON Tropicana",
        city: "Bandung",
        address: "Jl. Cihampelas No.125 - 127, Cipaganti",
        grade: 4,
        price: 1300653,
        image: "aston-tropicana.jpeg",
      ),
      Hotel(
        name: "Kamuela Villas Seminyak",
        city: "Bali",
        address: "Jl. Bali Deli No.88, Seminyak",
        grade: 5,
        price: 1993249,
        image: "kamuela.jpeg",
        type: HotelType.villa,
      ),
    ];
