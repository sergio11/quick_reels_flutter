import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/domain/model/comment.dart';

class CommentCard extends StatelessWidget {

  final CommentBO commentBO;

  const CommentCard({
    Key? key,
    required this.commentBO
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.colorDark,
        border: Border.all(
          color: AppColors.colorWhite,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              commentBO.author.photoUrl,
            ),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: commentBO.author.username,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                            text: ' ${commentBO.text}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.w500)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                        DateFormat.yMMMd().format(
                          commentBO.datePublished,
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.colorWhite, fontWeight: FontWeight.w400)
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
              color: AppColors.colorPrimary,
            ),
          )
        ],
      ),
    );
  }
}