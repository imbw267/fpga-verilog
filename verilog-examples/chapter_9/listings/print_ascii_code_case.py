def print_ascii_code_case(begin,end):
    index_start = ord(begin)
    index_end = ord(end)
    for i in range(index_start, index_end+1):
        hex_str = hex(i)[-2:]
        print("8'h00: ascii_code = 8'h{}    // {}".format(hex_str, chr(i)))
        
#print_ascii_code_case('0', '9')
#print_ascii_code_case('A', 'Z')
#print_ascii_code_case('a', 'z')
