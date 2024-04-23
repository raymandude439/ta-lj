import 'package:tugas_akhir_lj/data/models/regression_coefficient.dart';

class AiModels{

  int id;
  String modelName;
  String description;
  DateTime dateCreated;
  String resultFormat;
  double accuracy;
  List<RegressionCoefficient> listRegressionCoefficient;

  AiModels({
    required this.id,
    required this.modelName,
    required this.description,
    required this.dateCreated,
    required this.resultFormat,
    required this.accuracy,
    required this.listRegressionCoefficient
  });
}