[s,h] = sload('A01T.gdf' , 0 , 'OVERFLOWDETECTION:OFF');
j=0;
k=0;
x1=zeros(1,25);
x1_trail=[];
x1_counter=1;
x1_count=[];
x1_count(1)=1;
x1_c=2;
x2=zeros(1,25);
x2_trail=[];
x2_counter=1;
x2_count=[];
x2_count(1)=1;
x2_c=2;
x3=zeros(1,25);
x3_trail=[];
x3_counter=1;
x3_count=[];
x3_count(1)=1;
x3_c=2;
x4=zeros(1,25);
x4_trail=[];
x4_counter=1;
x4_count=[];
x4_count(1)=1;
x4_c=2;
size(s,1)

for i=1:size(h.EVENT.TYP)
    if(k==288)
        if(h.EVENT.TYP(i) == 769)
            a1=h.EVENT.DUR(i);
            b1=h.EVENT.POS(i);
            x1=[x1;s(b1+1:b1+a1,:)];
            x1_trail(x1_counter:x1_counter+a1)=k;
            x1_counter=x1_counter+a1;
            x1_count(x1_c)=x1_counter-1;
            x1_c=x1_c+1;
        end
        if(h.EVENT.TYP(i) == 770)
            a2=h.EVENT.DUR(i);
            b2=h.EVENT.POS(i);
            x2=[x2;s(b2+1:b2+a2,:)];
            x2_trail(x2_counter:x2_counter+a2)=k;
            x2_counter=x2_counter+a2;
            x2_count(x2_c)=x2_counter-1;
            x2_c=x2_c+1;
        end
        if(h.EVENT.TYP(i) == 771)
            h.EVENT.TYP(i)
            a3=h.EVENT.DUR(i);
            b3=h.EVENT.POS(i);
            x3=[x3;s(b3+1:b3+a3,:)];
            x3_trail(x3_counter:x3_counter+a3)=k;
            x3_counter=x3_counter+a3;
            x3_count(x3_c)=x3_counter-1;
            x3_c=x3_c+1;
        end
        if(h.EVENT.TYP(i) == 772)
            a4=h.EVENT.DUR(i);
            b4=h.EVENT.POS(i);
            x4=[x4;s(b4+1:b4+a4,:)];
            x4_trail(x4_counter:x4_counter+a4)=k;
x4_counter=x4_counter+a4;
x4_count(x4_c)=x4_counter-1;
x4_c=x4_c+1;
end
if(h.EVENT.TYP(i) == 768)
h.EVENT.TYP(i);
k=k+1;
end
end
if(k ~= 288)
if(h.EVENT.TYP(i) == 769)
a1=h.EVENT.DUR(i);
b1=h.EVENT.POS(i);
x1=[x1;s(b1+1:b1+a1,:)];
x1_trail(x1_counter:x1_counter+a1)=k;
x1_counter=x1_counter+a1;
x1_count(x1_c)=x1_counter-1;
x1_c=x1_c+1;
end
if(h.EVENT.TYP(i) == 770)
a2=h.EVENT.DUR(i);
b2=h.EVENT.POS(i);
x2=[x2;s(b2+1:b2+a2,:)];
x2_trail(x2_counter:x2_counter+a2)=k;
x2_counter=x2_counter+a2;
x2_count(x2_c)=x2_counter-1;
x2_c=x2_c+1;
end
if(h.EVENT.TYP(i) == 772)
a4=h.EVENT.DUR(i);
b4=h.EVENT.POS(i);
x4=[x4;s(b4+1:b4+a4,:)];
x4_trail(x4_counter:x4_counter+a4)=k;
x4_counter=x4_counter+a4;
x4_count(x4_c)=x4_counter-1;
x4_c=x4_c+1;
end
if(h.EVENT.TYP(i) == 771)
a3=h.EVENT.DUR(i);
b3=h.EVENT.POS(i);
x3=[x3;s(b3+1:a3+b3,:)];
x3_trail(x3_counter:x3_counter+a3)=k;
x3_counter=x3_counter+a3;
x3_count(x3_c)=x3_counter-1;
x3_c=x3_c+1;
end
if(h.EVENT.TYP(i) == 768)
h.EVENT.TYP(i);
k=k+1;
end
end
end
x_end=0;
l=1;%go till 72
%while(0)
min=313;
%
% for l=1:71
% if((x1_count(l+1)-x1_count(l))<min)
% min=(x1_count(l+1)-x1_count(l));
% end
% if((x2_count(l+1)-x2_count(l))<min)
% min=(x2_count(l+1)-x2_count(l));
% end
% if((x3_count(l+1)-x3_count(l))<min)
% min=(x3_count(l+1)-x3_count(l));
% end
% if((x4_count(l+1)-x4_count(l))<min)
% min=(x4_count(l+1)-x4_count(l));
% end
% end
x1_csp = zeros(1,2);
x2_csp = zeros(1,2);
x3_csp = zeros(1,2);
x4_csp = zeros(1,2);

for l=1:72
YH=zeros(1,25);
YL=zeros(1,25);
YH=[YH;x1(x1_count(l):x1_count(l)+min,:)];
YL=[YL;x2(x2_count(l):x2_count(l)+min,:)];
YH=YH(2:314,:);
YL=YL(2:314,:);
% for l=1:71
% YH=[YH;x1(x1_count(l)+1:x1_count(l)+min,:)];
% YL=[YL;x2(x2_count(l)+1:x2_count(l)+min,:)];
% end
Fs=250;
xfilt = [];
%
% for l=1:25
% x1filt = filter1('bp',x1(:,l),'fc',[8 35],'fs',Fs);
% x1(:,l) = x1filt';
% x2filt = filter1('bp',x2(:,l),'fc',[8 35],'fs',Fs);
% x2(:,l) = x2filt';
% end
% YH=YH/72;
% YL=YL/72;%implement CSP algorithm.
XH=YH(:,:);
XH=XH';
XL=YL(:,:);
XL=XL';
[W] = csp(XH',XL');
XH=(W'*XH)';
XL=(W'*XL)';
lda_class = ones(626,1);
lda_class(313:626) = 2;
lda_data = [XH;XL];
test_lda = LDA(lda_data, lda_class);
XH = XH*test_lda(:,2:5)';
XL = XL*test_lda(:,2:5)';
x1_csp = [x1_csp;XH];
x2_csp = [x2_csp;XL];
end
for l=1:72
YH=zeros(1,25);
YL=zeros(1,25);
YH=[YH;x3(x3_count(l):x3_count(l)+min,:)];
YL=[YL;x4(x4_count(l):x4_count(l)+min,:)];
YH=YH(2:314,:);
YL=YL(2:314,:);
% for l=1:71
% YH=[YH;x1(x1_count(l)+1:x1_count(l)+min,:)];
% YL=[YL;x2(x2_count(l)+1:x2_count(l)+min,:)];
% end
Fs=250;
xfilt = [];
%
% for l=1:25
% x1filt = filter1('bp',x1(:,l),'fc',[8 35],'fs',Fs);
% x1(:,l) = x1filt';
% x2filt = filter1('bp',x2(:,l),'fc',[8 35],'fs',Fs);
% x2(:,l) = x2filt';
% end
% YH=YH/72;
% YL=YL/72;%implement CSP algorithm.
XH=YH(:,:);
XH=XH';
XL=YL(:,:);
XL=XL';
[W] = csp(XH',XL');
XH=(W'*XH)';
XL=(W'*XL)';
lda_class = ones(626,1);
lda_class(313:626) = 2;
lda_data = [XH;XL];
test_lda = LDA(lda_data, lda_class);
XH = XH*test_lda(:,2:5)';
XL = XL*test_lda(:,2:5)';
x3_csp = [x3_csp;XH];
x4_csp = [x4_csp;XL];
end
