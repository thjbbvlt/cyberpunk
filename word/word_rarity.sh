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

sed "s/'),/\n/g" ./tmp/word-rarity-2-tmp.sh > ./tmp/word-rarity-3-tmp.sh

sed -i "s/\].*//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/\[//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/)/\n/g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/(//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/',//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/, '//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/^'//g" ./tmp/word-rarity-3-tmp.sh
sed -i "s/^ '//g" ./tmp/word-rarity-3-tmp.sh

grep "faml" ./tmp/word-rarity-3-tmp.sh | sed "s/^/wordnet /g" > ./tmp/word-rarity-4-tmp.sh

bash ./tmp/word-rarity-4-tmp.sh > ./tmp/word-rarity-5-tmp.sh

grep "used as" ./tmp/word-rarity-5-tmp.sh | sed "s/^\([^ ]*\) used as [an]* \([^ ]*\) is \([^ ]*\).*/\1 (\2) = \3/g"

# maintenant: il faut utiliser wordnet!

# et pour plus tard: récupérer les titres depuis la db directement (comme ça je peux aussi utiliser importation dbpedia!).

# et les wordnet hyperonyme?

# bon, en fait je pense que je dois séparer deux trucs:
# 1) analyser la familiarité d'un mot
# 2) mettre en lien le mot et la manifestation
# et je peux faire ces deux choses à partir du même fichier temporaire, mais en deux opérations distinctes produisant deux nouveaux fichiers temporaires
