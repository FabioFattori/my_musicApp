import 'dart:io';

class Storage {
  late Directory docDir;
  List<String> toReturn = <String>[];
  int pos = 0;

  int getPos() {
    return pos;
  }

  incrementPos() {
    pos++;
  }

  decrementPos() {
    pos--;
  }

  jumpTo(n) {
    pos = n;
  }

  GivenAPathUpdatePos(path) {
    pos = toReturn.indexOf(path);
  }

  String SkipSong() {
    if (pos < toReturn.length - 1) {
      pos++;
      return toReturn[pos];
    }
    pos = 0;
    return toReturn[pos];
  }

  String getName(path) {
    String finalString = path.split(".mp3")[0];
    List<String> appoggio = finalString.split('_');
    finalString = "";
    for (var i = 0; i < appoggio.length; i++) {
      finalString += '${appoggio[i]} ';
    }

    return finalString;
  }

  List<String> GivenAStringGetFiles(strg) {
    List<String> nw = <String>[];
    for (String s in toReturn) {
      if (getName(s).toLowerCase().contains(strg.toString().toLowerCase())) {
        nw.add(s);
      }
    }

    return nw;
  }

  String goBack() {
    if (pos > 0) {
      pos--;
      return toReturn[pos];
    }
    pos = toReturn.length - 1;
    return toReturn[pos];
  }

  setFiles() async {
    String path = "GEMITAIZ_-_01_-_INTRO_-_QCVC_3.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_01_Intro_QVC5.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_03_Ballata_del_dubbio_Pt3_QVC5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_04_Billy_Idol_QVC5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_05_Ancora_un_po_QVC5.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_06_Le_mille_e_una_notte_Ft_Luche_e_Caneda_QVC5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_07_Veleno_pt5_ft_MadMan_QVC5.mp3";

    toReturn.add(path);

    path =
        "Gemitaiz_-_08_Ci_puoi_riprovare_ft_Achille_Lauro_e_Clementino_QVC5.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_09_Non_ti_rivedo_Piu_-_QVC5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_10_Quello_che_vi_consiglio_pt3_-_QVC7.mp3";

    toReturn.add(path);

    path =
        "Gemitaiz_-_12_Decathlon_ft_Nto_e_Jack_The_Smoker_-_Quello_che_vi_consiglio_Vol_5.mp3";

    toReturn.add(path);
    path =
        "Gemitaiz_-_14_Si_va_ft_Gemello_e_Mystic_1_-_Quello_che_vi_consiglio_Vol_5.mp3";

    toReturn.add(path);

    path =
        "Gemitaiz_-_15_Quello_che_mi_chiedi_-_Quello_che_vi_consiglio_Vol_5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_16_Outro_QVC5.mp3";

    toReturn.add(path);
    path =
        "Gemitaiz_-_Dancing_With_The_Devil_(ft._Bassi_Maestro_Mondo_Marcio).mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Dimmelo_Pure_Prod_Il_Tre.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Fire_pt_2.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_Fresco_RMX_(Post_Malone_-_Wow.).mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_In_Aria_Feat_Sercho.mp3";

    toReturn.add(path);

    path = "GEMITAIZ_-_Intro_Qvc_4.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_La_Ballata_Del_Dubbio_Prod_Frenetik_beat_Orang3.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Neanche_Un_Giorno_Prod_Shablo.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Niente_Prod_Chebit.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_On_The_Corner_Prod_Bassi_Maestro.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Outro_Too_Much.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Quello_Che_Vi_Consiglio_pt_2.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_Siddharta.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Stare_Male.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Superman_pt_3.mp3";

    toReturn.add(path);
    path =
        "Gemitaiz_-_Tutti_Quanti_Feat_Killa_Cali_Jack_The_Smoker_Low_Low_Ensi_Uzi_Junker_Clementino.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Veleno_pt_4_Feat_MadMan.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_Vivere_pt_2_Feat_Engma_Primo_Brown.mp3";

    toReturn.add(path);
    path = "Gemitaiz_-_Vmpsb.mp3";

    toReturn.add(path);

    path =
        "Gemitaiz_-10_Scappo_via_-_Quello_che_vi_consiglio_Vol_5_Prod_Mixer_T_QVC5.mp3";

    toReturn.add(path);

    path =
        "Gemitaiz_-11_Se_vuoi_puoi_Ft_Ser_Travis_-_Quello_che_vi_consiglio_Vol_5.mp3";

    toReturn.add(path);
    path =
        "Gemitaiz_-13_Giorno_nero_ft_Killa_Cali_e_Yojimbo_-_Quello_che_vi_consiglio_Vol_5.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-15_Fratè_-_QVC7_-_Quello_che_vi_consiglio_vol.7.mp3";

    toReturn.add(path);

    path = "Lazza_-_64_Bars_Prod_Drillionaire_Red_Bull_64_Bars.mp3";

    toReturn.add(path);
    path = "Post_Malone_-_Remember_Beerbongs_Bentleys_Album_.mp3";

    toReturn.add(path);

    path = "Post_Malone_Socialite_Ft_Swae_Lee_Hollywoods_Bleeding_Album_.mp3";

    toReturn.add(path);

    path = "Salmo_-_LOSING_MY_MIND_(Audio).mp3";

    toReturn.add(path);
  }

  List<String> getFiles() {
    if (toReturn.isEmpty) {
      setFiles();
    }

    return toReturn;
  }
}
