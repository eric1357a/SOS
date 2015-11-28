package sos.ejb;

public interface ViewCounter {

  void plusOne(String itemNo);

  int getCount(String itemNo);
  
}
