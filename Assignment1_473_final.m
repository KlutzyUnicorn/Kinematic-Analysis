clc; clear all; close all;
[R1,R2,R3,R4,R5,R6,R7,R8,theta1,theta2] = deal(0.5,1.8,2.4,1.4,1.4,0.5,1.6,0.4,0,100*pi/180);

%% Newton-Raphson method
% x = [5*pi/180;200*pi/180]; %if initial guess theta3=5, theta4=200
x = [135*pi/180;80*pi/180;120*pi/180;180*pi/180]; %if initial guess theta3=10, theta4=100

fprintf('Initial Guess is: \n theta3=%.4f°, theta4=%.4f°, theta5=%.4f°, theta6=%.4f°\n\n', ...
        x(1)*180/pi, x(2)*180/pi, x(3)*180/pi, x(4)*180/pi)
   

theta3 = x(1); theta4 = x(2); theta5=x(3); theta6=x(4);
i = 1;
j=1;
while(true)
    f = [-R1*cos(theta2)+R2*cos(theta4)+R3*cos(theta6)-R4*cos(theta5)+R5*cos(theta1);
        -R1*sin(theta2)+R2*sin(theta4)+R3*sin(theta6)-R4*sin(theta5)+R5*sin(theta1);
        R6*cos(theta2)+R7*cos(theta3)+R8*cos(theta6)-R4*cos(theta5)+R5*cos(theta1);
        R6*sin(theta2)+R7*sin(theta3)+R8*sin(theta6)-R4*sin(theta5)+R5*sin(theta1)];
    J = [0 -R2*sin(theta4) R4*sin(theta5) -R3*sin(theta6);
        0 R2*cos(theta4) -R4*cos(theta5) R3*cos(theta6);
        -R7*sin(theta3) 0 R4*sin(theta5) -R8*sin(theta6);
        R7*cos(theta3) 0 -R4*cos(theta5) R8*cos(theta6)];
    x = x - inv(J)*f;
    
    fprintf('Iteration number: %d \n \n',i);
    fprintf('Newton-Raphson Guess: \n theta3=%.4f°, theta4=%.4f°, theta5=%.4f°, theta6=%.4f°\n\n', ...
        x(1)*180/pi, x(2)*180/pi, x(3)*180/pi, x(4)*180/pi);

    if (abs(theta3*180/pi - x(1)*180/pi)<0.01 && ...
    abs(theta4*180/pi - x(2)*180/pi)<0.01 && ...
    abs(theta5*180/pi - x(3)*180/pi)<0.01 && ...
    abs(theta6*180/pi - x(4)*180/pi)<0.01)
        break;
    end;
    theta3 = x(1); theta4 = x(2); theta5 = x(3); theta6 = x(4);

    i=i+1;
end;