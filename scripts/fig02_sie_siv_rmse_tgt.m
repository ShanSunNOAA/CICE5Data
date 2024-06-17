wd2=2;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2011.txt; sie_cfsr(:,:,1)=sie_nh_cfsr_ini_2011; % Apr:Dec
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2012.txt; sie_cfsr(:,:,2)=sie_nh_cfsr_ini_2012; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2013.txt; sie_cfsr(:,:,3)=sie_nh_cfsr_ini_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2014.txt; sie_cfsr(:,:,4)=sie_nh_cfsr_ini_2014; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2015.txt; sie_cfsr(:,:,5)=sie_nh_cfsr_ini_2015; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2016.txt; sie_cfsr(:,:,6)=sie_nh_cfsr_ini_2016; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_nh_cfsr_ini_2017.txt; sie_cfsr(:,:,7)=sie_nh_cfsr_ini_2017; % Jan:Jul

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2011.txt; sie_cryo(:,:,1)=sie_nh_cryo_ini_2011; % Apr:Dec
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2012.txt; sie_cryo(:,:,2)=sie_nh_cryo_ini_2012; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2013.txt; sie_cryo(:,:,3)=sie_nh_cryo_ini_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2014.txt; sie_cryo(:,:,4)=sie_nh_cryo_ini_2014; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2015.txt; sie_cryo(:,:,5)=sie_nh_cryo_ini_2015; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2016.txt; sie_cryo(:,:,6)=sie_nh_cryo_ini_2016; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_nh_cryo_ini_2017.txt; sie_cryo(:,:,7)=sie_nh_cryo_ini_2017; % Jan:Jul

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec']

sie_cfsr(sie_cfsr <= -99) = NaN; sie_cryo(sie_cryo <= -99) = NaN; %nanmean

%sie_cfsr_ave=nanmean(sie_cfsr,3); cts_ave=nanmean(cts,3);
%unit: 10^12 m2
load /home/Shan.Sun/helpme/post_cice/nsidc_nh_ext_2011_2017.txt; obn=nsidc_nh_ext_2011_2017(:,2:13); 

obn1d=reshape(obn',84,1); obn1d(85:96)=NaN;

for n=1:7
for m=1:12
  obn3d(m,1:12,n)=obn1d(m+(n-1)*12:11+m+(n-1)*12);
end
end

diff1=sie_cfsr-obn3d; diff2=sie_cryo-obn3d;
diff1_2d=nanmean(diff1,3); diff2_2d=nanmean(diff2,3);
for i=1:12
for j=1:12
rmse_ctr(i,j)=rms(diff1(i,j,:),'omitnan');
rmse_cryo(i,j)=rms(diff2(i,j,:),'omitnan');
end
end
rmse_cryo(:,5:9)=NaN;

initMonth = 1:12; leadMonth = 1:12;
xMax=length(initMonth); yMax=length(leadMonth);

w=0.30; hgt=0.30; hspace=0.010; i1=.07; j1=.63;

for i=1:12
for j=1:12
  rmse_cfsr_tgt(i,j) =rmse_ctr(i,mod(j-i,12)+1);
  rmse_cryo_tgt(i,j)=rmse_cryo(i,mod(j-i,12)+1);
  diff1_2d_tgt(i,j) =diff1_2d(i,mod(j-i,12)+1);
  diff2_2d_tgt(i,j) =diff2_2d(i,mod(j-i,12)+1);
end
end

my_jet=[
    1.0000         0         0  %red
    1.0000    0.5000         0  % orange
    1.0000    1.0000         0  % yellow
         0    1.0000         0  % green
         0         0    1.0000  % blue
    0.6667         0    1.0000  % purple
]

my_yellow_red=[
249 254  41
233 222  36
227 194  33
219 161  32
202  96  26
192  49  24
189   3  23
133   0  28
 73   1  63
 44   4  94
]

my_yellow_red=[
255 245 204
255 230 112
255 204  51
255 175  51
202  96  26
192  49  24
189   3  23
133   0  28
 73   1  63
 44   4  94
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

my_white=[
         0         0    1.      % blue
         0    0.3333    1.0000
    0.0       0.7    1.0000  % 
    0.0       0.7       .3     %
    0.0       1.        1.      % cyan
   %1.0       1.0000    1.0
    0.7778    0.7778    0.7778  % grey
    0.3000    1.0000         0  % light green
    0.0000    1.0000         0  % green
    1.0000    1.0000         0  % yellow
    1.0000    0.5000         0  % orange
    1.0000         0         0  % red
]

my_wh_ctr=[
   0   0  50
  16  78 139
  72 118 255
 173 215 230
 209 237 237
 229 239 249  % offwhite
% 253 245 230
 255 228 180
 237 118   0
 224  49  15
 205   0   0
  50   0   0
]

my_wh_ctr=[
 120   0 136
  90   0 184
  70   0 245
   0 170 225
   0 200 200
 229 239 249  % offwhite
   0 200 125
 195 255   0
 255 255   0
 255 155   0
 255   0   0
]

my_wh_ctr=[
 120   0 136
  90   0 184
  70   0 245
   0 170 225
   0 200 200
 120 239 249  % offwhite
   0 255 255  % cyan?
 195 255   0
 255 255   0
 255 155   0
 255   0   0
]

my_wh_ctr=[
0.250980 0.000000 0.752941
0.000000 0.250980 1.000000
0.250980 0.752941 1.000000
0.250980 1.000000 1.000000
 .88 .88 .9  % offwhite
1.000000 0.878431 0.250980
1.000000 0.376471 0.250980
1.000000 0.  0.
.62      0  .11
]

my_wh_ctr0=[
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
.62      0  .11
]

%my_wh_ctr=my_wh_ctr/255;

for n=1:3
  axes('position',[i1,j1,w,hgt])
  if (n==1) imagesc(initMonth,leadMonth,rmse_cfsr_tgt); end
  if (n==2) q=imagesc(initMonth,leadMonth,rmse_cryo_tgt); 
    set(q,'AlphaData',~isnan(rmse_cryo_tgt)); end
  if (n==3) 
    dif2=rmse_cryo_tgt-rmse_cfsr_tgt;
    q=imagesc(initMonth,leadMonth,dif2); 
    set(q,'AlphaData',~isnan(dif2)); end
  set(gca,'YDir','normal'); % This is needed to make y-axis increase going up
  set(gca,'XTick',[0.5:1:12.5]);
  set(gca,'XTickLabel',[' '])
  for m=1:12
    text(m-.1,0.14,months(m,1:1),'FontSize',5)
  end

  set(gca,'YTick',[0.5:1:12.5]);
  set(gca,'YTickLabel',[])
  if (n==1) 
  text(-.22,2.,'2','FontSize',8)
  text(-.22,4.,'4','FontSize',8)
  text(-.22,6.,'6','FontSize',8)
  text(-.22,8.,'8','FontSize',8)
  text(-.53,10.,'10','FontSize',8)
  text(-.53,12.,'12','FontSize',8)
  end

  i4=4.1;
  text(i4,-.8,'Target Month','FontSize',8); 
  if (n==1) text(4.4,13.05,'(a) Control Runs','FontSize',7);
  text(-1.0,4,'Lead Month','FontSize',8,'Rotation',90); % Optional labels
  text(12.5,14.25,'Arctic SIE RMSE (10$^{6}$km$^{2}$) 2011-2017','FontSize',8,'Interpreter','latex');
  end
  if (n==2) text(4.4,13.05,'(b) CS2\_IC Runs','FontSize',7); 
  end
  if (n==3) text(3.1,13.05,'(c) CS2\_IC minus Control','FontSize',7); 
  end

  if (n==2) cb=colorbar('southoutside');
    a=get(cb)
    a.Position
%0.6500    0.4338    0.3000    0.0432
    set(cb,'Position',[.15 .562 .45 .019],'FontSize',7)
      caxis([0,5]); colormap(gca,my_yw_rd);
  end
  if (n<3) caxis([0,5]); colormap(gca,my_yw_rd); end

  if (n==3) cb=colorbar('southoutside');
    a=get(cb)
    a.Position
%0.6768    0.6087    0.3000    0.0159
    set(cb,'Position',[.71 .562 .26 .019],'FontSize',7)
    caxis([-2,2]); colormap(gca,my_wh_ctr); 
    text(-13.3,-4.35,'10$^{6}$km$^{2}$','FontSize',8,'Interpreter','latex');
    text(5.5,-4.50,  '10$^{6}$km$^{2}$','FontSize',8,'Interpreter','latex');
  end
  i1=i1+w+hspace
end

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2011.txt; siv_cfsr(:,:,1)=siv_nh_cfsr_ini_2011; % Apr:Dec
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2012.txt; siv_cfsr(:,:,2)=siv_nh_cfsr_ini_2012; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2013.txt; siv_cfsr(:,:,3)=siv_nh_cfsr_ini_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2014.txt; siv_cfsr(:,:,4)=siv_nh_cfsr_ini_2014; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2015.txt; siv_cfsr(:,:,5)=siv_nh_cfsr_ini_2015; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2016.txt; siv_cfsr(:,:,6)=siv_nh_cfsr_ini_2016; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_nh_cfsr_ini_2017.txt; siv_cfsr(:,:,7)=siv_nh_cfsr_ini_2017; % Jan:Jul

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2011.txt; siv_cryo(:,:,1)=siv_nh_cryo_ini_2011; % Apr:Dec
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2012.txt; siv_cryo(:,:,2)=siv_nh_cryo_ini_2012; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2013.txt; siv_cryo(:,:,3)=siv_nh_cryo_ini_2013;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2014.txt; siv_cryo(:,:,4)=siv_nh_cryo_ini_2014; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2015.txt; siv_cryo(:,:,5)=siv_nh_cryo_ini_2015; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2016.txt; siv_cryo(:,:,6)=siv_nh_cryo_ini_2016; 
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_nh_cryo_ini_2017.txt; siv_cryo(:,:,7)=siv_nh_cryo_ini_2017; % Jan:Jul

siv_cfsr(siv_cfsr <= -99) = NaN; siv_cryo(siv_cryo <= -99) = NaN; %nanmean
months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec']

%siv_cfsr_ave=nanmean(siv_cfsr,3); cts_ave=nanmean(cts,3);
%unit: 10^12 m2
load /home/Shan.Sun/helpme/post_cice/piomas_nh_vol_2011_2017.txt; obn=piomas_nh_vol_2011_2017(:,2:13); 

obn1d=reshape(obn',84,1); obn1d(85:96)=NaN;

for n=1:7
for m=1:12
  obn3d(m,1:12,n)=obn1d(m+(n-1)*12:11+m+(n-1)*12);
end
end

diff1=siv_cfsr-obn3d; diff2=siv_cryo-obn3d;
diff1_2d=nanmean(diff1,3); diff2_2d=nanmean(diff2,3);
for i=1:12
for j=1:12
rmse_ctr(i,j)=rms(diff1(i,j,:),'omitnan');
rmse_cryo(i,j)=rms(diff2(i,j,:),'omitnan');
end
end
rmse_cryo(:,5:9)=NaN;

initMonth = 1:12; leadMonth = 1:12;
xMax=length(initMonth); yMax=length(leadMonth);

for i=1:12
for j=1:12
  rmse_cfsr_tgt(i,j) =rmse_ctr(i,mod(j-i,12)+1);
  rmse_cryo_tgt(i,j)=rmse_cryo(i,mod(j-i,12)+1);
  diff1_2d_tgt(i,j) =diff1_2d(i,mod(j-i,12)+1);
  diff2_2d_tgt(i,j) =diff2_2d(i,mod(j-i,12)+1);
end
end

my_jet=[
    1.0000         0         0  %red
    1.0000    0.5000         0  % orange
    1.0000    1.0000         0  % yellow
         0    1.0000         0  % green
         0         0    1.0000  % blue
    0.6667         0    1.0000  % purple
]

my_yellow_red=[
249 254  41
233 222  36
227 194  33
219 161  32
202  96  26
192  49  24
189   3  23
133   0  28
 73   1  63
 44   4  94
]

my_yellow_red=[
255 245 204
255 230 112
255 204  51
255 175  51
202  96  26
192  49  24
189   3  23
133   0  28
 73   1  63
 44   4  94
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

my_white=[
         0         0    1.      % blue
         0    0.3333    1.0000
    0.0       0.7    1.0000  % 
    0.0       0.7       .3     %
    0.0       1.        1.      % cyan
   %1.0       1.0000    1.0
    0.7778    0.7778    0.7778  % grey
    0.3000    1.0000         0  % light green
    0.0000    1.0000         0  % green
    1.0000    1.0000         0  % yellow
    1.0000    0.5000         0  % orange
    1.0000         0         0  % red
]

my_wh_ctr=[
   0   0  50
  16  78 139
  72 118 255
 173 215 230
 209 237 237
 229 239 249  % offwhite
% 253 245 230
 255 228 180
 237 118   0
 224  49  15
 205   0   0
  50   0   0
]

my_wh_ctr=[
 120   0 136
  90   0 184
  70   0 245
   0 170 225
   0 200 200
 229 239 249  % offwhite
   0 200 125
 195 255   0
 255 255   0
 255 155   0
 255   0   0
]

my_wh_ctr=[
 120   0 136
  90   0 184
  70   0 245
   0 170 225
   0 200 200
 120 239 249  % offwhite
   0 255 255  % cyan?
 195 255   0
 255 255   0
 255 155   0
 255   0   0
]

my_wh_ctr=[
0.250980 0.000000 0.752941
0.000000 0.250980 1.000000
0.250980 0.752941 1.000000
0.250980 1.000000 1.000000
 .88 .88 .9  % offwhite
1.000000 0.878431 0.250980
1.000000 0.376471 0.250980
1.000000 0.  0.
.62      0  .11
]

my_wh_ctr0=[
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
.62      0  .11
]

%my_wh_ctr=my_wh_ctr/255;

w=0.30; hgt=0.30; hspace=0.010; i1=.07; j1=.14;
for n=1:3
  axes('position',[i1,j1,w,hgt])
  if (n==1) imagesc(initMonth,leadMonth,rmse_cfsr_tgt); end
  if (n==2) q=imagesc(initMonth,leadMonth,rmse_cryo_tgt); 
    set(q,'AlphaData',~isnan(rmse_cryo_tgt)); end
  if (n==3) 
    dif2=rmse_cryo_tgt-rmse_cfsr_tgt;
    q=imagesc(initMonth,leadMonth,dif2); 
    set(q,'AlphaData',~isnan(dif2)); end
  set(gca,'YDir','normal'); % This is needed to make y-axis increase going up
  set(gca,'XTick',[0.5:1:12.5]);
  set(gca,'XTickLabel',[' '])
  for m=1:12
    text(m-.1,0.15,months(m,1:1),'FontSize',5)
  end

  set(gca,'YTick',[0.5:1:12.5]);
  set(gca,'YTickLabel',[])
  if (n==1) 
  text(-.22,2.,'2','FontSize',8)
  text(-.22,4.,'4','FontSize',8)
  text(-.22,6.,'6','FontSize',8)
  text(-.22,8.,'8','FontSize',8)
  text(-.53,10.,'10','FontSize',8)
  text(-.53,12.,'12','FontSize',8)
  end

  i4=4.1;
  text(i4,-.8,'Target Month','FontSize',8); 
  if (n==1) text(4.4,13.05,'(d) Control Runs','FontSize',7);
  text(-1.0,4,'Lead Month','FontSize',8,'Rotation',90); % Optional labels
  text(12.4,14.25,'Arctic SIV RMSE (10$^{3}$km$^{3}$) 2011-2017','FontSize',8,'Interpreter','latex');
  end
  if (n==2) text(4.4,13.05,'(e) CS2\_IC Runs','FontSize',7); 
  end
  if (n==3) text(3.1,13.05,'(f) CS2\_IC minus Control','FontSize',7); 
  end

  if (n==2) cb=colorbar('southoutside');
    a=get(cb)
    a.Position
%0.6500    0.4338    0.3000    0.0432
    set(cb,'Position',[.15 .068 .45 .02],'FontSize',7)
  end
  if (n<3) caxis([0,10]); colormap(gca,my_yw_rd); end

  if (n==3) cb=colorbar('southoutside');
    a=get(cb)
    a.Position
%0.6768    0.6087    0.3000    0.0159
    set(cb,'Position',[.71 .068 .26 .02],'FontSize',7)
    caxis([-4,4]); colormap(gca,my_wh_ctr); 
    text(-13.4,-4.42,'10$^{3}$km$^{3}$','FontSize',8,'Interpreter','latex');
    text(5.4,-4.42,  '10$^{3}$km$^{3}$','FontSize',8,'Interpreter','latex');
  end
  i1=i1+w+hspace
end

print -depsc2 fig02_sie_siv_rmse_tgt.eps
