import 'package:fpdart/fpdart.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';

abstract class AiModelsRepository {
  Future<Either<Exception, AiModels>> getAiModels({required String id});
  Future<Either<Exception, List<AiModels>>> getAllAiModels();
  Future<Either<Exception, bool>> addAiModels({required AiModels aiModel});
}
