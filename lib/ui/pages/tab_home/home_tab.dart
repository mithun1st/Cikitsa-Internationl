import 'dart:math';

import 'package:doctime/ui/login_screen.dart';
import 'package:doctime/ui/theme/theme.dart';
import 'package:doctime/ui/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State {
  @override
  Widget build(BuildContext context) {
    //appbar variable
    AppBar appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: const Icon(Icons.logout_outlined))
      ],
      // title: Text('Cikitsa International'),
      title: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: Image.asset('assets/ci-logo.png'),
      ),
      backgroundColor: Colors.blue.shade400,
      bottom: PreferredSize(
        //preferredSize: const Size.fromHeight(60),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * .08),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          margin: const EdgeInsets.only(bottom: 4),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              hintText: 'Search for doctor name/code',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );

    //calculate screen size
    double bodySize = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + appBar.preferredSize.height);

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            //***************************************section 1
            SizedBox(
              height: bodySize * .34,
              child: _LiveDoctorSection(),
            ),
            const SizedBox(height: 10),

            //**************************************section 2
            SizedBox(
              height: bodySize * .40,
              child: _ConsultSpecialistSection(),
            ),
            const SizedBox(height: 10),
            //**************************************section 3
            SizedBox(
              width: double.infinity,
              child: _OurServiceSection(),
            ),
            const SizedBox(height: 10),
            //**************************************section 4
            SizedBox(
              height: bodySize * .70,
              child: _OnlineDoctorSection(),
            ),
            const SizedBox(height: 10),
            //**************************************section 5
            SizedBox(
              height: bodySize * .20,
              child: _HelpSection(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  ///########################Custom Widget#################
  Widget _LiveDoctorSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Doctor();
        },
      ),
    );
  }

  Widget _ConsultSpecialistSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  fit: BoxFit.cover,
                  'assets/consult.png',
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                flex: 8,
                child: Text(
                  'Consult a Specialist',
                  style: TEXTSTYLE_TitleLine.copyWith(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Doctor();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _OurServiceSection() {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Service',
            style: TEXTSTYLE_TitleLine.copyWith(),
          ),
          Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(child: OurService()),
                  Flexible(child: OurService()),
                  Flexible(child: OurService()),
                ],
              ),
              Row(
                children: [
                  Flexible(child: OurService()),
                  Flexible(child: OurService()),
                  Flexible(child: OurService()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _OnlineDoctorSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Card(
                  child: Text('\tLive\t'),
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                flex: 8,
                child: Text(
                  '719 Doctors Online Now',
                  style: TEXTSTYLE_TitleLine.copyWith(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OnlineDoctor();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _HelpSection() {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Flexible(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Need Help',
                    style: TEXTSTYLE_TitleLine,
                  ),
                  Text(
                    'Please feel free to contact our friendly reception staff or call +8801300717172',
                    textAlign: TextAlign.start,
                    style: TEXTSTYLE_WidgetText2,
                  ),
                ],
              )),
          //Divider(),
          Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  fit: BoxFit.cover,
                  'assets/helpcall.png',
                ),
              )),
        ],
      ),
    );
  }
}
