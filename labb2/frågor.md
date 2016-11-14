##### Kör testversionen
* på några (regelbundet) böjda ord,
 * 'dagens' yields: `dagens matchar suffixregeln dag|ens @ en ar` </br>
 * 'dags' yields: `dags matchar suffixregeln dag|[^sxz]s @ en ar` </br>
 * 'dagar' yields: Nothing
* på några sammansatta ord,
 * 'järnvag' yields: `järnvag sammansatt som järn|vag`
 * 'järnväg' yields: Nothing
 * 'statsapparat' yields: `statsapparat sammansatt som stats|apparat`
* på några (regelbundet) böjda sammansatta ord.
 * 'högskolet' yields `högskolet sammansatt som hög|skolet`
 * 'högskolestudent' yields `högskolestudent sammansatt som högskole|student`
 * 'järnvägsbro' yields: `järnvägsbro sammansatt som järn|väg|s|bro`




###### Testa ett treledssammansatt substantiv i bestämd form plural. Vilken suffixregel används? Vad betyder den? Läs om hur suffixreglerna byggs upp på http://www.nada.kth.se/stava/suffixregler.html.

## Vad betyder följande regel? Hur många ord genereras av den? Vilken ordklass har orden?
(dj|mm)@ a, ande, ~anden, ~ade

The provided text file showed this rule matching the word "sitt."
```
sitt matchar suffixregeln sitt|(dj|mm)@ a ande ~ade
```
471 ord genereras av '(dj|mm)@ a ande ~ade'

## Ord som slutar på -alitet, till exempel serialitet och fundamentalitet godkänns inte av Stava. Hitta på två regler som fixar detta. (Ledning: både adjektiv- och adverbformerna av dessa substantiv finns i ordlistan.)
## Kolla med genstava vilka ord som genereras av dina regler men inte borde genereras. Tänk på att vissa ord som genereras kanske aldrig har använts men ändå borde anses korrekta (eller åtminstone rättstavade - om skribenten skrivit ordet är det inte Stavas sak att underkänna det) eftersom det är skapat på ett regelbundet sätt. Till exempel är de nog få studenter på kursen som själva använt orden "hortikulturalitet" och "bronkialitet", men till skillnad från till exempel "uttalitet" är de bildade på det sätt som avsågs.
## Fixa reglerna så att Stava inte accepterar de felaktiga orden men fortfarande accepterar alla korrekta ord. Försök till exempel att hitta någon böjningsform som finns i ordlistan och som är gemensam för många felaktiga ord men inte för korrekta. Extra svårt är kanske att se till att ordet gammalitet inte genereras, men det går.
## Testa reglerna med testversionen av Stava genom att skriva in dem i rutan för nya regler.
