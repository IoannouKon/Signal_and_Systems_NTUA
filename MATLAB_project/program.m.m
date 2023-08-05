% AM 03119840
% Κωνσταντίνος Ιωάννου
% 10/2/2021

%Προσοχή να τρέξετε καθε άσκηση (1.1 ,1.2 ,2.1,2.2) Ξεχωριστά!

% Άσκηση 1.1##############################################

% α)Ορίζω τα α ,β για Ρ=2
a2 =[1 0 0];
b2 = [0.55 0 0.45];

% α)Ορίζω τα α ,β για Ρ=5
 a5 = [1 0 0 0 0 0]; 
 b5 = [0.55 0 0 0 0 0.45];

 %β) Διάγραμμα πλάτους και φάσης για Ρ=2
 figure(1)
 freqz(b2,a2)
 
  %β) Διάγραμμα πλάτους και φάσης για Ρ=5
 figure(2) 
 freqz(b5,a5)

% γ) Διάγραμμα πόλων και μηδενικών για Ρ=2
[Z2,P2,~] = tf2zp(b2,a2);
zplane(Z2,P2)
%  γ) Διάγραμμα πόλων και μηδενικών για Ρ=5
[Z5,P5,~] = tf2zp(b5,a5);
zplane(Z5,P5)

% δ)Κρουστική Απόκριση φίλτρου για Ρ=2
figure(3)
impz(b2,a2)

% δ)Κρουστική Απόκριση φίλτρου για Ρ=5
figure(4)
impz(b5,a5)


% ε) Αντήχηση
Z = [Z2 ; Z2; Z2];
P = [P2 ; P2 ; P2];
[b,a] = zp2tf(Z,P,1)

%Διάγραμμα πλάτους και φάσης
figure(5)
freqz(b,a)

%Διάγραμμα πόλων και μηδενικών
[Z,P,K] = tf2zp(b,a);
zplane(Z,P)

%Κρουστική απόκριση φιλτρου
figure(6)
impz(b,a)



% στ)Να υπολογιστούν τα a,b γιά την απαλοιφή της αντίχοισης απο ένα σήμα.

   ast = b;
   bst = a;
   n0 =linspace(0,25,25);
    x = heaviside(n0) - heaviside(n0-5);
    reverb = filter(b,a,x);
   dereverb = filter(bst,ast,reverb);
   figure(78)
   stem(n0,x) 
   title( 'x-signal')
   figure(79)
   stem(n0,reverb)  %plot στον διακριτό  
   title('reverb-x')
   figure(80)
   stem(n0,dereverb)
   title('derverb-x')
   

   




%Άσκηση 1.2########################################################


p = [0.65+0.65i 0.65+0.65i  0.65-0.65i 0.65-0.65i]; 

z = [0.8  0.8  0.8i -0.8i  ]; 

 % α)Διάγραμμα πόλων και μηδενικών
  figure(7)
  zplane(z',p') %z and p must be column
 

  % α)Εύρεση α και β
  [B,A] = zp2tf(z',p,1);
  

 % β) Απόκριση πλάτους και φάσης 
    figure(8)
    freqz(B,A)
    
  % γ)Κρουστική απόκριση συστήματος
  figure(9)
  impz(B,A)
  
 % γ)Βηματική απόκριση συστήματος
   figure(10) 
   stepz(B,A,100) %Mas arkei mexri to 90 gia na fainete kai pio kala 
   
  % δ) Μετακίνηση πόλων.
  p1 = [ 0.7+0.7i 0.7+0.7i 0.7-0.7i 0.7-0.7i ];
  p2 = [ 0.707+0.707i 0.707+0.707i 0.707-0.707i 0.707-0.707i];
  p3 = [  0.75+0.75i 0.75+0.75i 0.75-0.75i 0.75-0.75i];
   
  
  figure(11)
  zplane(z',p1') %z and p must be column
  
  figure(12)
  zplane(z',p2') %z and p must be column
  
  figure(13)
  zplane(z',p3') %z and p must be column
  
  % δ)Εύρεση α και β.
  [b1,a1] = zp2tf(z',p1,1);
  [b2,a2] = zp2tf(z',p2,1);
  [b3,a3] = zp2tf(z',p3,1);
  
  % δ)Απόκριση πλάτους για ρ1
  figure(14)
    freqz(b1,a1) %mono to platos mas noiazei
    
  % δ)Κρουστική απόκριση
  figure(15)
  impz(b1,a1)
  
  figure(16)
  impz(b2,a2)
  
  figure(17)
  impz(b3,a3)
  
  
  % ε)Μετακίνηση πόλων
   p4 = [ 0.4+0.7i 0.4+0.7i 0.4-0.7i 0.4-0.7i];
   
   figure(15)
   zplane(z',p4')
   
   [b4,a4] = zp2tf(z',p4,1);
   
   figure(16)
    freqz(b4,a4)
    
  % στ) Νέα μηδενικά
  
  p = [0.65+0.65i 0.65+0.65i  0.65-0.65i 0.65-0.65i]; 
  
  z1 = [0.77+0.2i  0.77-0.2i   0.2+0.77i  0.2-0.77i];
  z2 = [ 0.4+0.7i 0.4-0.7i 0.7+0.4i 0.7-0.4i];
  
  % στ)Διάγραμμα πόλων και μηδενικών
  figure(17)
   zplane(z1',p')
   
   figure(18)
   zplane(z2',p')
   
   
   % στ) Εύρεση α και β
   
   [b11,a11] = zp2tf(z1',p,1);
   [b12,a12] = zp2tf(z2',p,1);
   
   % στ)Απόκριση φάσης και πλάτους
   figure(19)
    freqz(b11,a11)
    
    figure(20)
    freqz(b12,a12)
    
    
     % Άσκηση 2.1#####################################################
   
     % α) φόρτωσε αρχείο
    
     audio1 = audioread('viola_series.wav');
    
    % α)άκουσε αρχείο 
     fs = 44100; % 41.1 kHz = 41100 Hz Syxnotita sampling
     sound(audio1,fs)
    
  %must have same legnth
        [L,~] = size(1000*audio1);
        Ts= 1./fs;
        Tms=Ts.*1000;
        n0 = (0:L-1).*Tms;
   
     % α) Σχέδιο -plot
     figure(21) 
     plot(n0,audio1)  
     
    
   
    % β) Ενέργεια
  
     % Normalize  [-1,1]
       range1 = max(audio1(:)) - min(audio1(:));
       m1 = (audio1 - min(audio1(:))) / range1;
       audio1 = 2 * m1 - 1;
     
     % enrgy - cov
       n0 = linspace(-1,1,1000);
       w = 0.54 - 0.46*cos(2*pi*n0/1000);
       energy = conv(audio1.*audio1,w,'same');
    
       
       figure(23);
       subplot (2,1,1), plot(audio1), xlabel(' Time(ms) '), ylabel(' Viola series audio ');
       subplot (2,1,2), plot(energy),
       
       
       %must have same legnth
        [L,v] = size(1000*audio1);
        Ts= 1./fs;
        Tms=Ts.*1000;
        n0 = (0:L-1).*Tms;
       
       
       figure(24)
        plot(n0,6*audio1,n0,energy) 
    title ('Energy and signal')
        
     % γ) Διακριτός μετασχήμαματιμος Fourier audio1
         
        figure(25)
        Y =fft(audio1);
        plot(abs(Y))
        xlabel('F(Hz)')
        ylabel( '|FASMA|')
        
        %δ) Απομόνωση νότας 
         figure(26)
         %audio1nota = audio1(2000:4000);
          audio1nota = audio1(2228:6567);
         plot(n0(2228:6567),audio1nota);
         title( ' NOTA')
   
     
    
       % ε) fft της νότας που απομονώσαμε 
         
        %Plot fft - Νότας
         figure(27)
         Ynota=fft(audio1nota);
         plot(abs(Ynota))
         xlabel('F(Hz)')
         ylabel( '|FASMA notas |')
         
         
         
         %Άσκηση 2.2*********************************************
         
     % α) φόρτωσε αρχείο
    
     audio2 = audioread('piano_note.wav');
    
    % α)άκουσε αρχείο 
     fs = 44100; % 41.1 kHz = 41100 Hz Syxnotita sampling
     sound(audio2,fs)
   
     % α) Σχέδιο -plot
     figure(1) 
     plot(audio2)  
     
         
     % β) Φίλτρου ηχόυς για c = 0.6 και P τ.ω καθυστέρηση 0.15 sec
     
     % εύρεση P
     k = 0.15;
     P = fs*k;
     %εύρεση a1,b1
     a1 = [ 1 zeros(1,P)];
     b1 = [0.6 zeros(1,P-1) 0.4];
     
     echoed = filter(b1,a1,audio2);
     echolength = length(echoed);
     echot  = (1:echolength)./fs;
    
     figure(2)
     plot(echot,echoed)
     sound(echoed,fs)
     
 
     
     
   % β) Φίλτρο αντήχησης δημιουργημένο με τρία φιλτρα ηχούς σε σειρά  
    
    echoed = filter(b1,a1,audio2);  %Ένα φίλτρο ηχούς
    echoed2 = filter(b1,a1,echoed); %Δύο φίλτρα ηχούς σε σειρά
    reverbed = filter(b1,a1,echoed2); % Τρία φίλτρα ηχόυς σε σειρά
    
      reverbedlength = length(reverbed);
      revert = (1:reverbedlength)./fs;
      
       figure(3)
      plot(revert,reverbed)
      sound(reverbed,fs)
      
    % Για να τα βάλουμε στο ίδιο plot τα τρια σήματα  κανονικοποιουμε 
     
     n0 = 0:1/fs:(length( echoed ) - 1)/fs;
     figure(7)
     plot( n0,audio2,n0,echoed,n0,reverbed)
     
      
      
    
     % γ) fft για τα τρία σήματα
     
     X = fft(audio2); 
     Y = fft(echoed);
     Z =fft(reverbed);
     
     
     figure(4)
     plot( 20*log10( abs(X)) )
     title('Αρχικό σήμα')
     
      figure(5)
     plot( 20*log10( abs(Y) ) )
     title('Ηχό')
     
     figure(6)
     plot(20*log10( abs(Z) ) )
     title('Αντήχηση')
     
      
     
    % δ) Εύρεση κατάλληλου P 
    
     
     % P = fs*k;
     %εύρεση a1,b1
     fs = 44100;
     P = 3000; %Κάνουμε δοκιμές μειώνοντας σταδιακα το P=6615.
     a1 = [ 1 zeros(1,P)];
     b1 = [0.6 zeros(1,P-1) 0.4];
     
     echoed_extra = filter(b1,a1,audio2);
     echolength_extra = length(echoed);
     echot_extra  = (1:echolength_extra)./fs;
    
     figure(7)
     plot(echot_extra,echoed_extra)
     sound(echoed_extra,fs)
     title('Γιά P=3000')
     
     %ε) Αποθήκευση των φιλτραρισμένων σημάτων σε αρχεία wav
     
     % χρησιμοιποιησα το audiowrite γιατι το wavrite δεν ανταποκρινόταν
     % audiowrite(FILENAME,Y,FS)
     
     audiowrite( 'echoed.wav',echoed,44100);
     audiowrite('reverbed.wav',reverbed,44100);
   
    % στ)Φίλτρο απαλοιφής αντήχησης (dereverbed)
     
      % φίλτρο αντήχησης reverbed = filter(b1,a1,echoed2); Από (β) ερώτημα
       
       s1 = filter(a1,b1,reverbed); % Ουσιαστικά εναλλάξαμε τις θέσεις των a,b 
       s2 = filter(a1,b1,s1); % Και βάλαμε 3 τέτοια φίλτρα στη σειρά
       dereverbed = filter(a1,b1,s2);
       
         s3length = length(dereverbed);
           s3t = (1:s3length)./fs;
      
          figure(333)
         plot(s3t,dereverbed)
         sound(dereverbed,fs)
         
        n0 = 0:1/fs:(length( s1 ) - 1)/fs;
        figure(777)
        plot( n0,audio2,n0,dereverbed)
        title(' audio2 AND dereverved')
      
      
      
      
      
      
      
 
   

      
      
      
     
     
     
     
  

