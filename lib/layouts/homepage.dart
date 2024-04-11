import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:viticareworkers/layouts/qrscanner.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var desc = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pending Requests'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.star,color: Colors.orange,size: 40,),
                  Text("200",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
        body: Column(
        children: [
          Center(
              child: Column(
                children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Card(
                        shape:RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.deepOrange, width: 1.0),
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: InkWell(
                              onTap: (){
                                // _navigateToStoriesPage(context, index);
                              },
                              child: Text("Kamal Sushant\nM Block 234", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
                          trailing: InkWell(
                            onTap: (){
                              // _navigateToShowCommentsPage(context, index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("3:29PM",style: TextStyle(fontSize:15,color: Colors.black)),
                                )
                            ),
                          ),
                        ),
                      ),
                  Card(
                    shape:RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.deepOrange, width: 1.0),
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      title: InkWell(
                          onTap: (){
                            // _navigateToStoriesPage(context, index);
                          },
                          child: Text("Ayush Malhotra\nM Block 629", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
                      trailing: InkWell(
                        onTap: (){
                          // _navigateToShowCommentsPage(context, index);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            alignment: Alignment.center,
                            width: 100,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text("2:30PM",style: TextStyle(fontSize:15,color: Colors.black)),
                            )
                        ),
                      ),
                    ),
                  ),

                      Card(
                        shape:RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.deepOrange, width: 1.0),
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: InkWell(
                              onTap: (){
                                // _navigateToStoriesPage(context, index);
                              },
                              child: Text("Vivek Sinha\nM Block 824", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
                          trailing: InkWell(
                            onTap: (){
                              // _navigateToShowCommentsPage(context, index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("10:30AM",style: TextStyle(fontSize:15,color: Colors.black)),
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )],
              )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape:RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.deepOrange, width: 1.0),
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                title: InkWell(
                    onTap: (){
                      // _navigateToStoriesPage(context, index);
                    },
                    child: Text("History\n\n\n\n\n\n\n\n", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all( 50),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,fixedSize: Size(300, 50),),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>QRScanner()));
                }, icon: Icon(Icons.qr_code),
                label: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      children: [
                        TextSpan(text: 'Scan '),
                        TextSpan(
                            text:'QR',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(text: ' code '),

                      ]),
                )),
          ),
        ],

          ))
    ;
  }
}