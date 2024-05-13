import 'package:fast_pay/screens/widgets/textfield.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/cards/cards_bloc.dart';
import '../../../blocs/cards/cards_event.dart';
import '../../../blocs/cards/cards_state.dart';
import '../../../data/models/cards_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/styles/styles.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  TextEditingController cardController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card Screen"),
      ),
      body: BlocConsumer<UserCardsBloc, UserCardsState>(
        builder: (BuildContext context, UserCardsState state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              children: [
                MyTextField(
                    controller: cardController,
                    hintText: "card number ",
                    obscureText: false,
                    keyboardType: TextInputType.number),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                    controller: expireDateController,
                    hintText: "expire date",
                    obscureText: false,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: width,
                  child: TextButton(
                    onPressed: () {
                      List<CardModel> db = state.cardsDB;
                      List<CardModel> myCards = state.userCards;
                      bool isExists = false;
                      for (var element in myCards) {
                        if (element.cardNumber == cardController.text) {
                          isExists = true;
                          break;
                        }
                      }
                      CardModel cardModel = CardModel.initial();
                      bool hasInDb = false;
                      for (var element in db) {
                        if (element.cardNumber == cardController.text) {
                          hasInDb = true;
                          cardModel = element;
                          break;
                        }
                      }
                      if ((!isExists) && hasInDb) {
                        cardModel = cardModel.copyWith(
                          expireDate: expireDateController.text,
                          cardNumber: cardController.text,
                        );
                        context.read<UserCardsBloc>().add(AddCardEvent(cardModel));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("ERROR"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_1A72DD,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                    ),
                    child: Text(
                      "ADD",
                      style: AppTextStyle.rubikMedium
                          .copyWith(color: AppColors.white, fontSize: 16.w),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.statusMessage == 'added') {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
