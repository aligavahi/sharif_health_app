import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/homepage_cubit.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';
import 'package:sharif_health_app/ui/homepage/profile/exit_dialog.dart';
import 'package:sharif_health_app/ui/homepage/profile/main_page/profile_avatar.dart';
import 'package:sharif_health_app/ui/homepage/profile/main_page/profile_tiles.dart';
import 'package:sharif_health_app/ui/homepage/profile/personal_info_section.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

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
              return getMainProfilePage(context, state);
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

  getMainProfilePage(context, ProfileState state) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: const Color.fromRGBO(0xF6, 0xF7, 0xFC, 1),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width,
          top: 0,
          left: 0,
          child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              )),
        ),
        Positioned(
          top: 10,
          width: MediaQuery.of(context).size.width,
          child: getSwitchContextMenu(context, state),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width,
            child: getChildren(context, state)),
      ],
    ));
  }

  Widget getChildren(context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfileAvatar(),
        SizedBox(
          height: 40,
          child: Center(
            child: Text(
              get_username(state.profileData),
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: Center(
            child: Text(
              "${state.profileData['mobile_number']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .45,
          child: ProfileTile.getListView(context),
        )
      ],
    );
  }

  String get_username(data) {
    data = "${data['first_name'] ?? ""} ${data['last_name'] ?? ""}".trim();
    return data;
  }

  Widget getSwitchContextMenu(context, ProfileState state) {
    List<Role> roles = BlocProvider.of<HomepageCubit>(context).state.roles;
    return Center(
      child: DropdownMenu(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStateProperty.all(AppColors.green),
          backgroundColor: WidgetStateProperty.all(AppColors.green),
          shadowColor: WidgetStateProperty.all(AppColors.green),
        ),
        dropdownMenuEntries: List<DropdownMenuEntry<String>>.generate(
            roles.length,
            (index) => DropdownMenuEntry<String>(
                value: roles[index].name, label: roles[index].displayTitle)),
        onSelected: (val) {},
        initialSelection:
            BlocProvider.of<HomepageCubit>(context).state.selectedRole.name,
      ),
    );
  }
}
