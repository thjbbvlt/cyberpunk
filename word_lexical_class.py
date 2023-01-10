import nltk
import sys # pour pouvoir utiliser un argument lors de l'appel de la commande
from nltk.tokenize import word_tokenize
text = word_tokenize(sys.argv[1]) # l'argument lors de l'appel de la commande
num = sys.argv[2]
# pour le test:
# text = word_tokenize("Do androids dream of electric sheep?")
# attention aux majuscules! car les majuscules dans le titre va être considéré comme un nom propre!

# print(nltk.pos_tag(text))
print(nltk.pos_tag(text),sys.argv[2])
# et normalement ça renvoie la phrase avec chaque mot tagged.
