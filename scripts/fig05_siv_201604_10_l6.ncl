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
       cntrs=(/10,20,30,40,50,60,70,80,90/) ; aice
    end if
    if (varname .eq. "hi") then
      cntrs=(/.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5/)
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
    res@cnLevelSelectionMode = "ExplicitLevels"     ; set manual contour levels
    res@cnLinesOn = False
    res@cnLineLabelsOn = False                    ; turn the line labels off
    if( hemisphere .eq. "NH") then
        res@mpMinLatF = 60
    else
        res@mpMaxLatF = -60
    end if
    res@cnLevels       = cntrs
    res@cnFillColors = (/3,4,6,7,9,13,14,15,16,17/)
    res@cnMinLevelValF = cntrs(0)
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

    lmon=6; lm6
    hemisphere = "NH"

    nn=1 ; IC Apr2016
    fin1 = "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/mon_2016_04.nc"
    fin10= "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cfsr_run/ic_16_04_01.nc"
    fin2 = "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/mon_2016_04.nc"
    fin20= "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/ic_16_04_01.nc"
    fobs1= "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/ic_16_04_01.nc"
    fobs2= "/scratch2/BMC/gsd-fv3-dev/sun/cice_result/cryo_run/ic_16_10_01.nc"

    fi = addfile(fin1,"r")
    tlon2d = fi->TLON
    tlat2d = fi->TLAT
    ulon2d = fi->ULON
    ulat2d = fi->ULAT
    varname = "hi"
    qqq = fi->hi(lmon,:,:)
    qqq@lon2d = tlon2d
    qqq@lat2d = tlat2d
    ; same variable but incorrectly in ugrid
    uice = qqq
    uice@lon2d = ulon2d
    uice@lat2d = ulat2d
    ; extended tgrid by using ugrid in the gap
    x2 = fillGap(qqq,ulat2d,ulon2d)
    ulat = x2@lat2d
    ulon = x2@lon2d
    ; mask small values of ice concentration
    qqq = maskIce(qqq,hemisphere)
    uice = maskIce(uice,hemisphere)
    x2 = maskIce(x2,hemisphere)
    ; printVarSummary(ulat)
    ; printVarSummary(ulon)
    ; printVarSummary(eice)

    fi = addfile(fin2,"r")
    qqq = fi->hi(lmon,:,:)
    y2 = fillGap(qqq,ulat2d,ulon2d)
    y2 = maskIce(y2,hemisphere)

    fi = addfile(fin10,"r")
    qqq = fi->hi_d(:,:)
    x1 = fillGap(qqq,ulat2d,ulon2d)
    x1 = maskIce(x1,hemisphere)

    fi = addfile(fin20,"r")
    qqq = fi->hi_d(:,:)
    y1 = fillGap(qqq,ulat2d,ulon2d)
    y1 = maskIce(y1,hemisphere)

    fi = addfile(fobs1,"r")
    qqq = fi->hi_d(:,:)
    obs1= fillGap(qqq,ulat2d,ulon2d)
    obs1= maskIce(obs1,hemisphere)

    fi = addfile(fobs2,"r")
    qqq = fi->hi_d(:,:)
    obs2= fillGap(qqq,ulat2d,ulon2d)
    obs2= maskIce(obs2,hemisphere)

    ; colourmap
    ;wks = gsn_open_wks("x11", "sie_201610_l6")
     wks = gsn_open_wks("png",get_script_prefix_name())
    plot = new(6,graphic) ; create a plot array
    cmap = "precip2_17lev";"perc2_9lev";
    gsn_define_colormap(wks,cmap)

    res = setPolarPlotResources(varname,hemisphere)
    res@lbLabelBarOn        = False           ; turn off individual cb's
    res@tiMainString    = ""
    res@gsnLeftString   = ""
    res@gsnRightString  = ""
    res@gsnCenterStringFontHeightF = 0.035
    if (nn.eq.1) then
      res@gsnCenterString = "Ctrl IC=1Apr2016"
    else
      res@gsnCenterString = "Ctrl IC=1Oct2016"
    end if
    plot(0) = gsn_csm_contour_map_polar(wks,x1,res)

    if (nn.eq.1) then
      res@gsnCenterString = "CS2_IC IC=1Apr2016"
    else
      res@gsnCenterString = "CS2_IC IC=1Oct2016"
    end if
    plot(1) = gsn_csm_contour_map_polar(wks,y1,res)

    if (nn.eq.1) then
      res@gsnCenterString = "CryoSat-2 Apr2016"
    else
      res@gsnCenterString = "CryoSat-2 Oct2016"
    end if
    plot(2) = gsn_csm_contour_map_polar(wks,obs1,res)

    if (nn.eq.1) then
      res@gsnCenterString = "Ctrl Fcst=Oct2016"
    else
      res@gsnCenterString = "Ctrl Fcst=Apr2017"
    end if
    plot(3) = gsn_csm_contour_map_polar(wks,x2,res)

    if (nn.eq.1) then
      res@gsnCenterString = "CS2_IC Fcst=Oct2016"
    else
      res@gsnCenterString = "CS2_IC Fcst=Apr2017"
    end if
    plot(4) = gsn_csm_contour_map_polar(wks,y2,res)

    if (nn.eq.1) then
      res@gsnCenterString = "CryoSat-2 Oct2016"
    else
      res@gsnCenterString = "CryoSat-2 Apr2017"
    end if
    plot(5) = gsn_csm_contour_map_polar(wks,obs2,res)
    title_margin           = 0.0005
    resP = True
    resP@gsnPanelMainString = "Sea Ice Thickness (m)"
    resP@gsnPanelLabelBar    = True                ; add common colorbar
    resP@lbLabelFontHeightF  = 0.015               ; make labels smaller
    resP@lbTitleOn        =  True
    resP@lbTitleString  = "m"               ; add unit
    resP@lbTitlePosition  = "Right"
    resP@lbTitleFontHeightF  = 0.015
    resP@lbTitleDirection  = "Across"
    resP@gsnMaximize      = True             ; maximize plot area
    gsn_panel(wks, plot, (/2,3/),resP)
end
