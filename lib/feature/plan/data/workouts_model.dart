class WorkoutsModel {
    final String image;
    final String title;
    final int calories;
    final List<Day> days;

    WorkoutsModel({
        required this.image,
        required this.title,
        required this.calories,
        required this.days,
    });

    factory WorkoutsModel.fromJson(Map<dynamic, dynamic> json) => WorkoutsModel(
        image: json["image"],
        title: json["title"],
        calories: json["calories"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "calories": calories,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
    };
}

class Day {
    final int day;
    final List<Exercise> exercises;

    Day({
        required this.day,
        required this.exercises,
    });

    factory Day.fromJson(Map<dynamic, dynamic> json) => Day(
        day: json["day"],
        exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
    };
}

class Exercise {
    final String title;
    final String description;

    Exercise({
        required this.title,
        required this.description,
    });

    factory Exercise.fromJson(Map<dynamic, dynamic> json) => Exercise(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}