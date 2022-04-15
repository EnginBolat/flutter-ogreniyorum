import 'package:block_ile_listeleme/models/kisiler_model.dart';

abstract class KisilerRepository{
  Future<List<Kisiler>> kisileriGetir();
}

class KisilerDaoRepository implements KisilerRepository{
  @override
  Future<List<Kisiler>> kisileriGetir() async{
    var kisiListesi = <Kisiler>[];
    var k1 = Kisiler('1','Ahmet','1111');
    var k2 = Kisiler('2','Mehmet','2222');

    kisiListesi.add(k1);
    kisiListesi.add(k2);

    return kisiListesi;
  }
}