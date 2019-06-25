clear
clc
x1 = 1
y1 = 4
n1 = pi
x2 = 9
y2 = 17
n2 = pi/9
r = 1
c1x = (x1 + r*cos(n1-pi/2));
c1y = (y1 + r*sin(n1-pi/2));
c2x = (x2 + r*cos(n2-pi/2));
c2y = (y2 + r*sin(n2-pi/2));
c2 = [c2x;c2y];

hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + c1x;
yunit = r * sin(th) + c1y;
plot(xunit, yunit,'k');

th = 0:pi/50:2*pi;
xunit1 = r * cos(th) + c2x;
yunit1 = r * sin(th) + c2y;
plot(xunit1, yunit1,'k');


d = sqrt(((c2x-c1x)^2)+(c2y-c1y)^2);

c3x = (c1x+c2x)/2;
c3y = (c1y+c2y)/2;
th = 0:pi/50:2*pi;
xunit2 = d/2 * cos(th) + c3x;
yunit2 = d/2 * sin(th) + c3y;
plot(xunit2,yunit2,'k');

c4x = c1x;
c4y = c1y;
th = 0:pi/50:2*pi;
r4 = r+r;
xunit3 = r4 * cos(th) + c4x;
yunit3 = r4 * sin(th) + c4y;
plot(xunit3,yunit3,'k');


 P1 = [c3x;c3y]
 P2 = [c4x;c4y]
 d2 = sum((P2-P1).^2);
   P0 = (P1+P2)/2+((d/2)^2-r4^2)/d2/2*(P2-P1);
   t = (((d/2)+r4)^2-d2)*(d2-(r4-(d/2))^2);
   if t <= 0
     fprintf('The circles don''t intersect.\n')
   else
     T = sqrt(t)/d2/2*[0 -1;1 0]*(P2-P1);
     pa = P0 + T % Pa and Pb are circles' intersection points
     pb = P0 - T
   end
   

P1 = [c1x;c1y]
P2 = [c3x;c3y] 
   d2 = sum((P2-P1).^2);
   P0 = (P1+P2)/2+(r^2-(d/2)^2)/d2/2*(P2-P1);
   t = ((r+(d/2))^2-d2)*(d2-((d/2)-r)^2);
   if t <= 0
     fprintf('The circles don''t intersect.\n')
   else
     T = sqrt(t)/d2/2*[0 -1;1 0]*(P2-P1);
     pc = P0 + T; % Pa and Pb are circles' intersection points
     pd = P0 - T;
   end
   
P1 = [c2x;c2y]
P2 = [c3x;c3y] 
   d2 = sum((P2-P1).^2);
   P0 = (P1+P2)/2+(r^2-(d/2)^2)/d2/2*(P2-P1);
   t = ((r+(d/2))^2-d2)*(d2-((d/2)-r)^2);
   if t <= 0
     fprintf('The circles don''t intersect.\n')
   else
     T = sqrt(t)/d2/2*[0 -1;1 0]*(P2-P1);
     pe = P0 + T; % Pa and Pb are circles' intersection points
     pf = P0 - T;
   end  
   
plot([pc(1),pe(1)],[pc(2),pe(2)],'m')
plot([c1x c2x],[c1y c2y],'--r');
plot([pb(1) c2x],[pb(2) c2y],'m')
plot([c1x x1],[c1y y1],'--r');
plot([c2x x2],[c2y y2],'--r');
plot([c3x xunit2],[c3y yunit2]);
plot([c4x xunit3],[c4y yunit3]);
