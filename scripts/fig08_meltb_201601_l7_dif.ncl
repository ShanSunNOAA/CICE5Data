;*************************************************
; NCL Graphics: ice_4.ncl
;
; Concepts illustrated:
;    - Plotting ice data
;    - Filling gap between poles in CICE T-fold Tripole grid correctly
;     
; See http://oceans11.lanl.gov/trac/CICE; in particular the
; discussion of the T-fold Tripole GRID in the 
; CICE Documentation and User's Guide (PDF)
;
; In simplistic terms, the T-fold grid has an apparent gap that 
; manifests as a line between the two northern poles. The U-fold grid
; does not have the gap but since this data is aligned to the T-fold
; grid, it is displaced slightly from its correct position if drawn using the 
; U-fold grid. The solution is to add the top row of the U-fold grid
; to the T-grid prior to drawing.
; 
; Thanks to Petteri Uotila of CSIRO Marine & Atmospheric Research
; in Aspendale, Victoria, Australia for providing this solution.
;
;*************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

function fillArray(xi,xigap)
local dimxi, xo
begin
    dimxi = dimsizes(xi)
    ; add an extra row 
    xo = new((/dimxi(0)+1,dimxi(1)/),typeof(xi),getVarFillValue(xi))
    ; copy the original data
    xo(:dimxi(0)-1,:) = xi
    ; this line fills the extra cells with data in xigap
    xo(dimxi(0),:) = xigap(dimxi(0)-1,:)
    return(xo)
end

function fillGap(xi,ulat,ulon)
local xo, ulato, ulono
begin
    ; extend xi and fill with values next to extensions
    xo = fillArray(xi,xi)
    ; because 2d coordinates have been copied from xi and
    ; are of different dimsize than xo we need to delete them.
    ; Alternatively we could xo = (/' xi '/) but other 
    ; it is useful to copy all other attributes 
    delete(xo@lat2d)
    delete(xo@lon2d)
    ; locations in extensions are based on ulat and ulon
    ulato = fillArray(xi@lat2d,ulat)
    ulono = fillArray(xi@lon2d,ulon)
    xo@lat2d = ulato
    xo@lon2d = ulono
    return(xo)
end

function getContourLevels(varname,hemisphere)
begin
    if (varname .eq. "aice") then
       cntrs=(/10,25,40,50,60,70,80,85,90/) ; 9 numbers aice
    end if
    if (varname .eq. "hi") then
      cntrs=(/.3,0.7,1.1,1.5,1.9,2.3,2.7,3.1,3.5/) 
    end if
    if (varname .eq. "dm") then
       cntrs=(/-1.2,-.8,-.4,-.2,.2,.4,.8,1.2/) ; 8 numbers
    end if
    if (varname .eq. "daice") then
       cntrs=(/-25,-15,-5,-2,2,5,15,25/) ; 8 numbers aice
    end if
    if (varname .eq. "dhi") then
       cntrs=(/-2,-1.5,-1,-.5,.5,1.,1.5,2./) ; 8 numbers aice
    end if
    return(cntrs)
end

function setPolarPlotResources(varname,hemisphere)
    local NH_Pcntrs, SH_Pcntrs
begin
    ; add here a function that returns contours for different variables
    cntrs=getContourLevels(varname,hemisphere) ; aice
    ; resources settings good for sea-ice polar plots
    res = True
;
;   if panelling uncomment the next 2 lines and comment the line following
;   
    res@gsnDraw  = False
    res@gsnFrame = False
    res@gsnMaximize = True
;
    res@gsnPolar = hemisphere
    res@cnFillOn = True
    res@mpFillOn = False
    res@mpPerimDrawOrder = "PostDraw"
    res@gsnSpreadColors = True
    res@gsnSpreadColorStart  = 3
    res@gsnAddCyclic        = True
    res@cnLinesOn = False
    res@cnLineLabelsOn = False                    ; turn the line labels off
    if( hemisphere .eq. "NH") then
        res@mpMinLatF = 67.5
        res@mpMinLatF = 60
    else
        res@mpMaxLatF = -60
    end if
    res@cnLevelSelectionMode = "ExplicitLevels"     ; set manual contour levels
    res@cnLevels       = cntrs
    res@cnMinLevelValF = cntrs(0)
    res@cnFillColors = (/3,4,6,7,9,13,14,15,16,17/) ;precip2_17lev
    res@lbLabelFontHeightF  = 0.022
    return(res) 
end

function setPolarPlotResources_diff(varname,hemisphere)
    local NH_Pcntrs, SH_Pcntrs
begin
    ; add here a function that returns contours for different variables
    cntrs=getContourLevels(varname,hemisphere) ; aice
    ; resources settings good for sea-ice polar plots
    res = True
;
;   if panelling uncomment the next 2 lines and comment the line following
;   
    res@gsnDraw  = False
    res@gsnFrame = False
    res@gsnMaximize = True
;
    res@gsnPolar = hemisphere
    res@cnFillOn = True
    res@mpFillOn = False
    res@mpPerimDrawOrder = "PostDraw"
    res@gsnSpreadColors = True
    res@gsnSpreadColorStart  = 3
    res@gsnAddCyclic        = True
    res@cnLinesOn = False
    res@cnLineLabelsOn = False                    ; turn the line labels off
    if( hemisphere .eq. "NH") then
        res@mpMinLatF = 67.5
        res@mpMinLatF = 60
    else
        res@mpMaxLatF = -60
    end if
    res@cnLevelSelectionMode = "ExplicitLevels"     ; set manual contour levels
    res@cnLevels       = cntrs
    res@cnMinLevelValF = cntrs(0)
    res@cnFillColors = (/2,3,4,5,7,9,10,11,12/)
    return(res) 
end

function maskIce(xi,hemisphere)
begin
    tlat2d = xi@lat2d
    size = dimsizes(tlat2d)
    if (size(0) .ne. dimsizes(xi(:,0))) then
      lat2d = tlat2d(:size(0)-2,:)
    else
      lat2d = tlat2d
    end if
    if( hemisphere .eq. "NH") then
        xi = mask(xi, lat2d.lt.50,False)
        xi = mask(xi, xi.lt.0.05,False)
    else
        xi = mask(xi, lat2d.gt.-50,False)
        xi = mask(xi, xi.lt.0.05,False)
    end if
    return(xi)
end

; main routine starts
begin

    lmon=6; 0 is Jan, 6 is Jul
    PRINT_MINMAX=True
    hemisphere = "NH"
    do nn=1,2
    if (nn.eq.1) then
      fin = "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/mon_2016_01.nc"
    else
      fin = "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/mon_2016_01.nc"
    end if
    fi = addfile(fin,"r")
    tlon2d = fi->TLON
    tlat2d = fi->TLAT
    ulon2d = fi->ULON
    ulat2d = fi->ULAT
    xyz    = fi->hi(lmon,:,:)

    xyz@lon2d = tlon2d
    xyz@lat2d = tlat2d
    ; same variable but incorrectly in ugrid
    uice = xyz
    uice@lon2d = ulon2d
    uice@lat2d = ulat2d
    ; extended tgrid by using ugrid in the gap
   ;printVarSummary(xyz)
   ;printVarSummary(ulat2d)
   ;printVarSummary(ulon2d)
    hi = fillGap(xyz,ulat2d,ulon2d)
    ulat = xyz@lat2d
    ulon = xyz@lon2d
    ; mask small values of ice concentration
    hi = maskIce(hi,hemisphere)
    uice = maskIce(uice,hemisphere)
    ; printVarSummary(ulat)
    ; printVarSummary(ulon)
    xyz = fi->meltt(lmon,:,:)
    meltt = fillGap(xyz,ulat2d,ulon2d)

    xyz = fi->meltb(lmon,:,:)
    meltb = fillGap(xyz,ulat2d,ulon2d)

    xyz = fi->meltl(lmon,:,:)
    meltl = fillGap(xyz,ulat2d,ulon2d)

    xyz = 100*fi->aice(lmon,:,:)
    aice = fillGap(xyz,ulat2d,ulon2d)
    aice = maskIce(aice,hemisphere)

    if (PRINT_MINMAX) then
      printVarSummary(meltt)
      printMinMax(meltt , True )
      print("===")
      printVarSummary(meltb)
      printMinMax(meltb , False)
      print("===")
      printVarSummary(meltl)
      printMinMax(meltl , False)
      print("===")
    end if

    if (nn.eq.1) then
      dmeltt=meltt
      dmeltb=meltb
      dmeltl=meltl
      hi1=hi
      aice1=aice
    end if

    end do

    dmeltt=meltt-dmeltt
    dmeltb=meltb-dmeltb

    ; colourmap
   ;wks = gsn_open_wks("x11","siv_201404_l6")
    wks = gsn_open_wks("png",get_script_prefix_name())
    plot1 = new(2,graphic)
    plot2 = new(2,graphic)
    plot3 = new(2,graphic)

      varname="hi"
      cmap ="precip2_17lev";"perc2_9lev";
      gsn_define_colormap(wks,cmap)
      res = setPolarPlotResources(varname,hemisphere)
      res@gsnCenterString = ""
      res@gsnLeftString   = ""
      res@gsnRightString  = ""
      res@gsnSpreadColors = False        ; no longer automatic

      pres1                  = True                ; mods desired
      pres1@gsnFrame         = False               ; save panel until both ready
      pres1@gsnPanelLeft     = 0.03		      ; draw from center to right edge 
      pres1@gsnPanelRight    = 0.33                 ; draw from left edge to center
      pres1@lbLeftMarginF  = 0.03
      pres1@lbLabelFontHeightF  = 0.015      ; make labels smaller
      pres1@gsnPanelMainFontHeightF = 0.0150
      pres1@gsnPanelMainString = "Forecast July 2016 (IC=1Jan2016)"

      pres2=pres1
      pres2@gsnPanelLeft     = 0.35		      ; draw from center to right edge 
      pres2@gsnPanelRight    = 0.65                 ; draw from left edge to center

      pres3=pres1
      pres3@gsnPanelLeft     = 0.67		      ; draw from center to right edge 
      pres3@gsnPanelRight    = 0.97                 ; draw from left edge to center

;;;;;;;;;  1st column

      res@tiMainString    = ""
      res@gsnCenterStringFontHeightF = 0.03
      res@gsnCenterString = "Sea Ice Thickness (m)"
      res@lbTitleOn        =  True
      res@lbTitleString  = "m" ; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"
      plot1(1) = gsn_csm_contour_map_polar(wks,hi1,res)

      res@tiMainFontHeightF    = 0.030 ; 0.025
      res@tiMainString    = "Control"
      varname="aice"
      gsn_define_colormap(wks,cmap)
      res = setPolarPlotResources(varname,hemisphere)
      res@gsnCenterString = "Sea Ice Concentration (%)"
      res@lbTitleOn        =  True
      res@lbTitleString  = "%" ; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"
      plot1(0) = gsn_csm_contour_map_polar(wks,aice1,res)

      gsn_panel(wks,plot1,(/2,1/),pres1)

;;;;;;;;;  2nd column
      varname="dhi"
      cmap ="CBR_coldhot";"BlueDarkRed18";"GMT_no_green"; "seaice_2"; 14  "precip2_15lev"  "cosam12"
      gsn_define_colormap(wks,cmap)
      res = setPolarPlotResources_diff(varname,hemisphere)
      res@tiMainString    = ""

      res@gsnCenterString = "SIT Diff (m)"
      res@lbTitleOn        =  True
      res@lbTitleString  = "m"; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"
      hi=hi-hi1
      plot2(1) = gsn_csm_contour_map_polar(wks,hi,res)

      varname="daice"
      gsn_define_colormap(wks,cmap)
      res = setPolarPlotResources_diff(varname,hemisphere)

      res@tiMainString    = "CS2_IC minus Control"
      res@gsnCenterString = "SIC Diff (%)"
      aice=aice-aice1
      res@lbTitleOn        =  True
      res@lbTitleString  = "%" ; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"
      plot2(0) = gsn_csm_contour_map_polar(wks,aice,res)

      gsn_panel(wks,plot2,(/2,1/),pres2)

;;;;;;;;;  3rd column
      varname="dm"
      gsn_define_colormap(wks,cmap)
      res = setPolarPlotResources_diff(varname,hemisphere)
      res@tiMainString    = "CS2_IC minus Control"

      res@gsnCenterString = "Top Melt Diff (cm/day)"
      res@lbTitleOn        =  True
      res@lbTitleString  = "cm/day" ; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"
      plot3(0) = gsn_csm_contour_map_polar(wks,dmeltt,res)

      res@tiMainString    = ""
      res@gsnCenterString = "Basal Melt Diff (cm/day)"
      res@lbTitleOn        =  True
      res@lbTitleString  = "cm/day" ; add unit
      res@lbTitlePosition  = "Bottom"
      res@lbTitleFontHeightF  = 0.02
      res@lbTitleDirection  = "Across"

      plot3(1) = gsn_csm_contour_map_polar(wks,dmeltb,res)
      gsn_panel(wks,plot3,(/2,1/),pres3)

  frame(wks)
end
