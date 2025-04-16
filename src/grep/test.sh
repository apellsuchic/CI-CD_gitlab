#!/bin/bash

GREEN='\e[32m' # Кодировка зелёного цвета для текста
NC='\e[0m'      # Сброс текста до настроек по умолчанию
RED='\e[31m'    # Кодировка красного цвета для текста
EXE=s21_grep.c
EXE2=s21_grep.h

printf "${GREEN}-----RUNNING TESTS-----${NC}\n"

# TEST 1
FILE=tampletes/*.txt
grep  ch $FILE >a
gcc $EXE $EXE2 && ./a.out ch $FILE >b
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
FILE=tampletes/*.txt
FLAGS=-e
grep $FLAGS lo $FLAGS H $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS lo $FLAGS H $FILE >b
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
FILE=tampletes/*.txt
FLAGS=-i
grep $FLAGS lO $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS lO $FILE >b
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
FLAGS=-v
grep $FLAGS ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 5
FILE=tampletes/*.txt
FLAGS=-c
grep $FLAGS ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 6
FILE=tampletes/*.txt
FLAGS=-l
grep $FLAGS  ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
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
FILE=tampletes/*.txt
FLAGS=-n
grep $FLAGS ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
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
FILE=tampletes/hard_test.txt
grep  ch $FILE >a
gcc $EXE $EXE2 && ./a.out ch $FILE >b
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
grep $FLAGS lo $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS lo $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 10
FILE=tampletes/test.txt
FLAGS=-i
grep $FLAGS lO $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS lO $FILE >b
result=$(diff a b)

if [ $? -eq 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 11
FILE=tampletes/test.txt
FLAGS=-v
grep $FLAGS lo $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS lo $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 12
FILE=tampletes/hard_test.txt
FLAGS=-c
grep $FLAGS ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
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
FLAGS=-l
grep $FLAGS  ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
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
FLAGS=-n
grep $FLAGS ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 15
FILE=tampletes/hard_test.txt
FLAGS=-h
grep $FLAGS  ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 16
FILE=tampletes/*.txt
FLAGS=-h
grep $FLAGS  ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 17
FILE=tampletes/hard_testr.txt
FLAGS=-s
grep $FLAGS  ch $FILE >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	((failed++))
fi

((i++))

# TEST 18
FILE=tampletes/hard_testr.txt
FILE2=tamplates/*.txt
FLAGS=-s
grep $FLAGS  ch $FILE $FILE2 >a
gcc $EXE $EXE2 && ./a.out $FLAGS ch $FILE $FILE2 >b
result=$(diff a b)

if [ $? == 0 ]; then
	printf " TEST #$i ${GREEN}PASSED${NC}\n"
	((failed++))
else
	printf " TEST #$i ${RED}FAILED${NC}\n"
	printf "$result"
	#((failed++))
fi
if [[ $i -lt 18 ]]; then
	exit 2
fi

printf " ${GREEN}-----DONE[$((i - failed))/$((i))]-----${NC}\n"

rm -f a.out a b s21_grep.h.gch