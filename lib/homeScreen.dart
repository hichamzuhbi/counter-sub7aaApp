import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  resetToZero({bool resetGoal = false}) async {
    setCount(_counter = 0);
    resetGoal == true ? setGoal(_goal = 0) : null;
    setRepeator(_repeator = 0);
  }

  setCount(int value) async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    data.setInt('counter', value);
    getCount();
  }

  setRepeator(int value) async {
    final SharedPreferences data1 = await SharedPreferences.getInstance();
    data1.setInt('repeator', value);
    getRep();
  }

  setGoal(int value) async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    data.setInt('goal', value);
    getGoal();
  }

  setColor(int value) async {
    final SharedPreferences data1 = await SharedPreferences.getInstance();
    data1.setInt('color', value);
    getColor();
  }

  getCount() async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      _counter =
          data.getInt('counter') ?? 0; //krmel iza ken l return null yredd 0
    });
  }

  getRep() async {
    final SharedPreferences data1 = await SharedPreferences.getInstance();
    setState(() {
      _repeator =
          data1.getInt('repeator') ?? 0; //krmel iza ken l return null yredd 0
    });
  }

  getGoal() async {
    final SharedPreferences data1 = await SharedPreferences.getInstance();
    setState(() {
      _goal = data1.getInt('goal') ?? 0; //krmel iza ken l return null yredd 0
    });
  }

  getColor() async {
    final SharedPreferences data1 = await SharedPreferences.getInstance();
    setState(() {
      colorvalue = data1.getInt('color') ??
          0xff0A4F25; //krmel iza ken l return null yredd a5dar
    });
  }

  @override
  void initState() {
    //hyde btshte8el awwal shi ba3d l reload aw restart
    getColor();
    getCount();
    getRep();
    getGoal();
    super.initState();
  }

  TextDirection directionApp = TextDirection.rtl;
  int radio = 0;
  int colorvalue = 0xff0A4F25;
  int _counter = 0;
  int _repeator = 0;
  int _goal = 0;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    Color appcolor = Color(colorvalue);
    return Directionality(
      textDirection: directionApp, //hon bye2lob l app badal l yamin bisir chmel
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resetToZero(resetGoal: true);
            setGoal(_goal = 1);
          },
          child: Icon(Icons.refresh),
          backgroundColor: appcolor,
        ),
        appBar: AppBar(
          backgroundColor: appcolor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                  child: Icon(
                      isActive ? Icons.color_lens_outlined : Icons.color_lens)),
            ),
          ],
          elevation: 0, //shadow te3 l appbar
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: appcolor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        "العدد",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            resetToZero();
                            setGoal(_goal - 1);
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$_goal",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {
                            resetToZero();
                            setGoal(_goal + 1);
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            resetToZero();
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("0"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setGoal(_goal = 33);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("33"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setGoal(_goal = 100);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("100"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setGoal(_goal + 100);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("+100"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setGoal(_goal + 1000);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("+1000"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "الأذكار",
                    style: TextStyle(color: appcolor, fontSize: 25),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "$_counter",
                    style: TextStyle(color: appcolor, fontSize: 25),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CircularPercentIndicator(
                    radius: 100.0, //required
                    lineWidth: 6.0,
                    percent: _counter / _goal,
                    //header: new Text("Icon header"),
                    center: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_counter >= _goal) {
                            setRepeator(_repeator + 1);
                            setCount(_counter = 1);
                          } else {
                            setCount(_counter + 1);
                          }
                        });
                      },
                      child: Icon(
                        Icons.touch_app,
                        size: 50.0,
                        color: appcolor,
                      ),
                    ),
                    backgroundColor: appcolor.withOpacity(0.3),
                    progressColor: appcolor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "مرات التكرار : $_repeator",
                    style: TextStyle(color: appcolor, fontSize: 25),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "المجموع : ${_goal * _repeator + _counter}",
                    style: TextStyle(color: appcolor, fontSize: 25),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: isActive ? true : false,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Radio(
                      //activeColor: appcolor,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff0A4F25)),
                      value: 0xff0A4F25,
                      groupValue: colorvalue,
                      onChanged: (val) {
                        setState(() {
                          setColor(val!);
                        });
                      },
                    ), //hyde checked l2n bl radio lli 3ndu lvalue add groupvalue bkun checked
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff774342)),
                      value: 0xff774342,
                      groupValue: colorvalue,
                      onChanged: (val) {
                        setState(() {
                          setColor(val!);
                        });
                      },
                    ), //hyda ma bikun checked l2n l value b2lbbo 8er l group value
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff000000)),
                      value: 0xff000000,
                      groupValue: colorvalue,
                      onChanged: (val) {
                        setState(() {
                          setColor(val!);
                        });
                      },
                    ), //hyda ma bikun checked l2n l value b2lbbo 8er l group value
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
