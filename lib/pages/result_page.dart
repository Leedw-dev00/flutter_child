import 'package:flutter/material.dart';
import 'package:flutter_child/pages/main_page.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget{
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>{

  DateTime _selectedDate =  DateTime.now();
  late bool _isResult;
  late bool _isPlay;

  @override
  void initState(){
    super.initState();
    _isResult = false;
    _isPlay = false;
  }


  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
    );
    if(picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF55AC4B),
        centerTitle: true,
        title: Image.asset('assets/images/login_logo.png', width: 130.0,),
        actions: [
          Builder(
              builder: (BuildContext context){
                return GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Image.asset('assets/images/ham.png'),
                );
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                width: Get.width,
                height: Get.height*0.32,
                decoration: BoxDecoration(
                  color: Color(0xFF55AC4B),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('조회기간', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 17.0),),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 5.0,),
                                Text('${_selectedDate.toLocal()}'.split(' ')[0], style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                IconButton(onPressed: (){_selectDate(context);}, icon: Icon(Icons.calendar_today_outlined, color: Colors.black54, size: 18.0,)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("TO", textAlign: TextAlign.center, style: TextStyle(fontFamily:"SB_M", color: Colors.white),),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(width: 5.0,),
                                Text('${_selectedDate.toLocal()}'.split(' ')[0], style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                IconButton(onPressed: (){_selectDate(context);}, icon: Icon(Icons.calendar_today_outlined, color: Colors.black54, size: 18.0,)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height*0.05,),
                    Text('검색어', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 17.0),),
                    SizedBox(height: 10.0,),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Colors.black54,),
                          hintText: '검색어를 입력해주세요',
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(color: Colors.white, width: 0.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('총 5건', style:
                      TextStyle(
                          fontFamily: "SB_M",
                          color: Colors.black54,
                          fontSize: 17.0
                      ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF37912C),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      Text('No.', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 14.0),),
                                      Image.asset('assets/images/sort.png',),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF37912C),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      Text('이름', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 14.0),),
                                      Image.asset('assets/images/sort.png',),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF37912C),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('통화일시', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 14.0),),
                                          Text('(시작시간/종료시간/총시간)', style: TextStyle(fontFamily: "SB_L", color: Colors.white, fontSize: 12.0),),
                                        ],
                                      ),
                                      Image.asset('assets/images/sort.png',),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF37912C),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15.0))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      Text('통화내용', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 14.0),),
                                      Image.asset('assets/images/sort.png',),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD7E9D4),
                                    border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('1', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('김영철', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2021.08.26', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                      Text('(08:29/08:31/02:00)', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 12.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('엄마가 때려요...', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                        onPressed: (){
                                          setState(() {
                                            _isResult = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7FBF7),
                                    border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('박진수', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2021.08.28', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                      Text('(11:30/11:42/12:00)', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 12.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('엄마가 때려요...', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                        onPressed: (){
                                          setState(() {
                                            _isResult = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD7E9D4),
                                    border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('3', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('김지원', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2021.08.28', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                      Text('(19:01/19:03/02:00)', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 12.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('아빠가 때려요...', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                        onPressed: (){
                                          setState(() {
                                            _isResult = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7FBF7),
                                    border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('4', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('정진희', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2021.09.01', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                      Text('(12:30/12:48/18:00)', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 12.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7FBF7),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('할머니가 때려요...', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                        onPressed: (){
                                          setState(() {
                                            _isResult = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD7E9D4),
                                    border: Border.all(width: 1.0, color: Colors.white),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('5', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('김지호', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2021.09.04', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                      Text('(09:27/09:37/10:00)', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 12.0),),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7E9D4),
                                      border: Border.all(width: 1.0, color: Colors.white),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('아빠가 때려요...', style: TextStyle(fontFamily: "SB_M", color: Colors.black54, fontSize: 14.0),),
                                        onPressed: (){
                                          setState(() {
                                            _isResult = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.keyboard_arrow_left, size: 25.0,),
                              Icon(Icons.keyboard_arrow_right, size: 25.0,),
                            ],
                          ),
                          SizedBox(height: 20.0,),

                          _isResult
                          ?
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                              width: Get.width,
                              height: Get.height*0.7,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: Get.width*0.18,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF37912C),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('결과보기', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 15.0),),
                                    )
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    children: <Widget>[
                                      Text('음성듣기', style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                      SizedBox(width: 20.0),
                                      Container(
                                        width: Get.width*0.7,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Image.asset('assets/images/rewind.png'),
                                              iconSize: 25.0,
                                              onPressed: (){},
                                            ),
                                            IconButton(
                                              icon: Image.asset('assets/images/play.png'),
                                              iconSize: 45.0,
                                              onPressed: (){
                                                setState(() {
                                                  _isPlay = true;
                                                });
                                              },
                                            ),
                                            IconButton(
                                              icon: Image.asset('assets/images/fast.png'),
                                              iconSize: 25.0,
                                              onPressed: (){},
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 30.0,),
                                  _isPlay
                                  ?
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('음성파형', style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                      SizedBox(width: 20.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.5, color: Colors.black54)
                                          ),
                                          child: Image.asset('assets/images/wave.png', width: Get.width*0.7,),
                                        )
                                      )
                                    ],
                                  )
                                  :
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('음성파형', style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                      SizedBox(width: 20.0),
                                    ],
                                  ),
                                  SizedBox(height: 30.0,),
                                  _isPlay
                                  ?
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('음성결과', style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                      SizedBox(width: 20.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: Get.width*0.7,
                                          child: Text('처음에는 안정된 음성이었으나 점차 불안정한 음성이 나타나 아동학대를 당한 것으로 의심이 됩니다', textAlign: TextAlign.center, maxLines: 5, style:
                                            TextStyle(
                                              fontFamily: "SB_M", fontSize: 14.0
                                            ),
                                          ),
                                        )
                                      )
                                    ],
                                  )
                                  :
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('음성결과', style: TextStyle(fontFamily: "SB_M", color: Color(0xFF37912C), fontSize: 15.0),),
                                      SizedBox(width: 20.0),
                                    ],
                                  ),
                                ],
                              )
                          )
                          :
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                              width: Get.width,
                              height: 350.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: Get.width*0.18,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xFF37912C),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('결과보기', style: TextStyle(fontFamily: "SB_M", color: Colors.white, fontSize: 15.0),),
                                      )
                                  ),
                                ],
                              )
                          ),
                          SizedBox(height: 50.0,)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xFF55AC4B)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: Get.height*0.02,),
                    Image.asset('assets/images/login_logo.png', width: Get.width*0.33,),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 25.0,
                        child: ElevatedButton(
                            onPressed: (){
                              print('로그아웃');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF276D2C), //background color of button
                              // side: BorderSide(width:3, color:Colors.brown), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                            child: Text('로그아웃', style: TextStyle(color: Colors.white, fontSize: 12.0,),)
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,)
                  ],
                )
            ),
            Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Color(0xFF276D2C)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
                      ),
                      child: ListTile(
                        title: Text('Home', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){
                          Get.off(MainPage());
                        },
                      ),
                    ),
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Color(0xFF276D2C)),

                      ),
                      child: ListTile(
                        title: Text('결과보기', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){
                          Get.off(ResultPage());
                        },
                      ),
                    ),
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Color(0xFF276D2C)),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0))
                      ),
                      child: ListTile(
                        title: Text('설정', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){print('설정');},
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),

    );
  }
}