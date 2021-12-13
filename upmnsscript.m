close all



%Define the Dirac mass matrix

%And the Majorana mass matrix


%Applying seesaw mechanism

 

%working in GeV
%We define the majorana masses (fixed)
M11=1e+11; %100GeV 100000000000
M23=1e+11;
M_R=[M11 0 0 ; 0 M23 0 ; 0 0 M23];
 
 tic
 %The we randomly assign values to h's of dirac mass elements
     for n=1:10000
    he1=rand;
    he2=rand;
    he3=rand;
    hu1=rand;
    hu2=rand;
    hu3=rand;
    m_e1=5*he1;
    m_e2=5*he2;
    m_e3=5*he3;
    m_u1=5*hu1;
    m_u2=5*hu2;
    m_u3=5*hu3;
    
    M_D=[m_e1 m_e2 m_e3 ; m_u1 m_u2 m_u3 ; 0 0 0];
    mv=M_D*inv(M_R)*M_D';
   
    
    a=1.45e-9;
    s_emu=0.01;%rand/10;
    O1=rand;
    O2=rand;
    r1=a*O1;
    r2=a*O2;
    Rl=round([1 s_emu r1 ; -s_emu 1 r2 ; -r1+s_emu*r2 -r2-r1*s_emu 1],1);
 
    [V,D]=eig(round(vpa(mv),1));
    
    Upmns=round(vpa(Rl*V),1);
    
    if (abs(Upmns(1,1))<(1) && (abs(Upmns(1,1))>(0)))
        
        if (abs(Upmns(1,2))<(1) && (abs(Upmns(1,2))>(0)))
            
            if (abs(Upmns(1,3))<(1) && (abs(Upmns(1))>(0)))
                
                if (abs(Upmns(2,1))<(1) && (abs(Upmns(2,1))>(0)))
                    
                    if (abs(Upmns(2,2))<(1) && (abs(Upmns(2,2))>(0)))
                        
                        if (abs(Upmns(2,3))<(1) && (abs(Upmns(2,3))>(0)))
                            
                            if (abs(Upmns(3,1))<(1) && (abs(Upmns(3,1))>(0)))
                                
                                if (abs(Upmns(3,2))<(1) && (abs(Upmns(3,2))>(0)))
                                    
                                    if (abs(Upmns(3,3))<(1) && (abs(Upmns(3,3))>(0)))
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    

 end
    
 
n
Upmns
he1
he2
he3
hu1
hu2
hu3
s_emu
O1
O2
 
toc
