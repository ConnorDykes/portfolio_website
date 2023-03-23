enum Platforms { iOS, android, web }

class ProjectModel {
  String? name;
  String? icon;
  String? description;

  String? summary;
  List<String>? images;
  String? link;
  List<Platforms>? platfroms;

  ProjectModel(
      {this.name,
      this.icon,
      this.description,
      this.summary,
      this.images,
      this.link,
      this.platfroms});
}
