%homework scores
hw1(nameA, 65).
hw1(nameB, 73).
hw1(nameC, 91).

hw2(nameA, 77).
hw2(nameB, 89).
hw2(nameC, 93).

hw3(nameA, 72).
hw3(nameB, 71).
hw3(nameC, 89).

%midterm scores
midterm(nameA, 70).
midterm(nameB, 86).
midterm(nameC, 88).

%final scores
final(nameA, 80).
final(nameB, 89).
final(nameC, 87).

%project scores
project(nameA, 70).
project(nameB, 82).
project(nameC, 97).

%aggregate grade predicates/functions
net_hw(Name,Result):-
    hw1(Name, R1),
    hw2(Name, R2),
    hw3(Name, R3),
    Result is R1+R2+R3.

avg_hw(Name, Result):-
    net_hw(Name,R1),
    Result is R1/3.

avg_exam(Name, Result):-
    midterm(Name, R1),
    final(Name, R2),
    Result is R1/2+R2/2.

%get final grade by weighting sub scores
final_point_grade(Name,Result):-
    avg_hw(Name, R1),
    avg_exam(Name, R2),
    project(Name, R3),
    Result is R1/5+R2*2/5+R3*2/5.

%convert point to letter
letter_grade(Score):-
    Score >= 90, write('A').

letter_grade(Score):-
    Score >= 80, write('B').

letter_grade(Score):-
    Score >=70, write('C').

letter_grade(Score):-
    Score >=60, write('D').

letter_grade(Score):-
    Score >=0, write('F').

final_letter_grade(Name):-
    final_point_grade(Name, R1),
    letter_grade(R1).

%query student by letter grade
student_from_grade(Grade):-
    (Grade = a),
    final_point_grade(nameA,R1),
    R1>=90, write('nameA').

student_from_grade(Grade):-
    (Grade = b),
    final_point_grade(nameA,R1),
    R1>=80, write('nameA').

student_from_grade(Grade):-
    (Grade = c),
    final_point_grade(nameA,R1),
    R1>=70, write('nameA').

student_from_grade(Grade):-
    (Grade = a),
    final_point_grade(nameB,R1),
    R1>=90, write('nameB').

student_from_grade(Grade):-
    (Grade = b),
    final_point_grade(nameB,R1),
    R1>=80, write('nameB').

student_from_grade(Grade):-
    (Grade = c),
    final_point_grade(nameB,R1),
    R1>=70, write('nameB').

student_from_grade(Grade):-
    (Grade = a),
    final_point_grade(nameC,R1),
    R1>=90, write('nameC').

student_from_grade(Grade):-
    (Grade = b),
    final_point_grade(nameC,R1),
    R1>=80, write('nameC').

student_from_grade(Grade):-
    (Grade = c),
    final_point_grade(nameC,R1),
    R1>=70, write('nameC').





