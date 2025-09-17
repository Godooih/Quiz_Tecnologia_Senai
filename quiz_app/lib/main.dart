import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Tech',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

// --- TELA INICIAL ---
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void startQuiz() {
    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, preencha nome e idade!')));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          playerName: nameController.text,
          playerAge: ageController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.computer, size: 100, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'Quiz de Tecnologia',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: startQuiz,
                  child: Text('Começar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- QUIZ PAGE ---
class QuizPage extends StatefulWidget {
  final String playerName;
  final String playerAge;

  QuizPage({required this.playerName, required this.playerAge});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;

  final List<Map<String, Object>> questions = [
    {
      "question": "Quem é considerado o pai da computação?",
      "answers": [
        {"text": "Alan Turing", "correct": true},
        {"text": "Bill Gates", "correct": false},
        {"text": "Steve Jobs", "correct": false},
        {"text": "Charles Babbage", "correct": false},
      ]
    },
    {
      "question": "Qual linguagem é usada no Flutter?",
      "answers": [
        {"text": "Java", "correct": false},
        {"text": "Dart", "correct": true},
        {"text": "Python", "correct": false},
        {"text": "C#", "correct": false},
      ]
    },
    {
      "question": "O que significa HTML?",
      "answers": [
        {"text": "Hyper Text Markup Language", "correct": true},
        {"text": "Hyper Tool Machine Link", "correct": false},
        {"text": "High Tech Modern Language", "correct": false},
        {"text": "Home Tool Markup Language", "correct": false},
      ]
    },
    {
      "question": "Qual empresa criou o Windows?",
      "answers": [
        {"text": "Apple", "correct": false},
        {"text": "Microsoft", "correct": true},
        {"text": "IBM", "correct": false},
        {"text": "Google", "correct": false},
      ]
    },
    {
      "question": "O que significa CPU?",
      "answers": [
        {"text": "Central Processing Unit", "correct": true},
        {"text": "Computer Personal Unit", "correct": false},
        {"text": "Central Power Utility", "correct": false},
        {"text": "Control Process User", "correct": false},
      ]
    },
    {
      "question": "Qual foi o primeiro navegador popular?",
      "answers": [
        {"text": "Netscape Navigator", "correct": true},
        {"text": "Chrome", "correct": false},
        {"text": "Firefox", "correct": false},
        {"text": "Internet Explorer", "correct": false},
      ]
    },
    {
      "question": "Quem fundou a Apple com Steve Jobs?",
      "answers": [
        {"text": "Steve Wozniak", "correct": true},
        {"text": "Mark Zuckerberg", "correct": false},
        {"text": "Larry Page", "correct": false},
        {"text": "Jeff Bezos", "correct": false},
      ]
    },
    {
      "question": "Qual desses NÃO é um sistema operacional?",
      "answers": [
        {"text": "Linux", "correct": false},
        {"text": "Windows", "correct": false},
        {"text": "Python", "correct": true},
        {"text": "macOS", "correct": false},
      ]
    },
    {
      "question": "Qual tecnologia é usada em criptomoedas?",
      "answers": [
        {"text": "Blockchain", "correct": true},
        {"text": "Big Data", "correct": false},
        {"text": "Cloud Computing", "correct": false},
        {"text": "Inteligência Artificial", "correct": false},
      ]
    },
    {
      "question": "O que significa AI?",
      "answers": [
        {"text": "Artificial Intelligence", "correct": true},
        {"text": "Advanced Internet", "correct": false},
        {"text": "Automatic Interface", "correct": false},
        {"text": "Applied Innovation", "correct": false},
      ]
    },
  ];

  void answerQuestion(bool isCorrect) {
    if (answered) return;

    if (isCorrect) score++;
    setState(() {
      answered = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (currentQuestion < questions.length - 1) {
          currentQuestion++;
          answered = false;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(score: score, total: questions.length, name: widget.playerName),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pergunta ${currentQuestion + 1}/${questions.length}",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              question["question"] as String,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.amberAccent),
            ),
            SizedBox(height: 30),
            ...(question["answers"] as List<Map<String, Object>>).map((answer) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: answered
                        ? (answer["correct"] as bool ? Colors.green : Colors.redAccent)
                        : Colors.deepPurple.shade400,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () => answerQuestion(answer["correct"] as bool),
                  child: Text(answer["text"] as String, style: TextStyle(fontSize: 18)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// --- RESULT PAGE ---
class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  final String name;

  ResultPage({required this.score, required this.total, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fim do Quiz!",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            SizedBox(height: 20),
            Text(
              "$name, você acertou $score de $total perguntas!",
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 8,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Jogar Novamente", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
