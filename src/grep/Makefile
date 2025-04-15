CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

s21_grep:
	$(CC) $(CFLAGS) s21_grep.c s21_grep.h -o s21_grep

rebuild: clean s21_grep

test:
	bash test.sh

clean:
	rm -f s21_grep