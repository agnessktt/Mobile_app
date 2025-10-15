import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: RichTextExample(),
          ),
        ),
      ),
    );
  }
}

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  List<TextSpan> underlineEachWord(String text) {
    final words = text.split(" ");
    return [
      for (int i = 0; i < words.length; i++) ...[
        TextSpan(
          text: words[i],
          style: const TextStyle(
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        if (i != words.length - 1) const TextSpan(text: " "), // chèn space không gạch
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 18),
        children: [
          TextSpan(
            text:
            "Ngoài ra còn có các lệnh khác cầu kỳ hơn phải vào menu để trình bày như: ",
          ),

          ...underlineEachWord("Words Only"),
          const TextSpan(text: " chỉ "),

          ...underlineEachWord("gạch dưới cho từng chữ một"),
          const TextSpan(text: ". "),

          const TextSpan(
            text: "Double",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          const TextSpan(text: " để "),
          const TextSpan(
            text: "gạch dưới hai nét",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          const TextSpan(text: ". "),

          const TextSpan(
            text: "Dotted",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
          const TextSpan(text: " để "),
          const TextSpan(
            text: "gạch dưới bằng dấu chấm",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
          const TextSpan(text: ", "),

          const TextSpan(
            text: "Strikethrough",
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          const TextSpan(text: " tạo ra "),
          const TextSpan(
            text: "chữ gạch giữa",
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          const TextSpan(text: ", các lệnh "),

          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Text(
              "Superscript",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          const TextSpan(text: " và "),
          WidgetSpan(
            alignment: PlaceholderAlignment.bottom,
            child: Text(
              "Subscript",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          const TextSpan(
              text: " giúp chúng ta tạo được một biểu thức đơn giản."),
        ],
      ),
    );
  }
}
