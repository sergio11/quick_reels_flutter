import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/comment_dto.dart';
import 'package:quickreels/app/data/datasource/dto/user_dto.dart';
import 'package:quickreels/app/domain/model/comment.dart';
import 'package:quickreels/app/domain/model/user.dart';

class CommentBoMapper extends Mapper<CommentBoMapperData, CommentBO> {
  final Mapper<UserDTO, UserBO> userMapper;

  CommentBoMapper({required this.userMapper});

  @override
  CommentBO call(CommentBoMapperData object) {
    return CommentBO(
        commentId: object.commentDTO.commentId,
        postId: object.commentDTO.postId,
        datePublished: object.commentDTO.datePublished,
        text: object.commentDTO.text,
        author: userMapper(object.userDTO));
  }
}

class CommentBoMapperData {
  final CommentDTO commentDTO;
  final UserDTO userDTO;

  CommentBoMapperData({required this.commentDTO, required this.userDTO});
}