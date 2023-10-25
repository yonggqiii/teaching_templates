def main():
    ##### Question numbers ####
    first_qn, last_qn = 1, 50
    #### Question options and number of columns ####
    options, num_cols  = [A, B, C, D, E], 3
    # options, num_cols = [T, F],  4

    #### Answer key ####
    # answers = make_answers(B, A, B, A, A, C, B, A, B, C, D, E, A, A, C, E, E, D, E, A, E, E, A, C, E, C, C, D, A, B, B, E)
    
    #### generate table with no solutions ####
    gen_table(first_qn, last_qn, num_cols, options)
   
    #### generate the table with solutions ####
    # gen_table(first_qn, last_qn, num_cols, options, answers)

def make_answers(*ans):
    return dict(zip(range(1, len(ans) + 1), ans))

def gen_table(first_qn_no: int, last_qn_no: int, num_cols: int, options: list[str], answers: dict[int, str] = None):
    num_cols = min(num_cols, last_qn_no + first_qn_no + 1)

    print(TABLE_PREAMBLE)

    print(tabular_preamble(options, num_cols))
    print(HLINE)

    print(header(options, num_cols))
    print(HLINE)

    # print questions
    num_rows = ceil((last_qn_no - first_qn_no + 1) / num_cols)
    for row in range(num_rows):
        first_qn_in_row = first_qn_no + (row * num_cols)
        qns_in_row = range(first_qn_in_row, first_qn_in_row + num_cols)
        print('&'.join(build_question(i, last_qn_no, options, answers) for i in qns_in_row) + LINEBREAK)
        print(HLINE)

    print(END)        

def tabular_preamble(options: list[str], num_cols: int) -> str:
    table_format = '|' + '|'.join('c' * (len(options) + 1) for _ in range(num_cols)) + '|'
    return f'\\begin{{tabular}}{{{table_format}}}'

def header(options: list[str], num_cols) -> str:
    x = ['']
    x.extend(map(lambda x: f'\\textbf{{{x}}}', options))
    x *= num_cols
    return '&'.join(x) + LINEBREAK

def build_question(qn_no: int, last_qn: int, options: list[str], answers: dict[int, str] = None) -> str:
    if qn_no > last_qn:
        return '&' * len(options)
    res = [f'\\textbf{{{qn_no}}}']
    for option in options:
        if answers is None or qn_no not in answers or option != answers[qn_no]:
            bubble = '\\begin{tikzpicture}[baseline=-3.5]\n  \\draw (0,0) circle (0.22cm);\n\\end{tikzpicture}'
        else:
            bubble = '\\begin{tikzpicture}[baseline=-3.5]\n  \\draw[fill=black] (0,0) circle (0.22cm);\n\\end{tikzpicture}'
        res.append(bubble)
    return '&'.join(res)

from math import ceil

TABLE_PREAMBLE = '\\begin{table}[h]\n\\centering\n\\large\n\\bgroup\n\\def\\arraystretch{1.5}'
HLINE = '\\hline'
LINEBREAK = '\\\\'
END = '\\end{tabular}\n\\egroup\n\\end{table}'

for i in 'ABCDE':
    exec(f'{i} = "{i}"')

T = 'True'
F = 'False'
if __name__ == '__main__':
    main()
