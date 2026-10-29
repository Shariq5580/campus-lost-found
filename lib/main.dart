import 'package:flutter/material.dart';

void main(){
  runApp(const LostFoundApp());
}

class LostFoundApp extends StatelessWidget{
  const LostFoundApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Campus Lost & Found',
      theme:ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor:Colors.teal),
        useMaterial3:true,
      ),
      home:const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  final List<Map<String,String>> items=const[
    {'name':'Student ID Card','location':'Library','status':'Lost','description':'A student identification card was reported missing in the library.'},
    {'name':'Black Backpack','location':'Cafeteria','status':'Found','description':'A black backpack was found near the cafeteria entrance.'},
    {'name':'Water Bottle','location':'Computer Lab','status':'Found','description':'A water bottle was found in the computer lab.'},
    {'name':'Wireless Earbuds','location':'Lecture Hall 2','status':'Lost','description':'Wireless earbuds were reported missing in Lecture Hall 2.'},
    {'name':'Notebook','location':'Room 101','status':'Found','description':'A notebook was found inside Room 101.'},
    {'name':'Mobile Phone','location':'Sports Ground','status':'Lost','description':'A mobile phone was reported missing near the sports ground.'},
    {'name':'Keys','location':'Main Gate','status':'Found','description':'A set of keys was found near the main gate.'},
    {'name':'Calculator','location':'Engineering Block','status':'Lost','description':'A calculator was reported missing in the engineering block.'},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Campus Lost & Found'),
        backgroundColor:Colors.teal,
        foregroundColor:Colors.white,
      ),
      body:ListView.builder(
        padding:const EdgeInsets.all(12),
        itemCount:items.length,
        itemBuilder:(context,index){
          final item=items[index];
          final isFound=item['status']=='Found';

          return Card(
            margin:const EdgeInsets.only(bottom:12),
            child:Padding(
              padding:const EdgeInsets.all(12),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(
                    item['name']!,
                    style:const TextStyle(
                      fontSize:18,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height:8),
                  Text('Location: ${item['location']}'),
                  const SizedBox(height:6),
                  Row(
                    children:[
                      const Text('Status: '),
                      Chip(
                        label:Text(item['status']!),
                        backgroundColor:isFound
                            ?Colors.green.shade100
                            :Colors.orange.shade100,
                      ),
                    ],
                  ),
                  Align(
                    alignment:Alignment.centerRight,
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(context)=>DetailsScreen(item:item),
                          ),
                        );
                      },
                      child:const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget{
  final Map<String,String> item;

  const DetailsScreen({super.key,required this.item});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Item Details'),
        backgroundColor:Colors.teal,
        foregroundColor:Colors.white,
      ),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            const Icon(
              Icons.inventory_2,
              size:70,
              color:Colors.teal,
            ),
            const SizedBox(height:20),
            Text(
              item['name']!,
              style:const TextStyle(
                fontSize:25,
                fontWeight:FontWeight.bold,
              ),
            ),
            const SizedBox(height:20),
            Text(
              'Location: ${item['location']}',
              style:const TextStyle(fontSize:17),
            ),
            const SizedBox(height:12),
            Text(
              'Status: ${item['status']}',
              style:const TextStyle(fontSize:17),
            ),
            const SizedBox(height:20),
            const Text(
              'Description',
              style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),
            const SizedBox(height:8),
            Text(
              item['description']!,
              style:const TextStyle(fontSize:16),
            ),
            const Spacer(),
            SizedBox(
              width:double.infinity,
              child:ElevatedButton(
                onPressed:()=>Navigator.pop(context),
                child:const Text('Back to Items'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
