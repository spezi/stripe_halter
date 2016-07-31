//resize([70,20])circle(d=20, false);
 //scale([0,0,5])circle(d=20, false);
 
 
 mdicke = 3;
 
 module grundplatte() {
     linear_extrude(height = mdicke, center = false, convexity = 10)
        resize([72,40])
        circle(d=20, false);
     
     translate([0,0,mdicke])
        color( "Blue", 1 )
        linear_extrude(height = 2, center = false, convexity = 10)  
        square([50,10],true);
 }
 

 
 module schlitz() {
    
 translate([28,0,0])
    cube([2,11,20],true);
 
 translate([28,-10,0])
    cube([2,11,20],true);
 }
 
 
 
 module zackenone(){
 
  for (y = [22,28,34,40] )
     {
 
         translate([2.5,y,0])
            linear_extrude(height = mdicke, center = false, convexity = 10)
            circle(5, $fn=1);
         
         mirror([1,0,0]) 
         translate([2.5,y,0])
            linear_extrude(height = mdicke, center = false, convexity = 10)
            circle(5, $fn=1);
     }
 }
 

 
 module laengszacken() {
  mirror([1,1,0]) 
    translate([0,14,0])
    zackenone();
 }
 
 
module alles() {
zackenone();
 
 mirror([0,1,0]) 
    zackenone();
 
  difference() {
    grundplatte();
    schlitz(); 
      mirror([1,0,0]) 
      translate([0,10,0])
      schlitz(); 
 }
 
 
 laengszacken();
 mirror([1,0,0]) 
    laengszacken();
 }
 
 projection(cut = false)
 alles();