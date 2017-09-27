import math

def generate_lookup_table(function, IN_BITS=10, OUT_BITS=8, SIGNED=False):
    if SIGNED:
        upper_limit = (2**(OUT_BITS-1))-1
        lower_limit = -(2**(OUT_BITS-1))
    else:
        upper_limit = (2**OUT_BITS)-1
        lower_limit = 0
    print(" "*8 + "case(addr_reg)")    
    for x in range(0, 2**IN_BITS):
        raw_y = function(x)
        bounded_y = int(max(min(upper_limit, raw_y), lower_limit))
        y = bounded_y & (2**(OUT_BITS))-1
        formatted_y = (str(OUT_BITS)+"\'b{:>0" + str(OUT_BITS) + "};").format(bin(y)[2:])
        preamble_x = ("4\'h{:>0" + str(math.ceil(IN_BITS/4.)) + "}: data = ").format(hex(x)[2:])
        print(" "*12 + preamble_x + formatted_y)
    print(" "*8 + "endcase")
def main():
    ## To generate the full lookup table
    # generate_lookup_table(lambda x: 2**7 * math.sin(2.*math.pi*x/(2**10)), IN_BITS=10, OUT_BITS=8, SIGNED=True)
    # Generating Quadrature
    generate_lookup_table(lambda x: 2**7 * math.sin(2.*math.pi*x/(2**10)), IN_BITS=8, OUT_BITS=8, SIGNED=True)
    pass
if __name__ == "__main__":
    main()
