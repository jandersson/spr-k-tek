# Random Indexing

## Testa programmet

Kör nu programmet OrdHP med träningsmängd ri_dataset1/ och testfilen test1.dat:
java -Xmx1000m -cp lib:RI:OrdHP OrdHP /info/sprakt10/ri/ri_dataset1/ test1.dat

eller om du gör labben i Windowsmiljö (t.ex. hemma, förutsatt att du kopierat även textmängderna):
java -Xmx1000m -cp lib;RI;OrdHP OrdHP ../ri_dataset1/ test1.dat

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

##### Window Size

| Window Size | Accuracy | Indexing Time|
|-------------|----------|--------------|
| 2           | 21/59    | 0.0355       |
| 4           | 24/59    | 0.0391       |
| 6           | 23/59    | 0.0373       |
| 8           | 23/59    | 0.0354       |
| 10          | 23/59    | 0.0354       |
| 12          | 23/59    |  0.0358      |

The improvement from increasing the window size stops after a size of 4. This suggests the there might not be as much information beyond this point about the relationship of words, either due to the phrase/sentence length or some other factor.

The random seed should not affect the expected value of the result, though it could change the result from seed to seed.

#### På vilket sätt tror du att de olika parametrarna kan påverka resultatet? (Du behöver inte resonera om alla.)

I do not believe the random seed will affect the expected value of the result, rather it should just help produce different results from run to run.

### Egna synonymer
