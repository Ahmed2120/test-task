class Drug{
  String name;
  String dose;
  String strength;

  Drug(this.name, this.dose, this.strength);

  Drug.fromJson(Map<String, dynamic> json):
        name = json['name'],
        dose = json['dose'],
        strength = json['strength'];

  Map<String, dynamic> toJson(){
    return {
    'name' : name,
    'dose' : dose,
    'strength' : strength
    };
  }
}