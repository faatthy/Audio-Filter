[x,fs]=audioread("D:/audio.wav");
N=length(x);
k=0:N-1;
X=fft(x,N);
figure
plot(k,abs(X));
f=(0:N-1)*fs/N;
plot(f,abs(X)/N);
f=(-N/2:N/2-1)*fs/N;

plot(f,abs(fftshift(X))/N);
title("Original audio");
audio_filter=filter(LPF,x);
%sound(audio_filter,fs);
audiowrite('audio_filter.wav',audio_filter,fs);
freqz(LPF);
impz(LPF);
%filtered audio
figure
Audio_filter=fft(audio_filter,N);
plot(f,abs(fftshift(Audio_filter)/N));
title("Filtered audio");
%speed up
%sound (audio_filter,2*fs);
f_speed=(-N/2:N/2-1)*2*fs/N;
figure
plot(f_speed,abs(fftshift(Audio_filter)/N));
title ("Speed up audio");
    

