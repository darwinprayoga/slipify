import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Track {
  final String audio;
  final String image;
  final String title;

  const Track({
    required this.audio,
    required this.image,
    required this.title,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
        audio: json['audio'] as String,
        image: json['image'] as String,
        title: json['title'] as String);
  }
}

Future<Track> fetchTracks(String link) async {
  final response =
      await http.get(Uri.parse("https://opengraph.apiclabs.com/v1/?url=$link"));

  if (response.statusCode == 200) {
    return Track.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Track');
  }
}
