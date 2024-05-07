import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cards/cards_bloc.dart';
import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../../data/models/cards_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/styles/styles.dart';
import '../../routes.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    context.read<CardBloc>().add(GetCardsUserByIdEvent(
        userId: context.read<UserProfileBloc>().state.userModel.userId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card screen"),),
      body: BlocBuilder<CardBloc,CardsState>(
        builder: (context,state){
          debugPrint("CARD STATE LENGTH${state.userCards.length}");
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(children:List.generate(state.userCards.length, (index){
                    CardModel cardModel=state.userCards[index];
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(int.parse("0xFF${cardModel.color}"))
                      ),
                      child:const Text("Casdsadas"),
                    );
                  }),),
                ),
                SizedBox(width: width,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context,RouteNames.updateCard);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_1A72DD,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                    ),child: Text("Add card",style:AppTextStyle.rubikMedium.copyWith(
                      color: AppColors.white,fontSize: 18.w
                  ),),
                  ),),
                SizedBox(height: 10.h,),
              ],
            ),
          );
        },
      ),
    );
  }
}