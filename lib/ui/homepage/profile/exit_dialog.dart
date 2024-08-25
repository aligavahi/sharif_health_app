import 'package:flutter/material.dart';
import 'package:sharif_health_app/model/homepage/profile/profile_cubit.dart';

class ExitDialog extends StatelessWidget {
  final ProfileCubit profileCubit;

  const ExitDialog(this.profileCubit,  {super.key});
  final exitTitle = "خروج";
  final detail = "آیا می خواهید از حساب کاربری خارج شوید؟";
  final yes = "بله";
  final no = "خیر";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsPadding: EdgeInsets.only(bottom: 20,left: 10,right: 10),
      contentPadding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 15
      ),
      titlePadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.center,
      title: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(19),topRight:Radius.circular(19) )),
        tileColor: Colors.red,
        title: Center(
          child: Text(
            exitTitle,
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white),
          ),
        ),
        trailing: Image.asset(
          "assets/profile/log-out.png",
          color: Colors.white,
        ),
      ),
      content: Text(detail,
        textDirection: TextDirection.rtl,
      ),
      actions: [
        SizedBox(width:MediaQuery.of(context).size.width*.25,child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
          profileCubit.confirmLogout();
        } ,child: Text(yes))),
        SizedBox(width:MediaQuery.of(context).size.width*.25,child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
          profileCubit.backToProfile();

        }, child: Text(no))),
      ],
    );
  }
}
