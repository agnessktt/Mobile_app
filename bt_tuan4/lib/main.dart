import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay the Bill',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display',
      ),
      home: PayBillScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PayBillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          'Pay the bill',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Electric bill
            BillItem(
              title: 'Electric bill',
              subtitle: 'Pay electric bill this month',
              iconData: Icons.electrical_services,
              iconColor: Colors.orange,
              phoneColor: Colors.purple,
            ),

            SizedBox(height: 30),

            // Water bill
            BillItem(
              title: 'Water bill',
              subtitle: 'Pay water bill this month',
              iconData: Icons.water_drop,
              iconColor: Colors.blue,
              phoneColor: Colors.blue,
            ),

            SizedBox(height: 30),

            // Mobile bill
            BillItem(
              title: 'Mobile bill',
              subtitle: 'Pay mobile bill this month',
              iconData: Icons.phone_android,
              iconColor: Colors.red,
              phoneColor: Colors.purple,
            ),

            SizedBox(height: 30),

            // Internet bill
            BillItem(
              title: 'Internet bill',
              subtitle: 'Pay internet bill this month',
              iconData: Icons.wifi,
              iconColor: Colors.red,
              phoneColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final Color iconColor;
  final Color phoneColor;

  const BillItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.iconColor,
    required this.phoneColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 70,
                      decoration: BoxDecoration(
                        color: phoneColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (title == 'Mobile bill')
                    Positioned(
                      right: 25,
                      child: Container(
                        width: 35,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: phoneColor, width: 2),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 12,
                              decoration: BoxDecoration(
                                color: phoneColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  Positioned(
                    left: 15,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        iconData,
                        color: iconColor,
                        size: 20,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
