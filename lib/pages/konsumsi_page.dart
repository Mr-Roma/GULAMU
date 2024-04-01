import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RiwayatKonsumsiPage extends StatelessWidget {
  const RiwayatKonsumsiPage({Key? key}) : super(key: key);

  void handleDeleteTodo(String id) {
    FirebaseFirestore.instance.collection('dataMakanan').doc(id).delete();
  }

  // void handleToggleTodo(String id, bool status) {
  //   final updateData = {
  //     'status': !status,
  //   };
  //   FirebaseFirestore.instance.collection('todo').doc(id).update(updateData);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF407BFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Animate(
                          child: Container(
                            child: Animate(
                                    child: Icon(Icons.arrow_back_ios, size: 15))
                                .slide(begin: Offset(1, 0)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 40,
                            height: 40,
                          ),
                        ).slide(
                            begin: Offset(1, 0),
                            duration: Duration(seconds: 1)),
                        SizedBox(
                          width: 70,
                        ),
                        Animate(
                          child: Text(
                            "Riwayat Konsumsi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18),
                          ),
                        ).slide(begin: Offset(0, 1)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Animate(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '26 Maret, 2024',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 14),
                          ),
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ).fadeIn(duration: Duration(seconds: 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      child: Animate(child: DateList())
                          .slideY(duration: Duration(seconds: 1)),
                    ),
                  ],
                ),
              ),
              Animate(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('dataMakanan')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Mohon Tunggu');
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Text('Tidak ada Data');
                            }

                            // Returning only the username in a Text widget
                            return Container(
                              width: double.infinity,
                              height: 524.35,
                              child: ListView(
                                children: [
                                  for (var docu in snapshot.data!.docs)
                                    CardRiwayat(
                                      id: docu.id,
                                      namaMakanan: docu.data()['namaMakanan'],
                                      jumlahGula: docu.data()['jumlahGula'],
                                      tipe: docu.data()['tipe'],
                                      onDelete: handleDeleteTodo,
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    )),
              ).slide(begin: Offset(0, 1), duration: Duration(seconds: 1))
            ],
          ),
        ),
      ),
    );
  }
}

class DateList extends StatefulWidget {
  @override
  _DateListState createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  String? selectedDate;

  final List<String> dates = [
    'Sen, 21',
    'Sel, 22',
    'Rab, 23',
    'Kam, 24',
    'Jum, 25',
    'Sab, 26',
    'Min, 27',
    'Sen, 28',
    'Sel, 29',
    'Rab, 30',
    'Kam, 1',
    'Jum, 2',
    'Sab, 3',
    'Min, 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        shrinkWrap: true, // Add shrinkWrap property
        itemBuilder: (BuildContext context, int index) {
          // Splitting the date string
          List<String> parts = dates[index].split(', ');
          String day = parts[0];
          String date = parts[1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = dates[index];
                });
                // Handle onTap event
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: selectedDate == dates[index]
                      ? Colors.blue // Change color as desired for selected date
                      : Colors
                          .transparent, // Transparent color for unselected dates
                  borderRadius:
                      BorderRadius.circular(10), // Circular border radius
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      day,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    Text(
                      date,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardRiwayat extends StatelessWidget {
  final String id;
  final namaMakanan;
  final jumlahGula;
  final tipe;
  final void Function(String) onDelete;

  const CardRiwayat({
    Key? key,
    required this.id,
    required this.namaMakanan,
    required this.jumlahGula,
    required this.tipe,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 68,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/c1.png'),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaMakanan,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Gula: $jumlahGula gram",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open',
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  child: Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    onDelete(id);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
