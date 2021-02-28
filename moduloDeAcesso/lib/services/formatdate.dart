class FormatDate {
  static String hora() {
    if (DateTime.now().hour.toString().length < 2) {
      return '0${DateTime.now().hour.toString()}';
    } else {
      return DateTime.now().hour.toString();
    }
  }

  static String minutos(String tamanho, String campo) {
    if (tamanho.length < 2) {
      return '0${campo}';
    } else {
      return campo;
    }
  }

  static String mes() {
    if (DateTime.now().month.toString().length < 2) {
      return '0${(DateTime.now().month)}';
    } else {
      return DateTime.now().month.toString();
    }
  }

  static String dia() {
    if (DateTime.now().day.toString().length < 2) {
      return '0${(DateTime.now().day)}';
    } else {
      return DateTime.now().day.toString();
    }
  }

  static String get objetodia => dia();
  static String get objetomes => mes();
  static String get objetoano => DateTime.now().year.toString();

  static String data() {
    return '${objetodia}/${objetomes}/${objetoano}';
  }
}
