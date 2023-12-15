import 'package:flutter/material.dart';
import 'package:opusapp/screens/constants/SColors.dart';
import 'package:opusapp/screens/preference_shared/screenSizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryList extends StatefulWidget {
  var bookings;
  HistoryList({@required this.bookings});
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              color: SColors.PrimaryColorPurple,
              height: ScreenSizeConfig.safeBlockVertical * 28,
              width: ScreenSizeConfig.safeBlockHorizontal * 100,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: ScreenSizeConfig.safeBlockVertical * 7,
                    width: ScreenSizeConfig.safeBlockHorizontal * 100,
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    width: ScreenSizeConfig.safeBlockHorizontal * 100,
                    padding: EdgeInsets.fromLTRB(
                        ScreenSizeConfig.safeBlockHorizontal * 8,
                        ScreenSizeConfig.safeBlockHorizontal * 22,
                        0,
                        ScreenSizeConfig.safeBlockHorizontal * 0),
                    child: Row(
                      children: [
                        Text(
                          'Bookings History',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSizeConfig.safeBlockHorizontal * 6),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenSizeConfig.screenWidth * 0.88,
                    height: ScreenSizeConfig.screenHeight * 0.72,
                    child: ListView.builder(
                      itemCount: widget.bookings.length,
                      itemBuilder: (context, index) {
                        return Container(
                            width: ScreenSizeConfig.screenWidth * 0.88,
                            child: Card(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: ScreenSizeConfig
                                                          .screenWidth *
                                                      0.15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      widget.bookings[index]
                                                              ["Client"]
                                                              ["fullName"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      widget.bookings[index]
                                                              ["Client"]
                                                              ["phone"]
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                                child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: ScreenSizeConfig
                                                          .screenWidth *
                                                      0.1),
                                              child: Icon(
                                                Icons.book,
                                                color: Colors.grey,
                                              ),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: TextButton(
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                            color: SColors.PrimaryColorPurple),
                                      ),
                                      onPressed: () async {
                                        var url =
                                            "tel://${widget.bookings[index]["Client"]["phone"]}";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ))
                                  ],
                                )));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
