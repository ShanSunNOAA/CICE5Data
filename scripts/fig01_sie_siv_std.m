wd2=1.;
ylimit=[0 35];
xlimit=[1 23];

lead1=1;lead7=6;
ctr_ext(1:8,1:12,1:2)=NaN; ctr_vol(1:8,1:12,1:2)=NaN; ctr_ext1(1:8,1:12,1:2)=NaN; ctr_vol1(1:8,1:12,1:2)=NaN;

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1104.txt; ctr_ext(1,9,1:2)=sie_mon_1104(lead7,2:3); ctr_ext1(1,4,1:2)=sie_mon_1104(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1105.txt; ctr_ext(1,10,1:2)=sie_mon_1105(lead7,2:3);ctr_ext1(1,5,1:2)=sie_mon_1105(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1106.txt; ctr_ext(1,11,1:2)=sie_mon_1106(lead7,2:3);ctr_ext1(1,6,1:2)=sie_mon_1106(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1107.txt; ctr_ext(1,12,1:2)=sie_mon_1107(lead7,2:3);ctr_ext1(1,7,1:2)=sie_mon_1107(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1108.txt; ctr_ext(2,1,1:2)=sie_mon_1108(lead7,2:3); ctr_ext1(1,8,1:2)=sie_mon_1108(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1109.txt; ctr_ext(2,2,1:2)=sie_mon_1109(lead7,2:3); ctr_ext1(1,9,1:2)=sie_mon_1109(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1110.txt; ctr_ext(2,3,1:2)=sie_mon_1110(lead7,2:3); ctr_ext1(1,10,1:2)=sie_mon_1110(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1111.txt; ctr_ext(2,4,1:2)=sie_mon_1111(lead7,2:3); ctr_ext1(1,11,1:2)=sie_mon_1111(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1112.txt; ctr_ext(2,5,1:2)=sie_mon_1112(lead7,2:3); ctr_ext1(1,12,1:2)=sie_mon_1112(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1201.txt; ctr_ext(2,6,1:2)=sie_mon_1201(lead7,2:3); ctr_ext1(2,1,1:2)=sie_mon_1201(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1202.txt; ctr_ext(2,7,1:2)=sie_mon_1202(lead7,2:3); ctr_ext1(2,2,1:2)=sie_mon_1202(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1203.txt; ctr_ext(2,8,1:2)=sie_mon_1203(lead7,2:3); ctr_ext1(2,3,1:2)=sie_mon_1203(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1204.txt; ctr_ext(2,9,1:2)=sie_mon_1204(lead7,2:3); ctr_ext1(2,4,1:2)=sie_mon_1204(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1205.txt; ctr_ext(2,10,1:2)=sie_mon_1205(lead7,2:3);ctr_ext1(2,5,1:2)=sie_mon_1205(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1206.txt; ctr_ext(2,11,1:2)=sie_mon_1206(lead7,2:3);ctr_ext1(2,6,1:2)=sie_mon_1206(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1207.txt; ctr_ext(2,12,1:2)=sie_mon_1207(lead7,2:3);ctr_ext1(2,7,1:2)=sie_mon_1207(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1208.txt; ctr_ext(3,1,1:2)=sie_mon_1208(lead7,2:3); ctr_ext1(2,8,1:2)=sie_mon_1208(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1209.txt; ctr_ext(3,2,1:2)=sie_mon_1209(lead7,2:3); ctr_ext1(2,9,1:2)=sie_mon_1209(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1210.txt; ctr_ext(3,3,1:2)=sie_mon_1210(lead7,2:3); ctr_ext1(2,10,1:2)=sie_mon_1210(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1211.txt; ctr_ext(3,4,1:2)=sie_mon_1211(lead7,2:3); ctr_ext1(2,11,1:2)=sie_mon_1211(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1212.txt; ctr_ext(3,5,1:2)=sie_mon_1212(lead7,2:3); ctr_ext1(2,12,1:2)=sie_mon_1212(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1301.txt; ctr_ext(3,6,1:2)=sie_mon_1301(lead7,2:3); ctr_ext1(3,1,1:2)=sie_mon_1301(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1302.txt; ctr_ext(3,7,1:2)=sie_mon_1302(lead7,2:3); ctr_ext1(3,2,1:2)=sie_mon_1302(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1303.txt; ctr_ext(3,8,1:2)=sie_mon_1303(lead7,2:3); ctr_ext1(3,3,1:2)=sie_mon_1303(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1304.txt; ctr_ext(3,9,1:2)=sie_mon_1304(lead7,2:3); ctr_ext1(3,4,1:2)=sie_mon_1304(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1305.txt; ctr_ext(3,10,1:2)=sie_mon_1305(lead7,2:3);ctr_ext1(3,5,1:2)=sie_mon_1305(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1306.txt; ctr_ext(3,11,1:2)=sie_mon_1306(lead7,2:3);ctr_ext1(3,6,1:2)=sie_mon_1306(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1307.txt; ctr_ext(3,12,1:2)=sie_mon_1307(lead7,2:3);ctr_ext1(3,7,1:2)=sie_mon_1307(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1308.txt; ctr_ext(4,1,1:2)=sie_mon_1308(lead7,2:3); ctr_ext1(3,8,1:2)=sie_mon_1308(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1309.txt; ctr_ext(4,2,1:2)=sie_mon_1309(lead7,2:3); ctr_ext1(3,9,1:2)=sie_mon_1309(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1310.txt; ctr_ext(4,3,1:2)=sie_mon_1310(lead7,2:3); ctr_ext1(3,10,1:2)=sie_mon_1310(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1311.txt; ctr_ext(4,4,1:2)=sie_mon_1311(lead7,2:3); ctr_ext1(3,11,1:2)=sie_mon_1311(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1312.txt; ctr_ext(4,5,1:2)=sie_mon_1312(lead7,2:3); ctr_ext1(3,12,1:2)=sie_mon_1312(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1401.txt; ctr_ext(4,6,1:2)=sie_mon_1401(lead7,2:3); ctr_ext1(4,1,1:2)=sie_mon_1401(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1402.txt; ctr_ext(4,7,1:2)=sie_mon_1402(lead7,2:3); ctr_ext1(4,2,1:2)=sie_mon_1402(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1403.txt; ctr_ext(4,8,1:2)=sie_mon_1403(lead7,2:3); ctr_ext1(4,3,1:2)=sie_mon_1403(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1404.txt; ctr_ext(4,9,1:2)=sie_mon_1404(lead7,2:3); ctr_ext1(4,4,1:2)=sie_mon_1404(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1405.txt; ctr_ext(4,10,1:2)=sie_mon_1405(lead7,2:3);ctr_ext1(4,5,1:2)=sie_mon_1405(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1406.txt; ctr_ext(4,11,1:2)=sie_mon_1406(lead7,2:3);ctr_ext1(4,6,1:2)=sie_mon_1406(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1407.txt; ctr_ext(4,12,1:2)=sie_mon_1407(lead7,2:3);ctr_ext1(4,7,1:2)=sie_mon_1407(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1408.txt; ctr_ext(5,1,1:2)=sie_mon_1408(lead7,2:3); ctr_ext1(4,8,1:2)=sie_mon_1408(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1409.txt; ctr_ext(5,2,1:2)=sie_mon_1409(lead7,2:3); ctr_ext1(4,9,1:2)=sie_mon_1409(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1410.txt; ctr_ext(5,3,1:2)=sie_mon_1410(lead7,2:3); ctr_ext1(4,10,1:2)=sie_mon_1410(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1411.txt; ctr_ext(5,4,1:2)=sie_mon_1411(lead7,2:3); ctr_ext1(4,11,1:2)=sie_mon_1411(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1412.txt; ctr_ext(5,5,1:2)=sie_mon_1412(lead7,2:3); ctr_ext1(4,12,1:2)=sie_mon_1412(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1501.txt; ctr_ext(5,6,1:2)=sie_mon_1501(lead7,2:3); ctr_ext1(5,1,1:2)=sie_mon_1501(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1502.txt; ctr_ext(5,7,1:2)=sie_mon_1502(lead7,2:3); ctr_ext1(5,2,1:2)=sie_mon_1502(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1503.txt; ctr_ext(5,8,1:2)=sie_mon_1503(lead7,2:3); ctr_ext1(5,3,1:2)=sie_mon_1503(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1504.txt; ctr_ext(5,9,1:2)=sie_mon_1504(lead7,2:3); ctr_ext1(5,4,1:2)=sie_mon_1504(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1505.txt; ctr_ext(5,10,1:2)=sie_mon_1505(lead7,2:3);ctr_ext1(5,5,1:2)=sie_mon_1505(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1506.txt; ctr_ext(5,11,1:2)=sie_mon_1506(lead7,2:3);ctr_ext1(5,6,1:2)=sie_mon_1506(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1507.txt; ctr_ext(5,12,1:2)=sie_mon_1507(lead7,2:3);ctr_ext1(5,7,1:2)=sie_mon_1507(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1508.txt; ctr_ext(6,1,1:2)=sie_mon_1508(lead7,2:3); ctr_ext1(5,8,1:2)=sie_mon_1508(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1509.txt; ctr_ext(6,2,1:2)=sie_mon_1509(lead7,2:3); ctr_ext1(5,9,1:2)=sie_mon_1509(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1510.txt; ctr_ext(6,3,1:2)=sie_mon_1510(lead7,2:3); ctr_ext1(5,10,1:2)=sie_mon_1510(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1511.txt; ctr_ext(6,4,1:2)=sie_mon_1511(lead7,2:3); ctr_ext1(5,11,1:2)=sie_mon_1511(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1512.txt; ctr_ext(6,5,1:2)=sie_mon_1512(lead7,2:3); ctr_ext1(5,12,1:2)=sie_mon_1512(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1601.txt; ctr_ext(6,6,1:2)=sie_mon_1601(lead7,2:3); ctr_ext1(6,1,1:2)=sie_mon_1601(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1602.txt; ctr_ext(6,7,1:2)=sie_mon_1602(lead7,2:3); ctr_ext1(6,2,1:2)=sie_mon_1602(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1603.txt; ctr_ext(6,8,1:2)=sie_mon_1603(lead7,2:3); ctr_ext1(6,3,1:2)=sie_mon_1603(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1604.txt; ctr_ext(6,9,1:2)=sie_mon_1604(lead7,2:3); ctr_ext1(6,4,1:2)=sie_mon_1604(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1605.txt; ctr_ext(6,10,1:2)=sie_mon_1605(lead7,2:3);ctr_ext1(6,5,1:2)=sie_mon_1605(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1606.txt; ctr_ext(6,11,1:2)=sie_mon_1606(lead7,2:3);ctr_ext1(6,6,1:2)=sie_mon_1606(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1607.txt; ctr_ext(6,12,1:2)=sie_mon_1607(lead7,2:3);ctr_ext1(6,7,1:2)=sie_mon_1607(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1608.txt; ctr_ext(7,1,1:2)=sie_mon_1608(lead7,2:3); ctr_ext1(6,8,1:2)=sie_mon_1608(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1609.txt; ctr_ext(7,2,1:2)=sie_mon_1609(lead7,2:3); ctr_ext1(6,9,1:2)=sie_mon_1609(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1610.txt; ctr_ext(7,3,1:2)=sie_mon_1610(lead7,2:3); ctr_ext1(6,10,1:2)=sie_mon_1610(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1611.txt; ctr_ext(7,4,1:2)=sie_mon_1611(lead7,2:3); ctr_ext1(6,11,1:2)=sie_mon_1611(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1612.txt; ctr_ext(7,5,1:2)=sie_mon_1612(lead7,2:3); ctr_ext1(6,12,1:2)=sie_mon_1612(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1701.txt; ctr_ext(7,6,1:2)=sie_mon_1701(lead7,2:3); ctr_ext1(7,1,1:2)=sie_mon_1701(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1702.txt; ctr_ext(7,7,1:2)=sie_mon_1702(lead7,2:3); ctr_ext1(7,2,1:2)=sie_mon_1702(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1703.txt; ctr_ext(7,8,1:2)=sie_mon_1703(lead7,2:3); ctr_ext1(7,3,1:2)=sie_mon_1703(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1704.txt; ctr_ext(7,9,1:2)=sie_mon_1704(lead7,2:3); ctr_ext1(7,4,1:2)=sie_mon_1704(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1705.txt; ctr_ext(7,10,1:2)=sie_mon_1705(lead7,2:3);ctr_ext1(7,5,1:2)=sie_mon_1705(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1706.txt; ctr_ext(7,11,1:2)=sie_mon_1706(lead7,2:3);ctr_ext1(7,6,1:2)=sie_mon_1706(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1707.txt; ctr_ext(7,12,1:2)=sie_mon_1707(lead7,2:3);ctr_ext1(7,7,1:2)=sie_mon_1707(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1708.txt; ctr_ext(8,1,1:2)=sie_mon_1708(lead7,2:3); ctr_ext1(7,8,1:2)=sie_mon_1708(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1709.txt; ctr_ext(8,2,1:2)=sie_mon_1709(lead7,2:3); ctr_ext1(7,9,1:2)=sie_mon_1709(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1710.txt; ctr_ext(8,3,1:2)=sie_mon_1710(lead7,2:3); ctr_ext1(7,10,1:2)=sie_mon_1710(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1711.txt; ctr_ext(8,4,1:2)=sie_mon_1711(lead7,2:3); ctr_ext1(7,11,1:2)=sie_mon_1711(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/sie_mon_1712.txt; ctr_ext(8,5,1:2)=sie_mon_1712(lead7,2:3); ctr_ext1(7,12,1:2)=sie_mon_1712(lead1,2:3);

%%%%%%%%%%%%%%5

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1104.txt; ctr_vol(1,9,1:2)=siv_mon_1104(lead7,2:3); ctr_vol1(1,4,1:2)=siv_mon_1104(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1105.txt; ctr_vol(1,10,1:2)=siv_mon_1105(lead7,2:3);ctr_vol1(1,5,1:2)=siv_mon_1105(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1106.txt; ctr_vol(1,11,1:2)=siv_mon_1106(lead7,2:3);ctr_vol1(1,6,1:2)=siv_mon_1106(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1107.txt; ctr_vol(1,12,1:2)=siv_mon_1107(lead7,2:3);ctr_vol1(1,7,1:2)=siv_mon_1107(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1108.txt; ctr_vol(2,1,1:2)=siv_mon_1108(lead7,2:3); ctr_vol1(1,8,1:2)=siv_mon_1108(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1109.txt; ctr_vol(2,2,1:2)=siv_mon_1109(lead7,2:3); ctr_vol1(1,9,1:2)=siv_mon_1109(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1110.txt; ctr_vol(2,3,1:2)=siv_mon_1110(lead7,2:3); ctr_vol1(1,10,1:2)=siv_mon_1110(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1111.txt; ctr_vol(2,4,1:2)=siv_mon_1111(lead7,2:3); ctr_vol1(1,11,1:2)=siv_mon_1111(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1112.txt; ctr_vol(2,5,1:2)=siv_mon_1112(lead7,2:3); ctr_vol1(1,12,1:2)=siv_mon_1112(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1201.txt; ctr_vol(2,6,1:2)=siv_mon_1201(lead7,2:3); ctr_vol1(2,1,1:2)=siv_mon_1201(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1202.txt; ctr_vol(2,7,1:2)=siv_mon_1202(lead7,2:3); ctr_vol1(2,2,1:2)=siv_mon_1202(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1203.txt; ctr_vol(2,8,1:2)=siv_mon_1203(lead7,2:3); ctr_vol1(2,3,1:2)=siv_mon_1203(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1204.txt; ctr_vol(2,9,1:2)=siv_mon_1204(lead7,2:3); ctr_vol1(2,4,1:2)=siv_mon_1204(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1205.txt; ctr_vol(2,10,1:2)=siv_mon_1205(lead7,2:3);ctr_vol1(2,5,1:2)=siv_mon_1205(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1206.txt; ctr_vol(2,11,1:2)=siv_mon_1206(lead7,2:3);ctr_vol1(2,6,1:2)=siv_mon_1206(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1207.txt; ctr_vol(2,12,1:2)=siv_mon_1207(lead7,2:3);ctr_vol1(2,7,1:2)=siv_mon_1207(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1208.txt; ctr_vol(3,1,1:2)=siv_mon_1208(lead7,2:3); ctr_vol1(2,8,1:2)=siv_mon_1208(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1209.txt; ctr_vol(3,2,1:2)=siv_mon_1209(lead7,2:3); ctr_vol1(2,9,1:2)=siv_mon_1209(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1210.txt; ctr_vol(3,3,1:2)=siv_mon_1210(lead7,2:3); ctr_vol1(2,10,1:2)=siv_mon_1210(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1211.txt; ctr_vol(3,4,1:2)=siv_mon_1211(lead7,2:3); ctr_vol1(2,11,1:2)=siv_mon_1211(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1212.txt; ctr_vol(3,5,1:2)=siv_mon_1212(lead7,2:3); ctr_vol1(2,12,1:2)=siv_mon_1212(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1301.txt; ctr_vol(3,6,1:2)=siv_mon_1301(lead7,2:3); ctr_vol1(3,1,1:2)=siv_mon_1301(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1302.txt; ctr_vol(3,7,1:2)=siv_mon_1302(lead7,2:3); ctr_vol1(3,2,1:2)=siv_mon_1302(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1303.txt; ctr_vol(3,8,1:2)=siv_mon_1303(lead7,2:3); ctr_vol1(3,3,1:2)=siv_mon_1303(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1304.txt; ctr_vol(3,9,1:2)=siv_mon_1304(lead7,2:3); ctr_vol1(3,4,1:2)=siv_mon_1304(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1305.txt; ctr_vol(3,10,1:2)=siv_mon_1305(lead7,2:3);ctr_vol1(3,5,1:2)=siv_mon_1305(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1306.txt; ctr_vol(3,11,1:2)=siv_mon_1306(lead7,2:3);ctr_vol1(3,6,1:2)=siv_mon_1306(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1307.txt; ctr_vol(3,12,1:2)=siv_mon_1307(lead7,2:3);ctr_vol1(3,7,1:2)=siv_mon_1307(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1308.txt; ctr_vol(4,1,1:2)=siv_mon_1308(lead7,2:3); ctr_vol1(3,8,1:2)=siv_mon_1308(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1309.txt; ctr_vol(4,2,1:2)=siv_mon_1309(lead7,2:3); ctr_vol1(3,9,1:2)=siv_mon_1309(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1310.txt; ctr_vol(4,3,1:2)=siv_mon_1310(lead7,2:3); ctr_vol1(3,10,1:2)=siv_mon_1310(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1311.txt; ctr_vol(4,4,1:2)=siv_mon_1311(lead7,2:3); ctr_vol1(3,11,1:2)=siv_mon_1311(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1312.txt; ctr_vol(4,5,1:2)=siv_mon_1312(lead7,2:3); ctr_vol1(3,12,1:2)=siv_mon_1312(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1401.txt; ctr_vol(4,6,1:2)=siv_mon_1401(lead7,2:3); ctr_vol1(4,1,1:2)=siv_mon_1401(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1402.txt; ctr_vol(4,7,1:2)=siv_mon_1402(lead7,2:3); ctr_vol1(4,2,1:2)=siv_mon_1402(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1403.txt; ctr_vol(4,8,1:2)=siv_mon_1403(lead7,2:3); ctr_vol1(4,3,1:2)=siv_mon_1403(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1404.txt; ctr_vol(4,9,1:2)=siv_mon_1404(lead7,2:3); ctr_vol1(4,4,1:2)=siv_mon_1404(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1405.txt; ctr_vol(4,10,1:2)=siv_mon_1405(lead7,2:3);ctr_vol1(4,5,1:2)=siv_mon_1405(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1406.txt; ctr_vol(4,11,1:2)=siv_mon_1406(lead7,2:3);ctr_vol1(4,6,1:2)=siv_mon_1406(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1407.txt; ctr_vol(4,12,1:2)=siv_mon_1407(lead7,2:3);ctr_vol1(4,7,1:2)=siv_mon_1407(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1408.txt; ctr_vol(5,1,1:2)=siv_mon_1408(lead7,2:3); ctr_vol1(4,8,1:2)=siv_mon_1408(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1409.txt; ctr_vol(5,2,1:2)=siv_mon_1409(lead7,2:3); ctr_vol1(4,9,1:2)=siv_mon_1409(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1410.txt; ctr_vol(5,3,1:2)=siv_mon_1410(lead7,2:3); ctr_vol1(4,10,1:2)=siv_mon_1410(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1411.txt; ctr_vol(5,4,1:2)=siv_mon_1411(lead7,2:3); ctr_vol1(4,11,1:2)=siv_mon_1411(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1412.txt; ctr_vol(5,5,1:2)=siv_mon_1412(lead7,2:3); ctr_vol1(4,12,1:2)=siv_mon_1412(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1501.txt; ctr_vol(5,6,1:2)=siv_mon_1501(lead7,2:3); ctr_vol1(5,1,1:2)=siv_mon_1501(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1502.txt; ctr_vol(5,7,1:2)=siv_mon_1502(lead7,2:3); ctr_vol1(5,2,1:2)=siv_mon_1502(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1503.txt; ctr_vol(5,8,1:2)=siv_mon_1503(lead7,2:3); ctr_vol1(5,3,1:2)=siv_mon_1503(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1504.txt; ctr_vol(5,9,1:2)=siv_mon_1504(lead7,2:3); ctr_vol1(5,4,1:2)=siv_mon_1504(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1505.txt; ctr_vol(5,10,1:2)=siv_mon_1505(lead7,2:3);ctr_vol1(5,5,1:2)=siv_mon_1505(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1506.txt; ctr_vol(5,11,1:2)=siv_mon_1506(lead7,2:3);ctr_vol1(5,6,1:2)=siv_mon_1506(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1507.txt; ctr_vol(5,12,1:2)=siv_mon_1507(lead7,2:3);ctr_vol1(5,7,1:2)=siv_mon_1507(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1508.txt; ctr_vol(6,1,1:2)=siv_mon_1508(lead7,2:3); ctr_vol1(5,8,1:2)=siv_mon_1508(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1509.txt; ctr_vol(6,2,1:2)=siv_mon_1509(lead7,2:3); ctr_vol1(5,9,1:2)=siv_mon_1509(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1510.txt; ctr_vol(6,3,1:2)=siv_mon_1510(lead7,2:3); ctr_vol1(5,10,1:2)=siv_mon_1510(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1511.txt; ctr_vol(6,4,1:2)=siv_mon_1511(lead7,2:3); ctr_vol1(5,11,1:2)=siv_mon_1511(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1512.txt; ctr_vol(6,5,1:2)=siv_mon_1512(lead7,2:3); ctr_vol1(5,12,1:2)=siv_mon_1512(lead1,2:3);
%ctr_vol(5,9,1)
%siv_mon_1504(6,2)

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1601.txt; ctr_vol(6,6,1:2)=siv_mon_1601(lead7,2:3); ctr_vol1(6,1,1:2)=siv_mon_1601(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1602.txt; ctr_vol(6,7,1:2)=siv_mon_1602(lead7,2:3); ctr_vol1(6,2,1:2)=siv_mon_1602(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1603.txt; ctr_vol(6,8,1:2)=siv_mon_1603(lead7,2:3); ctr_vol1(6,3,1:2)=siv_mon_1603(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1604.txt; ctr_vol(6,9,1:2)=siv_mon_1604(lead7,2:3); ctr_vol1(6,4,1:2)=siv_mon_1604(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1605.txt; ctr_vol(6,10,1:2)=siv_mon_1605(lead7,2:3);ctr_vol1(6,5,1:2)=siv_mon_1605(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1606.txt; ctr_vol(6,11,1:2)=siv_mon_1606(lead7,2:3);ctr_vol1(6,6,1:2)=siv_mon_1606(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1607.txt; ctr_vol(6,12,1:2)=siv_mon_1607(lead7,2:3);ctr_vol1(6,7,1:2)=siv_mon_1607(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1608.txt; ctr_vol(7,1,1:2)=siv_mon_1608(lead7,2:3); ctr_vol1(6,8,1:2)=siv_mon_1608(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1609.txt; ctr_vol(7,2,1:2)=siv_mon_1609(lead7,2:3); ctr_vol1(6,9,1:2)=siv_mon_1609(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1610.txt; ctr_vol(7,3,1:2)=siv_mon_1610(lead7,2:3); ctr_vol1(6,10,1:2)=siv_mon_1610(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1611.txt; ctr_vol(7,4,1:2)=siv_mon_1611(lead7,2:3); ctr_vol1(6,11,1:2)=siv_mon_1611(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1612.txt; ctr_vol(7,5,1:2)=siv_mon_1612(lead7,2:3); ctr_vol1(6,12,1:2)=siv_mon_1612(lead1,2:3);

load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1701.txt; ctr_vol(7,6,1:2)=siv_mon_1701(lead7,2:3); ctr_vol1(7,1,1:2)=siv_mon_1701(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1702.txt; ctr_vol(7,7,1:2)=siv_mon_1702(lead7,2:3); ctr_vol1(7,2,1:2)=siv_mon_1702(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1703.txt; ctr_vol(7,8,1:2)=siv_mon_1703(lead7,2:3); ctr_vol1(7,3,1:2)=siv_mon_1703(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1704.txt; ctr_vol(7,9,1:2)=siv_mon_1704(lead7,2:3); ctr_vol1(7,4,1:2)=siv_mon_1704(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1705.txt; ctr_vol(7,10,1:2)=siv_mon_1705(lead7,2:3);ctr_vol1(7,5,1:2)=siv_mon_1705(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1706.txt; ctr_vol(7,11,1:2)=siv_mon_1706(lead7,2:3);ctr_vol1(7,6,1:2)=siv_mon_1706(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1707.txt; ctr_vol(7,12,1:2)=siv_mon_1707(lead7,2:3);ctr_vol1(7,7,1:2)=siv_mon_1707(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1708.txt; ctr_vol(8,1,1:2)=siv_mon_1708(lead7,2:3); ctr_vol1(7,8,1:2)=siv_mon_1708(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1709.txt; ctr_vol(8,2,1:2)=siv_mon_1709(lead7,2:3); ctr_vol1(7,9,1:2)=siv_mon_1709(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1710.txt; ctr_vol(8,3,1:2)=siv_mon_1710(lead7,2:3); ctr_vol1(7,10,1:2)=siv_mon_1710(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1711.txt; ctr_vol(8,4,1:2)=siv_mon_1711(lead7,2:3); ctr_vol1(7,11,1:2)=siv_mon_1711(lead1,2:3);
load /scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/siv_mon_1712.txt; ctr_vol(8,5,1:2)=siv_mon_1712(lead7,2:3); ctr_vol1(7,12,1:2)=siv_mon_1712(lead1,2:3);

xdim1=[1:12]; xdim2=[2:13]; xdim3=[3:14]; xdim4=[4:15]; xdim5=[5:16]; xdim6=[6:17];
xdim7=[7:18]; xdim8=[8:19]; xdim9=[9:20]; xdim10=[10:21]; xdim11=[11:22]; xdim12=[12:23]; xdim13=[13:24];

ctr_ext1(ctr_ext1 <= 0) = NaN; ctr_ext(ctr_ext <= 0) = NaN;
ctr_vol1(ctr_vol1 <= 0) = NaN; ctr_vol(ctr_vol <= 0) = NaN;

months = ['Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'; 'Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sep'; 'Oct'; 'Nov'; 'Dec'];
load /home/Shan.Sun/helpme/post_cice/nsidc_nh_ext_2011_2018.txt;         obn=nsidc_nh_ext_2011_2018(:,2:13);
load /home/Shan.Sun/helpme/post_cice/nsidc_sh_ext_2011_2018.txt;         obs=nsidc_sh_ext_2011_2018(:,2:13);
load /home/Shan.Sun/helpme/post_cice/siv_nh_CS2_obs_2011_2017_sep2022.txt; obs_cs2=siv_nh_CS2_obs_2011_2017_sep2022(:,2:13);
load /home/Shan.Sun/helpme/post_cice/piomas_nh_vol_2011_2017.txt;    obs_uw=piomas_nh_vol_2011_2017(:,2:13);
obs_cs2(obs_cs2 <= 0) = NaN;

std_ext0(:,:,1)=nanstd(obn,1);
ave_ext0(:,:,1)=nanmean(obn,1);
std_ext0(:,:,2)=nanstd(obs,1);
ave_ext0(:,:,2)=nanmean(obs,1);
std_ext7=nanstd(ctr_ext,1);  std_ext1=nanstd(ctr_ext1,1);
ave_ext7=nanmean(ctr_ext,1); ave_ext1=nanmean(ctr_ext1,1);

std_vol0=nanstd(obs_cs2,1);  
ave_vol0=nanmean(obs_cs2,1);
std_vol00=nanstd(obs_uw,1);
ave_vol00=nanmean(obs_uw,1);
std_vol7=nanstd(ctr_vol,1); std_vol1=nanstd(ctr_vol1,1);
ave_vol7=nanmean(ctr_vol,1);ave_vol1=nanmean(ctr_vol1,1);

i1=.08; w=0.41; hgt=0.36; hspace=0.08; vspace=0.10;
j1=.55; txt1=8; txt2=10;
for n=1:4
if (n<=2) ymin=0;ymax=34;end
if (n==3) ymin=0;ymax=38;end
if (n==3) i1=0.08; j1=0.1; end
if (n==2) i1=i1+w+hspace; j1=.55; end
if (n==4) i1=0.08+w+hspace; j1=.1; end
axes('position',[i1,j1,w,hgt])

if (n <= 2) 
errorbar(ave_ext0(:,:,n),std_ext0(:,:,n),'k'); hold on
errorbar(ave_ext1(:,:,n),std_ext1(:,:,n),'r'); hold on
errorbar(ave_ext7(:,:,n),std_ext7(:,:,n),'b'); hold on
ylabel ('10^6km^2','fontsize',8)
end
if (n==1) title ('(a) Arctic SIE: Mean and STD','fontsize',txt2); 
text(6.8,ymax*.88,'CTRL 0.5mo Lead','FontSize',txt1,'color','r');
text(6.8,ymax*.78,'CTRL 5.5mo Lead','FontSize',txt1,'color','b');
text(6.8,ymax*.68,'NSIDC','FontSize',txt1,'color','k');
end
if (n==2) title ('(c) Antarctic SIE: Mean and STD','fontsize',txt2); 
text(2.2,ymax*.88,'CTRL 0.5mo Lead','FontSize',txt1,'color','r');
text(2.2,ymax*.78,'CTRL 5.5mo Lead','FontSize',txt1,'color','b');
text(2.2,ymax*.68,'NSIDC','FontSize',txt1,'color','k');
end

if (n > 2) 
errorbar(ave_vol7(:,:,n-2),std_vol7(:,:,n-2),'b'); hold on
errorbar(ave_vol1(:,:,n-2),std_vol1(:,:,n-2),'r'); hold on
ylabel ('10^3km^3','fontsize',8)
end
if (n==3) errorbar(ave_vol0,std_vol0,'k'); hold on; 
          errorbar(ave_vol00,std_vol00,'g'); hold on;
text(7.1,ymax*.92,'CTRL 0.5mo Lead','FontSize',txt1,'color','r');
text(7.1,ymax*.82,'CTRL 5.5mo Lead','FontSize',txt1,'color','b');
text(7.1,ymax*.72,'PIOMAS','FontSize',txt1,'color','g');
text(7.1,ymax*.62,'CryoSat-2','FontSize',txt1,'color','k');
          title ('(b) Arctic SIV: Mean and STD','fontsize',txt2); end
if (n==4) title ('(d) Antarctic SIV: Mean and STD','fontsize',txt2); 
text(2.2,ymax*.92,'CTRL 0.5mo Lead','FontSize',txt1,'color','r'); 
text(2.2,ymax*.82,'CTRL 5.5mo Lead','FontSize',txt1,'color','b'); end

grid
axis([1 12 ymin ymax])
set(gca,'xticklabel',[])
set(gca,'fontsize',8)
for m=1:12
text(m-.1,ymin-(ymax-ymin)*.020,months(m,1:1),'FontSize',6)
end
xlabel ('Target Month','fontsize',8)
%yticks([0 7 14 21 28])
%yticklabels({'0','7','14','21','28'})
%a = get(gca,'yTickLabel');  
%set(gca,'yTickLabel',a,'fontsize',8)

end % n=

print -depsc2 fig01_sie_siv_std.eps
