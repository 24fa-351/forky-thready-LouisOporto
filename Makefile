all: compile link

compile:
	gcc *.c -c  

link:
	gcc *.o -o forky.exe

debug:
	gcc -g *.c -o debug.exe

test:
	bash results.sh
