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
I denne delen skal du lage forskjellige views som tar i bruk forskjellige deler av funksjonaliteten på iOS. 
Lag et nytt prosjekt i Xcode ved å trykke ```File -> New Project.. -> Single View Application```. Deretter kan åpne ```Main.storyboard```, her skal du bygge opp alle oppgavene.

![StoryboardExample](https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/StoryboardExample.png "StoryboardExample")

Se gjerne på løsningsforslaget om du står fast. 

###Oppgaver:
Oppgavene går ut på å opprette egne views (ViewController i Storyboard + NavnViewControllers.swift) og knytte disse sammen med hovedviewet.

#### Oppgave 0: NavigationController
For at views skal kunne navigere tilbake til hoved viewet kan du velge å legge til en Navigation Controller.

Tips: Velg header hovedview i Main.storyboard, klikk på ```Editor -> Embed in.. -> Navigation Controller```.

#### Oppgave 1: ConverterViewController
Implementer en View Controller hvor bruker kan konverte grader fra fahrenheit til celsius og vice versa.


![ConvertViewController](https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/ConvertViewControllerExample.png "ConvertViewController")

**Tips:**

Det er ofte en fordel å starte med å sette opp Text Fields og Text Labels i Storyboard først, som i Lynkurs-02-iOS. Knytt deretter disse opp mot en ny View Controller som IBOutlets.

Verdi hentes ut fra ```textfield```ved å kalle ```textfield.text```

For å merke endringer i et Text Field kan du implementere en lytter, hvor metoden ``handleValue``` kalles med tekstfeltet som argument når det skjer noe.
```
textfield.addTarget(self, action: #selector(handleValue(_:)), for: .editingChanged)
```

Deretter kan verdien fra det generiske input feltet håndteres 
```
func handleValue(_ textField: UITextField) {
    if let value: Double = Double(textField.text!) {
        //Bruk verdi
    }
}
```

Verdier kan settes på tilsvarende måte med ```textField.text = "\(value)"```.


#### Oppgave 2: MapViewController
Bruk Apple Maps til å vise et kart hvor... 

#### Oppgave 3. NetworkViewController
GET og POST data mot API og vis på fornuftig måte.

#### Oppgave 4. ImageViewController
Hent og vis bilder lagret på simulator eller enhet.

#### Oppgave 5. CameraViewController
Ta bilder med kamera og bruk dem i App.
Obs: fungerer ikke på Simulator, så krever at man kan teste på enhet.

#### Oppgave 6. MotionViewController
Obs: fungerer ikke på Simulator, så krever at man kan teste på enhet.

#### Oppgave 7. ListViewController
Lag en liste hvor man kan legge til og slette elementer.

**Tips:**
Sjekk ut ```File -> New Project.. -> Master-Detail Application``` 

### Andre tips:

#### Ikon
For å gi appen din et ikon/logo må du opprette PNGs etter retningslinje til [Apple](human-interface-guidelines/graphics/app-icon) og deretter legge de inn over gjeldene AppIcon i Assets.xcassets inne i Xcode. For å tilpasse et eksisterende bilde til logo-filter kan man bruke gratisverktøy som [MakeAppIcon.com](https://makeappicon.com).
