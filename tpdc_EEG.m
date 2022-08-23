%Muthuraman TPDC code created 04-03-2016
tic
%%%%%%%%%%%%%%%%%%%%%% EEG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

close all
addpath 'E:\Flexibility\TPDC'
addpath E:\Flexibility\TPDC\arfit
load('dataout.mat');
for k = 1
    close all
a=data_out(:,:);
b1(1,:)=a(1,:);b1(2,:)=a(2,:);b1(3,:)=a(3,:);b1(4,:)=a(4,:);b1(5,:)=a(5,:);
tlock1=b1;
len=200;%Length of the data
C=tlock1';%(1:len,9);
% C(:,2)=mael(1:len,13);
% C(:,3)=mael(1:len,18);
% C(:,4)=mael(1:len,25);
% C(:,5)=mael(1:len,26);
[N, D]= size(C);
X0=C;
rolloff= ceil(N/16);
   parameters.taperwin= ones(N/2, 1);
   parameters.taperwin(1:2*rolloff+1)= (1-cos(pi/(2*rolloff+1)*(0:2*rolloff)))/2;
   parameters.taperwin= [parameters.taperwin; flipud(parameters.taperwin)];
 win = [0    0.0400    0.0800    0.1200    0.1600    0.2000    0.1600    0.1200    0.0800    0.0400         0];
taperwin=parameters.taperwin;
X= [];
for d= 1:D
   X(:, d)= X0(:, d)-mean(X0(:, d));
   %X(:, d)= X(:, d).*taperwin;
   X(:, d)= X(:, d)-mean(X(:, d));
   X(:, d)= X(:, d)/sqrt(var(X(:, d)));
end
results.X= X;
C=[];
C=X;
[a1, a2, a3, sbc, fpe, th, p]=arfit(C, 0, 30, 'fpe');
p=30;
A = DEKF(C',p);
 set(findobj('type','axes'),'fontsize',12,'FontWeight','bold')
for i =1:len
     x1= A(:,:,i);
   
[pdc] =test_muthu(len,D,p,x1);
cPDC12(i,:) = pdc(1,2,:);
cPDC13(i,:) = pdc(1,3,:);
cPDC14(i,:) = pdc(1,4,:);
cPDC15(i,:) = pdc(1,5,:);

cPDC21(i,:) = pdc(2,1,:);
cPDC23(i,:) = pdc(2,3,:);
cPDC24(i,:) = pdc(2,4,:);
cPDC25(i,:) = pdc(2,5,:);

cPDC31(i,:) = pdc(3,1,:);
cPDC32(i,:) = pdc(3,2,:);
cPDC34(i,:) = pdc(3,4,:);
cPDC35(i,:) = pdc(3,5,:);

cPDC41(i,:) = pdc(4,1,:);
cPDC42(i,:) = pdc(4,2,:);
cPDC43(i,:) = pdc(4,3,:);
cPDC45(i,:) = pdc(4,5,:);

cPDC51(i,:) = pdc(5,1,:);
cPDC52(i,:) = pdc(5,2,:);
cPDC53(i,:) = pdc(5,3,:);
cPDC54(i,:) = pdc(5,4,:);

i
x1=[];

end

figure(35)
%len=100000;
time1=200;
 freq1=100;
 set(gcf,'renderer','painters')
 set(gcf,'Visible','off');
 subplot(552);surf(30:1:time1,1:1:freq1,double(cPDC12(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 1<-2', 'FontSize', 14,'FontWeight','bold');
 subplot(553);surf(30:1:time1,1:1:freq1,double(cPDC21(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 2<-1', 'FontSize', 14,'FontWeight','bold');
 subplot(554);surf(30:1:time1,1:1:freq1,double(cPDC14(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 1<-4', 'FontSize', 14,'FontWeight','bold');
 subplot(555);surf(30:1:time1,1:1:freq1,double(cPDC15(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 1<-5', 'FontSize', 14,'FontWeight','bold');
 
 subplot(556);surf(30:1:time1,1:1:freq1,double(cPDC21(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 2<-1', 'FontSize', 14,'FontWeight','bold');
 subplot(558);surf(30:1:time1,1:1:freq1,double(cPDC23(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 2<-3', 'FontSize', 14,'FontWeight','bold');
 subplot(559);surf(30:1:time1,1:1:freq1,double(cPDC24(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 2<-4', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,10);surf(30:1:time1,1:1:freq1,double(cPDC25(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 2<-5', 'FontSize', 14,'FontWeight','bold');

 subplot(5,5,11);surf(30:1:time1,1:1:freq1,double(cPDC31(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 3<-1', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,12);surf(30:1:time1,1:1:freq1,double(cPDC32(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 3<-2', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,14);surf(30:1:time1,1:1:freq1,double(cPDC34(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 3<-4', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,15);surf(30:1:time1,1:1:freq1,double(cPDC35(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 3<-5', 'FontSize', 14,'FontWeight','bold');
 
 subplot(5,5,16);surf(30:1:time1,1:1:freq1,double(cPDC41(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 4<-1', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,17);surf(30:1:time1,1:1:freq1,double(cPDC42(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 4<-2', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,18);surf(30:1:time1,1:1:freq1,double(cPDC43(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 4<-3', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,20);surf(30:1:time1,1:1:freq1,double(cPDC45(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 4<-5', 'FontSize', 14,'FontWeight','bold');
 
 subplot(5,5,21);surf(30:1:time1,1:1:freq1,double(cPDC51(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 5<-1', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,22);surf(30:1:time1,1:1:freq1,double(cPDC52(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 5<-2', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,23);surf(30:1:time1,1:1:freq1,double(cPDC53(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 5<-3', 'FontSize', 14,'FontWeight','bold');
 subplot(5,5,24);surf(30:1:time1,1:1:freq1,double(cPDC54(30:1:time1,1:1:freq1))','EdgeColor','none');view(0,90);axis xy; axis tight;xlabel('Time', 'FontSize', 14,'FontWeight','bold');ylabel('Frequency', 'FontSize', 14,'FontWeight','bold');colormap jet;colorbar;caxis([0,1]);title('PDC 5<-4', 'FontSize', 14,'FontWeight','bold');
 
 
str=strcat('trial', num2str(k));
cd 'E:\Flexibility\TPDC';
name =[str '.jpg'];
print('-dpng', name);
save(['Trial',num2str(k)],'cPDC*');
end
toc

% print('-dpng', name);