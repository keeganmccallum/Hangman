all: main

main: 221Hang.o hngDisplay.o wordbank.o groupFunc.o
	gcc 221Hang.o hngDisplay.o groupFunc.o -o main

hngDisplay.o: hngDisplay.h hngDisplay.c
	gcc -c hngDisplay.c

groupFunc.o: groupFunc.c groupFunc.h
	gcc -c groupFunc.c
