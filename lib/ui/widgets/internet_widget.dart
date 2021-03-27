import 'package:bag_app/logic/cubits/internet/internet_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetWidget extends StatelessWidget {
  final Widget child;

  const InternetWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return kIsWeb?child: BlocBuilder<InternetCubit,InternetState>(builder: (context, state) {
       if(state is InternetLoading){
      return Center(child: CupertinoActivityIndicator(),);
      }
      else if(state is InternetDisconnected){
        return Center(child: CustomText(text: 'No internet',),);
      }
      else{
        return child;
      }
    },);
  }
}
