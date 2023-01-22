import 'package:fiels/component/cubit/cubit.dart';
import 'package:fiels/component/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FilesCubit(),
        child: BlocConsumer<FilesCubit,FilesStates>(
            listener:(Context,state){},
            builder:(Context,state){
              return Container();
            }
    ),
    );
  }
}
