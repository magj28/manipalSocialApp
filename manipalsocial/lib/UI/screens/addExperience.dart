import 'package:flutter/material.dart';
import 'package:manipalsocial/UI/widgets/customTextField.dart';
import 'package:manipalsocial/UI/widgets/pinkButton.dart';
import 'package:manipalsocial/logic/viewModels/experienceViewModel.dart';
import 'package:manipalsocial/logic/viewModels/placeViewModel.dart';
import 'package:manipalsocial/logic/viewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class AddExperienceScreen extends StatelessWidget {
  final expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final singlePlace = Provider.of<PlaceViewModel>(context, listen: false);
    final exp = Provider.of<ExperienceViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff131132),
      appBar: AppBar(
        backgroundColor: Color(0xff131132),
        title: Text(
          'Write Your Experience',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Write Your Experience in ${singlePlace.singlePlace.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1B90CE),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintMessage: 'Write your experience',
            isPassword: false,
            controller: expController,
          ),
          SizedBox(
            height: 40,
          ),
          PinkButton(
            buttonText: 'Submit',
            onPress: () {
              //finding headers and place if to send in the request
              String headers =
                  Provider.of<UserViewModel>(context, listen: false).headers;
              String placeID = singlePlace.singlePlace.mongooseId;

              //Finding out the operation type - create or edit?
              Operation op = exp.operation;
              if (op == Operation.Create) {
                //create a new experience
                exp.createExperience(headers, placeID, expController.text);
              } else {
                //Update experience
                String expID = exp.expID;
                exp.editExperience(headers, expID, placeID, expController.text);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
