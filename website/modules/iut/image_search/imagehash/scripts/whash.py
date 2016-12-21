from PIL import Image
import imagehash
import sys, os

userpath = sys.argv[1]
len_hash = int(sys.argv[2]) if len(sys.argv) > 2 else 8 
print(imagehash.whash(Image.open(userpath), len_hash))