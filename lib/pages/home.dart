import 'package:eventapp/pages/monthly.dart';
import 'package:eventapp/pages/weekly.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(10,236,240,243),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WeeklyData()),
            );
          },
        ),
        title: Text(''),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
            onPressed: (){},
          ),
        ],
      ),
      body: Center(child: SafeArea(child: MonthlyData(),),),
      backgroundColor: Color.fromARGB(220,236,240,243),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(165,236,240,243),
        elevation: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: '',
              backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
            backgroundColor: Colors.black,
          )
        ],
        fixedColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(

        onPressed:(){ },
        child: new Icon(Icons.add),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: Colors.deepOrange,

      ),

    );
  }
}
