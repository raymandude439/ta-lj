import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:tugas_akhir_lj/data/datasources/ai_models_datasource.dart';
import 'package:tugas_akhir_lj/data/datasources/fake/ai_models_fake_datasource.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';
import 'package:tugas_akhir_lj/domain/repository/ai_model_repository.dart';

class AiModelsRepositoryImpl implements AiModelsRepository {
  final AiModelsDataSource aiModelsDataSource;

  AiModelsRepositoryImpl({
    required this.aiModelsDataSource,
  });

  @override
  Future<Either<Exception, List<AiModels>>> getAllAiModels() {
    return aiModelsDataSource.getAllAiModels();
  }

  @override
  Future<Either<Exception, AiModels>> getAiModels({required String id}) {
    return aiModelsDataSource.getAiModels(id: id);
  }

  @override
  Future<Either<Exception, bool>> addAiModels({required AiModels aiModel}) {
    return aiModelsDataSource.addAiModels(aiModel: aiModel);
  }
}

final aiModelsRepositoryProvider = Provider<AiModelsRepository>((ref) {
  final dataSource = ref.read(aiModelsFakeDataSourceProvider);
  return AiModelsRepositoryImpl(aiModelsDataSource: dataSource);
});
