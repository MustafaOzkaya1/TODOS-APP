import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit():super(0);

  var krepo = YapilacakDaoRepository();

  Future<void> guncelle(int yap_id,String yap_name) async {
    await krepo.guncelle(yap_id, yap_name);
  }
}