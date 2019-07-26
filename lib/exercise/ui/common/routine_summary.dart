import 'package:flutter/material.dart';
import 'package:fitness_app/exercise/model/routine_model.dart';
import 'package:fitness_app/exercise/ui/detail/routine_detail_page.dart';
import 'package:fitness_app/exercise/ui/style/separator.dart';
import 'package:fitness_app/exercise/ui/style/text_style.dart';

class RoutineCardSummary extends StatelessWidget {
  final RoutineCardModel routineCardModel;
  final bool routineSummaryCard;

  RoutineCardSummary(this.routineCardModel, {this.routineSummaryCard = true});

  RoutineCardSummary.vertical(this.routineCardModel)
      : routineSummaryCard = false;

  @override
  Widget build(BuildContext context) {
    final cardThumbnail = new Container(
      // margin: new EdgeInsets.symmetric(vertical: 16.0),
      margin: new EdgeInsets.symmetric(vertical: routineSummaryCard ? 5.0 : 30),
      alignment:
          // horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
          routineSummaryCard
              ? FractionalOffset.centerRight
              : FractionalOffset.center,
      child: new Hero(
        tag: "card-hero-${routineCardModel.id}",
        child: new Image(
          image: new AssetImage(routineCardModel.avater),
          height: routineSummaryCard ? 92.0 : 200,
          width: routineSummaryCard ? 92.0 : 200,
        ),
      ),
    );

    Widget _cardValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          // new Image.asset(image, height: 12.0),
          new Image.asset(image, height: 20.0),
          new Container(width: 8.0),
          // new Text(value, style: Style.smallTextStyle),
          new Text(
            value,
            // style: Style.commonTextStyle
          ),
        ]),
      );
    }

    final routineCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          // horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
          routineSummaryCard ? 15.0 : 6.0,
          routineSummaryCard ? 6.0 : 15.0,
          6.0,
          6.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: routineSummaryCard
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          // new Container(height: 4.0),
          new Container(height: 6.0),
          new Text(routineCardModel.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          // new Container(height: 15.0),
          new Text(
            routineCardModel.benefit,

            // style:  Style.commonTextStyle,
          ),
          new Container(height: 5.0),
          new Separator(),
          new Container(height: 5.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: routineSummaryCard ? 1 : 0,
                child: _cardValue(
                    value: routineCardModel.reps,
                    image: 'assets/exercise_assets/exercise_icons/reps.png'),
              ),
              // child: FittedBox(
              //   // fit: BoxFit.contain,
              //   child: _cardValue(
              //       value: routineCardModel.reps,
              //       image:
              //           'assets/exercise_assets/exercise_icons/reps.png'),
              // )),
              new Container(
                width: routineSummaryCard ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: routineSummaryCard ? 1 : 0,
                  child: _cardValue(
                      value: routineCardModel.sets,
                      image: 'assets/exercise_assets/exercise_icons/set.png')),
            ],
          ),
        ],
      ),
    );

    final routineCard = new Container(
      child: routineCardContent,
      height: routineSummaryCard ? 150.0 : 180.0, //horizontal ? 124.0 : 154.0,
      margin: routineSummaryCard
          ? new EdgeInsets.only(left: 10.0) // left: 46.0
          : new EdgeInsets.only(top: 230.0), // top: 72.0)
      decoration: new BoxDecoration(
        // color: new Color(0xFF333366),
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: routineSummaryCard
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        new RoutineDetailPage(routineCardModel),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            // vertical: 16.0,
            // horizontal: 24.0,
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: new Stack(
            children: <Widget>[
              routineCard,
              cardThumbnail,
            ],
          ),
        ));
  }
}
