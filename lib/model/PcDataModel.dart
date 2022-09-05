class PcDataModel{
  final String id, nome,img,descrizione, colore,marca,processore,schedaGrafica,sistemaOperativo,tipoMemSec,tipo;
  final bool preferito;
  final int numeroProcessore, ram, dimMemSec;
  final double prezzo, dimensioneSchermo, peso;

  PcDataModel(this.id, this.nome, this.img, this.descrizione, this.colore,this.marca,this.processore,
      this.schedaGrafica,this.sistemaOperativo,this.tipoMemSec,this.tipo,this.preferito,
      this.numeroProcessore,this.dimMemSec,this.ram,this.dimensioneSchermo,this.peso,this.prezzo);
  }