# Random Indexing

## Testa programmet

Kör nu programmet OrdHP med träningsmängd ri_dataset1/ och testfilen test1.dat:
`java -Xmx1000m -cp lib:RI:OrdHP OrdHP /info/sprakt10/ri/ri_dataset1/ test1.dat`

eller om du gör labben i Windowsmiljö (t.ex. hemma, förutsatt att du kopierat även textmängderna):
`java -Xmx1000m -cp lib;RI;OrdHP OrdHP ../ri_dataset1/ test1.dat`

1. Hur många rätt blev det?

  We got 16/59 correct.

2. Hur många rätt hade det blivit om man chansat?

  There are 5 possible answers, we have a 20% chance of picking a single correct answer.

  If selected randomly we would expect to get 59 * 0.2 = 11.8 = 11 correct answers

## Gör följande tre uppgifter.

### Stopplista
Vad ger detta för resultat? Varför tror du?

The result was 24/59 correct

We do not include stopwords. Stopwords make up a stoplist. The stoplist prevents the indexer from indexing these words, usually because they occur with high frequency and have no interest. I think this doesn't help our queries, since they don't contain stopwords (presumably). This should help the indexing as the sliding window can now look at neighboring words outside of the stoplist. This could effectively increase our window size in instances where the window contains a stopword.

### Ändra parametrar

##### Dimensionality
The dimensionality refers to the size of the context and index vectors. This also provides implicit dimensionality reduction, as opposed to LSA. Since the dimension d is a parameter we do not use every term or every document as a dimension. It was stated during a lecture that this parameter is usually around 2000, afterwards it provides diminishing returns. This could also suggest some sort of implicit dimensionality in language itself.

| Dimensionality | Accuracy | Indexing Time |
|----------------|----------|---------------|
| 30             | 7/59     | 0.0311        |
| 300            | 21/59    | 0.0338        |
| 1800           | 24/59    | 0.0364        |
| 4000           | 23/59    | 0.0400        |
| 8000           | 25/59    | 0.0450        |
| 9000           | 26/59    | 0.0502        |

According to the results in the above table we see a small increase in accuracy as the dimensionality increases from the default value (1800). Decreasing from the default value of 1800 to 300 showed a very small decrease in accuracy. There is a sharp drop at some dimension as, a dimensionality of 30 resulted in very poor results. This is not insignificant, as it demonstrates a low power processor might be quite capable of generating similar results without needing to utilize a large vector.

d = 4000 was used in this reference: http://www.rni.org/kanerva/cogsci2k-poster.txt

##### Window Size

The window size lets us determine what words are local to the word being focused on. We take the word inside the window, add its index vector to the context vector of the word being focused on. This eventually builds up a context vector where two similar words will have similar context vectors (similar in the sense of cosine or some other vector similarity measure).

| Window Size | Accuracy | Indexing Time|
|-------------|----------|--------------|
| 2           | 21/59    | 0.0355       |
| 4           | 24/59    | 0.0391       |
| 6           | 23/59    | 0.0373       |
| 8           | 23/59    | 0.0354       |
| 10          | 23/59    | 0.0354       |
| 12          | 23/59    |  0.0358      |

The improvement from increasing the window size stops after a size of 4 and does not really decrease. I would have expected at some window size for the accuracy to decrease because we could be considering words that are not really related.

#### På vilket sätt tror du att de olika parametrarna kan påverka resultatet? (Du behöver inte resonera om alla.)

#### Random Seed
I do not believe the random seed will affect the expected value of the result, rather it should just help produce different results from run to run.

#### Random Degree

Each term gets its own random vector assigned to it, called an index vector. The dimensionality of the vector is a parameter. The random degree is the number of -1/+1's to randomly place in the index vector. Random vectors with high dimension like this have been shown to be approximately orthogonal.

I think this is useful up to a point and it should probably grow proportionally to whatever the dimension is set to. With a higher dimensional matrix, we can add a few more random -1/+1's to the index vector and remain nearly orthogonal.

random degree = 10 was used in this reference: http://www.rni.org/kanerva/cogsci2k-poster.txt


### Egna synonymer

I came up with a list of synonyms, however many of them appeared to not be in the corpora.

```
magnifik|högtidlig|förhörligad|praktfull|förfinad|3
fragmentering|utspädning|nybildning|sönderdelning|förkortning|spridning|2
valör|mängd|värde|standard|form|växel|1
uppfordrande|upprepande|utvärderande|uppmanade|utmärkande|upplysande|2
lobotomi|blodanalys|skiktröntgen|tarmundersökning|hjärnoperation|ögonbehandling|3
svartmåla|förtala|utmärka|förstöra|dölja|förfula|0
bifall|medverkan|synpunkt|tilltal|lydnad|samtycke|4
hårdragen|obetydlig|långsökt|plågsam|finkänslig|svårsmält|1
lekamen|redskap|kropp|partikel|gräns|tecken|1


--------------------- Testing

Test File: test-jaa.dat

- Correct
lekamen => kropp [kropp(0.211) redskap(0.07) tecken(0.063) partikel(0.022) gräns(0.0)]

- Missed
bifall => samtycke [synpunkt(0.104) lydnad(0.1) samtycke(0.071) tilltal(0.028) medverkan(0.012)]

- Unsufficient
magnifik => förfinad [praktfull(0.106) högtidlig(0.0)]
fragmentering => sönderdelning [spridning(0.027) utspädning(0.0)]
valör => värde [standard(0.0) mängd(-1.0)]
uppfordrande => uppmanade [upprepande(0.076) utvärderande(0.0)]
lobotomi => hjärnoperation [blodanalys(-1.0)]
*svartmåla => förtala [förtala(-1.0)]
hårdragen => långsökt [obetydlig(0.0) långsökt(-1.0)]
- Numbers
Correct: 1
Missed: 1
Unsufficient: 7 (1*)
Total: 9

Total time: 0.16745 minutes

```
