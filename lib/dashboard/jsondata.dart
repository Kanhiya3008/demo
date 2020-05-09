import 'dart:convert';
import 'package:examapp/dashboard/HomePageDetail.dart';
//import 'package:parse_json/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // Membuat List Dari data Internet
  List<User> listModel = [];
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    final responseData = await http.get("https://jsonplaceholder.typicode.com/users");
    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for(Map i in data){
          listModel.add(User.fromJson(i));
        }
        loading = false;
      });
    }
  }
  //Panggil Data / Call Data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        child: loading ? Center (child: CircularProgressIndicator()) : ListView.builder(
            itemCount: listModel.length,
            itemBuilder: (context, i){
              final nDataList = listModel[i];
              return Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageDetail(
                      dName: nDataList.name,
                      dEmail: nDataList.email,
                      dPhone: nDataList.phone,
                      dCity: nDataList.address.city,
                      dZip: nDataList.address.zipcode,
                    )
                    )
                    );
                  },
                  child: Card(
                    color: Colors.amber[100],
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(nDataList.name, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green),
                          ),
                          Text(nDataList.email),
                          Text(nDataList.phone),
                          Text(nDataList.website),
                          SizedBox(height: 10,),
                          Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(nDataList.address.street),
                          Text(nDataList.address.city),
                          Text(nDataList.address.suite),
                          Text(nDataList.address.zipcode),
                          SizedBox(height: 10,),
                          Text("Company", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(nDataList.company.name),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

List<User> modelUserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String modelUserToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  String lat;
  String lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}


