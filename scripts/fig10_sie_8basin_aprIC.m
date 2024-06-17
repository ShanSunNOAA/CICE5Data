wd2=1;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/basin8_cfsr_sie_ic_201304.txt; cfsr(1,:,:)=basin8_cfsr_sie_ic_201304;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/basin8_cfsr_sie_ic_201404.txt; cfsr(2,:,:)=basin8_cfsr_sie_ic_201404;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/basin8_cfsr_sie_ic_201504.txt; cfsr(3,:,:)=basin8_cfsr_sie_ic_201504;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/basin8_cfsr_sie_ic_201604.txt; cfsr(4,:,:)=basin8_cfsr_sie_ic_201604;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/basin8_cfsr_sie_ic_201704.txt; cfsr(5,:,:)=basin8_cfsr_sie_ic_201704;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/basin8_cryo_sie_ic_201304.txt; cryo(1,:,:)=basin8_cryo_sie_ic_201304;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/basin8_cryo_sie_ic_201404.txt; cryo(2,:,:)=basin8_cryo_sie_ic_201404;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/basin8_cryo_sie_ic_201504.txt; cryo(3,:,:)=basin8_cryo_sie_ic_201504;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/basin8_cryo_sie_ic_201604.txt; cryo(4,:,:)=basin8_cryo_sie_ic_201604;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/basin8_cryo_sie_ic_201704.txt; cryo(5,:,:)=basin8_cryo_sie_ic_201704;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/obs/basin8_sie_obs_2013.txt; amsr(1,:,:)=basin8_sie_obs_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/obs/basin8_sie_obs_2014.txt; amsr(2,:,:)=basin8_sie_obs_2014;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/obs/basin8_sie_obs_2015.txt; amsr(3,:,:)=basin8_sie_obs_2015;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/obs/basin8_sie_obs_2016.txt; amsr(4,:,:)=basin8_sie_obs_2016;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/obs/basin8_sie_obs_2017.txt; amsr(5,:,:)=basin8_sie_obs_2017;

amsr(:,:,5:9) = NaN;

ave00(:,:)=nanmean(amsr,1);
ave1(:,:)=nanmean(cfsr,1);
ave2(:,:)=nanmean(cryo,1);

ave0(:,1:9)=ave00(:,4:12);
ave0(:,10:12)=ave00(:,1:3);

xdim=[1:1:12];

xmin=[0, 0, 0, 0, 0, 0, 0, 0];
xmax=[10, 4, 5, 4, 5, 5, 5, 4];

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'; 'Jan'; 'Feb'];
month4 = ['Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'; 'Jan'; 'Feb'; 'Mar'];

axes('position',[0.35 0.89 0.3 0.01],'FontSize',10)
title ('(a) Ice Extent (10$^6$km$^2$, IC=1 Apr 2013-2017)','Interpreter','latex')
axis off

i1=.04; j1=.58; w=0.20; hgt=0.26; hspace=0.03; vspace=0.10;

for n=1:8

if (n==5) i1=.04; j1=j1-hgt-vspace; end
axes('position',[i1,j1,w,hgt])

q=plot(xdim,ave1(n,:),'b',xdim,ave2(n,:),'r--',xdim,ave0(n,:),'ko','MarkerSize',5);
set(q,'linewidth',wd2)
grid

set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
for m=1:12
text(m-.3,-0.2,month4(m,1:1),'FontSize',6)
end
%if (n > 4) xlabel('Valid Month','fontsize',8); end % too close to x-axis
text(3,-.7,'Valid Month','FontSize',8);
%%text(2.1,4.3,int2str(n),'FontSize',8,'fontweight','bold')

text(-.07,0,'0','FontSize',8);
text(-.07,2,'2','FontSize',8);
text(-.07,4,'4','FontSize',8);

%yticks(0 : 2 : 4);
%a=get(gca,'YTickLabel');
%set(gca,'YTickLabel',a,'fontsize',8)
%set(gca,'YTickLabel',[0 2 4],'fontsize',8)

%if (n==1 || n==5) ylabel('Ice Extent','fontsize',8); end

if (n==1) basin8='1) BKG Sea'; end
if (n==2) basin8='2) Canadian Arctic'; end
if (n==3) basin8='3) Baffin Bay'; end
if (n==4) basin8='4) Beaufort Sea'; end 
if (n==5) basin8='5) Chukchi'; end
if (n==6) basin8='6) Bering Sea'; end
if (n==7) basin8='7) E. Siberian Sea'; end
if (n==8) basin8='8) Laptev Sea'; end

title(basin8,'fontsize',8)

i1=i1+w+hspace;
%axis([1 12 xmin(n) xmax(n)])
axis([1 12 0 5])
if (n==8) 
legend ('Control','CS2\_IC','AMSR2','location','NE')
%legend ('boxoff')
end

end

print -depsc2 fig10_sie_8basin_aprIC.eps
