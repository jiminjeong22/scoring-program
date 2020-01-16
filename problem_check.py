import sys

score_board = open("/home/ubuntu/workspace/Score_Program/problem_score.csv","a")
excuse_board = open("/home/ubuntu/workspace/Score_Program/problem_excuse.csv","a") 
st = sys.argv[1]

try:
    answer =  open("answer.txt", 'r')
    yours = open("result.txt",'r')
except IOError:
    data = "%s,0," %st
    score_board.write(data)
    score_board.close()
    excuse_data = "%s,Problem01\n" %st
    excuse_board.write(excuse_data)
    excuse_board.write("Excuse: Does not make Problem01 file\n")
    excuse_board.write("---------------------------------------------------------\n")
    answer.close()
    yours.close()
    sys.exit()

answer_line = answer.readlines()
yours_line = yours.readlines()

if answer_line == yours_line :
    data = "%s,10," %st
    score_board.write(data)
else:
    data = "%s,5," %st
    excuse_data = "%s,Problem01\n" %st
    score_board.write(data)
    excuse_board.write(excuse_data)
    excuse_board.write("Answer : \n")
    excuse_board.writelines(answer_line)
    excuse_board.write("\n")
    excuse_board.write("Yours : \n")
    excuse_board.writelines(yours_line)
    excuse_board.write("---------------------------------------------------------\n")
score_board.close()
excuse_board.close()
answer.close()
yours.close()