import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repository.dart';

class KayitSayfaCubit extends Cubit<void>  {
  KayitSayfaCubit():super(0);
  var krepo =YapilacakDaoRepository();

  Future <void> kaydet(String yap_name) async{
    await krepo.kaydet(yap_name);
  }
}