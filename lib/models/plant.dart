import 'package:hive/hive.dart';

part 'plant.g.dart';

@HiveType(typeId: 0)
class Plant {
  Plant({
    required this.produto,
    required this.categoria,
    required this.tempMinSuportada,
    required this.tempMaxSuportada,
    required this.tempIdealMin,
    required this.tempIdealMax,
    required this.aguaNecessariaMin,
    required this.aguaNecessariaMax,
    required this.frequenciaIrrigacao,
    required this.climaIdeal,
    required this.luzSolarHDia,
    required this.chuvaIdealMin,
    required this.chuvaIdealMax,
    required this.velVentoMax,
    required this.umidadeIdealMin,
    required this.umidadeIdealMax,
    required this.nebulosidadeIdeal,
    required this.uvIdealMin,
    required this.uvIdealMax,
    required this.tempoCultivoMin,
    required this.tempoCultivoMax,
    required this.tempoCultivoUnidade,
    required this.soloIdeal,
    this.irrigacaoTipoEspecial,
  });

  @HiveField(0)
  String produto;

  @HiveField(1)
  String categoria;

  @HiveField(2)
  int tempMinSuportada;

  @HiveField(3)
  int tempMaxSuportada;

  @HiveField(4)
  double tempIdealMin;

  @HiveField(5)
  double tempIdealMax;

  @HiveField(6)
  double aguaNecessariaMin;

  @HiveField(7)
  double aguaNecessariaMax;

  @HiveField(8)
  String frequenciaIrrigacao;

  @HiveField(9)
  String climaIdeal;

  @HiveField(10)
  int luzSolarHDia;

  @HiveField(11)
  double chuvaIdealMin;

  @HiveField(12)
  double chuvaIdealMax;

  @HiveField(13)
  int velVentoMax;

  @HiveField(14)
  double umidadeIdealMin;

  @HiveField(15)
  double umidadeIdealMax;

  @HiveField(16)
  String nebulosidadeIdeal;

  @HiveField(17)
  double uvIdealMin;

  @HiveField(18)
  double uvIdealMax;

  @HiveField(19)
  double tempoCultivoMin;

  @HiveField(20)
  double tempoCultivoMax;

  @HiveField(21)
  String tempoCultivoUnidade;

  @HiveField(22)
  String soloIdeal;

  @HiveField(23)
  String? irrigacaoTipoEspecial;

  factory Plant.fromMap(Map<String, dynamic> plant) {
    return Plant(
      produto: plant["produto"]! as String,
      categoria: plant["categoria"]! as String,
      tempMinSuportada: int.parse(plant["temp_min_suportada"]! as String),
      tempMaxSuportada: int.parse(plant["temp_max_suportada"]! as String),
      tempIdealMin: double.parse(plant["temp_ideal_min"]! as String),
      tempIdealMax: double.parse(plant["temp_ideal_max"]! as String),
      aguaNecessariaMin: double.parse(plant["agua_necessaria_min"]! as String),
      aguaNecessariaMax: double.parse(plant["agua_necessaria_max"]! as String),
      frequenciaIrrigacao: plant["frequencia_irrigacao"]! as String,
      climaIdeal: plant["clima_ideal"]! as String,
      luzSolarHDia: int.parse(plant["luz_solar_h_dia"]! as String),
      chuvaIdealMin: double.parse(plant["chuva_ideal_min"]! as String),
      chuvaIdealMax: double.parse(plant["chuva_ideal_max"]! as String),
      velVentoMax: int.parse(plant["vel_vento_max"]! as String),
      umidadeIdealMin: double.parse(plant["umidade_ideal_min"]! as String),
      umidadeIdealMax: double.parse(plant["umidade_ideal_max"]! as String),
      nebulosidadeIdeal: plant["nebulosidade_ideal"]! as String,
      uvIdealMin: double.parse(plant["uv_ideal_min"]! as String),
      uvIdealMax: double.parse(plant["uv_ideal_max"]! as String),
      tempoCultivoMin: double.parse(plant["tempo_cultivo_min"]! as String),
      tempoCultivoMax: double.parse(plant["tempo_cultivo_max"]! as String),
      tempoCultivoUnidade: plant["tempo_cultivo_unidade"]! as String,
      soloIdeal: plant["solo_ideal"]! as String,
      irrigacaoTipoEspecial: plant["irrigacao_tipo_especial"] as String?,
    );
  }
}
