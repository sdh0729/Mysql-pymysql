def solution(strings, n):
    answer = []
    for i in strings:
        for j in range (n):
            answer.append(strings[i],[j])
    return answer
strings = ["sun","bed","car"]
n=1
solution(strings,n)