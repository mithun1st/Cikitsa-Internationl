import 'package:doctime/ui/theme/theme.dart';
import 'package:flutter/material.dart';

Widget Box1() {
  return Container(color: Colors.red);
}

Widget Box2() {
  return Container(color: Colors.green);
}

Widget Box3() {
  return Container(color: Colors.blue);
}

Widget Doctor() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: AspectRatio(
      aspectRatio: 1 / 1.2,
      child: Card(
        //elevation: 6,
        color: Colors.purple.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------1st part
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Text('\tLive\t'),
                        color: Colors.red,
                      ),
                      Text(
                        'Experienced Child MBBS Doctor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Image.asset('assets/doctors-appoinment.png'),
                ),
              ],
            ),
            //-------2nd part
            const Spacer(),
            Text(
              '\t500 Taka',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.indigo,
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.video_call,
                        color: Colors.white,
                      ),
                      Text(
                        ' See Doctor Now',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget OurService() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: AspectRatio(
      aspectRatio: 1 / 1,
      child: Card(
        elevation: 12,
        color: Colors.blue.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset('assets/cost-estimation.png'),
            ),
            Flexible(
              child: Text(
                'Cost Estimation',
                textAlign: TextAlign.center,
                style: TEXTSTYLE_WidgetText2.copyWith(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget OnlineDoctor() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: AspectRatio(
      aspectRatio: 1.4 / 2,
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(width: 1, color: Colors.brown),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------1st part photo
            Flexible(
              flex: 7,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                    fit: BoxFit.cover, 'assets/doctor-character.webp'),
              ),
            ),
            //-------2nd part
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\tGeneral Physician Centre',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        '\tDr. Firstname Lastname',
                        style: TEXTSTYLE_WidgetText1,
                      ),
                      Text(
                        '\tMBBS, HPH',
                        style: TextStyle(fontSize: 10),
                      ),
                      Wrap(children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        Text(
                          '\t(4.8)',
                          style: TEXTSTYLE_WidgetText1,
                        )
                      ]),
                    ],
                  ),
                  Text(
                    '\t165/=',
                    style: TEXTSTYLE_WidgetText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
