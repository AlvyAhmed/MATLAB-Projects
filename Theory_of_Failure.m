% get data
sa = input('Axial stress (N/mm^2) = ');
sb = input('Bending stress (N/mm^2) = ');
ss = input('Shear stress (N/mm^2) = ');
sy = input('Yeild stress (N/mm^2) = ');
g = input('poisson ratio = ');

% combined stress

sn = sa+sb;

%calculation of principle stress

s1=(sn/2)+sqrt(((sn/2)^2)+(ss^2));
s2=(sn/2)-sqrt(((sn/2)^2)+(ss^2));

% theories of failure

n=sy/max(s1,s2);

if n>1
    disp('Max principle stress theory: SAFE')
else
    disp('Max principle stress theory: NOT SAFE')
end


