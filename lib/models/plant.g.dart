// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantAdapter extends TypeAdapter<Plant> {
  @override
  final int typeId = 0;

  @override
  Plant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plant(
      produto: fields[0] as String,
      categoria: fields[1] as String,
      tempMinSuportada: fields[2] as int,
      tempMaxSuportada: fields[3] as int,
      tempIdealMin: fields[4] as double,
      tempIdealMax: fields[5] as double,
      aguaNecessariaMin: fields[6] as double,
      aguaNecessariaMax: fields[7] as double,
      frequenciaIrrigacao: fields[8] as String,
      climaIdeal: fields[9] as String,
      luzSolarHDia: fields[10] as int,
      chuvaIdealMin: fields[11] as double,
      chuvaIdealMax: fields[12] as double,
      velVentoMax: fields[13] as int,
      umidadeIdealMin: fields[14] as double,
      umidadeIdealMax: fields[15] as double,
      nebulosidadeIdeal: fields[16] as String,
      uvIdealMin: fields[17] as double,
      uvIdealMax: fields[18] as double,
      tempoCultivoMin: fields[19] as double,
      tempoCultivoMax: fields[20] as double,
      tempoCultivoUnidade: fields[21] as String,
      soloIdeal: fields[22] as String,
      irrigacaoTipoEspecial: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Plant obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.produto)
      ..writeByte(1)
      ..write(obj.categoria)
      ..writeByte(2)
      ..write(obj.tempMinSuportada)
      ..writeByte(3)
      ..write(obj.tempMaxSuportada)
      ..writeByte(4)
      ..write(obj.tempIdealMin)
      ..writeByte(5)
      ..write(obj.tempIdealMax)
      ..writeByte(6)
      ..write(obj.aguaNecessariaMin)
      ..writeByte(7)
      ..write(obj.aguaNecessariaMax)
      ..writeByte(8)
      ..write(obj.frequenciaIrrigacao)
      ..writeByte(9)
      ..write(obj.climaIdeal)
      ..writeByte(10)
      ..write(obj.luzSolarHDia)
      ..writeByte(11)
      ..write(obj.chuvaIdealMin)
      ..writeByte(12)
      ..write(obj.chuvaIdealMax)
      ..writeByte(13)
      ..write(obj.velVentoMax)
      ..writeByte(14)
      ..write(obj.umidadeIdealMin)
      ..writeByte(15)
      ..write(obj.umidadeIdealMax)
      ..writeByte(16)
      ..write(obj.nebulosidadeIdeal)
      ..writeByte(17)
      ..write(obj.uvIdealMin)
      ..writeByte(18)
      ..write(obj.uvIdealMax)
      ..writeByte(19)
      ..write(obj.tempoCultivoMin)
      ..writeByte(20)
      ..write(obj.tempoCultivoMax)
      ..writeByte(21)
      ..write(obj.tempoCultivoUnidade)
      ..writeByte(22)
      ..write(obj.soloIdeal)
      ..writeByte(23)
      ..write(obj.irrigacaoTipoEspecial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
