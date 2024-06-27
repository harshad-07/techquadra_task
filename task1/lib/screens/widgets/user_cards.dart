import 'package:flutter/material.dart';

import '../../common/widgets/containers/rounded_container.dart';
import '../../model/get_user_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/local_storage/storage_utility.dart';

class UserCards extends StatelessWidget {
  final GetUsersModel? userData;
  final void Function()? onTap;
  const UserCards({super.key, this.onTap, this.userData});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.primary50,
      padding: EdgeInsets.all(Sizes.md),
      margin: EdgeInsets.symmetric(vertical: Sizes.sm + Sizes.xs),
      // width: HelperFunctions.screenWidth(context),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userData?.name ?? 'null',
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: AppColors.white)),
                  Text(userData?.email ?? 'null',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: AppColors.white)),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.primary50,
                    title: const Text("Confirmation",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                    content: const Text(
                      "Are you sure you want to save this in your local storage?",
                      style: TextStyle(color: AppColors.white),
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        // onPressed: () async{
                        //   await _auth.signOutGoogle();
                        //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                        //    return WalkThrough();
                        //  }), (route) => false);
                        // },
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.primary)),
                        child: const Text("Yes",
                            style: TextStyle(
                              color: AppColors.white,
                            )),
                        onPressed: () async {
                          StorageService.saveUserData(context,
                              userData!.id.toString(), userData!.toJson());
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
