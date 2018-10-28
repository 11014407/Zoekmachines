# Zoekmachines
Het Project voor zoekmachines
De eerste file de uitgevoert moet worden is de file die de data omzet van .xml files naar .json files waardoor ze bruikbaar worden in elastic search. Deze file bevind zich in ~/KVR waar ook alle .xml files zich bevinden. Na het uitvoeren van de functies in deze file worden er even veeel .json files geschreven als dat er .xml files zijn. Dit zal even duren en kan voor onoverzichtelijkheid zorgen.

De file waarin de main code wordt uitgevoerd is de elastic_search.ipynb. Het eerste wat gedaan moet worden om dit werkend te krijgen is het loaden van de data in de .json files die nu zijn aangemaakt in de ~/KVR directory. Het is belangrijk dat hierbij de goede directory die gebruikt word is meegegeven waardoor alle files beschikbaar zijn.

Advanced search werkt niet ondanks vele pogingen. Hij zoekt wel, maar voor onverklaarbare redenen krijgen we steeds 0 resultaten eruit. We hebben als groep daarom besloten om verder te gaan met het maken van een woordweb en een tijdlijn.