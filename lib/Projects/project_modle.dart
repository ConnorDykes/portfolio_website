enum Platforms { iOS, android, web }

class ProjectModel {
  String? name;
  String? icon;
  String? description;

  String? summary;
  List<String>? images;
  String? iOSLink;
  String? androidLink;
  String? webLink;
  List<Platforms>? platfroms;

  ProjectModel(
      {this.name,
      this.icon,
      this.description,
      this.summary,
      this.images,
      this.iOSLink,
      this.androidLink,
      this.webLink,
      this.platfroms});
}
