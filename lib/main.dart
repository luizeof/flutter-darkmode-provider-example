import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() async => runApp(
      // Aqui rodamos o app dentro do provider
      ChangeNotifierProvider<DynamicDarkMode>(
        create: (_) => DynamicDarkMode(),
        child: MyHomePage(),
      ),
    );

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Aqui capturamos os dados do nosso ThemeProvider
    final themeProvider = Provider.of<DynamicDarkMode>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Habilita o suporte ao Dark Mode no MaterialApp
      darkTheme: ThemeData.dark(),
      // Informa o status do Dark Mode ap MaterialApp
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            themeProvider.isDarkMode
                ? 'Dark Mode Habilitado'
                : 'Light Mode Habilitado',
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.brightness_4),
              onPressed: () {
                // Aqui alteramos o status do Dark Mode
                // e o Provider se encarrega de avisar ao MaterialApp
                setState(
                  () {
                    themeProvider.isDarkMode
                        // Configura como Light Mode
                        ? themeProvider.setLightMode()
                        // Configura como Dark Mode
                        : themeProvider.setDarkMode();
                  },
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Spacer(),
              Text('Texto Padrão'),
              Spacer(),
              Icon(
                Icons.wb_sunny,
                size: 36.0,
              ),
              Spacer(),
              RaisedButton(
                child: Text('RaisedButton Padrão'),
                onPressed: () {},
              ),
              Spacer(),
              Text('Dark Mode Dinâmico'),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
