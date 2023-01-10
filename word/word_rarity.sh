#!/bin/bash

grep 'into manifestation' ../values.sql | sed "s/insert into manifestation values (\([^,]*\), \([^,]*\), .*/python3 word_lexical_class.py \2 \1/g" | tr 'A-Z' 'a-z' > ./tmp/word-rarity-1-tmp.sh
# grep: pour sélectionner les lignes comportant des titres
# sed: pour sélectionner, dans ces lignes, les titres (\2) et les keys des manifestations (\1); et pour transformer le résultat en commandes.
# tr: pour enlever les majuscules (sinon wordnet pense qu'il s'agit de noms propres)
# j'exporte ensuite dans un fichier temporaire

bash ./tmp/word-rarity-1-tmp.sh > ./tmp/word-rarity-2-tmp.sh

sed -i "s/'VB'/-famlv/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'VB.'/-famlv/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'NN'/-famln/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'NN.'/-famln/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'JJ'/-famla/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'JJ.'/-famla/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'RB'/-famlr/g" ./tmp/word-rarity-2-tmp.sh
sed -i "s/'RB.'/-famlr/g" ./tmp/word-rarity-2-tmp.sh

cat ./tmp/word-rarity-2-tmp.sh

# maintenant: il faut utiliser wordnet!

# et pour plus tard: récupérer les titres depuis la db directement (comme ça je peux aussi utiliser importation dbpedia!).

# et les wordnet hyperonyme?
