import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';
import 'package:sharif_health_app/ui/homepage/profile/exit_dialog.dart';
import 'package:sharif_health_app/ui/homepage/profile/personal_info_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
        create: (BuildContext context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogout) {
              if (state.confirmed) {
                Navigator.pushNamed(context, '/');
              } else {
                showDialog(
                    context: context,
                    builder: (buildContext) =>
                        ExitDialog(BlocProvider.of<ProfileCubit>(context)));
              }
            }
          },
          builder: (context, state) {
            if (state is ProfileInitial || state is ProfileLogout) {
              return getMainProfilePage(context,state);
            } else if (state is ProfileEdit) {
              return getEditProfilePage(context, state);
            }
            return const Center(child: Text("در حال دریافت اطلاعات"));
          },
        ));
  }

  getEditProfilePage(context, state) {
    return PersonalInfoSection(state);
  }

  getMainProfilePage(context,ProfileState state) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.green),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile/profile_avatar.png'),
              radius: MediaQuery.of(context).size.height * .3 * .5,
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStateProperty.all(CircleBorder()),
                          padding: WidgetStateProperty.all(EdgeInsets.all(20)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {},
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Text("${state.profileData['first_name']} ${state.profileData['last_name']}",textDirection: TextDirection.rtl,),
            Text("${state.profileData['mobile_number']}"),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context)
                              .onProfileEdit();
                        },
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl,
                            "ویرایش اطلاعات شخصی"),
                        trailing: Image.asset("assets/profile/edit.png"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl, "صندوق پیام"),
                        trailing: Image.asset("assets/profile/mail.png"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl,
                            "سوابق تراکنش ها"),
                        trailing: Image.asset("assets/profile/percent.png"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl, "ارتباط با ما"),
                        trailing: Image.asset("assets/profile/message.png"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl, "دعوت از دوستان"),
                        trailing: Image.asset("assets/profile/share.png"),
                      ),
                      ListTile(
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).onLogout();
                        },
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                            textDirection: TextDirection.rtl,
                            "خروج از حساب کاربری"),
                        trailing: Image.asset("assets/profile/log-out.png"),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
