#!/bin/bash

GREEN='\e[32m' # Кодировка зелёного цвета для текста
NC='\e[0m'      # Сброс текста до настроек по умолчанию
RED='\e[31m'    # Кодировка красного цвета для текста
EXE=s21_cat.c
EXE2=s21_cat.h

printf "${GREEN}-----RUNNING TESTS-----${NC}\n"
# TEST 1
FILE=tampletes/test.txt
cat $FILE >a
gcc $EXE $EXE2 && ./a.out $FILE >b
result=$(diff a b)
failed=0
i=1

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))


# TEST 2
FILE=tampletes/test.txt
FLAGS=-b
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))
# TEST 3
FILE=tampletes/test.txt
FLAGS=--number-nonblank
cat -b $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))
# TEST 4
FILE=tampletes/test.txt
FLAGS=--number
cat -n $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))
# TEST 5
FILE=tampletes/test.txt
FLAGS=--squeeze-blank
cat -s $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 6
FILE=tampletes/test.txt
FILE2=tampletes/test2.txt
FLAGS=-s
cat $FLAGS $FILE2 $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE2 $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 7
FILE=tampletes/test3.txt
FLAGS=-s
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 8
FILE=tampletes/test.txt
FLAGS=-t
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 9
FILE=tampletes/test.txt
FLAGS=-e
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 10
FILE=tampletes/hard_test.txt
cat $FILE >a
gcc $EXE $EXE2 && ./a.out $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 11
FILE=tampletes/hard_test.txt
FLAGS=-b
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf " $result "
	((failed++))
fi

((i++))

# TEST 12
FILE=tampletes/hard_test.txt
FLAGS=-n
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 13
FILE=tampletes/hard_test.txt
FLAGS=-s
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 14
FILE=tampletes/hard_test.txt
FLAGS=-v
cat $FLAGS $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

if [[ $i -lt 14 ]]; then
	exit 1
fi

printf " ${GREEN}-----DONE[$((i - failed))/$((i))]-----${NC}\n"

rm -f a.out a b s21_cat.h.gch