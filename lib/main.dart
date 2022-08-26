import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Form',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final Controller = TextEditingController();

  final FormKey = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables

  @override

  // aumentando a reatividade do codigo
  // void initState() {
  //   Controller.addListener(() {
  //     print(Controller.text);
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Form(
        key: FormKey,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // pegando o nome
              ComponentTExtField(
                label: "Name",
                icon: Icons.person,
              ),
              SizedBox(
                height: 30,
              ),

              // pegando o email
              ComponentTExtField(
                label: "E-mail",
                icon: Icons.email,
              ),

              SizedBox(
                height: 30,
              ),
              // colocando a senha
              ComponentTExtField(label: "Senha", icon: Icons.vpn_key),

              SizedBox(
                height: 30,
              ),

              // confirmando a senha
              ComponentTExtField(
                label: "Confirmar Senha",
                icon: Icons.vpn_key,
              ),

              SizedBox(
                height: 30,
              ),

              SizedBox(
                height: 60,
              ),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                    onPressed: () {
                      // fazendo a validação no formulario sem precisar de um contexto escrito de forma manual
                      FormKey.currentState?.validate();
                    },
                    icon: Icon(Icons.save_alt),
                    label: Text('Salvar')),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () {
                      FormKey.currentState?.reset();
                    },
                    icon: Icon(Icons.restore),
                    label: Text('Reset')),
              ),
              ValueListenableBuilder(
                  valueListenable: Controller,
                  builder: (_, __, ___) {
                    return Text(Controller.text);
                  }),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ComponentTExtField extends StatelessWidget {
  // aqui nos reequerimos que eles tenham essas caracteristica retornada
  const ComponentTExtField(
      {Key? key,
      required this.label,
      required this.icon,
      this.validator,
      this.onSaved})
      : super(key: key);

  // declarando eles paras ser componentizado
  final String label;
  final IconData icon;
  final String? Function(String text)? validator;
  final String? Function(String text)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // melhora a reatividade a cada vez que e digitado algo no input
      // onChanged: (text) {
      //   print(text);
      // },

      // apos o enter ele retorna o texto inteiro
      // onSubmitted: (text) {
      //   print(text);
      // },

      // ultilizando validador para o input
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'esse campo e obrigratorio preencher';
        }
      },
      decoration: InputDecoration(
        // colocando uma borda
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(40),
        )),
        // texto dentro do input
        labelText: label,
        prefixIcon: icon == null ? null : Icon(icon),
        //suffixIcon: Icon(Icons.add)),
      ),
    );
  }
}
