import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';
import 'package:sharif_health_app/utils/app_colors.dart';

class ProfileTile extends ListTile {
  const ProfileTile({super.key});

  static getListView(context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      children: [
        getPersonalInfoTile(context),
        getMessageBoxTile(context),
        getTransactionHistoryTile(context),
        getContactUsTile(context),
        getShareTile(context),
        getExitTile(context)
      ],
    );
  }

  static getTile(context, asset, name, callback) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          tileColor: Colors.white,
          onTap: callback,
          leading: const Icon(Icons.arrow_back),
          title: Text(
            textDirection: TextDirection.rtl,
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Image.asset(
            asset,
            color: AppColors.orange,
          ),
        ));
  }

  static getPersonalInfoTile(context) {
    return getTile(context, "assets/profile/edit.png", "ویرایش اطلاعات شخصی",
        () {
      BlocProvider.of<ProfileCubit>(context).onProfileEdit();
    });
  }

  static getMessageBoxTile(context) {
    return getTile(context, "assets/profile/mail.png", "صندوق پیام", () {});
  }

  static getTransactionHistoryTile(context) {
    return getTile(
        context, "assets/profile/percent.png", "سوابق تراکنش ها", () {});
  }

  static getContactUsTile(context) {
    return getTile(
        context, "assets/profile/message.png", "ارتباط با ما", () {});
  }

  static getExitTile(context) {
    return getTile(context, "assets/profile/log-out.png", "خروج از حساب کاربری",
        () {
      BlocProvider.of<ProfileCubit>(context).onLogout();
    });
  }

  static getShareTile(context) {
    return getTile(context, "assets/profile/share.png", "دعوت از دوستان",
        () {
    });
  }
}
