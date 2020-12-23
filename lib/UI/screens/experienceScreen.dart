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
          'Experiences',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffFC2E7E)),
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
                'See what people think about this place',
                style: TextStyle(
                    color: Color(0xff1B90CE),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
              exps.isFetchingData //to show a progress indicator while its fetching data
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: exps.exps.length,
                      itemBuilder: (context, index) {
                        return ExperienceCard(
                            name: exps.exps[index].user.name,
                            email: exps.exps[index].user.email,
                            date: exps.exps[index].createdAt,
                            likes: exps.exps[index].likes.toString(),
                            experience: exps.exps[index].experience,
                            expID: exps.exps[index].mongooseId,
                            likedBy: exps.exps[index].likedBy);
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
