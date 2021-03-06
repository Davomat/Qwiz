import 'dart:math';

import 'category.dart';
import 'question.dart';

class QuestionProvider {

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
      case Category.biology:      return _getQuestionsAboutBiology();
      case Category.logic:        return _getQuestionsAboutLogic();
      default:                    return List<Question>.empty();
    }
  }


  static List<Question> _getQuestionsAboutCosmos() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Wie alt ist das Universum?',
      rightAnswer:  '13,8 Milliarden Jahre',
      wrongAnswer1:  '138 Milliarden Jahre',
      wrongAnswer2: '1,38 Milliarden Jahre',
      wrongAnswer3:  '138 Millionen Jahre',
    ));

    questions.add(Question(
      questionText: 'Wie / Wann entstanden die schweren Elemente wie z.B. Gold oder Platin, die wir heute auf der Erde vorfinden?',
      rightAnswer:  'bei Supernovae (Sternentode)',
      wrongAnswer1: 'direkt nach dem Urknall',
      wrongAnswer2: 'beim Zusammenprall der Ur-Erde mit Mond',
      wrongAnswer3: 'durch starke Sonneneruptionen',
      additionalInformation: 'Massereiche Sterne fusionieren vor ihrem \"Tod\" Kohlenstoff weiter zu Neon, Sauerstoff, Silizium und Eisen, was durch die darauf folgende Implosion teilweise ins All geschleudert wird (Rebound).',
    ));

    questions.add(Question(
      questionText: 'Was ist eine Kilonova (oder auch Macronova)?',
      rightAnswer:  'Zusammensto?? zweier Neutronensterne',
      wrongAnswer1: 'Zusammensto?? zweier Riesensterne',
      wrongAnswer2: 'Expansion eines roten Riesen',
      wrongAnswer3: 'Expansion eines blauen Riesen',
      additionalInformation: 'Stichwort Doppelsternsystem; Beim Zusammensto?? zerf??llt die schwere, neutronenreiche Materie und ordnen sich neu an - zu den meisten bekannten schwereren Elementen wie Gold oder Uran (keine Kernfusion!).',
    ));

    questions.add(Question(
      questionText: 'Was ist KEIN bekannter Begriff in der Astrophysik?',
      rightAnswer:  'schwarze Entropie',
      wrongAnswer1: 'dunkle Energie',
      wrongAnswer2: 'schwarzes Loch',
      wrongAnswer3: 'dunkle Materie',
    ));

    questions.add(Question(
      questionText: 'Warum ist dunkle Materie aufsp??bar aber noch nicht erforscht?',
      rightAnswer:  'keine Wechselwirkung mit Licht',
      wrongAnswer1: 'zu gro??e Entfernung zur Erde',
      wrongAnswer2: 'keine Abgrenzung zu Sternen m??glich',
      wrongAnswer3: 'Teleskopie zu ungenau (unscharf)',
      additionalInformation: 'Die Existenz dunkler Materie ist bekannt, weil viele beobachtete Galaxien deutlich \"zu leicht\" sind und mit ihrer beobachtbaren Masse nicht zusammenzuhalten w??rden. Es muss also weitere, nicht aufsp??rbare Gravitationsquellen geben.',
    ));

    questions.add(Question(
      questionText: 'Wie ist eine astronomische Einheit (AE) definiert?',
      rightAnswer:  'mittlerer Abstand Erde - Sonne',
      wrongAnswer1: 'Umfang der Erdumlaufbahn',
      wrongAnswer2: 'mittlerer Abstand Erde - Mond',
      wrongAnswer3: 'Durchmesser unseres Sonnensystems',
    ));

    questions.add(Question(
      questionText: 'Wie gro?? ist eine AE (Abstand Erde - Sonne)?',
      rightAnswer:  '150 Millionen km',
      wrongAnswer1:  '15 Milliarden km',
      wrongAnswer2: '1,5 Millionen km',
      wrongAnswer3: '1,5 Billionen km',
    ));

    questions.add(Question(
      questionText: 'Wie lange braucht das Licht, um den gr????ten bekannten Stern (Stephenson 2-18) zu umrunden?',
      rightAnswer:  'ca. 8,7 Stunden',
      wrongAnswer1: 'ca. 7,8 Minuten',
      wrongAnswer2: 'ca. 7,8 Tage',
      wrongAnswer3: 'ca. 8,7 Sekunden',
      additionalInformation: '8,7 Stunden mit Lichtgeschindigkeit entsprechen ??ber 1850 Jahren mit einem typischen Passagierflugzeug (Boeing 747, 900 km/h).',
    ));

    questions.add(Question(
      questionText: 'Welche Planeten haben neben Saturn auch ein Ringsystem?',
      rightAnswer:   'Uranus und Neptun',
      wrongAnswer1:  'Neptun und Mars',
      wrongAnswer2:    'Mars und Jupiter',
      wrongAnswer3: 'Jupiter und Uranus',
      additionalInformation: 'Saturns Ringsystem ist um ein vielfaches massiver, dichter und besser sichtbar.',
    ));

    questions.add(Question(
      questionText: 'Die Sonnenoberfl??che ist 6000 K hei??. Welche Temperatur hat der Sonnenkern?',
      rightAnswer:       '15.000.000 K',
      wrongAnswer1:         '150.000 K',
      wrongAnswer2:   '1.500.000.000 K',
      wrongAnswer3: '150.000.000.000 K',
    ));

    questions.add(Question(
      questionText: 'Was wird aus der Sonne, nachdem ihr HELIUM vollst??ndig verbraucht ist?',
      rightAnswer:  'ein wei??er Zwerg',
      wrongAnswer1: 'ein roter Zwerg',
      wrongAnswer2: 'ein brauner Zwerg',
      wrongAnswer3: 'ein roter Riese',
      additionalInformation: 'Wenn aller Wasserstoff zu Helium fusioniert ist, bl??ht sich die ??u??ere Sonnenschicht auf und die Sonne wird zun??chst zum roten Riesen. Im Kern wird dann Helium fusioniert, bis eine extrem hei??e, wei?? gl??hende Kohlenstoffkugel verbleibt.',
    ));

    questions.add(Question(
      questionText: 'Was liegt im Zentrum der meisten beobachtbaren Planetensysteme?',
      rightAnswer:  'aktive Doppelsterne',
      wrongAnswer1: 'aktiver Einzelstern',
      wrongAnswer2: 'Riesen-Eisplaneten',
      wrongAnswer3: 'ausgebrannter Stern',
      additionalInformation: 'Doppelsterne sind ein h??ufiges Ph??nomen und betreffen ??ber 70 % aller Sterne.',
    ));

    questions.add(Question(
      questionText: 'Wie viel Masse muss ein Stern mindestens besitzen, um bei seinem Tod in ein schwarzes Loch kollabieren zu k??nnen?',
      rightAnswer:     '3 Sonnenmassen',
      wrongAnswer1:   '30 Sonnenmassen',
      wrongAnswer2:  '300 Sonnenmassen',
      wrongAnswer3: '3000 Sonnenmassen',
      additionalInformation: 'Bei der Supernova wird h??ufig der Gro??teil der Masse weggeschleudert. Zur Bildung eines schwarzen Lochs m??ssen mindestens 2,5 Sonnenmassen verbleiben, was im Regelfall Sterne mit ca. 8 bis 30 Sonnenmassen betrifft, im \"Bestfall\" reichen bereits 3.',
    ));

    questions.add(Question(
      questionText: 'Wie gro?? w??re ein schwarzes Loch mit der Masse der Erde (Schwarzschild-Radius)?',
      rightAnswer:   '9 mm',
      wrongAnswer1:  '3 m',
      wrongAnswer2:  '1 km',
      wrongAnswer3: '90 km',
      additionalInformation: 'Bei statischen Schwarzen L??chern ist der Ereignishorizont eine Kugeloberfl??che, deren Radius \'Schwarzschild-Radius\' genannt wird.',
    ));

    questions.add(Question(
      questionText: 'Was ist ein Pulsar?',
      rightAnswer:  'ein schnell rotierender Neutronenstern',
      wrongAnswer1: 'ein elliptisch rotierender Doppelstern',
      wrongAnswer2: 'ein periodisch Masse abgebender Stern',
      wrongAnswer3: 'ein periodisch gr????enver??nderlicher Stern',
    ));

    questions.add(Question(
      questionText: 'Wie schnell kann ein Pulsar rotieren?',
      rightAnswer:  'bis zu 1500 Hertz',
      wrongAnswer1: 'bis zu 150 Hertz',
      wrongAnswer2: 'bis zu 15 Hertz',
      wrongAnswer3: 'bis zu 1,5 Hertz',
    ));

    questions.add(Question(
      questionText: 'Das Erdmagnetfeld hat eine Flussdichte von 50 ??T. Wie hoch kann die eines Magnetars werden?',
      rightAnswer:  'bis zu 1 Billion T',
      wrongAnswer1: 'bis zu 200 Tausend T',
      wrongAnswer2: 'bis zu 50 T',
      wrongAnswer3: 'bis zu 1 T',
      additionalInformation: 'Magnetare sind Pulsare mit extrem intensiven Magnetfeldern, tausendmal st??rker als bei Neutronensternen ??blich. Sch??tzungsweise 10 % aller Neutronensterne sind Magnetare.',
    ));

    questions.add(Question(
      questionText: 'Was bestitzt an sich keine Energie?',
      rightAnswer:  'Zeit',
      wrongAnswer1: 'Raum',
      wrongAnswer2: 'Materie',
      wrongAnswer3: 'alle 3 sind Energietr??ger',
      additionalInformation: 'Materie hat Masse, welche sich ??ber E=mc?? ausdr??cken l??sst. Raum an sich beherbergt Energie in Form von Quantenfeldfluktuation. Zeit beschreibt dahingegen zusammenh??ngende Zust??nde des Universums.',
    ));

    questions.add(Question(
      questionText: 'Wodurch k??nnte das Vakuum zerfallen und sich die komplette Physik unseres Universums ??ndern?',
      rightAnswer:  'metastabiles Higgs-Feld',
      wrongAnswer1: 'hypermassive schwarze L??cher',
      wrongAnswer2: 'beschleunigende Raumausdehnung',
      wrongAnswer3: 'Quarkverschmelzung in Teilchenbeschleunigern',
      additionalInformation: 'Das Higgs-Feld gibt Elementarteilchen ihre Masse, was jegliche Wechselwirkung im Universum bestimmt. Es besitzt jedoch noch potentielle Energie, welche durch den Tunneleffekt freigelassen werden und die Eigenschaften des Higgs-Felds ver??ndern k??nnte.',
    ));

    questions.add(Question(
      questionText: 'Was ist KEIN hypothetisches Ende (Tod) des Universums?',
      rightAnswer:  'Big Toss',
      wrongAnswer1: 'Big Rip',
      wrongAnswer2: 'Big Freeze',
      wrongAnswer3: 'Big Crunch',
      additionalInformation: 'Big Crunch: Alles f??llt wieder zu einer Singularit??t zusammen.  Big Freeze: Alle Energie ist gleichm????ig im Universum verteilt, alles ist fast 0K kalt.  Big Rip: Ausdehnung wird so schnell, dass es selbst Atome auseinander rei??t.',
    ));

    return questions;
  }


  static List<Question> _getQuestionsAboutScience() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Wie viel ??C sind 0 K?',
      rightAnswer:   'ca. -273',
      wrongAnswer1:  'ca. -100',
      wrongAnswer2:  'ca. -679',
      wrongAnswer3: 'ca. -3251',
      additionalInformation: 'genauer: -273,15??C \nHier gibt es keine Teilchenbewegung mehr; praktisch nicht erreichbar',
    ));

    questions.add(Question(
      questionText: 'Warum ist Wasser bei 4??C am dichtesten - auch dichter als Eis?',
      rightAnswer:  'kristalline Molek??l-Ketten ben??tigen mehr Raum',
      wrongAnswer1: 'optimaler Winkel zwischen H-Atomen und O-Atom',
      wrongAnswer2: 'nur Irrglaube, weil Seen so langsam einfrieren',
      wrongAnswer3: 'Tripelpunkt bei Normaldruck erreicht',
      additionalInformation: 'genauer: 3,983??C\nDer Grund der Anomalie des Wassers liegt in der Verkettung der Wassermolek??le ??ber Wasserstoffbr??ckenbindungen, deren Struktur im festen Zustand mehr Raum als bei beweglichen Molek??len verbraucht.',
    ));

    questions.add(Question(
      questionText: 'Was ist das Besondere am Tripelpunkt?',
      rightAnswer:  '3 Aggregatzust??nde treten simultan auf',
      wrongAnswer1: '3 Stoffe verdampfen gleichzeitig',
      wrongAnswer2: '3 Wahrheitswerte sind gleich wahrscheinlich',
      wrongAnswer3: '3 Grafen schneiden sich in einem Punkt',
      additionalInformation: 'Der Tripelpunkt beschreibt den Zustand eines aus einer einzigen Stoffkomponente bestehenden Systems, in dem Temperatur und Druck dreier Phasen im thermodynamischen Gleichgewicht stehen.'
    ));

    questions.add(Question(
      questionText: 'Der innere Erdkern ist ...',
      rightAnswer:  'fest',
      wrongAnswer1: 'fl??ssig',
      wrongAnswer2: 'gasf??rmig',
      wrongAnswer3: 'ein Plasma',
      additionalInformation: 'Der ??u??ere Erdkern ist fl??ssig, konvektiert und erzeugt das Erdmagnetfeld. Der innere Erdkern ist durch den enormen Druck von 330 GPa fest und besteht zu 80 % aus Eisen und zu 20 % aus Nickel.',
    ));

    questions.add(Question(
      questionText: 'Wie gro?? ist der Durchmesser der Erde?',
      rightAnswer:   'ca. 12.700 km',
      wrongAnswer1:  'ca. 40.100 km',
      wrongAnswer2: 'ca. 127.000 km',
      wrongAnswer3: 'ca. 401.000 km',
      additionalInformation: '40.100 km entspricht ungef??hr dem mittleren Umfang.',
    ));

    questions.add(Question(
      questionText: 'Wie hoch reicht die Atmosph??re (offizielle Grenze: Ende der Homosph??re)?',
      rightAnswer:   'ca. 100 km',
      wrongAnswer1:   'ca. 20 km',
      wrongAnswer2:  'ca. 600 km',
      wrongAnswer3: 'ca. 3000 km',
      additionalInformation: 'Der ??bergang zum Weltraum ist flie??end und wurde anhand des Durchmischungsgrades festgelegt. In der Exosph??re (oberhalb der Exobase in ~600 km H??he) ist die mittlere freie Wegl??nge so gro??, dass Teilchen entweichen k??nnen.',
    ));

    questions.add(Question(
      questionText: 'Welche Strahlung ist die energiereichste?',
      rightAnswer:  'Gammastrahlung',
      wrongAnswer1: 'Mikrowellenstrahlung',
      wrongAnswer2: 'UV-C-Strahlung',
      wrongAnswer3: 'R??ntgenstrahlung',
      additionalInformation: 'Je h??her die Frequenz, desto k??rzer die Wellenl??nge und h??her die Energie der Strahlung.  Energie: Radiowellen < Mikrowellen < Infrarot-Strahlung < sichtbares Licht < UV-Strahlung < R??ntgenstrahlung < Gammastrahlung',
    ));

    questions.add(Question(
      questionText: 'Wie hoch ist die Lichtgeschwindigkeit im Vakuum ca.?',
      rightAnswer:  '300.000.000 m/s',
      wrongAnswer1:     '300.000 m/s',
      wrongAnswer2: '300.000.000 km/h',
      wrongAnswer3:     '300.000 km/h',
      additionalInformation: 'genauer: 299.792.458 m/s\nIn einem Medium ist sie geringer.',
    ));

    questions.add(Question(
      questionText: 'Wie lange braucht das Licht von der Sonnenoberfl??che bis zur Erde?',
      rightAnswer:  'ca. 8,3 Minuten',
      wrongAnswer1: 'ca. 1,2 Stunden',
      wrongAnswer2: 'ca. 8,3 Sekunden',
      wrongAnswer3: 'ca. 1,2 Minuten',
      additionalInformation: 'Bei konstanter Geschwindigkeit gilt v = s/t.\nAlso t = s/v ~ 150 Mio km / 300 Tsd km/s = 500 s',
    ));

    questions.add(Question(
      questionText: 'Wie lange braucht das Licht vom Sonnenkern bis zur Sonnenoberfl??che?',
      rightAnswer:  'ca. 100.000 Jahre',
      wrongAnswer1: 'ca. 1 Sekunde',
      wrongAnswer2: 'ca. 10 Tage',
      wrongAnswer3: 'ca. 100 Jahre',
      additionalInformation: 'Die erzeugten Photonen legen bis zu ihrer Reabsorption nur kurze Wege zur??ck, nicht viel l??nger als einige Kernabst??nde. Sie wandern so kreuz und quer und ben??tigen bis zur Oberfl??che zwischen 10.000 und 170.000 Jahre.',
    ));

    questions.add(Question(
      questionText: 'Was ist keine SI-Gr????e?',
      rightAnswer:  'elektrische Spannung U',
      wrongAnswer1: 'Stoffmenge n',
      wrongAnswer2: 'Temperatur T',
      wrongAnswer3: 'Lichtst??rke I_v',
      additionalInformation: 'Die Stromst??rke I ist ein SI-Gr????e.',
    ));

    questions.add(Question(
      questionText: 'Durch welche SI-Einheiten l??sst sich die Einheit Newton [N] ausdr??cken?',
      rightAnswer:  '(kg ??? m) / (s ??? s)',
      wrongAnswer1:     '(kg) / (m ??? s ??? s)',
      wrongAnswer2:     '(kg) / (m ??? s)',
      wrongAnswer3: '(kg ??? m) / (s)',
      additionalInformation: 'Kraft ist Masse [kg] ??? Beschleunigung [m/s??].',
    ));

    questions.add(Question(
      questionText: 'Woraus besteht der Gro??teil des Hausstaubs?',
      rightAnswer:  'Textil- und Holz-Fasern',
      wrongAnswer1: 'abgestorbene Hautzellen',
      wrongAnswer2: 'Bakterien und Mikroorganismen',
      wrongAnswer3: 'Pollen und Bl??tenstaub',
      additionalInformation: 'In Bezug auf die Masse bestreiten Baumwollfasern den gr????ten Teil des Hausstaubs. Abgestorbene Hautzellen, Haare und andere Textil-, Synthetik- sowie Holzfasern ergeben ebenso einen gro??en Anteil. Der Rest besteht aus Mikroorganismen, Asche, Tabak, Graphit oder auch Radiergummi.',
    ));

    questions.add(Question(
      questionText: 'Warum sind Eisenstangen im Gegensatz zu Holz oder Glas biegbar?',
      rightAnswer:  'besondere atomare Bindung in Metallen',
      wrongAnswer1: 'Es sind ultra-viskose Fl??ssigkeiten',
      wrongAnswer2: 'gezielte Eigenschaft der Stab-/R??hrenform',
      wrongAnswer3: 'Erw??rmung und Verfl??ssigung an Biegestelle',
      additionalInformation: 'Atome in Holz und Glas sind durch kovalente (Atom-) Bindung miteinander verkettet und starr. Bei der Metallbindung k??nnen sich Atomr??mpfe relativ zueinander verschieben. Die Elektronen k??nnen sich in diesem Atomgitter frei bewegen.',
    ));

    questions.add(Question(
      questionText: 'Das Plancksche Wirkumsquantum beschreibt die Beziehung zwischen ...',
      rightAnswer:  'Energie und Frequenz von Photonen',
      wrongAnswer1: 'Wellenl??nge und Frequenz von Strahlung',
      wrongAnswer2: 'Polarisierung und Feldst??rke von Ladungen',
      wrongAnswer3: 'Energie und Orbital von Elektronen',
      additionalInformation: 'E = h???f.\nDie Entdeckung des Wirkungsquantums durch Max Planck um 1900 begr??ndete die Quantenphysik und legte die Basis des Welle-Teilchen-Dualismus.',
    ));

    return questions;
  }


  static List<Question> _getQuestionsAboutTechnology() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Was ist die neutrale Faser?',
      rightAnswer:  'spannungsfreie Mitte eines Balkens',
      wrongAnswer1: 'elektrisch isoliertes Steuerkabel',
      wrongAnswer2: 'mittleres Drahtst??ck in Litze',
      wrongAnswer3: 'funkenfreier Kontakt in Z??ndkerzen',
    ));

    questions.add(Question(
      questionText: 'Was beschreibt das Elastizit??tsmodul genauer?',
      rightAnswer:  'reversible Verformung von Festk??rpern',
      wrongAnswer1: 'Verfestigung von viskosen Fl??ssigkeiten',
      wrongAnswer2: 'Periodendauer von pendelnden Massen',
      wrongAnswer3: 'D??mpfung von schwingenden Federn',
    ));

    questions.add(Question(
      questionText: 'Die ISS umrundet die Erde 15,5 mal am Tag in 400 km H??he. Wie schnell fliegt sie?',
      rightAnswer:  'ca. 27.600 km/h',
      wrongAnswer1: 'ca. 2.760 km/h',
      wrongAnswer2: 'ca. 276.000 km/h',
      wrongAnswer3: 'ca. 2.760.000 km/h',
    ));

    questions.add(Question(
      questionText: 'Was wird in der Einheit \'VAr\' angegeben?',
      rightAnswer:  'elektr. Blindleistung',
      wrongAnswer1: 'Helligkeit',
      wrongAnswer2: 'Impulsdifferenz',
      wrongAnswer3: 'Ionisierungsgrad',
      additionalInformation: 'VAr steht f??r Volt-Ampere-reaktiv',
    ));

    questions.add(Question(
      questionText: 'Wie klein sind die Strukturgr????en in aktuellen Prozessoren von 2020?',
      rightAnswer:  '10 nm',
      wrongAnswer1: '100 nm',
      wrongAnswer2: '1 ??m',
      wrongAnswer3: '1 nm',
      additionalInformation: 'Die Strukturgr????e beschreibt in der Mikro- und Nanoelektronik die kleinste realisierte Kantenl??nge der Plotter-Einheit. Die damit erzeugten Strukturen sind in der Regel etwas kleiner als die f??r die Maske benutzte Plotter-Einheit.',
    ));

    questions.add(Question(
      questionText: 'Wie gro?? ist ein Pixel bei einem 23,5 Zoll Full HD Bildschirm (Kantenl??nge)?',
      rightAnswer:  '0,27 mm',
      wrongAnswer1: '0,81 mm',
      wrongAnswer2: '0,09 mm',
      wrongAnswer3: '0,03 mm',
      additionalInformation: 'Pixel sind bis ca. 0,1 mm noch problemlos mit dem blosen Auge zu erkennen. Als Merkmal f??r die Bildqualit??t wird h??ufig die Pixeldichte in dpi angegeben (dots per inch).',
    ));

    questions.add(Question(
      questionText: 'Bei welchem Displaytyp wird nicht die Leuchtst??rke der Subpixel eingestellt sondern deren Verdunkelung?',
      rightAnswer:  'LCD',
      wrongAnswer1: 'LED / OLED',
      wrongAnswer2: 'CRT (Kathodenstrahlr??hre)',
      wrongAnswer3: 'Plasma (PDP)',
      additionalInformation: 'Bei Liquid-Crystal-Displays wird durch Anlegen einer Spannung an die Subpixel deren helixartige Kristallstruktur sukzessive so kollabiert, dass das bereits polarisierte Licht nicht mehr passend zur 2. Polarisationsebene verdreht wird.',
    ));

    questions.add(Question(
      questionText: 'Wof??r steht das \'O\' in OLED-Displays?',
      rightAnswer:  'Organic',
      wrongAnswer1: 'Orthogonal',
      wrongAnswer2: 'Oscillating',
      wrongAnswer3: 'Oxygen',
    ));

    questions.add(Question(
      questionText: 'Wie viel PS hatte der erste Trabant von ca. 1960?',
      rightAnswer:  '18',
      wrongAnswer1: '32',
      wrongAnswer2: '52',
      wrongAnswer3: '8',
    ));

    questions.add(Question(
      questionText: 'Bis zu wie viel PS haben Formel 1 Fahrzeuge 2020?',
      rightAnswer:  '1000',
      wrongAnswer1: '700',
      wrongAnswer2: '500',
      wrongAnswer3: '400',
    ));

    questions.add(Question(
      questionText: 'Was ist der markanteste Vorteil von Winterreifen gg??. Sommerreifen?',
      rightAnswer:  'besserer Halt auf Schnee, Eis und Matsch',
      wrongAnswer1: 'besserer Halt bei niedrigen Temperaturen',
      wrongAnswer2: 'l??ngere Lebensdauer bei niedrigen Temperaturen',
      wrongAnswer3: 'keine Gefahr des Gummibruchs',
    ));

    questions.add(Question(
      questionText: 'Wie viel Leistung hat eine Mobilfunkantenne mit 5 km Senderadius?',
      rightAnswer:  '20 W',
      wrongAnswer1: '200 W',
      wrongAnswer2: '2 kW',
      wrongAnswer3: '20 kW',
    ));

    return questions;
  }


  static List<Question> _getQuestionsAboutProgramming() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Wie viele Ziffern hat das Bin??rsystem?',
      rightAnswer:  '2',
      wrongAnswer1: '1',
      wrongAnswer2: '4',
      wrongAnswer3: '16',
      additionalInformation: 'In der Digitaltechnik gibt es nur die zwei Zust??nde an/aus bzw. 1/0, high/low, true/false. Dementsprechend wird auch nur mit zwei Ziffern gerechnet.',
    ));

    questions.add(Question(
      questionText: 'Die Bin??rzahl 1010 entspricht im uns bekannten Dezimalsystem der Zahl ...',
      rightAnswer:  '10',
      wrongAnswer1: '2020',
      wrongAnswer2: '4',
      wrongAnswer3: '100',
      additionalInformation: 'Von rechts nach links gelesen berechnet man: 0???2^0 + 1???2^1 + 0???2^2 + 1???2^3 = 0 + 2 + 0 + 8 = 10',
    ));

    questions.add(Question(
      questionText: 'Die Dezimal 1000 entspricht im Hexadezimalsystem der Zahl ...',
      rightAnswer:  '3E8',
      wrongAnswer1: '1750',
      wrongAnswer2: 'F3200',
      wrongAnswer3: 'CA',
      additionalInformation: 'Es gibt die Ziffern 0 bis 9, sowie A [10], B [11], C [12], D [13], E [14] und F [15]. 1000 = 3???16^2 + E???16^1 + 8???16^0',
    ));

    questions.add(Question(
      questionText: 'Wie viele Bit sind ein Byte?',
      rightAnswer:  '8',
      wrongAnswer1: '10',
      wrongAnswer2: '4',
      wrongAnswer3: '16',
      additionalInformation: 'Mit einem Byte lassen sich 2^8 = 256 Zust??nde darstellen.',
    ));

    questions.add(Question(
      questionText: 'Was ist KEINE Programmiersprache?',
      rightAnswer:  'Heat',
      wrongAnswer1: 'Lua',
      wrongAnswer2: 'Haskell',
      wrongAnswer3: 'Rust',
    ));

    questions.add(Question(
      questionText: 'Was ist eine Programmiersprache?',
      rightAnswer:  'Ruby',
      wrongAnswer1: 'Diamond',
      wrongAnswer2: 'Sapphire',
      wrongAnswer3: 'Emerald',
    ));

    questions.add(Question(
      questionText: 'Genau wie viele Byte sind 1 MB?',
      rightAnswer:  '1.000.000',
      wrongAnswer1: '1.024.000',
      wrongAnswer2: '1.048.576',
      wrongAnswer3: '1.000.024',
      additionalInformation: 'Dezimalpr??fixe wie Kilo, Mega und Giga repr??sentieren 10er-Potenzen. [k] = 10^3. [M] = 10^6. [G] = 10^9. Bin??rpr??fixe wie Kibi, Mebi und Gibi stehen f??r 2er-Potenzen. [Ki] = 2^10. [Mi] = 2^20. [GiB] = 2^30. 1.024.000 Byte sind demnach 1 MiB.',
    ));

    questions.add(Question(
      questionText: 'Was ist kein Sortier-Algorithmus?',
      rightAnswer:  'SplitSort',
      wrongAnswer1: 'HeapSort',
      wrongAnswer2: 'MergeSort',
      wrongAnswer3: 'BubbleSort',
    ));

    questions.add(Question(
      questionText: 'Welche ist die gr????te Einheit?',
      rightAnswer:  'Yottabyte (YB)',
      wrongAnswer1: 'Exabyte (EB)',
      wrongAnswer2: 'Zettabyte (ZB)',
      wrongAnswer3: 'Petabyte (PB)',
      additionalInformation: 'Kilo = 10^3 ; Mega = 10^6 ; Giga = 10^9 ; Tera = 10^12 ; Peta = 10^15 ; Exa = 10^18 ; Zetta = 10^21 ; Yotta = 10^24',
    ));

    questions.add(Question(
      questionText: '8 Bit sind 1 Byte. Wie nennt man 4 Bit?',
      rightAnswer:  'Nibble',
      wrongAnswer1: 'Half',
      wrongAnswer2: 'Tetrade',
      wrongAnswer3: 'Quadrupel',
    ));

    return questions;
  }


  static List<Question> _getQuestionsAboutBiology() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Wodurch entstehen die Luftblasen im Brot?',
      rightAnswer:  'Hefe- und Milchs??ure-Bakterien',
      wrongAnswer1: 'gezielte Knetverfahren',
      wrongAnswer2: 'Kohlens??ure im Wasser des Teigs',
      wrongAnswer3: 'Aufplatzen von K??rnern bei Hitze',
    ));

    questions.add(Question(
      questionText: 'Welches Vitamin wird durch Sonneneinstrahlung in der Haut produziert?',
      rightAnswer:  'D',
      wrongAnswer1: 'A',
      wrongAnswer2: 'B',
      wrongAnswer3: 'E',
    ));

    questions.add(Question(
      questionText: 'Was ist kein Bestandteil des menschlichen Auges?',
      rightAnswer:  'Nagel',
      wrongAnswer1: 'Hornhaut',
      wrongAnswer2: 'Iris',
      wrongAnswer3: 'Linse',
    ));

    questions.add(Question(
      questionText: 'Wie viele Knochen hat ein erwachsener Mensch?',
      rightAnswer:  '206 - 212',
      wrongAnswer1: '104 - 106',
      wrongAnswer2: '312 - 342',
      wrongAnswer3: '442 - 504',
      additionalInformation: 'S??uglinge haben ??ber 300 Knochen, von denen einige im Laufe der Zeit zusammenwachsen. Auch Knorpelstrukturen verkn??chern ??ber die Zeit, weshalb keine eindeutige Anzahl genannt werden kann.',
    ));

    questions.add(Question(
      questionText: 'Welches menschliche Organ hat ausgebreitet die gr????te Oberfl??che?',
      rightAnswer:  'Lunge',
      wrongAnswer1: 'Haut',
      wrongAnswer2: 'Darm',
      wrongAnswer3: 'Gehirn',
      additionalInformation: 'Die Haut hat zwar das gr????te Volumen, ist aber nur bis 2 m?? gro??. Die Lunge kommt auf gut 100 m??. Der Darm hat entgegen fr??heren Sch??tzungen von 300 m?? nur gut 30 m??.',
    ));

    questions.add(Question(
      questionText: 'Welcher Muskulaturbereich ist der st??rkste im menschlichen K??rper (Kraft pro Querschnitt)?',
      rightAnswer:  'Kaumuskel',
      wrongAnswer1: 'Pomuskel',
      wrongAnswer2: 'Herzmuskel',
      wrongAnswer3: 'Beinstrecker',
    ));

    questions.add(Question(
      questionText: 'Wie viele Chromosomenpaare hat die menschliche DNA?',
      rightAnswer:  '23',
      wrongAnswer1: '11',
      wrongAnswer2: '31',
      wrongAnswer3: '43',
      additionalInformation: 'Menschen haben 46 Chromosomen, davon 22 Chromosomenpaare (Autosomen) 2 Geschlechtschromosomen oder Gonosomen (XX bei Frauen, XY bei M??nnern).',
    ));

    questions.add(Question(
      questionText: 'Welche Milch-Alternative verbraucht am wenigsten Ressourcen?',
      rightAnswer:  'Hafer',
      wrongAnswer1: 'Soja',
      wrongAnswer2: 'Mandel',
      wrongAnswer3: 'Reis',
      additionalInformation: 'Alle verbauchen deutlich weniger Wasser und Platz als Kuhmilch und erzeugen viel weniger Emissionen. Mandel- und Reis-Anbau sind sehr wasserintensiv, die Sojaproduktion ben??tigt mehr Fl??che und Energie als die von Hafer.',
    ));

    questions.add(Question(
      questionText: 'Welche ist die weltweit h??ufigste Todesursache?',
      rightAnswer:  'Verstopfung der Herzkranzgef????e',
      wrongAnswer1: 'Unf??lle im Verkehr und zuhause',
      wrongAnswer2: 'Lungen-, Darm-, Blut- und Brustkrebs',
      wrongAnswer3: 'Krankheiten wie HIV, Malaria und Tuberkulose',
      additionalInformation: 'Die koronare Herzkrankheit wird in den meisten F??llen durch Arteriosklerose (ugs. ???Arterienverkalkung???) verursacht, welche von hohem Alter oder einem ungesunden Lebesstil herr??hrt.',
    ));

    questions.add(Question(
      questionText: 'Welches Hormon reguliert den Stoffwechsel bzgl. Kohlenhydrate?',
      rightAnswer:  'Insulin',
      wrongAnswer1: 'Adrenalin',
      wrongAnswer2: 'Oxytocin',
      wrongAnswer3: 'Serotonin',
      additionalInformation: 'Serotonin und Adrenalin sind Neurotransmitter (Botenstoffe f??r Synapsen) mit verschiedenen \"psychischen\" Auswirkungen. Oxytocin l??st Wehen aus und stimuliert Brustdr??sen zur Milchabgabe.'
    ));

    questions.add(Question(
      questionText: 'Wof??r ist das Fluorid in Zahnpasta?',
      rightAnswer:  'Remineralisierung des Zahnschmelzes',
      wrongAnswer1: 'Vorbeugung gegen Zahnstein',
      wrongAnswer2: 'Bek??mpfung von Bakterien und Zahnbelag',
      wrongAnswer3: 'Pflege und St??rkung des Zahnfleischs',
      additionalInformation: 'Die von Mikroorganismen erzeugte S??ure kann das Calciumhydroxid (genauer: die Hydroxid-Ionen) im Zahnschmelz l??sen, wodurch Karies entsteht. Die Fluorid-Ionen k??nnen sich an der Stelle der herausgel??sten Hydroxid-Ionen binden und bilden eine festere Verbindung als vorher.',
    ));

    return questions;
  }


  static List<Question> _getQuestionsAboutLogic() {
    final questions = new List<Question>.empty(growable: true);

    questions.add(Question(
      questionText: 'Was ist 2^2^2^2?',
      rightAnswer:  '65.536',
      wrongAnswer1: '256',
      wrongAnswer2: '64',
      wrongAnswer3: '16',
      additionalInformation: 'Entgegen des Berechnungsalgorithmus\' ??berlicher Taschenrechner (z.B. Windows\' calc.exe) ist das Potenzieren rechtsassoziativ. Das hei??t, ohne Klammerung wird \"von rechts nach links\" gerechnet: 2^2^2^2 = 2^(2^[2^2]) = 2^(2^4) = 2^16',
    ));

    questions.add(Question(
      questionText: '{7890} = 4     {3664} = 3     {3700} = 2\n{3678} = 3     {5890} = 4     {2630} = 2\n{1890} = 4     {3859} = 3     {7801} = 3\n{1462} = 2     {8444} = 5     {2580} = ?',
      rightAnswer:  '3',
      wrongAnswer1: '2',
      wrongAnswer2: '4',
      wrongAnswer3: '5',
      additionalInformation: 'Gesucht ist die Anzahl geschlossener Bereiche in den Ziffern. Die 1, 2, 3, 5 und 7 haben 0, die 0, 4, 6 und 9 haben 1 und die 8 hat 2.',
    ));

    questions.add(Question(
      questionText: 'Wie viele W??gungen sind mit einer Balkenwaage mit 2 Schalen n??tig, um 1 schwerere unter 8 ansonsten gleich-schweren Kugeln zu identifizieren?',
      rightAnswer:  '2',
      wrongAnswer1: '3',
      wrongAnswer2: '4',
      wrongAnswer3: '5',
      additionalInformation: 'Man w??gt erst 3 gegen 3 ab und beh??lt die schwereren bzw. die 2 ??brigen, wenn sie gleich schwer sind. Von den ??brigen w??gt man 1 gegen 1 ab. Die schwerere oder ??brige Kugel ist die gesuchte.',
    ));

    questions.add(Question(
      questionText: 'Herr M??ller hat 2 Kinder. Eins davon ist ein M??dchen. Mit welcher Wahrscheinlichkeit ist das andere ein Junge?',
      rightAnswer:  '2/3',
      wrongAnswer1: '1/4',
      wrongAnswer2: '1/3',
      wrongAnswer3: '1/2',
      additionalInformation: 'Es gibt grundlegend 4 M??glichkeiten f??r Kind 1 und 2 (in Reihenfolge): J-J, J-M, M-J, M-M. Mit dem Wissen, dass eines der beiden ein M??dchen ist, bleiben die M??glichkeiten J-M, M-J und M-M. Aus diesen 3 M??glichkeiten sind 2 f??r die Fragestellung zutreffend.',
    ));

    return questions;
  }

}
