/*
Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.

This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!

All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.

What is considered Valid?
A string of braces is considered valid if all braces are matched with the correct brace.

Examples
	"(){}[]"   =>  True
	"([{}])"   =>  True
	"(}"       =>  False
	"[(])"     =>  False
	"[({})](]" =>  False
*/
import java.util.Stack;

public class BraceChecker {

  public boolean isValid(String braces) {
    if(braces.charAt(0)==')' || braces.charAt(0)=='}' || braces.charAt(0)==']') {
      return false;
    }
    
    Stack<Character> stack=new Stack<Character>();
    
    char c;
    for(int i=0;i<braces.length();i++) {
      c=braces.charAt(i);
      
      if(c=='(') {
        stack.push(c);
      }
      else if(c=='{') {
        stack.push(c);
      }
      else if(c=='[') {
        stack.push(c);
      }
      else if(c==')') {
        if(stack.isEmpty()) {
          return false;
        }
        else if(stack.peek()=='(') {
          stack.pop();
        }
        else {
          return false;
        }
      }
      else if(c=='}') {
        if(stack.isEmpty()) {
          return false;
        }
        else if(stack.peek()=='{') {
          stack.pop();
        }
        else {
          return false;
        }
      }
      else if(c==']') {
        if(stack.isEmpty()) {
          return false;
        }
        else if(stack.peek()=='[') {
          stack.pop();
        }
        else {
          return false;
        }
      }
    }
    return stack.empty();
  }
}