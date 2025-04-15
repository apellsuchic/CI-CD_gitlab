CC=gcc
CFLAGS= -Wall -Werror -Wextra -std=c11 

s21_cat:
	$(CC) $(CFLAGS) s21_cat.h s21_cat.c -o s21_cat

rebuild: clean s21_cat

test: 
	bash test.sh

clean:
	rm -f s21_cat