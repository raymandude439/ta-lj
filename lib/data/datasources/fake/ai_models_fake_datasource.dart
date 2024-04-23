import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tugas_akhir_lj/data/datasources/ai_models_datasource.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';
import 'package:tugas_akhir_lj/data/models/regression_coefficient.dart';

var aiModels = [
  AiModels(
      id: 1,
      modelName: 'CHA dan HA terhadap TGFB1',
      description: 'Model ini dapat membantu memprediksi nilai TGFB1, faktor regenerasi tulang, melalui nilai CHA dan HA. ...',
      dateCreated: DateTime.now(),
      accuracy: 0.9,
      resultFormat: "TGFB1",
      listRegressionCoefficient: [
        RegressionCoefficient(
            id: 1,
            columnName: 'CHA',
            columnCoefficient: 1.21529529
        ),
        RegressionCoefficient(
            id: 2,
            columnName: 'HA',
            columnCoefficient: 0.87184282
        )
      ]
  ),
];

class AiModelsFakeDataSource implements AiModelsDataSource {
  @override
  Future<Either<Exception, AiModels>> getAiModels({required String id}) async {
    await Future.delayed(const Duration(seconds: 5));
    return Right(aiModels.firstWhere((element) => element.id == id));
  }

  @override
  Future<Either<Exception, List<AiModels>>> getAllAiModels() async {
    await Future.delayed(const Duration(seconds: 5));
    return Right(aiModels);
  }

  @override
  Future<Either<Exception, bool>> addAiModels({required AiModels aiModel}) async {
    await Future.delayed(const Duration(seconds: 5));
    aiModels.add(aiModel);
    return Right(true);
  }
}

final aiModelsFakeDataSourceProvider = Provider<AiModelsFakeDataSource>(
      (ref) => AiModelsFakeDataSource(),
);
