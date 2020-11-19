/*
Given an array of integers, find the one that appears an odd number of times.
There will always be only one integer that appears an odd number of times.
*/
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FindOdd {
  public static int findIt(int[] A) {
    List asList=new ArrayList<>();
    int oddNumber=0;
    
    for(Integer i:A) {
      asList.add(i);
    }
    
    for(int i=0;i<asList.size();i++) {
      int freq=Collections.frequency(asList, asList.get(i));
      if(freq%2==1) {
        oddNumber=(int) asList.get(i);
      }
    }
    return oddNumber; 
  }
}