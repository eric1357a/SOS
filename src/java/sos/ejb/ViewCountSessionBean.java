package sos.ejb;

import java.util.LinkedHashMap;
import javax.ejb.Remote;
import javax.ejb.Stateful;

@Stateful
@Remote(ViewCounter.class)
public class ViewCountSessionBean implements ViewCounter {
  
  private LinkedHashMap<String, Integer> counts = new LinkedHashMap<>();

  public void plusOne(String itemNo) {
    if (counts.get(itemNo) == null)
      counts.put(itemNo, 1);
    else
      counts.put(itemNo, counts.get(itemNo) + 1);
  }

  public int getCount(String itemNo) {
    return counts.get(itemNo);
  }

}
