#!/bin/bash

function process_student {
	IFS='!'; temp=($1); unset IFS;
	IFS='/'; url=($1); unset IFS;
	IFS='.'; folder=(${temp[4]}); unset IFS;
	
	echo "###########################${temp[0]}#################"
	cp ./Makefile_p1 ./${temp[0]}/${url[4]}/Problem01/Makefile -f
	cp ./problem1_check.py ./${temp[0]}/${url[4]}/Problem01/problem1_check.py -f
	cp ./Makefile_p2 ./${temp[0]}/${url[4]}/Problem02/Makefile -f
	cp ./problem2_check.py ./${temp[0]}/${url[4]}/Problem02/problem2_check.py -f
	cp ./Makefile_p3 ./${temp[0]}/${url[4]}/Problem03/Makefile -f
	cp ./problem3_check.py ./${temp[0]}/${url[4]}/Problem03/problem3_check.py -f
	cp ./Makefile_p4 ./${temp[0]}/${url[4]}/Problem04/Makefile -f
	cp ./problem4_check.py ./${temp[0]}/${url[4]}/Problem04/problem4_check.py -f
	cd ./${temp[0]}
	cd ./${url[4]}
    
    #p1
    cd Problem01
	rm -f Problem01
	make clean
	make
	echo "Checking Problem01..."
	python3 problem1_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p2
	cd Problem02
	rm -f Problem02
	make clean
	make
	echo "Checking Problem02..."
	python3 problem2_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p3
	cd Problem03
	rm -f Problem03
	make clean
	make
	echo "Checking Problem03..."
	python3 problem3_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p4
	cd Problem04
	rm -f Problem04
	make clean
	make
	echo "Checking Problem04..."
	python3 problem4_check.py ${temp[0]}
	echo "done."
	cd ..
	
	cd ~/workspace/Score_Program_2018_fw
}

while IFS='' read -ra line || [[ -n "$line" ]]; do
	echo "Text read from file: $line"
    process_student "$line"
done < "$1"