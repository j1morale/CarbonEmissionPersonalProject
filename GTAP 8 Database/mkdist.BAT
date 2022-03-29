REM this is file MKDIST.BAT for GTAPAgg
REM revised Mar 2012
del gtapagg.zip
del aggpatch.zip
del setup.zip
REM next will have the effect of making all final users file read-only
REM a safety precaution
attrib +R *.*

zip setup setup.*

REM *************************************************
REM Generic files prepared by JMH
zip gtapagg gtapagg.exe gtapagg.chm gtpagopt.ini aggharx.exe gview.* aggedit.exe
zip gtapagg gtaphs*.xls regions.xls ViewHAR.* Charter.* TeeUser.hlp setup.zip tlica.exe gdxiomh.dll

zip gtapagg agg.TAB agg.?X? agg.STI mkwgt.TAB mkwgt.?X? mkwgt.sti

zip gtapagg GTPVEW.TAB GTPVEW.?X? GTPVEW.STI mkdist.BAT compiles.BAT 
REM next optional
zip gtapagg GTAPSAM.TAB GTAPSAM.?X?  

REM files above are included in program patch
copy gtapagg.zip aggpatch.zip
zip -d aggpatch *.har
zip -d aggpatch *.HAR
REM files below are NOT included in program patch

REM if line below were NOT commented out DEFAULT.LIC would be included
REM zip gtapagg default.lic

REM *************************************************
REM next are the data files to be prepared by Purdue
zip gtapagg sets.har default.prm default.agg
REM include next 2 below for encrypted data, otherwise just basedata.HAR
zip gtapagg basedata.HRX prmwgt.har
REM include below for optional time series file
zip gtapagg TSTRADE.HAR
REM include below for optional energy file
zip gtapagg gsdvole.HAR
zip gtapagg co2.HAR
zip gtapagg metadata.HAR
REM switch off ReadOnly
attrib -R *.*

dir gtapagg.zip

Rem next line makes 2nd zip which includes setup programs
del gtapagg2.zip
zip gtapagg2 setup.* gtapagg2 gtapagg.zip

dir *.zip/od
REM aggpatch.zip contains just the patch components
REM gtapagg.zip contains all GTAPAGG components--distribute with SETUP.*
REM gtapagg2.zip contains GTAPAGG.ZIP and SETUP.* within it--for single file web use 
REM end of file

