import 'package:flutter/material.dart';
import 'package:medcom/images.dart';
import 'package:medcom/symptom_summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Presents large images of medical symptoms and two buttons beneath it: a green checkmark for “yes, i have this symptom” and a red cross for “no, this doesn’t apply”.
/// A user must press one of these buttons to continue. When they do, another image will be shown, with the same buttons.
/// Once all of the images have been shown, a list of symptoms that the patient has will appear on the screen. This screen can be screenshot or copied to the clipboard.
/// Then, the user can return to the home screen (this page) and start the process all over again.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Determines which image is being displayed to the user. Currently a list index, but you should adjust this to whatever data-structure you're using.
  /// Also feel free to completely remove it. It's just a quick/easy way of tracking which images/symptoms the patient has (see `_addSymptom`).
  int _imageSelector = 0;
  List<String> symptoms = [];
  final ugheImages = symptomImages.entries
      .toList(); // This list of symptoms should be passed in through a constructor. This (using a global import as a member in a non-configuration instantiable object) is bad practice (because it inhibits testability and re-usability). Please fix my code. Thanks.

  void _addSymptom() {
    var symptom = ugheImages[_imageSelector].key;
    setState(() {
      symptoms.add(symptom);
    });
    _nextImage();
  }

  /// Show next symptom image in list
  void _nextImage() {
    int index = _imageSelector + 1;
    var allImagesHaveBeenShown = index >= ugheImages.length;
    if (allImagesHaveBeenShown) {
      index = 0;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SymptomSummary(
            symptoms: symptoms,
          ),
        ),
      ).then(
        (value) => setState(
          () {
            symptoms = [];
          },
        ),
      );
    }
    setState(() {
      _imageSelector = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _nextImage method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //
    // yes, this is a boilerplate comment. no, i'm not deleting it.
    return Scaffold(
      backgroundColor: Colors.blue[100],
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      //
      // refactoring left as an exercise to the next person. teehee.
      body: Stack(
        children: [
          // Full-width image in center of screen
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(ugheImages[_imageSelector].value),
                ),
              ),
            ),
          ),
          // Checkmark and Cross buttons
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 125,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 36,
                    color: Colors.green,
                    onPressed: _addSymptom,
                    icon: Icon(Icons.check),
                  ),
                  IconButton(
                    iconSize: 36,
                    color: Colors.red,
                    onPressed: _nextImage,
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // Dummy navigation
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Draw',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        // onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
