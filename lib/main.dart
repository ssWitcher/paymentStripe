import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    RaisedButton(
                        child: Text('Add This Card'),
                        color: Colors.blue,
                        onPressed: () => print('working'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   PaymentMethod _paymentMethod;
//   PaymentIntentResult _paymentIntent;

//   @override
//   void initState() {
//     super.initState();
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//             "pk_test_51H6kE3FGnI1zKRtpqHdeOPN0jvTKDNgCIU3P9LnQGLNlp0UWJMDWov3sHPySxlBrECWAZB6nMcvJTdel1arlWmtF00OngFgvZ1",
//         merchantId: "",
//         androidPayMode: "test"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("Called");
//     return Container(
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             CreditCardWidget(
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFocused,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     CreditCardForm(
//                       onCreditCardModelChange: onCreditCardModelChange,
//                     ),
//                     RaisedButton(
//                       child: Text("Add this Card"),
//                       color: Colors.blue,
//                       onPressed: () {
//                         print("Working");
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             // RaisedButton(
//             //   child: Text("Add this card"),
//             //   color: Colors.blue,
//             //   onPressed: () {
//             //     print("CardNUmber :  abchdhd");
//             //   },
//             //   // onPressed: () {
//             //   //   print("start");
//             //   //   StripePayment.createPaymentMethod(
//             //   //     PaymentMethodRequest(
//             //   //       card: CreditCard(
//             //   //         name: cardHolderName,
//             //   //         number: cardNumber,
//             //   //         cvc: cvvCode,
//             //   //         expMonth: int.parse(expiryDate.split("/")[0]),
//             //   //         expYear: int.parse(expiryDate.split("/")[1]),
//             //   //       ),
//             //   //     ),
//             //   //   ).then((paymentMethod) {
//             //   //     setState(() {
//             //   //       _paymentMethod = paymentMethod;
//             //   //     });
//             //   //   });
//             //   // },
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }
