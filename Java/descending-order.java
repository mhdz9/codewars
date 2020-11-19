/*
Your task is to make a function that can take any non-negative integer as an argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.

Examples:
  Input: 42145 Output: 54421
  Input: 145263 Output: 654321
  Input: 123456789 Output: 987654321
*/

import java.util.Arrays;

public class DescendingOrder {
  public static int sortDesc(final int num) {
    String number=String.valueOf(num);
    String result="";   
    char[] chars=number.toCharArray();
    Arrays.sort(chars);
    String sorted=new String(chars);
    
    for(int i=0;i<sorted.length();i++) {
      char n=sorted.charAt((sorted.length()-1)-i);
      result+=String.valueOf(n);
    }
    
    return Integer.parseInt(result);
  }
}