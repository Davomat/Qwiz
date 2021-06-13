
enum Category {
  cosmos,
  health,
  logic,
  programming,
  science,
  technology,
}

class CategoryHandler {
  static String getFullString(Category category) {
    switch (category) {
      case Category.cosmos:       return 'Kosmos und Physik';
      case Category.science:      return 'Naturwissenschaften';
      case Category.technology:   return 'Technik / Ingenieurswissen';
      case Category.programming:  return 'Informatik / Programmierung';
      case Category.logic:        return 'Logik und Mathematik';
      case Category.health:      return 'Körper und Gesundheit';
      default:                    return '';
    }
  }

  static String getShortString(Category category) {
    switch (category) {
      case Category.cosmos:       return 'Kosmos';
      case Category.science:      return 'NaWi';
      case Category.technology:   return 'Technik';
      case Category.programming:  return 'Programmierung';
      case Category.logic:        return 'Logik';
      case Category.health:      return 'Körper';
      default:                    return '';
    }
  }
}
