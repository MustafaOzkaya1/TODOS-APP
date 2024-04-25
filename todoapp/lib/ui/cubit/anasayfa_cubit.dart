

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/entity/yapilacaklar.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var krepo = YapilacakDaoRepository();

  Future<void> yapilacaklariYukle() async {
    var liste = await krepo.yapilacakYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yap_id) async {
    await krepo.sil(yap_id);
    await yapilacaklariYukle();
  }
}