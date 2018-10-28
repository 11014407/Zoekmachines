# Zoekmachines
Het Project voor zoekmachines
Depencencies:
import sys
import json
from elasticsearch import Elasticsearch
import numpy
import pandas as pd
from bs4 import BeautifulSoup
import os
import re
from pprint import pprint
from collections import Counter,defaultdict
import glob
import nltk
import math
from __future__ import division

De eerste file de uitgevoert moet worden is de file die de data omzet van .xml files naar .json files, genaamd Json_data.ipynb, waardoor ze bruikbaar worden in elastic search. Deze file bevind zich in ~/KVR waar ook alle .xml files zich bevinden. Na het uitvoeren van de functies in deze file worden er even veeel .json files geschreven als dat er .xml files zijn. Dit zal even duren en kan voor onoverzichtelijkheid zorgen.

The actual data is a zip file with around 3000 json files constituting a small databse. If for some reason the Json_data.ipynb file does not work correctly this is a backup to use as a smaller search engine.

De file waarin de main code wordt uitgevoerd is de elastic_search.ipynb. Het eerste wat gedaan moet worden om dit werkend te krijgen is het loaden van de data in de .json files die nu zijn aangemaakt in de ~/KVR directory. Het is belangrijk dat hierbij de goede directory die gebruikt word is meegegeven waardoor alle files beschikbaar zijn.

Advanced search werkt niet ondanks vele pogingen. Hij zoekt wel, maar voor onverklaarbare redenen krijgen we steeds 0 resultaten eruit. We hebben als groep daarom besloten om verder te gaan met het maken van een woordweb en een tijdlijn.