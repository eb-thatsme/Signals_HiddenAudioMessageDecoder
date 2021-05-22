%%%%%%%%%
% CAS 2
%%%%%%%%%
%%
% Clear workspace
close all;
clear all;
clc;
% Load in audio message - Uncomment to switch messages
load('message_1.mat');
%load('message_2.mat');
% List of variables
window = 50e-3;
toneLength = size(tone, 2);
samplesPerWindow = fs * window;
windowVal = 0;
totalSamples = toneLength/samplesPerWindow;
testingFrequencies = [400, 450, 500, 550, 600, 650, 700, 750];
% Below are the indexes in the f vector at which the testingFrequencies always occur
indexOfFreqs = [550503, 553771, 557065, 560000, 563617, 567020, 570208, 573549];
% Iniatialize A and f values for the first window
[A,f] = myFFT(tone(1: samplesPerWindow),fs);
plot(fs, abs(A))
title("Magnitude vs Frequency")
xlabel("Frequency"); ylabel("Magnitude");
xticks([400, 450, 500, 550, 600, 650, 700, 750]);
xlim([350 800]);
% Iniatialize placeholder arrays to store the final 8-bit number and message
finalNum = zeros(1,8);
finalMessage = zeros(totalSamples, 8);
% Insert for loop to increment to next window and fill finalNum/message arrays
for(m=1:totalSamples)
   
    %Determine if the A value at a testingFrequency is a "peak". If yes, assign binary 1
    for n=1:8
       if(A(indexOfFreqs(n)) > 0.015)
           finalNum(n) = 1;
       else
           finalNum(n) = 0;
       end
    end
   
    %Insert this window's 8-bit number into the final message array
    finalMessage(m, 1:8) = finalNum;
   
    %Increment window value
    windowVal = windowVal + samplesPerWindow;
   
    %Get A and f values for next window if next window exists
    if(windowVal < toneLength)
        [A,f] = myFFT(tone(windowVal: windowVal+samplesPerWindow),fs);
    end
end
%Show the final message in binary form (uncomment to output to command line)
%final = finalMessage
% Convert final binary message to string, without extra spaces ('%d')
% Transpose message array before conversion
binaryString = sprintf('%d', finalMessage');
% Show the final message in decimal form (uncomment to output to command line)
%bin2deci = bin2dec(reshape(binaryString,8,[]).')
% Convert binary string to ascii characters and output to command line
% Reshape binary string into 8 bit segments
decodedMessage = char(bin2dec(reshape(binaryString,8,[]).')).'
