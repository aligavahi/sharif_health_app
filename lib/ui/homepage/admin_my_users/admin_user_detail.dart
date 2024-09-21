import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/admin_my_users/admin_my_users_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class AdminUserDetail extends StatelessWidget {
  final User user;

  const AdminUserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const margin = 20.0;
    const padding = 15.0;

    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(padding),
          margin: const EdgeInsets.fromLTRB(margin, 2 * margin, margin, margin),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Text(
                "${user.firstName} ${user.lastName}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
              ),
              Row(children: [
                const Spacer(),
                Text(user.phoneNumber,style: const TextStyle(color: AppColors.shadow),),
                const Icon(Icons.phone_android,color: AppColors.shadow,),
                const Spacer()
              ]),
              const SizedBox(height: 10),
              SizedBox(
                height: (MediaQuery.of(context).size.width -
                            2 * (margin + padding)) /
                        1.5 +
                    10,
                child: GridView.count(
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    getGridItem(
                        title: "مربی",
                        value:
                            getOrVal("${user.trainer.firstName} ${user.trainer.lastName}".trim(),'ندارد')),
                    getGridItem(title: "آخرین تست", value: "2022/01/02"),
                    getGridItem(title: "تست ها", value: "${user.testCount}"),
                    getGridItem(
                        title: "تست های با مجوز",
                        value: "${user.approvedTestCount}"),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    BlocProvider.of<AdminMyUsersCubit>(context)
                        .goToPermissionDialog();
                  },
                  child: const ListTile(
                      leading: Icon(Icons.arrow_back_ios),
                      trailing: Icon(Icons.paste_rounded),
                      title: Text(
                        "ویرایش مجوز",
                        textDirection: TextDirection.rtl,
                      ))),
              InkWell(
                  onTap: () {},
                  child: const ListTile(
                      leading: Icon(Icons.arrow_back_ios),
                      trailing: Icon(Icons.paste_rounded),
                      title: Text(
                        "مشاهده تست های کاربر",
                        textDirection: TextDirection.rtl,
                      )))
            ],
          )),
      Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.lightShadow,
            backgroundImage: const AssetImage('assets/profile/profile_avatar.png'),
          )),
    ]);
  }

  getGridItem({required String title, required String value}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.background,
        ),
        child: Center(
          child: ListTile(
            subtitle: Text(
              title,
              textAlign: TextAlign.center,
            ),
            title: Text(value,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ));
  }

  getOrVal(String mainVal, String nullVal) {
    return mainVal==""?nullVal:mainVal;
  }
}
