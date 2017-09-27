//Listing 3.21
//Author: Pong P. Chu
//Chapter 3
//Page 76
//Copyright 2008

// non-negative exponents only, normalized, minimum magnitude is 0.1
// input numbers must be normalized prior to addition!

module fp_adder 
    (
     input wire sign1, sign2,
     input wire [3:0] exp1, exp2,
     input wire [7:0] frac1, frac2,
     output reg sign_out,
     output reg [3:0] exp_out,
     output reg [7:0] frac_out
    );
    
    // signal declaration
    // suffix   b,  s,     a,       n for
    //          big small  aligned  normalized number, respectively
    
    reg signb, signs;
    reg [3:0] expb, exps, expn, exp_diff;
    reg [7:0] fracb, fracs, fraca, fracn, sum_norm;
    reg [8:0] sum;
    reg [2:0] lead0;
    
    always @*
    begin
        // 1st stage: sort to find the larger number
        // input numbers must be normalized prior to addition!
        if ({exp1, frac1} > {exp2, frac2})
            begin
                signb = sign1;
                signs = sign2;
                expb = exp1;
                exps = exp2;
                fracb = frac1;
                fracs = frac2;
            end
        else
            begin
                signb = sign2;
                signs = sign1;
                expb = exp2;
                exps = exp1;
                fracb = frac2;
                fracs = frac1;
            end
            
        // 2nd stage: align small number
        exp_diff = expb - exps;
        fraca = fracs >> exp_diff;
        
        // 3rd stage: align smaller number
        if (signb==signs)
            sum = {1'b0, fracb} + {1'b0, fraca};
        else
            sum = {1'b0, fracb} - {1'b0, fraca};
            
        // 4th stage: normalize
        // count leading 0's in the binary representation
        if (sum[7])
            lead0 = 3'o0;
        else if (sum[6])
            lead0 = 3'o1;
        else if (sum[5])
            lead0 = 3'o2;
        else if (sum[4])
            lead0 = 3'o3;
        else if (sum[3])
            lead0 = 3'o4;
        else if (sum[2])
            lead0 = 3'o5;
        else if (sum[1])
            lead0 = 3'o6;
        else
            lead0 = 3'o7;
            
        // shift significand according to leading 0
        sum_norm = sum << lead0;
        
        // normalized with special conditions
        if (sum[8]) // with carry out; shift frac to right
            begin
                expn = expb + 1;
                fracn = sum[8:1];
            end
        else if (lead0 > expb)
            begin
                expn = 0;
                fracn = 0;
            end
        else
            begin
                expn = expb - lead0;
                fracn = sum_norm;
            end
    
        sign_out = signb;
        exp_out = expn;
        frac_out = fracn;
    end
    
endmodule  // fp_adder
