import 'dart:math';

import 'category.dart';
import 'question.dart';

class QuestionCatcher {

  static int getNumberOfQuestions(Category category) {
    return getQuestions(category).length;
  }

  static List<String> getRandomAnswerList(Question q) {
    final answers = List<String>.empty(growable: true);
    final temp = List<String>.empty(growable: true);

    temp.add(q.rightAnswer);
    temp.add(q.wrongAnswer1);
    temp.add(q.wrongAnswer2);
    temp.add(q.wrongAnswer3);

    answers.add(temp.removeAt(Random().nextInt(4)));
    answers.add(temp.removeAt(Random().nextInt(3)));
    answers.add(temp.removeAt(Random().nextInt(2)));
    answers.add(temp.removeAt(0));

    return answers;
  }

  static List<Question> getQuestions(Category category) {
    switch (category) {
      case Category.cosmos:       return _getQuestionsAboutCosmos();
      case Category.science:      return _getQuestionsAboutScience();
      case Category.technology:   return _getQuestionsAboutTechnology();
      case Category.programming:  return _getQuestionsAboutProgramming();
      case Category.logic:        return _getQuestionsAboutLogic();
      case Category.health:       return _getQuestionsAboutHealth();
      default:                    return new List<Question>.empty();
    }
  }


  static List<Question> _getQuestionsAboutCosmos() {
    final questions = new List<Question>.empty(growable: true);

    final qAgeOfCosmos = Question(
      questionText: 'Wie alt ist das Universum?',
      rightAnswer:  '13,8 Milliarden Jahre',
      wrongAnswer1:  '138 Milliarden Jahre',
      wrongAnswer2: '1,38 Milliarden Jahre',
      wrongAnswer3:  '138 Millionen Jahre',
    );
    questions.add(qAgeOfCosmos);

    final qHeavyElements = Question(
      questionText: 'Wie / Wann entstanden die schweren Elemente wie z.B. Gold oder Platin, die wir heute auf der Erde vorfinden?',
      rightAnswer:  'bei Supernovae (Sternentode)',
      wrongAnswer1: 'direkt nach dem Urknall',
      wrongAnswer2: 'beim Zusammenprall der Ur-Erde mit Mond',
      wrongAnswer3: 'durch starke Sonneneruptionen',
      additionalInformation: 'Massereiche Sterne fusionieren vor ihrem \"Tod\" Kohlenstoff weiter zu Neon, Sauerstoff, Silizium und Eisen, was durch die darauf folgende Implosion teilweise ins All geschleudert wird (Rebound).',
    );
    questions.add(qHeavyElements);

    final qKilonova = Question(
        questionText: 'Was ist eine Kilonova (oder auch Macronova)?',
        rightAnswer:  'Zusammenstoß zweier Neutronensterne',
        wrongAnswer1: 'Zusammenstoß zweier Riesensterne',
        wrongAnswer2: 'Expansion eines roten Riesen',
        wrongAnswer3: 'Expansion eines blauen Riesen',
      additionalInformation: 'Stichwort Doppelsternsystem; Beim Zusammenstoß zerfällt die schwere, neutronenreiche Materie und ordnen sich neu an - zu den meisten bekannten schwereren Elementen wie Gold oder Uran (keine Kernfusion!).',
    );
    questions.add(qKilonova);

    final qTerms = Question(
      questionText: 'Was ist KEIN bekannter Begriff in der Astrophysik?',
      rightAnswer:  'schwarze Entropie',
      wrongAnswer1: 'dunkle Energie',
      wrongAnswer2: 'scharzes Loch',
      wrongAnswer3: 'dunkle Materie',
    );
    questions.add(qTerms);

    final qDarkMatter = Question(
      questionText: 'Warum ist dunkle Materie aufspübar aber noch nicht erforscht?',
      rightAnswer:  'keine Wechselwirkung mit Materie',
      wrongAnswer1: 'zu große Entfernung zur Erde',
      wrongAnswer2: 'keine Abgrenzung zu Sternen möglich',
      wrongAnswer3: 'Teleskopie zu ungenau (unscharf)',
      additionalInformation: 'Die Existenz dunkler Materie ist bekannt, weil viele beobachtete Galaxien deutlich \"zu leicht\" sind und mit ihrer beobachtbaren Masse nicht zusammenzuhalten würden. Es muss also weitere, nicht aufspürbare Gravitationsquellen geben.',
    );
    questions.add(qDarkMatter);

    final qAstroUnitDefinition = Question(
      questionText: 'Wie ist eine astronomische Einheit (AE) definiert?',
      rightAnswer:  'mittlerer Abstand Erde - Sonne',
      wrongAnswer1: 'Umfang der Erdumlaufbahn',
      wrongAnswer2: 'mittlerer Abstand Erde - Mond',
      wrongAnswer3: 'Durchmesser unseres Sonnensystems',
    );
    questions.add(qAstroUnitDefinition);

    final qAstroUnit = Question(
      questionText: 'Wie groß ist eine AE (Abstand Erde - Sonne)?',
      rightAnswer:  '150 Millionen km',
      wrongAnswer1:  '15 Milliarden km',
      wrongAnswer2: '1,5 Millionen km',
      wrongAnswer3: '1,5 Billionen km',
    );
    questions.add(qAstroUnit);

    final qLight = Question(
      questionText: 'Wie lange braucht das Licht, um den größten bekannten Stern (Stephenson 2-18) zu umrunden?',
      rightAnswer:  'ca. 8,7 Stunden',
      wrongAnswer1: 'ca. 7,8 Minuten',
      wrongAnswer2: 'ca. 7,8 Tage',
      wrongAnswer3: 'ca. 8,7 Sekunden',
      additionalInformation: '8,7 Stunden mit Lichtgeschindigkeit entsprechen über 1850 Jahren mit einem typischen Passagierflugzeug (Boeing 747, 900 km/h).',
    );
    questions.add(qLight);

    final qRingSystems = Question(
      questionText: 'Welche Planeten hat neben Saturn noch \"Ringe\"?',
      rightAnswer:   'Uranus und Neptun',
      wrongAnswer1:  'Neptun und Mars',
      wrongAnswer2:    'Mars und Jupiter',
      wrongAnswer3: 'Jupiter und Uranus',
      additionalInformation: 'Saturns Ringsystem ist um ein vielfaches massiver, dichter und besser sichtbar.',
    );
    questions.add(qRingSystems);

    final qSunTemperature = Question(
      questionText: 'Die Sonnenoberfläche ist 6000 K heiß. Welche Temperatur hat der Sonnenkern?',
      rightAnswer:       '15.000.000 K',
      wrongAnswer1:         '150.000 K',
      wrongAnswer2:   '1.500.000.000 K',
      wrongAnswer3: '150.000.000.000 K',
    );
    questions.add(qSunTemperature);

    final qEndOfSun = Question(
      questionText: 'Was wird aus der Sonne, nachdem ihr HELIUM vollständig verbraucht ist?',
      rightAnswer:  'ein weißer Zwerg',
      wrongAnswer1: 'ein roter Zwerg',
      wrongAnswer2: 'ein brauner Zwerg',
      wrongAnswer3: 'ein roter Riese',
      additionalInformation: 'Wenn aller Wasserstoff zu Helium fusioniert ist, bläht sich die äußere Sonnenschicht auf und die Sonne wird zunächst zum roten Riesen. Im Kern wird dann Helium fusioniert, bis eine extrem heiße, weiß glühende Kohlenstoffkugel verbleibt.',
    );
    questions.add(qEndOfSun);

    final qBinaryStarSystems = Question(
      questionText: 'Was liegt im Zentrum der meisten beobachtbaren Planetensysteme?',
      rightAnswer:  'aktive Doppelsterne',
      wrongAnswer1: 'aktiver Einzelstern',
      wrongAnswer2: 'Riesen-Eisplaneten',
      wrongAnswer3: 'ausgebrannter Stern',
      additionalInformation: 'Doppelsterne sind ein häufiges Phänomen und betreffen über 70 % aller Sterne.',
    );
    questions.add(qBinaryStarSystems);

    final qBlackHoleMass = Question(
      questionText: 'Wie schwer muss ein Stern mindestens sein, um \"im Bestfall\" in ein schwarzes Loch zu kollabieren?',
      rightAnswer:     '3 Sonnenmassen',
      wrongAnswer1:   '30 Sonnenmassen',
      wrongAnswer2:  '300 Sonnenmassen',
      wrongAnswer3: '3000 Sonnenmassen',
      additionalInformation: 'Nach der Supernova müssen mindestens 2,5 Sonnenmassen verbleiben, um ein schwarzes Loch zu bilden. Das betrifft die meisten Sterne mit ca. 8 bis 30 Sonnenmassen.',
    );
    questions.add(qBlackHoleMass);

    final qBlackHoleSize = Question(
      questionText: 'Wie groß wäre ein schwarzes Loch mit der Masse der Erde (Schwarzschild-Radius)?',
      rightAnswer:   '9 mm',
      wrongAnswer1:  '3 m',
      wrongAnswer2:  '1 km',
      wrongAnswer3: '90 km',
      additionalInformation: 'Bei statischen Schwarzen Löchern ist der Ereignishorizont eine Kugeloberfläche, deren Radius \'Schwarzschild-Radius\' genannt wird.',
    );
    questions.add(qBlackHoleSize);

    final qPulsar = Question(
      questionText: 'Was ist ein Pulsar?',
      rightAnswer:  'ein schnell rotierender Neutronenstern',
      wrongAnswer1: 'ein elliptisch rotierender Doppelstern',
      wrongAnswer2: 'ein periodisch Masse abgebender Stern',
      wrongAnswer3: 'ein periodisch größenveränderlicher Stern',
    );
    questions.add(qPulsar);

    final qPulsarSpeed = Question(
      questionText: 'Wie schnell kann ein Pulsar rotieren?',
      rightAnswer:  'bis zu 1500 Hertz',
      wrongAnswer1: 'bis zu 150 Hertz',
      wrongAnswer2: 'bis zu 15 Hertz',
      wrongAnswer3: 'bis zu 1,5 Hertz',
    );
    questions.add(qPulsarSpeed);

    final qMagnetar = Question(
      questionText: 'Das Erdmagnetfeld hat eine Flussdichte von 50 \u00B5T. Wie hoch kann die eines Magnetars werden?',
      rightAnswer:  'bis zu 1 Billion T',
      wrongAnswer1: 'bis zu 200 Tausend T',
      wrongAnswer2: 'bis zu 50 T',
      wrongAnswer3: 'bis zu 1 T',
      additionalInformation: 'Magnetare sind Pulsare mit mit extrem intensiven Magnetfeldern, tausendmal stärker als bei Neutronensternen üblich. Schätzungsweise 10 % aller Neutronensterne sind Magnetare.',
    );
    questions.add(qMagnetar);

    final qEnergyInSpacetime = Question(
      questionText: 'Was bestitzt an sich keine Energie?',
      rightAnswer:  'Zeit',
      wrongAnswer1: 'Raum',
      wrongAnswer2: 'Materie',
      wrongAnswer3: 'alle 3 sind Energieträger',
      additionalInformation: 'Materie hat Masse, welche sich über E=mc² ausdrücken lässt. Raum an sich beherbergt Energie in Form von Quantenfeldfluktuation. Zeit beschreibt dahingegen zusammenhängende Zustände des Universums.',
    );
    questions.add(qEnergyInSpacetime);

    final qVacuumDecay = Question(
      questionText: 'Wodurch könnte das Vakuum zerfallen und sich die komplette Physik unseres Universums ändern?',
      rightAnswer:  'metastabiles Higgs-Feld',
      wrongAnswer1: 'hypermassive schwarze Löcher',
      wrongAnswer2: 'beschleunigende Raumausdehnung',
      wrongAnswer3: 'Quarkverschmelzung in Teilchenbeschleunigern',
      additionalInformation: 'Das Higgs-Feld gibt Elementarteilchen ihre Masse, was jegliche Wechselwirkung im Universum bestimmt. Es besitzt jedoch noch potentielle Energie, welche durch den Tunneleffekt freigelassen werden und die Eigenschaften des Higgs-Felds verändern könnte.',
    );
    questions.add(qVacuumDecay);

    final qEndOfUniverse = Question(
      questionText: 'Was ist KEIN hypothetisches Ende (Tod) des Universums?',
      rightAnswer:  'Big Toss',
      wrongAnswer1: 'Big Rip',
      wrongAnswer2: 'Big Freeze',
      wrongAnswer3: 'Big Crunch',
      additionalInformation: 'Big Crunch: Alles fällt wieder zu einer Singularität zusammen.  Big Freeze: Alle Energie ist gleichmäßig im Universum verteilt, alles ist fast 0K kalt.  Big Rip: Ausdehnung wird so schnell, dass es selbst Atome auseinander reißt.',
    );
    questions.add(qEndOfUniverse);

    return questions;
  }


  static List<Question> _getQuestionsAboutScience() {
    final questions = new List<Question>.empty(growable: true);

    final qCelsiusToKelvin = Question(
      questionText: 'Wie viel °C sind 0 K?',
      rightAnswer:   'ca. -273',
      wrongAnswer1:  'ca. -100',
      wrongAnswer2:  'ca. -679',
      wrongAnswer3: 'ca. -3251',
      additionalInformation: 'genauer: -273,15°C \nHier gibt es keine Teilchenbewegung mehr; praktisch nicht erreichbar',
    );
    questions.add(qCelsiusToKelvin);

    final qEarthCore = Question(
      questionText: 'Der innere Erdkern ist ...',
      rightAnswer:  'fest',
      wrongAnswer1: 'flüssig',
      wrongAnswer2: 'gasförmig',
      wrongAnswer3: 'ein Plasma',
      additionalInformation: 'Der äußere Erdkern ist flüssig, konvktiert und erzeugt das Erdmagnetfeld. Der innere Erdkern ist durch den enormen Druck von 330 GPa fest und besteht zu 80 % aus Eisen und zu 20 % aus Nickel.',
    );
    questions.add(qEarthCore);

    final qEarthSize = Question(
      questionText: 'Wie groß ist der Durchmesser der Erde?',
      rightAnswer:   'ca. 12.700 km',
      wrongAnswer1:  'ca. 40.100 km',
      wrongAnswer2: 'ca. 127.000 km',
      wrongAnswer3: 'ca. 401.000 km',
      additionalInformation: '40.100 km entspricht ungefähr dem mittleren Umfang.',
    );
    questions.add(qEarthSize);

    final qHeightOfAtmosphere = Question(
      questionText: 'Wie hoch reicht die Atmosphäre (offizielle Grenze: Ende der Homosphäre)?',
      rightAnswer:   'ca. 100 km',
      wrongAnswer1:   'ca. 20 km',
      wrongAnswer2:  'ca. 600 km',
      wrongAnswer3: 'ca. 3000 km',
      additionalInformation: 'Der Übergang zum Weltraum ist fließend und wurde anhand des Durchmischungsgrades festgelegt. In der Exosphäre (oberhalb der Exobase in ~600 km Höhe) ist die mittlere freie Weglänge so groß, dass Teilchen entweichen können.',
    );
    questions.add(qHeightOfAtmosphere);

    final qRayEnergy = Question(
      questionText: 'Welche Strahlung ist die energiereichste?',
      rightAnswer:  'Gammastrahlung',
      wrongAnswer1: 'Mikrowellenstrahlung',
      wrongAnswer2: 'UV-C-Strahlung',
      wrongAnswer3: 'Röntgenstrahlung',
      additionalInformation: 'Je höher die Frequenz (ja kürzer die Wellenlänge), desto höher die Energie der Strahlung.  Energie: Radiowellen < Mikrowellen < Infrarot-Strahlung < sichtbares Licht < UV-Strahlung < Röntgenstrahlung < Gammastrahlung',
    );
    questions.add(qRayEnergy);

    final qLightSpeed = Question(
      questionText: 'Wie hoch ist die Lichtgeschwindigkeit im Vakuum ca.?',
      rightAnswer:  '300.000.000 m/s',
      wrongAnswer1:     '300.000 m/s',
      wrongAnswer2: '300.000.000 km/h',
      wrongAnswer3:     '300.000 km/h',
      additionalInformation: 'genauer: 299.792.458 m/s\nIn einem Medium ist sie geringer.',
    );
    questions.add(qLightSpeed);

    final qTimeSunToEarth = Question(
      questionText: 'Wie lange braucht das Licht von der Sonnenoberfläche bis zur Erde?',
      rightAnswer:  'ca. 8,3 Minuten',
      wrongAnswer1: 'ca. 1,2 Stunden',
      wrongAnswer2: 'ca. 8,3 Sekunden',
      wrongAnswer3: 'ca. 1,2 Minuten',
      additionalInformation: 'Bei konstanter Geschwindigkeit gilt v = s/t.\nAlso t = s/v ~ 150 Mio km / 300 Tsd km/s = 500 s',
    );
    questions.add(qTimeSunToEarth);

    final qqTimeSunCoreToSurface = Question(
      questionText: 'Wie lange braucht das Licht vom Sonnenkern bis zur Sonnenoberfläche?',
      rightAnswer:  'ca. 100.000 Jahre',
      wrongAnswer1: 'ca. 1 Sekunde',
      wrongAnswer2: 'ca. 10 Tage',
      wrongAnswer3: 'ca. 100 Jahre',
      additionalInformation: 'Die erzeugten Photonen legen bis zu ihrer Reabsorption nur kurze Wege zurück, nicht viel länger als einige Kernabstände. Sie wandern so kreuz und quer und benötigen bis zur Oberfläche zwischen 10.000 und 170.000 Jahre.',
    );
    questions.add(qqTimeSunCoreToSurface);

    final qSIUnits = Question(
      questionText: 'Was ist keine SI-Einheit?',
      rightAnswer:  'elektrische Spannung U',
      wrongAnswer1: 'Stoffmenge n',
      wrongAnswer2: 'Temperatur T',
      wrongAnswer3: 'Lichtstärke I_v',
      additionalInformation: 'Die Stromstärke I ist ein SI-Einheit.',
    );
    questions.add(qSIUnits);

    final qNewtonToSI = Question(
      questionText: 'Durch welche SI-Einheiten lässt sich die Einheit Newton [N] ausdrücken?',
      rightAnswer:  '(kg * m) / (s * s)',
      wrongAnswer1:     '(kg) / (m * s * s)',
      wrongAnswer2:     '(kg) / (m * s)',
      wrongAnswer3: '(kg * m) / (s)',
      additionalInformation: 'Kraft ist Masse [kg] * Beschleunigung [m/s²].',
    );
    questions.add(qNewtonToSI);

    final qAtomicBond = Question(
      questionText: 'Warum sind Eisenstangen im Gegensatz zu Holz oder Glas biegbar?',
      rightAnswer:  'besondere atomare Bindung in Metallen',
      wrongAnswer1: 'Es sind ultra-viskose Flüssigkeiten',
      wrongAnswer2: 'gezielte Eigenschaft der Stab-/Röhrenform',
      wrongAnswer3: 'Erwärmung und Verflüssigung an Biegestelle',
      additionalInformation: 'Atome in Holz und Glas sind durch kovalente (Atom-) Bindung miteinander verkettet und starr. Bei der Metallbindung können sich Atomrümpfe relativ zueinander verschieben. Die Elektronen können sich in diesem Atomgitter frei bewegen.',
    );
    questions.add(qAtomicBond);

    final qPlanck = Question(
      questionText: 'Das Plancksche Wirkumsquantum beschreibt die Beziehung zwischen ...',
      rightAnswer:  'Energie und Frequenz von Photonen',
      wrongAnswer1: 'Wellenlänge und Frequenz von Strahlung',
      wrongAnswer2: 'Polarisierung und Feldstärke von Ladungen',
      wrongAnswer3: 'Energie und Orbital von Elektronen',
      additionalInformation: 'E = h*f.\nDie Entdeckung des Wirkungsquantums durch Max Planck um 1900 begründete die Quantenphysik und legte die Basis des Welle-Teilchen-Dualismus.',
    );
    questions.add(qPlanck);

    return questions;
  }


  static List<Question> _getQuestionsAboutTechnology() {
    final questions = new List<Question>.empty(growable: true);

    final qNeutralFiber = Question(
      questionText: 'Was ist die neutrale Faser?',
      rightAnswer:  'spannungsfreie Mitte eines Balkens',
      wrongAnswer1: 'elektrisch isoliertes Steuerkabel',
      wrongAnswer2: 'mittleres Drahtstück in Litze',
      wrongAnswer3: 'funkenfreier Kontakt in Zündkerzen',
    );
    questions.add(qNeutralFiber);

    final qISSSpeed = Question(
      questionText: 'Die ISS umrundet die Erde 15,5 mal am Tag in 400 km Höhe. Wie schnell fliegt sie?',
      rightAnswer:  'ca. 27.600 km/h',
      wrongAnswer1: 'ca. 2.760 km/h',
      wrongAnswer2: 'ca. 276.000 km/h',
      wrongAnswer3: 'ca. 2.760.000 km/h',
    );
    questions.add(qISSSpeed);

    final qVAr = Question(
      questionText: 'Was wird in der Einheit \'VAr\' angegeben?',
      rightAnswer:  'elektr. Blindleistung',
      wrongAnswer1: 'Helligkeit',
      wrongAnswer2: 'Impulsdifferenz',
      wrongAnswer3: 'Ionisierungsgrad',
      additionalInformation: 'VAr steht für Volt-Ampere-reaktiv',
    );
    questions.add(qVAr);

    final qProcessSize = Question(
      questionText: 'Wie klein sind die Strukturgrößen 2021 in aktuellen Prozessoren?',
      rightAnswer:  '10 nm',
      wrongAnswer1: '100 nm',
      wrongAnswer2: '1 \u00B5m',
      wrongAnswer3: '1 nm',
      additionalInformation: 'Die Strukturgröße beschreibt in der Mikro- und Nanoelektronik die kleinste realisierte Kantenlänge der Plotter-Einheit. Die damit erzeugten Strukturen sind in der Regel etwas kleiner als die für die Maske benutzte Plotter-Einheit.',
    );
    questions.add(qProcessSize);

    final qPixelSize = Question(
      questionText: 'Wie groß ist ein Pixel bei einem 23,5 Zoll Full HD Bildschirm (Kantenlänge)?',
      rightAnswer:  '0,27 mm',
      wrongAnswer1: '0,81 mm',
      wrongAnswer2: '0,09 mm',
      wrongAnswer3: '0,03 mm',
      additionalInformation: 'Pixel sind bis ca. 0,1 mm noch problemlos mit dem blosen Auge zu erkennen. Als Merkmal für die Bildqualität wird häufig die Pixeldichte in dpi angegeben (dots per inch).',
    );
    questions.add(qPixelSize);

    final qDisplaysLCD = Question(
      questionText: 'Bei welchem Displaytyp wird nicht die Leuchtstärke der Subpixel eingestellt sondern deren Verdunkelung?',
      rightAnswer:  'LCD',
      wrongAnswer1: 'LED / OLED',
      wrongAnswer2: 'CRT (Kathodenstrahlröhre)',
      wrongAnswer3: 'Plasma (PDP)',
      additionalInformation: 'Bei Liquid-Crystal-Displays wird durch Anlegen einer Spannung an die Subpixel deren helixartige Kristallstruktur sukzessive so kollabiert, dass das bereits polarisierte Licht nicht mehr passend zur 2. Polarisationsebene verdreht wird.',
    );
    questions.add(qDisplaysLCD);

    final qDisplaysOLED = Question(
      questionText: 'Wofür steht das \'O\' in OLED-Displays?',
      rightAnswer:  'Organic',
      wrongAnswer1: 'Orthogonal',
      wrongAnswer2: 'Oscillating',
      wrongAnswer3: 'Oxygen',
    );
    questions.add(qDisplaysOLED);

    final qTrabant = Question(
      questionText: 'Wie viel PS hatte der erste Trabant von ca. 1960?',
      rightAnswer:  '18',
      wrongAnswer1: '32',
      wrongAnswer2: '52',
      wrongAnswer3: '8',
    );
    questions.add(qTrabant);

    final qFormula1Cars = Question(
      questionText: 'Bis zu wie viel PS haben Formel 1 Fahrzeuge 2020?',
      rightAnswer:  '1000',
      wrongAnswer1: '700',
      wrongAnswer2: '500',
      wrongAnswer3: '400',
    );
    questions.add(qFormula1Cars);

    final qWinterTires = Question(
      questionText: 'Was ist der markanteste Vorteil von Winterreifen ggü. Sommerreifen?',
      rightAnswer:  'besserer Halt auf Schnee, Eis und Matsch',
      wrongAnswer1: 'besserer Halt bei niedrigen Temperaturen',
      wrongAnswer2: 'längere Lebensdauer bei niedrigen Temperaturen',
      wrongAnswer3: 'keine Gefahr des Gummibruchs',
    );
    questions.add(qWinterTires);

    final qAntennaPower = Question(
      questionText: 'Wie viel Leistung hat eine Mobilfunkantenne mit 5 km Senderadius?',
      rightAnswer:  '20 W',
      wrongAnswer1: '200 W',
      wrongAnswer2: '2 kW',
      wrongAnswer3: '20 kW',
    );
    questions.add(qAntennaPower);

    return questions;
  }


  static List<Question> _getQuestionsAboutProgramming() {
    final questions = new List<Question>.empty(growable: true);

    final qBitToByte = Question(
      questionText: 'Wie viele Bit sind ein Byte?',
      rightAnswer:  '8',
      wrongAnswer1: '10',
      wrongAnswer2: '4',
      wrongAnswer3: '16',
      additionalInformation: 'Mit einem Byte lassen sich 2^8 = 256 Zustände darstellen.',
    );
    questions.add(qBitToByte);

    final qLanguages1 = Question(
      questionText: 'Was ist KEINE Programmiersprache?',
      rightAnswer:  'Heat',
      wrongAnswer1: 'Lua',
      wrongAnswer2: 'Haskell',
      wrongAnswer3: 'Rust',
    );
    questions.add(qLanguages1);

    final qLanguages2 = Question(
      questionText: 'Was ist eine Programmiersprache?',
      rightAnswer:  'Ruby',
      wrongAnswer1: 'Diamond',
      wrongAnswer2: 'Sapphire',
      wrongAnswer3: 'Emerald',
    );
    questions.add(qLanguages2);

    final qByteToMegabyte = Question(
      questionText: 'Genau wie viele Byte sind 1 MB?',
      rightAnswer:  '1.000.000',
      wrongAnswer1: '1.024.000',
      wrongAnswer2: '1.048.576',
      wrongAnswer3: '1.000.024',
      additionalInformation: 'Dezimalpräfixe wie Kilo, Mega und Giga repräsentieren 10er-Potenzen. [k] = 10^3. [M] = 10^6. [G] = 10^9. Binärpräfixe wie Kibi, Mebi und Gibi stehen für 2er-Potenzen. [Ki] = 2^10. [Mi] = 2^20. [GiB] = 2^30. 1.024.000 Byte sind demnach 1 MiB.',
    );
    questions.add(qByteToMegabyte);

    final qSortingAlgorithms = Question(
      questionText: 'Was ist kein Sortier-Algorithmus?',
      rightAnswer:  'SplitSort',
      wrongAnswer1: 'HeapSort',
      wrongAnswer2: 'MergeSort',
      wrongAnswer3: 'BubbleSort',
    );
    questions.add(qSortingAlgorithms);

    final qBiggestUnit = Question(
      questionText: 'Welche ist die größte Einheit?',
      rightAnswer:  'Yottabyte (YB)',
      wrongAnswer1: 'Exabyte (EB)',
      wrongAnswer2: 'Zettabyte (ZB)',
      wrongAnswer3: 'Petabyte (PB)',
      additionalInformation: 'Kilo = 10^3 ; Mega = 10^6 ; Giga = 10^9 ; Tera = 10^12 ; Peta = 10^15 ; Exa = 10^18 ; Zetta = 10^21 ; Yotta = 10^24',
    );
    questions.add(qBiggestUnit);

    final qNibble = Question(
      questionText: '8 Bit sind 1 Byte. Wie nennt man 4 Bit?',
      rightAnswer:  'Nibble',
      wrongAnswer1: 'Half',
      wrongAnswer2: 'Tetrade',
      wrongAnswer3: 'Quadrupel',
    );
    questions.add(qNibble);

    return questions;
  }


  static List<Question> _getQuestionsAboutLogic() {
    final questions = new List<Question>.empty(growable: true);

    final qExponentsOfTwo = Question(
      questionText: 'Was ist 2^2^2^2?',
      rightAnswer:  '256',
      wrongAnswer1: '16',
      wrongAnswer2: '64',
      wrongAnswer3: '1024',
      additionalInformation: '2^2^2^2 = 4^2^2 = 16^2 = 256',
    );
    questions.add(qExponentsOfTwo);

    final qDaughters = Question(
      questionText: 'Herr Müller hat 2 Kinder. Eins davon ist ein Mädchen. Mit welcher Wahrscheinlichkeit ist das andere ein Junge?',
      rightAnswer:  '2/3',
      wrongAnswer1: '1/4',
      wrongAnswer2: '1/3',
      wrongAnswer3: '1/2',
      additionalInformation: 'Es gibt grundsätzlich die Möglichkeiten für Kind 1 und 2: J-J, J-M, M-J, M-M. Wenn eines der beiden ein Junge sein muss, bleiben J-M, M-J und M-M.',
    );
    questions.add(qDaughters);

    return questions;
  }


  static List<Question> _getQuestionsAboutHealth() {
    final questions = new List<Question>.empty(growable: true);

    final qVitaminD = Question(
      questionText: 'Welches Vitamin wird durch Sonneneinstrahlung in der Haut produziert?',
      rightAnswer:  'D',
      wrongAnswer1: 'A',
      wrongAnswer2: 'B',
      wrongAnswer3: 'E',
    );
    questions.add(qVitaminD);

    final qStrongestMuscle = Question(
      questionText: 'Welcher Muskulaturbereich ist der stärkste im menschlichen Körper (Kraft pro Querschnitt)?',
      rightAnswer:  'Kaumuskel',
      wrongAnswer1: 'Pomuskel',
      wrongAnswer2: 'Herzmuskel',
      wrongAnswer3: 'Beinstrecker',
    );
    questions.add(qStrongestMuscle);

    final qToothPaste = Question(
      questionText: 'Wofür ist das Fluorid in Zahnpasta?',
      rightAnswer:  'Füllen beschädigter atomarer Stellen am Zahn', // TODO besser beschreiben, iwas mit aushärten
      wrongAnswer1: 'Vorbeuge gegen Zahnstein',
      wrongAnswer2: 'Bekämpfung von Bakterien und Zahnbelag',
      wrongAnswer3: 'Pflege und Stärkung des Zahnfleischs',
    );
    questions.add(qToothPaste);

    return questions;
  }

}
