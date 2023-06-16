import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';
import 'package:planta/layout/presentation/screens/map_screen.dart';
import 'package:planta/layout/presentation/screens/profile_screen.dart';
import 'package:planta/layout/presentation/screens/result_screen.dart';
import 'package:planta/layout/presentation/screens/scan_screen.dart';

import '../components/layout_components/animatd_floating_action_buttom.dart';
import '../components/layout_components/bottom_app_bar_item.dart';
import '../controller/layout_cubit/layout_cubit.dart';
import '../controller/layout_cubit/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentTab],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const AnimatedFloatingAction(
              icon: Icons.qr_code_scanner,
              destination:  ScanScreen(),
            ),
            bottomNavigationBar: BottomAppBar(
              notchMargin: 15,
              shape: const CircularNotchedRectangle(),
              elevation: 100,
              shadowColor: Colors.grey,
              child: SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomAppBarItem(cubit: cubit, text: 'Home', index: 0, icon: Icons.home),
                        BottomAppBarItem(cubit: cubit, text: 'Map', index: 1, icon: Icons.map),
                      ],
                    ),
                    //Right Side
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomAppBarItem(cubit: cubit, text: 'Profile', index: 2, icon: Icons.person),
                        BottomAppBarItem(cubit: cubit, text: 'Result', index: 3, icon: Icons.add_chart),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!), fit: BoxFit.cover)
                      : const DecorationImage(
                          image: AssetImage(
                              "assets/images/home_screen_background.png"),
                          fit: BoxFit.cover),
                ),
              ),
              image==null? const Text("Taking photo to scaning...!"):const Text("Show result...!")
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          FloatingActionButton(
            heroTag: '12',
            backgroundColor: Theme.of(context).primaryColor,
            child: image == null? Icon(Icons.image_outlined):Icon(Icons.qr_code_scanner_outlined,size: 45,),
            onPressed: () async {
              if(image == null){
                // Capture a photo
                final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
                setState(() {try{
                  image = File(photo!.path);}catch(e){}
                });
              }else {
                navigateTo(context: context,destination: ResultScreen());
              }
            },
          ),  FloatingActionButton(
            heroTag: '34',
            backgroundColor: Theme.of(context).primaryColor,
            child: image == null? Icon(Icons.camera_alt_outlined):Icon(Icons.qr_code_scanner_outlined,size: 45,),
            onPressed: () async {
              if(image == null){
                // Capture a photo
                final XFile? photo =
                await _picker.pickImage(source: ImageSource.camera);
                setState(() {

          try{
            image = File(photo!.path);}catch(e){}
                });
              }else {
                navigateTo(context: context,destination: ResultScreen());
              }
            },
          ),
        ],
      ),
    );
  }
}

 */
