```prolog
?- tree_analyse("hon målade en tavla med en pensel.", T).
         |                                   
         s                                   
         |                                   
  +--------------+                           
  |              |                           
  |             vp                           
  |              |                           
  |       +-------------+                    
  |       |             |                    
  |       |            np                    
  |       |             |                    
  |       |     +-----+---------+            
  |       |     |     |         |            
  |       |     |     |        pp            
  |       |     |     |         |            
  |       |     |     |     +--------+       
  |       |     |     |     |        |       
  |       |     |     |     |       np       
 np       |     |     |     |        |       
  |       |     |     |     |     +------+   
  |       |     |     |     |     |      |   
 pron     v    det    n    prep  det     n   
  |       |     |     |     |     |      |   
  |       |     |     |     |     |      |   
 hon   målade  en   tavla  med   en   pensel

T = s(np(pron(hon)), vp(v(målade), np(det(en), n(tavla), pp(prep(med), np(det(en), n(pensel)))))) ;
           |                                 
           s                                 
           |                                 
  +------------------+                       
  |                  |                       
  |                 vp                       
  |                  |                       
  |       +--------+------------+            
  |       |        |            |            
  |       |       np           pp            
  |       |        |            |            
  |       |        |        +--------+       
  |       |        |        |        |       
  |       |        |        |       np       
 np       |        |        |        |       
  |       |     +-----+     |     +------+   
  |       |     |     |     |     |      |   
 pron     v    det    n    prep  det     n   
  |       |     |     |     |     |      |   
  |       |     |     |     |     |      |   
 hon   målade  en   tavla  med   en   pensel

T = s(np(pron(hon)), vp(v(målade), np(det(en), n(tavla)), pp(prep(med), np(det(en), n(pensel))))) ;
false.
```
The difference between the two tree's is how the first VP clause is transformed. In one tree it becomes VP -> V NP and in the other it becomes VP -> V NP PP
