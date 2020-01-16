all: Problem01
	g++ -L. problem01.o -o Problem01
	rm -f result.log
	rm -f answer.log
	./Problem01 > result.txt
	
	
Problem01: problem01.o 
	./output > answer.txt
	g++ -L. problem01.o -o Problem01

clean:
	rm *.o -f
	rm Problem01 -f
	rm answer.txt -f
	rm result.txt -f