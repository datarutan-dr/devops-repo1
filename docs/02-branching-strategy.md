# Branching strategy

## Chosen strategy
Vilken strategi du valt, och varför den passar ditt projekt. Tre till fem meningar.
Man använder "Korta grenar mot huvudgrenen" 
Man kallar det här: trunk-based development. 
Trunk är stammen, alltså huvudgrenen.
Under kursen så skall vi använda korta grenar mot huvudgrenen.


## Branch protection
Vilka regler du slog på, eller skulle slå på i ett team med fler än en person,
och varför just de.

Om man är flera skall man nog slå på Grenskydd ( branch protection), alltså regler som faktiskt hindrar att någon skickar in kod direkt i huvudgrenen.


## Tagging and versioning
Vad v0.1.0 innehåller, och hur du avgör vilket nummer nästa version får.

v0.1.0 är den första taggade versionen.
==
Med Conventional Commits och semantisk versionering: vad en fix:, en feat: och en docs: gör med numret.
==
Typen säger vilken sorts ändring det är. De fyra du använder mest:
feat är ny funktionalitet.
fix är en rättning av något som var fel.
docs är dokumentation.
chore är allt annat som inte ändrar vad systemet gör, som en inställningsfil.
Beskrivningen skrivs på engelska som en uppmaning, med liten bokstav: add, inte added.
! betyder att ändringen bryter något (breaking change): den som använder systemet måste ändra något hos sig.
===
Att docs: inte påverkar versionen är inte en lucka. Ett versionsnummer beskriver vad som händer för den som använder systemet, och en dokumentationsändring gör ingenting med dem.

===
===
MAJOR.MINOR.PATCH
varje tal säger vilken sorts förändring som skett. Branchen säger "semver".

----
PATCH: man öker siffran i PATCH när man gjort en rättning i koden. Men systemet har inte ändrats.

MINOR:när man lägger till nya funktioner eller markerar föråldrad kod. PATCH återställs till 0.  X.X.0

MAJOR: man ökar den om man gör en större ändring som gör att bakåtkompabiblioteten. Befintlig kod kan sluta fungera. 
MINOR & PATCH ställs till 0   tex: 2.0.0
----

===
===
