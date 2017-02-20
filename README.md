# iOS-Lynkurs


Snarveier i Xcode:

```CMD + R``` bygger og kjører prosjekt.

```CMD + B``` bygger prosjekt.

```CMD + U``` kjører kun tester.

```CMD + Option + Enter ``` åpner Assistant Editor.

## Lynkurs-01-Swift
Prosjektet er en ```Command Line Tool``` satt opp sammen med et ekstra test-Target ```OS X Unit Testing Bundle```.

####Oppgaver: 
Fiks koden i ```Person.swift```, slik at alle testene i ```PersonTests.swift``` fungerer. 

## Lynkurs-02-iOS
Lær deg basic iOS og Xcode ved å lag følgende: 

###Oppgaver:

####Tips:
Om ikke outlets eller actions fungerer, sjekk at du ikke har laget for mange knyttet til samme objekt.

## Lynkurs-03-App
I denne delen skal du lage forskjellige views som tar i bruk forskjellige deler av funksjonaliteten på iOS. Om du Alternativt kan du ut

###Oppgaver:
Oppgavene går ut på å opprette egne views (ViewController i Storyboard + NavnViewControllers.swift) og knytte disse sammen med hovedviewet.

#### 0: NavigationController
For at views skal ha en navigasjon tilbake til hovedview kan du velge å legge til en Navigation Controller.

Tips: Velg header hovedview i Main.storyboard, klikk på ```Editor -> Embed in.. -> Navigation Controller```.

#### 1: ConverterViewController
Konverter numeriske verdier live ved å bruke to Text Fields og lyttere. 

#### 2: MapViewController
Bruk Apple Maps til å vise et kart hvor... 

#### 3. NetworkViewController
GET og POST data mot API og vis på fornuftig måte.

#### 4. ImageViewController
Hent og vis bilder lagret på simulator eller enhet.

#### 5. Lag 

### Ekstraoppgaver:

#### 5. CameraViewController
Ta bilder med kamera og bruk dem i App.
Obs: fungerer ikke på Simulator, så krever at man kan teste på enhet.

#### 6. MotionViewController
Obs: fungerer ikke på Simulator, så krever at man kan teste på enhet.

#### 7. ListViewController
Lag en liste hvor man kan legge til og slette elementer.

Tips:
Sjekk ut ```File -> New Project.. -> Master-Detail Application``` 

### Andre tips:

#### Ikon
For å gi appen din et ikon/logo må du opprette PNGs etter retningslinje til [Apple](human-interface-guidelines/graphics/app-icon) og deretter legge de inn over gjeldene AppIcon i Assets.xcassets inne i Xcode. For å tilpasse et eksisterende bilde til logo-filter kan man bruke gratisverktøy som [MakeAppIcon.com](https://makeappicon.com).
