import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';
import 'package:tugas_akhir_lj/data/repository/ai_models_repository_impl.dart';

class ModelNotifier extends AutoDisposeFamilyAsyncNotifier<AiModels, String> {
  @override
  FutureOr<AiModels> build(String arg) {
    _fetchModels(arg);
    return AiModels(
        id: 0,
        modelName: '',
        dateCreated: DateTime.now(),
        description: '',
        resultFormat: '',
        accuracy: 0.0,
        listRegressionCoefficient: [

        ]
    );
  }

  Future<void> _fetchModels(String id) async {
    await Future.delayed(Duration.zero);
    state = const AsyncLoading();
    final repository = ref.read(aiModelsRepositoryProvider);
    final result = await repository.getAiModels(id: id);
    result.fold((e) => state = AsyncError(e, StackTrace.current),
            (data) => {state = AsyncData(data)});
  }
}

class ModelsNotifier extends AutoDisposeAsyncNotifier<List<AiModels>> {
  @override
  List<AiModels> build() {
    _fetchAiModels();
    return [];
  }

  void _fetchAiModels() async {
    await Future.delayed(Duration.zero);
    state = const AsyncLoading();
    final repository = ref.read(aiModelsRepositoryProvider);
    final result = await repository.getAllAiModels();
    result.fold((e) => state = AsyncError(e, StackTrace.current),
            (data) => state = AsyncData(data));
  }
}

final aiModelsProvider =
AsyncNotifierProvider.autoDispose<ModelsNotifier, List<AiModels>>(
  ModelsNotifier.new,
);

final aiModelProvider =
AsyncNotifierProvider.autoDispose.family<ModelNotifier, AiModels, String>(
  ModelNotifier.new,
);
