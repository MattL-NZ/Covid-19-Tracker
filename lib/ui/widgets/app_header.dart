import 'package:covid19/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF11249f), Color(0xFF2e74c5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.asset("assets/images/doctor2.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: InkWell(
                          child: IconButton(
                            icon: Icon(Icons.refresh, color: Colors.white, size: 30,), 
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: InkWell(
                          child: IconButton(
                            icon: Icon(Icons.info, color: Colors.white, size: 30,), 
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    'All you need to do \nis stay home',
                    style: headerStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}