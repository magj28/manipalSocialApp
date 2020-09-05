import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/experienceCard.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/experienceViewModel.dart';
import 'package:provider/provider.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //using provider to get data
    //listen is not set to false so as to rebuild the tree whenver data changes
    final exps = Provider.of<ExperienceViewModel>(context);
    return Scaffold(
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        backgroundColor: Color(0xff131132),
        title: Text(
          'EXPERIENCE',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Top posts',
                style: TextStyle(
                    color: Color(0xff1B90CE),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
                indent: 50,
                endIndent: 50,
              ),
              exps.isFetchingData //to show a progress indicator while its fetching data
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: exps.mostLikedExp.length,
                      itemBuilder: (context, index) {
                        return ExperienceCard(
                          name: exps.mostLikedExp[index].user.name,
                          email: exps.mostLikedExp[index].user.email,
                          date: exps.mostLikedExp[index].createdAt,
                          likes: exps.mostLikedExp[index].likes.toString(),
                          experience: exps.mostLikedExp[index].experience,
                          expID: exps.mostLikedExp[index].mongooseId,
                        );
                      },
                    ),
              Text(
                'Other posts',
                style: TextStyle(
                    color: Color(0xff1B90CE),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffFC2E7E),
                indent: 50,
                endIndent: 50,
              ),
              exps.isFetchingData //to show a progress indicator while its fetching data
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: exps.dateSortedExp.length,
                      itemBuilder: (context, index) {
                        return ExperienceCard(
                          name: exps.dateSortedExp[index].user.name,
                          email: exps.dateSortedExp[index].user.email,
                          date: exps.dateSortedExp[index].createdAt,
                          likes: exps.dateSortedExp[index].likes.toString(),
                          experience: exps.dateSortedExp[index].experience,
                          expID: exps.dateSortedExp[index].mongooseId,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        PinkButton(
          buttonText: '+ Write your Experience',
          onPress: () {
            exps.setOperation(Operation.Create);
            Navigator.pushNamed(context, '/addExperience');
          },
        )
      ],
    );
  }
}
