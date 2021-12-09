

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
 class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key}) : super(key: key);
 
   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {
  var points = <latlng.LatLng>[
      latlng.LatLng(41.685745, -73.6617),
    latlng.LatLng(40.696011,  -73.993286),
    latlng.LatLng(40.3485, -74.6617),

  ];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: () {},
         child:const Icon(Icons.location_on),

       ),
       appBar: AppBar(
         title:const Text('MapBox'),
       ),
       body: Stack(
         children: [Column(
           children: [
             Expanded(
               flex: 2,
               child: FlutterMap(
                 options: MapOptions(
                   center:latlng.LatLng(41.685745, -73.6617),
                   zoom: 8.0,
                 ),
                 layers: [
                   TileLayerOptions(
                     urlTemplate: "https://api.mapbox.com/styles/v1/kelvinfresh/ckwyqkxo60auo15qax5asthgs/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2VsdmluZnJlc2giLCJhIjoiY2t3eXExMmx3MGFjMjJ2bnl2cG05dDJiZiJ9.vNPPS4qdfY8DcySFIoq6Uw",
                     additionalOptions: {
                       "accessTokens" : "pk.eyJ1Ijoia2VsdmluZnJlc2giLCJhIjoiY2t3eXExMmx3MGFjMjJ2bnl2cG05dDJiZiJ9.vNPPS4qdfY8DcySFIoq6Uw",
                       'id' : 'mapbox.mapbox-streets-v8',
                     },
                     attributionBuilder: (_) {
                       return Text("© OpenStreetMap contributors");
                     },
                   ),
                   MarkerLayerOptions(
                     markers: [
                       Marker(
                         width: 80.0,
                         height: 80.0,
                         point: latlng.LatLng(40.696011,  -73.993286),
                         builder: (ctx) =>
                                 Container(
                                   child: IconButton(
                                     icon:const Icon(Icons.local_shipping),
                                     onPressed: (){},
                                     color: Colors.red,
                                     iconSize: 45.0,
                                   ),
                                 ),

                       ),
                       Marker(
                         width: 80.0,
                         height: 80.0,
                         point: latlng.LatLng(40.3485, -74.6617),
                         builder: (ctx) =>
                             Container(
                               child: IconButton(
                                 icon:const Icon(Icons.pin_drop),
                                 onPressed: (){},
                                 color: Colors.red,
                                 iconSize: 45.0,
                               ),
                             ),

                       ),
                       Marker(
                         width: 80.0,
                         height: 80.0,
                         point: latlng.LatLng(41.685745, -73.6617),
                         builder: (ctx) =>
                             Container(
                               child: IconButton(
                                 icon:const Icon(Icons.gps_fixed),
                                 onPressed: (){},
                                 color: Colors.blue,
                                 iconSize: 45.0,
                               ),
                             ),

                       ),

                     ],
                   ),
                   PolylineLayerOptions(
                     polylines: [
                       Polyline(
                           points: points,
                           strokeWidth: 2.0,
                         color: Colors.green,
                       )
                     ]
                   )
                 ],
               ),
             ),

           ],
         ),
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   keyboardType: TextInputType.streetAddress,
                   decoration: const InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                       prefixIcon: Icon(Icons.location_searching),
                     hintText: 'My Location',
                     suffixIcon: Icon(Icons.search),
                     border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight:Radius.circular(10),bottomLeft: Radius.circular(10),),)
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   keyboardType: TextInputType.streetAddress,
                   decoration: const InputDecoration(
                       fillColor: Colors.white,
                       filled: true,
                        prefixIcon: Icon(Icons.pin_drop),
                       hintText: 'Final Destination',
                       suffixIcon: Icon(Icons.search),
                       border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight:Radius.circular(10),bottomLeft: Radius.circular(10),),)
                   ),
                 ),
               ),
             ],
           )
         ]
       ),
     );
   }
 }
 