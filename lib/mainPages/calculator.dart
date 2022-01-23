// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CalCulatorPage extends StatefulWidget {
  CalCulatorPage();
  @override
  _CalCulatorPageState createState() => _CalCulatorPageState();
}

class _CalCulatorPageState extends State<CalCulatorPage> {
  Widget calcbutton(String btntxt, Color? btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          '$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(22),
      ),
    );
  }

  changemode() {
    if (mode) {
      setState(() {
        clrb = Colors.white;
        clrw = Colors.black;
      });
    } else if (!mode) {
      setState(() {
        clrb = Colors.black;
        clrw = Colors.white;
      });
    }
  }

  bool mode = false;
  Color clrb = Colors.black;
  Color clrw = Colors.white;
  Color clrws = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrb,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mode
                  ? Text("Dark Mode", style: TextStyle(color: clrw))
                  : Text("Light Mode", style: TextStyle(color: clrw)),
              Switch(
                  activeTrackColor: Colors.grey[400],
                  inactiveThumbColor: Colors.orange,
                  inactiveTrackColor: Colors.white,
                  activeColor: Colors.black,
                  value: mode,
                  onChanged: (val) {
                    setState(() {
                      mode = val;
                      changemode();
                    });
                  })
            ],
          ),
        ],
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 25, color: clrw),
        ),
        centerTitle: false,
        backgroundColor: clrb,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 32, bottom: 10),
                    child: Text(
                      '$opr',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 60,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ListView(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.centerRight,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Text(
                            '$text',
                            maxLines: 10,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: clrw,
                              fontSize: 80,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.grey, clrb),
                calcbutton('+/-', Colors.grey, clrb),
                calcbutton('%', Colors.grey, clrb),
                calcbutton('/', Colors.amber[700], clrw),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey[850], clrws),
                calcbutton('8', Colors.grey[850], clrws),
                calcbutton('9', Colors.grey[850], clrws),
                calcbutton('x', Colors.amber[700], clrw),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey[850], clrws),
                calcbutton('5', Colors.grey[850], clrws),
                calcbutton('6', Colors.grey[850], clrws),
                calcbutton('-', Colors.amber[700], clrw),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey[850], clrws),
                calcbutton('2', Colors.grey[850], clrws),
                calcbutton('3', Colors.grey[850], clrws),
                calcbutton('+', Colors.amber[700], clrw),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: clrws),
                  ),
                  color: Colors.grey[850],
                ),
                calcbutton('.', Colors.grey[850], clrws),
                calcbutton('=', Colors.amber[700], clrw),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        if (numOne != 0) {
          numTwo = double.parse(result);
        }
        finalResult = add();
      } else if (opr == '-') {
        numTwo = double.parse(result);

        finalResult = sub();
      } else if (opr == 'x') {
        numTwo = double.parse(result);

        finalResult = mul();
      } else if (opr == '/') {
        numTwo = double.parse(result);

        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
