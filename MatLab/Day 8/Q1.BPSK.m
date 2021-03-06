close all;
clear all;
clf;
 fc1=5;
 fc2=5;
 n=[1  1  0  0  1  0  0  1  1  0] 
l=length(n)
if n(l)==1
   n(l+1)=1
else 
    n(l+1)=0
end
l1=length(n)
tn=0:l1-1
 subplot(5,1,1)
stairs(tn,n,'r');
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Message Signal');
grid on;
 
%Carrier generation
 
t=0:0.01:l
c1=cos(2*pi*fc1*t);
c2=-cos(2*pi*fc2*t);
subplot(5,1,2);
plot(t,c1);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Carrier Signal');
grid on;
subplot(5,1,3);
plot(t,c2,'g');
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Carrier Signal');
grid on;
 
%BPSK Modulated signal generation
 
for i=1:l
    for j=(i-1)*100:i*100
        if(n(i)==1)
            s(j+1)=c1(j+1)
        else
            s(j+1)=c2(j+1);
        end
    end
end
 
subplot(5,1,4);
plot(t,s,'m');
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('BPSK SIGNAL Signal');
grid on;

%BPSK Demodulated signal generation
for i=1:l
    for j=(i-1)*100:i*100
        if(s(j+1)==c1(j+1))
            x(j+1)=1;
        else
            x(j+1)=0;
        end
    end
end
subplot(5,1,5);
plot(t,x,'k');
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Demodulated  Signal');
grid on;