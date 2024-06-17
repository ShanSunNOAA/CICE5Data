clf
clear
wd2=1.5; ftsz=0.01;
ylimit=[0 35];
xlimit=[1 23];
ymax=1.5;ymin=-2.0;
yr2=16;yr0=10;
fn1=9;

ttl_dt=35040;
xdt=[1:ttl_dt]/2976; %unit: month

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_15min_step_1601.txt; ctr=sie_15min_step_1601(1:ttl_dt,1)*1.e-6;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/sie_15min_step_1601.txt; alt=sie_15min_step_1601(1:ttl_dt,1)*1.e-6;

load /home/Shan.Sun/helpme/post_cice/nsidc_nh_ext_2011_2017.txt; obn=nsidc_nh_ext_2011_2017(:,2:13);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/tend_ctrl_alt_2data_2016_lat67_sep2022.txt; x16=tend_ctrl_alt_2data_2016_lat67_sep2022(:,1:5); y16=tend_ctrl_alt_2data_2016_lat67_sep2022(:,6:10);

xdim1=[1:12]; xdim2=[2:13]; xdim3=[3:14]; xdim4=[4:15]; xdim5=[5:16]; xdim6=[6:17];
xdim7=[7:18]; xdim8=[8:19]; xdim9=[9:20]; xdim10=[10:21]; xdim11=[11:22]; xdim12=[12:23]; xdim13=[13:24];

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'; 'Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'];

w=0.40; hgt=0.32; hspace=0.06; vspace=0.10; fac1=1.;

i1=.04;
% edit
x=x16*fac1; y=y16*fac1;j1=.55;
  axes('position',[i1,j1,w,hgt])
  q=plot(xdt,ctr,'b',xdt,alt,'r',xdim1,obn(yr2-yr0,:),'ko'); hold on
  set(q,'linewidth',wd2)
  set(q,'MarkerSize',5)
  q1=legend('Control','CS2\_IC','NSIDC','location','northeast')
  set(q1,'Fontsize',8)
  % set(q1,'box','off')
  % text(1,ctr(1,1,1),'o','FontSize',ftsz,'color','b','BackgroundColor','b');
  % text(1,alt(1,1,1),'o','FontSize',ftsz,'color','r','BackgroundColor','r');
  %text(10.7,5.5,'(a)','FontSize',10,'color','k','Fontweight','bold');
  text(10.7,5.5,'(a)','FontSize',10,'color','k')
  title ('Arctic Sea Ice Extent (10$^6$km$^2$)','fontsize',8,'Interpreter','latex')
  grid
  axis([1 12 4 20])
  yticks([4 8 12 16 20])
% yticklabels({'0','7','14','21','28'})
  dy=3.6;
  set(gca,'xticklabel',[])
  for m=1:12
    text(m,dy,months(m,1:1),'FontSize',5)
  end
  xlabel (num2str(2000+yr2),'fontsize',8);
  a = get(gca,'yTickLabel');  
  set(gca,'yTickLabel',a,'fontsize',8)
  i1=i1+w+hspace;

axes('position',[i1,j1,w,hgt])
q=plot(xdim1,x(:,2),'m',xdim1,x(:,3),'c',xdim1,x(:,4),'k',xdim1,x(:,5),'g',xdim1,y(:,2),'m--',xdim1,y(:,3),'c--',xdim1,y(:,4),'k--',xdim1,y(:,5),'g--'); hold on
set(q,'linewidth',wd2)
grid
%legend('top melt (Control)','basal melt (ctrl)','lat melt (ctrl)','top melt (CS2\_IC)','basal melt (CS2_IC)','lat melt (CS2_IC)','location','best')
%title 'Solid: Control, dashed: CS2\_IC'
a0=2.8;a2=a0+1;a3=3.8; a1=[a0 a2]; b1=[ymax*.82 ymax*.82]; b2=[ymax*.65 ymax*.65]; b3=[ymax*.48 ymax*.48];b4=[ymax*.31 ymax*.31];
%q=plot(a1,b1,'m',a1,b2,'c',a1,b3,'k',a1,b4,'g'); hold on
%set(q,'linewidth',wd2)
text(a3,b1(1),'Area Dyn   (%/day)','FontSize',fn1,'color','m')
text(a3,b2(1),'Area Thmo (%/day)','FontSize',fn1,'color','c')
text(a3,b3(1),'Vol Dyn   (cm/day)','FontSize',fn1,'color','k')
text(a3,b4(1),'Vol Thmo (cm/day)','FontSize',fn1,'color','g')

text(10.7,ymin*.85,'(c)','FontSize',10,'color','k')
title ('Tendency from Ctrl (solid), CS2\_IC (dashed)','fontsize',8,'Interpreter','latex')

dy=ymin*1.04
for m=1:12
  text(m,dy,months(m,1:1),'FontSize',5)
end
xlabel (num2str(2000+yr2),'fontsize',8);
set(gca,'xticklabel',[])
set(gca,'fontsize',8)
axis([1 12 ymin ymax])

ftsz=0.01;
ylimit=[0 35];
xlimit=[1 23];
ymax=1.3; % melt

%edit begin
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_15min_step_1601.txt; ctr_siv=siv_15min_step_1601(1:ttl_dt,1)*1.e-12;
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/siv_15min_step_1601.txt; alt_siv=siv_15min_step_1601(1:ttl_dt,1)*1.e-12;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/melt_ctrl_alt_2data_2016_snow_67n_sep2022.txt; x16=melt_ctrl_alt_2data_2016_snow_67n_sep2022(:,1:5); y16=melt_ctrl_alt_2data_2016_snow_67n_sep2022(:,6:10);

load /home/Shan.Sun/helpme/post_cice/piomas_nh_vol_2011_2017.txt; obs_uw=piomas_nh_vol_2011_2017(:,2:13);
load /home/Shan.Sun/helpme/post_cice/siv_nh_CS2_obs_2011_2017_sep2022.txt; obs_cs2=siv_nh_CS2_obs_2011_2017_sep2022(:,2:13);

xdim1=[1:12]; xdim2=[2:13]; xdim3=[3:14]; xdim4=[4:15]; xdim5=[5:16]; xdim6=[6:17];
xdim7=[7:18]; xdim8=[8:19]; xdim9=[9:20]; xdim10=[10:21]; xdim11=[11:22]; xdim12=[12:23]; xdim13=[13:24];

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'; 'Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'];

w=0.40; hgt=0.36; hspace=0.06; vspace=0.10; fac1=1.; i1=.04;
x=fac1*x16; y=fac1*y16;j1=.1;
for n=1:1
  axes('position',[i1,j1,w,hgt])
  if n==1 
    q=plot(xdt,ctr_siv,'b',xdt,alt_siv,'r',xdim1,obs_uw(yr2-yr0,:),'kx'); hold on
    q1=legend('Control','CS2\_IC','PIOMAS','location','northeast')
    set(q1,'Fontsize',8)
    text(10.7,5.3,'(b)','FontSize',10,'color','k')
    title ('Arctic Sea Ice Volume (10$^3$km$^3$)','fontsize',8,'Interpreter','latex')
  end
  if n==2 
    q=plot(xdim1,ctr_siv-obs_uw,'b',xdim1,alt_siv-obs_uw,'r'); hold on
  end
  set(q,'linewidth',wd2)
  grid
  if n==1 
    ymin=4
    axis([1 12 ymin 28])
    yticks([ymin 12 20 28])
   % yticklabels({'0','7','14','21','28'})
    dy=ymin-.6
  end
  if n==2 
    axis([1 12 0 10])
    yticks([0 2 4 6 8])
    yticklabels({'0','2','4','6','8'})
    dy=-.15
  end
  set(gca,'xticklabel',[])
  for m=1:12
    text(m,dy,months(m,1:1),'FontSize',5)
  end
  xlabel (num2str(2000+yr2),'fontsize',8);
  a = get(gca,'yTickLabel');  
  set(gca,'yTickLabel',a,'fontsize',8)
  i1=i1+w+hspace;
end %n=1,2

%i1=0.04; j1=.1
axes('position',[i1,j1,w,hgt])
q=plot(xdim1,x(:,2),'m',xdim1,x(:,3),'c',xdim1,x(:,4),'k',xdim1,x(:,5),'g',xdim1,y(:,2),'m--',xdim1,y(:,3),'c--',xdim1,y(:,4),'k--',xdim1,y(:,5),'g--'); hold on
set(q,'linewidth',wd2)
grid
a3=1.8; a1=[1.6 a2]; b1=[ymax*.82 ymax*0.82]; b2=[ymax*.73 ymax*.73]; b3=[ymax*.64 ymax*.64]; b4=[ymax*.55 ymax*.55];
text(a3,b1(1),'Top Melt','FontSize',fn1,'color','m')
text(a3,b2(1),'Basal Melt','FontSize',fn1,'color','c')
text(a3,b3(1),'Lat Melt','FontSize',fn1,'color','k')
text(a3,b4(1),'Snow Melt','FontSize',fn1,'color','g')

%text(1,x(1,2),'o','FontSize',ftsz,'color','m','BackgroundColor','m');
%text(1,x(1,3),'o','FontSize',ftsz,'color','c','BackgroundColor','c');
%text(1,x(1,4),'o','FontSize',ftsz,'color','g','BackgroundColor','g');
%text(a3+.1,ymax+3,'Melt; Solid: Control, dashed: CS2\_IC (10^3m^3)','FontSize',9)
text(10.7,ymax*.1,'(d)','FontSize',10,'color','k')
title ('Melt (cm/day) from Ctrl (solid), CS2\_IC (dashed)','fontsize',8,'fontsize',8,'Interpreter','latex')

dy=-ymax*.02
for m=1:12
  text(m,dy,months(m,1:1),'FontSize',5)
end
xlabel (num2str(2000+yr2),'fontsize',8);
set(gca,'xticklabel',[])
set(gca,'fontsize',8)
axis([1 12 0 ymax])
print -depsc2 fig07_sie_tendency_siv_melt_2016.eps
