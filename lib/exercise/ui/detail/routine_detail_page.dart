import 'package:flutter/material.dart';
import 'package:fitness_app/exercise/model/routine_model.dart';
import 'package:fitness_app/exercise/ui/common/routine_summary.dart';
import 'package:fitness_app/exercise/ui/style/separator.dart';
import 'package:fitness_app/exercise/ui/style/text_style.dart';

class RoutineDetailPage extends StatelessWidget {
  final RoutineCardModel routineModel;

  RoutineDetailPage(this.routineModel);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        // color: new Color(0xFF736AB7),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            // _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  // Container _getBackground() {
  //   return new Container(
  //     child: new Image.network(
  //       workout.picture,
  //       fit: BoxFit.cover,
  //       height: 300.0,
  //     ),
  //     constraints: new BoxConstraints.expand(height: 295.0),
  //   );
  // }

  Container _getGradient() {
    return new Container(
      // margin: new EdgeInsets.only(top: 190.0),
      margin: new EdgeInsets.only(top: 650.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          // colors: <Color>[new Color(0x00736AB7), new Color(0xFF736AB7)],
          colors: <Color>[Colors.blueGrey[50], Colors.white],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "How to Perform".toUpperCase();
    final _benefitTitle = "Benefit".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new RoutineCardSummary(
            routineModel,
            routineSummaryCard: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(routineModel.description,
                    style: Style.commonTextStyle),
                new Text(
                  _benefitTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(routineModel.description,
                    style: Style.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      // child: new BackButton(color: Colors.white),
      child: new BackButton(color: Colors.black54),
    );
  }
}
