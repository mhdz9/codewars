/*
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples:
  spinWords( "Hey fellow warriors" )
  => returns "Hey wollef sroirraw" spinWords( "This is a test") => returns "This is a test" spinWords( "This is another test" )=> returns "This is rehtona test"
*/

import java.util.ArrayList;
import java.util.Arrays;

public class SpinWords {

  public String spinWords(String sentence) {
    String[] words=sentence.split(" ");
    ArrayList<String> reversed=new ArrayList<String>();
    ArrayList<String> wordList = new ArrayList<String>(Arrays.asList(words));
    String temp="";
    char n;
    
    for(String s:wordList) {
      if(s.length()>=5) {
        for(int i=0;i<s.length();i++) {
          n=s.charAt((s.length()-1)-i);
          temp+=String.valueOf(n);
        }
        reversed.add(temp);
        temp="";
      }
      else {
        reversed.add(s);
      }
    }
    return reversed.toString().replace("[", "").replace("]", "").replace(", ", " ");
  }
}