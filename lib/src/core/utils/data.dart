import '../models/question.dart';
import '../models/subject.dart';


final htmlQuestions = [
  Question(1, 'What does HTML stand for?', 2, [
      "HighText Machine Language",
      "HyperText and links Markup Language",
      "HyperText Markup Language",
      "None of these",
    ],
  ),
  Question(2,
      "The correct sequence of HTML tags for starting a webpage is -", 1, [
        "Head, Title, HTML, body",
        "HTML, Head, Title, Body",
        "HTML, Body, Title, Head",
        "HTML, Head, Body, Title",
      ],
  ),
  Question(3,
    "Which of the following element is responsible for making the text bold in HTML?",
    2, [
      "<pre>",
      "<a>",
      "<b>",
      "<br>",
    ],
  ),
  Question(4,
    "Which character is used to represent the closing of a tag in HTML?",
    2, ["\\", "!", "/", "."],
  ),
  Question(5,
    "Choose the correct hyperlink in HTML?",
    0, [
      '<a href="www.javatpoint.com"> javaTpoint.com </a>',
      '<a url="www.javatpoint.com" javaTpoint.com /a>',
      '<a link="www.javatpoint.com"> javaTpoint.com </a>',
      '<a> www.javatpoint.com <javaTpoint.com /a>'
    ],
  ),
];

final phpQuestions = [
  Question(1, 'Variable name in PHP starts with -', 1, [
    "H! (Exclamation)",
    "\$ (Dollar)",
    "& (Ampersand)",
    "# (Hash)",
  ],
  ),
  Question(2,
    "Which of the following is the default file extension of PHP?", 0,
    [".php", ".hphp", ".xml", ".html",],
  ),
  Question(3,
    "Which of the following is correct to add a comment in php?",
    3, ["&.....&", "//....", "/*....*/", "Both (b) and (c)",],
  ),
  Question(4,
    "Which of the following is used to display the output in PHP?",
    0, ["echo", "write", "stdout", "Both (a) and (c)"],
  ),
  Question(5,
    "Which of the following is used for concatenation in PHP?",
    2, ['+ (plus)', '* (Asterisk)', '.(dot)', 'append()'],
  ),
];

final List<Subject> subjects = [
  Subject(1, "HTML", "html_logo.png", htmlQuestions),
  Subject(2, "PHP", "php_logo.png", phpQuestions),
];