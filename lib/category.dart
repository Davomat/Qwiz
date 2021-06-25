
enum Category {
  biology,
  cosmos,
  logic,
  programming,
  science,
  technology,
}

class CategoryHandler {
  Category category;

  CategoryHandler(this.category);

  static String getFullString(Category category) {
    switch (category) {
      case Category.cosmos:       return 'Kosmos und Physik';
      case Category.science:      return 'Naturwissenschaften';
      case Category.technology:   return 'Technik / Ingenieurswissen';
      case Category.programming:  return 'Informatik / Programmierung';
      case Category.logic:        return 'Logik und Mathematik';
      case Category.biology:      return 'Biologie und Umwelt';
      default:                    return '';
    }
  }

  static String getShortString(Category category) {
    switch (category) {
      case Category.cosmos:       return 'Kosmos';
      case Category.science:      return 'Naturwissensch.';
      case Category.technology:   return 'Technik';
      case Category.programming:  return 'Programmierung';
      case Category.logic:        return 'Logik';
      case Category.biology:      return 'Biologie';
      default:                    return '';
    }
  }

  static String getIcon(Category category) {
    switch (category) {
      case Category.cosmos:       return 'assets/icons/cosmos.png';
      case Category.science:      return 'assets/icons/science.png';
      case Category.technology:   return 'assets/icons/engineering.png';
      case Category.programming:  return 'assets/icons/prog.png';
      case Category.logic:        return 'assets/icons/logic.png';
      case Category.biology:      return 'assets/icons/bio.png';
      default:                    return '';
    }
  }
}
