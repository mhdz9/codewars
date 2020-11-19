/*
The objective is to write a method that takes two integer parameters and returns a single integer equal to the number of 1s in the binary representation of the greatest common divisor of the parameters.
Taken from Wikipedia: 
  "In mathematics, the greatest common divisor (gcd) of two or more integers, when at least one of them is not zero, is the largest positive integer that divides the numbers without a remainder. For example, the GCD of 8 and 12 is 4."

For example: the greatest common divisor of 300 and 45 is 15. The binary representation of 15 is 1111, so the correct output would be 4.
If both parameters are 0, the method should return 0. The function must be able to handle negative input.
*/
import java.math.BigInteger;

public class BinaryGCD {
  public static int gcdBinary(int x, int y) {
    int n = BigInteger.valueOf(x).gcd(BigInteger.valueOf(y)).intValue();
    String bin = Integer.toBinaryString(n);
    String[] binSplit = bin.split("");
    int result = 0;
    
    for(String s:binSplit) {
      result += Integer.parseInt(s);
    }
    
    return result;
  }
}