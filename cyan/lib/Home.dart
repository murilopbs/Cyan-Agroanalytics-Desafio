import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List lista = [];
List listaOrganizada = [];
TextEditingController controlador_texto = TextEditingController();
bool temTexto = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controlador_texto,
                      decoration: const InputDecoration(
                        labelText: "Adicione um item",
                        hintText: "Ex.: Zebra"
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  ElevatedButton(
                    child: const Text("Adicionar"),
                    onPressed: (){
                      setState(() {
                        lista.add(controlador_texto.text);
                        controlador_texto.text = "";
                      });
                    },
                  ),
                ],
              ),
            ),
            Text(lista.isEmpty ? "Adicione um item!" : lista.toString()),
            ElevatedButton(
              child: const Text("Ver resultados"),
              onPressed: (){
                if(lista.isEmpty){
                  setState(() {
                    temTexto = false;
                  });
                }else{
                  listaOrganizada = recebeLista(lista);
                  setState(() {
                    temTexto = true;
                  });
                }
              },
            ),
            Visibility(
              visible: temTexto,
              child: Text(listaOrganizada.toString()),
            ),
            ElevatedButton(
              child: const Text("Limpar lista"),
              onPressed: (){
                setState(() {
                  temTexto = false;
                  lista = [];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


List recebeLista(List lista){
  int i;
  int j;
  List listaSuporte = lista;


  for(i = 0; i < listaSuporte.length; i++){
    for(j = 0; j < listaSuporte.length; j++){
      if(listaSuporte[i].compareTo(listaSuporte[j]) < 0){
        String suporte = listaSuporte[j];
        listaSuporte[j] = listaSuporte[i];
        listaSuporte[i] = suporte;
      }
    }
  }


  return listaSuporte;
}

//walter.azevedo@cyan-agro.com