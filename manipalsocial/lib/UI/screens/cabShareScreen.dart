import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:manipalsocial/UI/widgets/infoCard.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/cabShareViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class CabShareScreen extends StatefulWidget {
  @override
  _CabShareScreenState createState() => _CabShareScreenState();
}

class _CabShareScreenState extends State<CabShareScreen> {
  DateTime selectedDate;
  String to = "manipal";
  String from = "manglore";
  var cabViewModel;

  @override
  Widget build(BuildContext context) {
    cabViewModel = Provider.of<CabViewModel>(context);
    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cab Share',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffFC2E7E)),
        ),
        backgroundColor: Color(0xff131132),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff131132),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/cab.png'),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Want to share cab ?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('From',
                          style: TextStyle(
                              color: Color(0xff1B90CE), fontSize: 20)),
                      DropdownButton<String>(
                        dropdownColor: Color(0xff1D1D3E),
                        value: to,
                        elevation: 16,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        underline: Container(
                          color: Colors.pinkAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            to = newValue;
                          });
                        },
                        items: <String>['manipal', 'manglore', 'udupi']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('To',
                          style: TextStyle(
                              color: Color(0xff1B90CE), fontSize: 20)),
                      DropdownButton<String>(
                        dropdownColor: Color(0xff1D1D3E),
                        value: from,
                        elevation: 16,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        underline: Container(
                          color: Colors.pinkAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            from = newValue;
                          });
                        },
                        items: <String>['manipal', 'manglore', 'udupi']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
              PinkButton(
                  buttonText: 'Pick Date',
                  onPress: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2030, 10, 7),
                        theme: DatePickerTheme(
                          backgroundColor: Color(0xff1D1D3E),
                          cancelStyle: TextStyle(
                            color: Color(0xff1B90CE),
                          ),
                          itemStyle: TextStyle(color: Colors.white),
                        ), onConfirm: (date) {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true,
                          theme: DatePickerTheme(
                              backgroundColor: Color(0xff1D1D3E),
                              cancelStyle: TextStyle(
                                color: Color(0xff1B90CE),
                              ),
                              itemStyle: TextStyle(color: Colors.white)),
                          onConfirm: (date) {
                        selectedDate = date;

                        //final date and time
                        print(selectedDate);
                      }, currentTime: DateTime.now());
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  }),

              //Search button
              PinkButton(
                  buttonText: 'Search',
                  onPress: () async {
                    print(to);
                    print(from);
                    print(selectedDate);
                    String headers =
                        Provider.of<UserViewModel>(context, listen: false)
                            .headers;
                    await cabViewModel.getCabShares(
                        headers, to, from, selectedDate.toIso8601String());
                  }),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
                indent: 50,
                endIndent: 50,
              ),
              Text(
                "Contact them for Cab Sharing",
                style: TextStyle(
                    color: Color(0xff1B90CE),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 20),
              ),
              cabViewModel
                      .isFetchingData //to show a progress indicator while its fetching data
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cabViewModel.cabShareList.length,
                      itemBuilder: (context, index) {
                        return InfoCard(
                            '${cabViewModel.cabShareList[index].user.name} At ${cabViewModel.cabShareList[index].dateTime}',
                            'phone',
                            '+91 ${cabViewModel.cabShareList[index].user.phoneNumber}');
                      }),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Available Drivers",
                style: TextStyle(
                    color: Color(0xff1B90CE),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 20),
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  InfoCard('Sumit Reddy', 'phone', '+91 8130180208'),
                  InfoCard('Prateek hiremath', 'phone', '+91 8130180208'),
                  InfoCard('Sanjay', 'phone', '+91 8130180208'),
                  InfoCard('Akhram', 'phone', '+91 8130180208'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToAndFrom extends StatefulWidget {
  ToAndFrom(this.dropdownValue);
  String dropdownValue;
  @override
  _ToAndFromState createState() => _ToAndFromState();
}

class _ToAndFromState extends State<ToAndFrom> {
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Color(0xff1D1D3E),
      value: widget.dropdownValue,
      elevation: 16,
      style: TextStyle(color: Colors.white, fontSize: 20),
      underline: Container(
        color: Colors.pinkAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: <String>['Manipal', 'Manglore', 'Udupi']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  @override
  MyCard(this.txt);

  String txt;

  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(25.0),
      color: Color(0xff1D1D3E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.pink,
            ),
            title: Text(
              "DRIVER'S NAME",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text("PHONE NUMBER",
                style: TextStyle(
                    color: Colors.white, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }
}
