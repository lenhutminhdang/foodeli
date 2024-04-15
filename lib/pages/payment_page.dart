import 'package:ct484_project/components/form/button.dart';
import 'package:ct484_project/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onCheckout() {
    if(formKey.currentState!.validate()) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Xác nhận thanh toán?"),
          actionsAlignment: MainAxisAlignment.spaceAround,
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Số thẻ: $cardNumber"),
                Text("Ngày hết hạn: $expiryDate"),
                Text("Chủ sở hữu: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // Cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy', style: TextStyle(fontSize: 18),),
            ),
            // Checkout button
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryProgressPage())
                );
              },
              color: Colors.orange,
              child: const Text('Đồng ý', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
            )
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'), 
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Column(
            children: [
              // Credit card
              CreditCardWidget(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName, 
                cvvCode: cvvCode, 
                showBackView: isCvvFocused, 
                onCreditCardWidgetChange: (p0) {

                }
              ),

              // Credit card form
              CreditCardForm(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName, 
                cvvCode: cvvCode, 
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                }, 
                formKey: formKey
              )
            ],
          ),

          const SizedBox(height: 50,),
          Button(
            label: 'Thanh toán', 
            onTap: onCheckout,
          ) 
        ],
      )
    );
  }
}