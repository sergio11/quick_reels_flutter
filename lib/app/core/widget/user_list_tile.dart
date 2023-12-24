import 'package:flutter/material.dart';
import 'package:quickreels/app/core/utils/helpers.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_button.dart';
import 'package:quickreels/app/domain/model/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListTile extends StatelessWidget {
  final UserBO userBO;
  final bool isFollowedByAuthUser;
  final bool isAuthUser;
  final VoidCallback? onFollowPressed;
  final VoidCallback? onUnFollowPressed;
  final bool isDisabled;

  const UserListTile(
      {super.key,
      required this.userBO,
      required this.isAuthUser,
      this.onFollowPressed,
      this.onUnFollowPressed,
      this.isFollowedByAuthUser = false,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      color: AppColors.colorDark,
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: buildCircleImage(
              imageUrl: userBO.photoUrl,
              radius: 22,
              showBackgroundColor: false),
        ),
        title: Text(
          userBO.username,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.colorWhite, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(userBO.bio,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.colorWhite)),
        trailing:
            !isAuthUser && onUnFollowPressed != null && onFollowPressed != null
                ? CommonButton(
                    text: (isFollowedByAuthUser
                            ? appLocalizations?.userListTileUnFollow
                            : appLocalizations?.userListTileFollow) ??
                        "",
                    textColor: isFollowedByAuthUser
                        ? AppColors.colorPrimary
                        : AppColors.colorWhite,
                    borderColor: isFollowedByAuthUser
                        ? AppColors.colorPrimary
                        : AppColors.colorWhite,
                    isDisabled: isDisabled,
                    onPressed: () => isFollowedByAuthUser
                        ? onUnFollowPressed?.call()
                        : onFollowPressed?.call(),
                    sizeType: CommonButtonSizeType.tiny,
                  )
                : null,
      ),
    );
  }
}
