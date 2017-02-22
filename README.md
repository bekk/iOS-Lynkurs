# iOS-Lynkurs

Kurset er tiltenkt å fungere som et lynkurs for å raskest mulig få deg i gang med native apputvikling i Xcode. Det er delt inn i følgende hoveddeler:

- **1:** 🍏 Generell introduksjon til kurset og plattformen

- **2:** 🔨 Enkel gjennomgang av programmeringsspråket Swift og utviklingsverktøyet Xcode
  
  - **3:** ✅ Klassik oppgaveløsning av Swift oppgaver, hvor målet er å få alle testene til å fungere.

- **4:** 🤔 Demonstrasjon av hvordan man oppretter et enkelt iOS-prosjekt i Xcode, og de nødvendige stegene for å lage en app man kan bruke.
  
  - **5:** 💻 Oppgaveløsning hvor man selv skal lage tilsvarende app på egen maskin. 

- **6:** 📱Demonstrasjon av hvordan appen kan utvides med navigasjon og flere views med ytterligere funksjonalitet.
  
  - **7:** ⭐️ Oppgaveløsning av utvidet funksjonalitet. Anbefalt forslag til rekkefølge er gitt under ```Lynkurs-03-App```. Deltakere står fritt til å velge hvordan de ønsker å kombinere funksjonalitet selv. 🤠

=======================================================================================================================================
#### Snarveier i Xcode:

```CMD + R``` bygger og kjører prosjekt.

```CMD + B``` bygger prosjekt.

```CMD + U``` kjører tester (dersom de er satt opp under appens Scheme)

```CMD + Option + Enter ``` åpner Assistant Editor.

```CMD + F ``` Søk i åpen fil

```CMD + Shift + F ``` Søk i hele prosjekt

```CMD + 1``` Åpner left toolbar (Filstruktur, Søk, Breakpoints etc)

```CMD + Option + 1``` Åpner right toolbar (Properties, Segues etc)

```Option + musklikk``` på metode, variabel eller klasse viser mer informasjon

**Storyboard:**

**Knytte element i View til View Controller:**

Hold inne ```Ctrl``` og klikk på et element (Button, Label, Text Field) og dra muspeker over i korresponderende View Controller i Assistant Editor. Slipp og velg om du vil ha en ```IBOutlet``` eller ```IBAction```. 

**Åpne annen View Controller:**

På samme måte kan man dra fra en Button over til et annen View Controller i Storyboard. Dette vil opprette en ```segue```, som gjør at knappen åpner et annet view og legger det over sitt eget. Hvordan selve overgangen skal oppføre seg velges når man slipper ```Ctrl```

**Auto Layout:**

Når man skal lage view layouts i iOS, kan man typisk enten bruke Stack Views eller Constraints. 
[Les mer om Auto Layout på developer.apple.com](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/)

**Auto Layout Constraints:**

Tilsvarende IBOutlets kan man ```Ctrl + dra``` fra element til eget view for å stille inn såkalte ```Constraints```, som kan ses på som regler som forteller hvordan UI skal se ut når appen kjører. Typiske ```Constraints``` er å midtstille horisontalt eller vertikalt, sette hvor stor relativ avstand det skal være til top, bunn, side eller andre elementer. Slik kan man lage en Auto Layout som oppfører seg likest mulig, uavhengig av skjermstørrelse eller skjermforhold.

Dette vil bli demonstrert flere ganger underveis i kurset.

## Lynkurs-01-Swift
Prosjektet er en ```Command Line Tool``` satt opp sammen med et ekstra test-Target ```OS X Unit Testing Bundle```.

####Oppgaver: 
Fiks koden i ```Person.swift```, slik at alle testene i ```PersonTests.swift``` fungerer. 

**Eksempel:**
```swift

//PersonTests.swift

func testAge() {
    XCTAssertTrue(kylie.age > 0, "should be older")
}

//Person.swift

init(firstName: String, lastName: String, gender: String, age: Int) {
    //...
    self.age = 0
}

```

Testen feiler fordi forventet ```age``` ikke blir returnert. Om man ser i konstruktøren til ```Person.swift```, kan man se at self.age alltid blir satt til 0. Prøv å endre denne til verdien man får som argument.

## Lynkurs-02-iOS
Lær deg basic iOS og Xcode ved å lag følgende: 

###Oppgaver:

#### Oppgave 1: 
Lag det Oscar lagde på demoen, gjerne med litt ekstra farger og pynt.

#### Oppgave 2: 
Fjern knappen og få labelen til å endre tekst ved at den lytter på endringer i input-feltet.

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
For at views skal kunne navigere tilbake til hoved viewet kan du velge å legge til en [Navigation Controller](https://developer.apple.com/reference/uikit/uinavigationcontroller).

Tips: Velg header hovedview i Main.storyboard, klikk på ```Editor -> Embed in.. -> Navigation Controller```.

![NavigationControllerExample](https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/NavigationControllerExample.png "NavigationControllerExample")

#### Oppgave 1: ConverterViewController
Implementer en View Controller hvor bruker kan konvertere fra fahrenheit til celsius og vice versa.

<img src="https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/ConvertViewControllerExample.png" alt="alt text" width="400" height="auto">

**Tips:**

Det er ofte en fordel å starte med å sette opp Text Fields og Text Labels i Storyboard først, som i Lynkurs-02-iOS. Knytt deretter disse opp mot en ny View Controller som IBOutlets.

Verdi hentes ut fra ```textfield```ved å kalle ```textfield.text```

For å merke endringer i et Text Field kan du implementere en lytter, hvor metoden ```handleValue``` kalles med tekstfeltet som argument når det skjer noe.
```swift
textfield.addTarget(self, action: #selector(handleValue(_:)), for: .editingChanged)
```

Deretter kan verdien fra det generiske input feltet håndteres 
```swift
func handleValue(_ textField: UITextField) {
    if let value: Double = Double(textField.text!) {
        //Bruk verdi
    }
}
```

Verdier kan settes på tilsvarende måte med:
```swift
textField.text = "\(value)"
```

#### Oppgave 2: MapViewController
Implementer en View Controller som bruker Apple Maps til å vise markører gitt navn, breddegrader og lengdegrader. Det anbefales å lage et ```MKMapView``` i Storyboard og deretter knytte det opp mot View Controller via en IBOutlet.

For å kunne bruke MapView må du importere MapKit i tillegg til UIKit i klassen:
```swift
import UIKit
import MapKit
```

Opprett en liste med alle markørene du ønsker ha i kartet ditt. f.eks:
```swift
let annotation = MKPointAnnotation()
annotation.title = "Bekk Consulting AS"
annotation.coordinate = CLLocationCoordinate2D(latitude: 59.9037048, longitude: 10.7369906)

var markers: [MKPointAnnotation] = []
markers.append(annotation)
```

Disse kan du legge til på kartet ved å skrive: 
```swift
mapView.addAnnotations(markers)
```

<img src="https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/MapsViewControllerExample.png" alt="alt text" width="400" height="auto">

#### Oppgave 3. NetworkViewController
GET og POST data mot API og vis på fornuftig måte.

Nettverkskall kan gjøres med innebygde URLSession:

```swift
func get(urlString: String) {
    
    let request = URLRequest(url: URL(string: urlString)!)
    let session = URLSession.shared

    let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
        guard error == nil else { //Abryter det oppstod feil
            print("\(error)")
            return
        }

        guard let responseData = data else { //Abryter om data ikke eksisterer
            print("Error: did not receive data")
            return
        }

        //Her kan vi bruke responsedata 
    })
    task.resume()
}

```

For å kunne behandle dataobjektet - responseData kan vi enten brukte det direkte, eller parse det om til andre formater som kan være greier å jobbe med.
Eksempelet viser hvordan vi kan gjøre om dataen til JSON:

```swift

    func parse(responseData: Data) {
        do {
            guard let data = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                print("Error: Serialization failed")
                return
            }
            
            //Bruk data som [String : AnyObject]
            
        } catch {
            print("Error: catched unknown error")
            return
        }
    }
```

Felter i et slikt JSON-objekt kan hentes ut ved å skrive:

```swift
if let value = data["value"] as? String {
    // Bruk value
}
```

<img src="https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/NetworkViewControllerExample.png" alt="alt text" width="400" height="auto">



Dersom endepunktet er usikkert(HTTP) og ikke sikkert (HTTPS) er du nødt til å lage noen unntak i ```Info.plist``` for å kunne nå endepunktet.

![HttpEndpointExample](https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/HttpEndpointExample.png "HttpEndpointExample")

#### Oppgave 4. SettingsViewController
Implementer en View Controller som kan lagre og hente data fra [UserDefaults](See https://developer.apple.com/reference/foundation/userdefaults).

**UserDefaults** er et enkelt key/value lager tiltenkt enkel data som innstillinger og lignende. Det er ikke nødvendig å importere noe ekstra for å bruke UserDefaults. For å lagre en integer holder det å skrive:

```swift
UserDefaults.standard.set(value, forKey: "mykey")
```
Denne kan hentes ut ved å skrive:
```swift
UserDefaults.standard.integer(forKey: "mykey")
```
Løsningsforslaget viser hvordan man kan representere denne verdien med en slider ved hjelp av UISlider:

<img src="https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/SettingsViewControllerExample.png" alt="alt text" width="400" height="auto">

#### Oppgave 5. MotionViewController
Implementer en View Controller som bruker CoreMotion til å utforske sensordata fra både akselerometeret og magnetometeret.

Obs: fungerer ikke på Simulator, krever at man kan teste på enhet.

```swift
import CoreMotion

let motionManager = CMMotionManager()
let updateIntervalInSeconds = 0.2

motionManager.accelerometerUpdateInterval = updateIntervalInSeconds
motionManager.startAccelerometerUpdates(to: OperationQueue.main) {(accelerometerData: CMAccelerometerData?, error: Error?) in
    // Bruk accelerometerData
}
```

Tips: Sjekk hva som finnes i accelerometerData med ```Option + musklikk```. Magnetometer kan brukes på tilsvarende måte.

#### Oppgave 6. TouchIDViewController
Implementer en View Controller som autentiserer fingeravtrykk med Touch ID.

<img src="https://github.com/bekk/iOS-Lynkurs/blob/master/Assets/TouchIDViewControllerExample.png" alt="alt text" width="400" height="auto">

#### Oppgave 7. ImageViewController
**TODO:** Hent og vis bilder lagret på simulator eller enhet.

#### Oppgave 8. CameraViewController
**TODO:** Ta bilder med kamera og bruk dem i App.
Obs: fungerer ikke på Simulator, så krever at man kan teste på enhet.

#### Oppgave 9. ListViewController
**TODO:** Lag en liste hvor man kan legge til og slette elementer.

**Tips:**
Sjekk ut ```File -> New Project.. -> Master-Detail Application``` 

### Andre tips:

#### Ikon
For å gi appen din et ikon/logo må du opprette PNGs etter retningslinje til [Apple](human-interface-guidelines/graphics/app-icon) og deretter legge de inn over gjeldene AppIcon i Assets.xcassets inne i Xcode. For å tilpasse et eksisterende bilde til logo-filter kan man bruke gratisverktøy som [MakeAppIcon.com](https://makeappicon.com).
