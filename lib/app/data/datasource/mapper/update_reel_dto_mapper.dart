import 'package:quickreels/app/core/utils/mapper.dart';
import 'package:quickreels/app/data/datasource/dto/update_reel_dto.dart';

class UpdatePostDtoMapper extends Mapper<UpdateReelDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(UpdateReelDTO object) {
    return {
      'description': object.description,
      'tags': object.tags,
      'placeInfo': object.placeInfo,
    };
  }
}
