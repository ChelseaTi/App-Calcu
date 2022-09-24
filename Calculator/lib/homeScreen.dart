import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


 class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);


  @override
  _homeScreenState createState() => _homeScreenState();
}

  class _homeScreenState extends State<homeScreen> {

    List<String> button = [
      "AC",
      "Clear",
      "%",
      "/",
      "9",
      "8",
      "7",
      "6",
      "5",
      "4",
      "3",
      "2",
      "1",
      "+",
      "0",
      "-",
      "=",
    ];

    void expression() {
      Parser p = Parser();
      Expression exp = p.parse(userInput);
      ContextModel cm = ContextModel();

      var evaluate = exp.evaluate(EvaluationType.REAL, cm);
      userInput = evaluate.toString();
    }

    isOperator(String x) {
      if (x == '%' || x == '+' || x == '-' || x == '*' || x == '/' ||
          x == '=') {
        return true;
      }
      return false;
    }

    var userInput = "";
    var userOutput = "";


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(userInput, style: const TextStyle(
                    color: Colors.black, fontSize: 33
                  ))
                ),
                const Divider(indent: 35,
                  endIndent: 35,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 35, right: 35, bottom: 35),
                  alignment: Alignment.centerRight,
                  child: Text(userOutput, style: const TextStyle(
                    color: Colors.black, fontSize: 30
                  ),),
                ),
              ],
            ),
          ),
          Expanded(
          flex: 2,
          child: SizedBox(
              width: 350,
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
            itemCount: button.length,
            itemBuilder: (BuildContext context, int index){
                if(index == 0){
                    return ButtonWidgets(
                      onPressed: (){
                        setState(() {
                          userInput ="";
                        });

                      },
                        buttonColor: Colors.green.shade100,
                        buttonText: button[index],
                        buttonTextColor: Colors.grey
                    ); //ButtonWidgets
                } else if (index == 1){
                  return ButtonWidgets(
                    onPressed: (){
                      setState(() {

                        userInput = userInput.substring(0, userInput.length - 1);
                      });
                    },
                      buttonColor: Colors.green.shade100,
                      buttonText: button[index],
                      buttonTextColor: Colors.grey
                  ); //ButtonWidgets
              } else if (index == button.length - 1){
                  return ButtonWidgets(
                  onPressed: (){
                  setState(() {

                  expression();
                  });
                  },
                  buttonColor: Colors.green.shade100,
                  buttonText: button[index],
                  buttonTextColor: Colors.grey,
                  ); //ButtonWidgets
                  } else{
                  return ButtonWidgets(
                      onPressed:(){
                        setState(() {
                         userInput = userInput + button[index];
                        });
                    },
                          buttonColor: isOperator(button[index]),
                          Colors.green.shade100,
                          Colors.blue.shade100,
                          buttonText: button[index],
                          buttonTextColor: Colors.black,
                  );

    }
                }
                      ],
                    )
                  );
},
};