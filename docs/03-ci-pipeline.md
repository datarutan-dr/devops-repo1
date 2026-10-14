# CI pipeline

## What the scripts do
One sentence each for build.sh and test.sh.

## The failure the pipeline caught
What I broke on purpose, and what the pipeline said. A link to the red run is enough.


==
En pipeline är ett skript med en utlösare (trigger).
Samma build.sh och test.sh kör på din dator och i GitHub Actions, så ett fel går att hitta på din egen dator.

Pipelinen anropar ett namn, inte ett innehåll.
När applikationen kommer i Modul 04 byter du vad skripten gör inuti, och pipelinen fortsätter fungera under tiden.

Exit-koden (exit code) är det pipelinen läser.
0 blir grönt, allt annat rött. build.sh stannar vid första felet med set -euo pipefail. test.sh använder medvetet inte -e, så att alla kontroller hinner köras innan exit-koden sätts.

Ett test som misslyckas informerar, en grind (quality gate) stoppar. Inställningen Require status checks to pass i grenskyddet (branch protection) är det som gör skillnaden.

En grind ska vara värd sin kostnad. Fråga hur ofta den fångar något, och vad den kostar när den inte gör det.

Ett AI-förslag är en gissning tills du har kontrollerat det. Kör det, läs vad som hände, och skriv ner vad du hittade.

ShellCheck läser skripten åt dig och hittar fel innan de körs. Pipelinen kör det varje gång.

==
