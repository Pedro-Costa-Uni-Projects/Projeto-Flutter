import '../model/registo.dart';

List<Registo> preCarregados(){
  //14 Registos

  List<Registo> toReturn = [];

  Registo registo1 = Registo(100.0, "Sim", 5, "Pré Carregado 1");
  registo1.data = DateTime.utc(2022, 3, 11, 12, 20);
  toReturn.add(registo1);

  Registo registo2 = Registo(95.0, "Não", 4, "Pré Carregado 2");
  registo2.data = DateTime.utc(2022, 3, 10, 11, 30);
  toReturn.add(registo2);

  Registo registo3 = Registo(110.0, "Sim", 3, "Pré Carregado 3");
  registo3.data = DateTime.utc(2022, 3, 9, 10, 40);
  toReturn.add(registo3);

  Registo registo4 = Registo(80.0, "Não", 2, "Pré Carregado 4");
  registo4.data = DateTime.utc(2022, 3, 8, 9, 50);
  toReturn.add(registo4);

  Registo registo5 = Registo(85.0, "Sim", 1, "Pré Carregado 5");
  registo5.data = DateTime.utc(2022, 3, 7, 7, 0);
  toReturn.add(registo5);

  Registo registo6 = Registo(70.0, "Não", 1, "Pré Carregado 6");
  registo6.data = DateTime.utc(2022, 3, 6, 6, 10);
  toReturn.add(registo6);

  Registo registo7 = Registo(60.0, "Sim", 1, "Pré Carregado 7");
  registo7.data = DateTime.utc(2022, 3, 5, 6, 20);
  toReturn.add(registo7);

  Registo registo8 = Registo(95.0, "Não", 2, "Pré Carregado 8");
  registo8.data = DateTime.utc(2022, 3, 4, 6, 30);
  toReturn.add(registo8);

  Registo registo9 = Registo(100.0, "Sim", 3, "Pré Carregado 9");
  registo9.data = DateTime.utc(2022, 3, 3, 6, 40);
  toReturn.add(registo9);

  Registo registo10 = Registo(70.0, "Não", 5, "Pré Carregado 10");
  registo10.data = DateTime.utc(2022, 3, 2, 6, 50);
  toReturn.add(registo10);

  Registo registo11 = Registo(50.0, "Sim", 5, "Pré Carregado 11");
  registo11.data = DateTime.utc(2022, 3, 1, 5, 0);
  toReturn.add(registo11);

  Registo registo12 = Registo(55.0, "Sim", 1, "Pré Carregado 12");
  registo12.data = DateTime.utc(2022, 2, 28, 4, 10);
  toReturn.add(registo12);

  Registo registo13 = Registo(70.0, "Não", 2, "Pré Carregado 13");
  registo13.data = DateTime.utc(2022, 2, 27, 4, 20);
  toReturn.add(registo13);

  Registo registo14 = Registo(65.0, "Sim", 4, "Pré Carregado 14");
  registo14.data = DateTime.utc(2022, 2, 26, 8, 0);
  toReturn.add(registo14);

  Registo registo15 = Registo(60.0, "Não", 5, "Pré Carregado 15");
  registo15.data = DateTime.utc(2022, 2, 25, 10, 30);
  toReturn.add(registo15);

  return toReturn;
}