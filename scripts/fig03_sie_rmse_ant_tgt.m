clear
clf
wd2=2;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2011.txt; sie_cfsr(:,:,1)=sie_sh_cfsr_ini_2011; % Apr:Dec
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2012.txt; sie_cfsr(:,:,2)=sie_sh_cfsr_ini_2012; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2013.txt; sie_cfsr(:,:,3)=sie_sh_cfsr_ini_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2014.txt; sie_cfsr(:,:,4)=sie_sh_cfsr_ini_2014; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2015.txt; sie_cfsr(:,:,5)=sie_sh_cfsr_ini_2015; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2016.txt; sie_cfsr(:,:,6)=sie_sh_cfsr_ini_2016; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_sh_cfsr_ini_2017.txt; sie_cfsr(:,:,7)=sie_sh_cfsr_ini_2017; % Jan:Jul

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec']

sie_cfsr(sie_cfsr <= -99) = NaN; 

load /home/Shan.Sun/post_cice/nsidc_sh_ext_2011_2017.txt; obs=nsidc_sh_ext_2011_2017(:,2:13); 

obs1d=reshape(obs',84,1); obs1d(85:96)=NaN;

for n=1:7
for m=1:12
  obs3d(m,1:12,n)=obs1d(m+(n-1)*12:11+m+(n-1)*12);
end
end

diff1=sie_cfsr-obs3d; 
diff1_2d=nanmean(diff1,3); 
for i=1:12
for j=1:12
rmse_ctr(i,j)=rms(diff1(i,j,:),'omitnan');
end
end

initMonth = 1:12; leadMonth = 1:12;
xMax=length(initMonth); yMax=length(leadMonth);

w=0.38; hgt=0.38; hspace=0.11; i1=.06; j1=.55;

for i=1:12
for j=1:12
  rmse_ctr_tgt(i,j) =rmse_ctr(i,mod(j-i,12)+1);
  diff1_2d_tgt(i,j) =diff1_2d(i,mod(j-i,12)+1);
end
end

my_white=[
         0         0    0.6667
         0         0    1.0000
         0    0.3333    1.0000
         0    0.6667    1.0000
         0    1.0000    1.0000
   %1.0       1.0000    1.0
    0.7778    0.7778    0.7778
    1.0000    1.0000         0
    1.0000    0.75         0
    1.0000    0.5         0
    1.0000    0.25         0
    1.0000         0         0
]

my_yw_rd=[
 255 245 204
 255 230 112
 255 204  51
 255 175  51
 255 153  51
 255 111  51
 255  85   0
 230  40  30
 200  30  20
 150  20  10
]
my_yw_rd=my_yw_rd/255;

my_wh_ctr=[
0.250980 0.000000 0.752941
0.000000 0.250980 1.000000
0.000000 0.501961 1.000000
0.250980 0.752941 1.000000
0.250980 1.000000 1.000000
 .88 .88 .9  % offwhite
1.000000 0.878431 0.250980
1.000000 0.627451 0.250980
1.000000 0.376471 0.250980
1.000000 0.  0.
.62   0  .11
]
for n=1:1
axes('position',[i1,j1,w,hgt])

if (n==1) imagesc(initMonth,leadMonth,rmse_ctr_tgt); end
if (n==2) imagesc(initMonth,leadMonth,diff1_2d_tgt); end
set(gca,'YDir','normal'); % This is needed to make y-axis increase going up

set(gca,'XTick',[0.5:1:12.5]);
set(gca,'XTickLabel',[' '])
for m=1:12
text(m-.1,0.2,months(m,1:1),'FontSize',5)
end

set(gca,'YTick',[0.5:1:12.5]);
set(gca,'YTickLabel',[])
text(-.2,2.,'2','FontSize',8)
text(-.2,4.,'4','FontSize',8)
text(-.2,6.,'6','FontSize',8)
text(-.2,8.,'8','FontSize',8)
text(-.4,10.,'10','FontSize',8)
text(-.4,12.,'12','FontSize',8)

text(4.8,-.7,'Target Month','FontSize',8); text(-0.9,5,'Lead Month','FontSize',8,'Rotation',90); % Optional labels
if (n==1) text(1.8,13.05,'Antarctic SIE RMSE Control 2011-2017','FontSize',7,'Interpreter','latex'); end
if (n==2) text(1.2,13.05,'Antarctic SIE Bias (10$^6$km$^2$) Control 2011-2017','FontSize',7,'Interpreter','latex'); end

if (n==1) colorbar('eastoutside','fontsize',8,'position', [0.450 j1 0.02 0.38]); caxis([0,15]); colormap(gca,my_yw_rd); end
if (n==2) colorbar('eastoutside','fontsize',8,'position', [0.935 j1 0.02 0.38]); caxis([-10,10]); colormap(gca,my_wh_ctr); end
i1=i1+w+hspace
end
text(12.5,13.15,'10$^6$km$^2$','FontSize',8,'Interpreter','latex')

print -depsc2 fig03_sie_rmse_ant_tgt.eps
