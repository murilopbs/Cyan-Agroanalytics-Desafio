List recebeLista(List lista){
  int i;
  int j;
  int contador;

  do{
    contador = 0;
    for(i = 0; i < lista.length; i++){
      for(j = 0; j < lista.length; j++){
        if(lista[i].compareTo(lista[j]) < 0){
          String suporte = lista[j];
          lista[j] = lista[i];
          lista[i] = suporte;
          contador++;
        }
      }
    }
  }while(contador < 1);

  return lista;
}