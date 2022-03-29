REM compiles AGG MkWgt and GTPVEW programs
echo on
del agg.?x?
del gtpvew.?x?
del mkwgt.?x?
del *.for
del *.log
tablo -sti agg.sti >tbAgg.log
if errorlevel 1 goto errbat
tablo -sti gtpvew.sti >tbGtpvew.log
if errorlevel 1 goto errbat
tablo -sti mkwgt.sti >tbMkwgt.log
if errorlevel 1 goto errbat
call ltg agg
if errorlevel 1 goto errbat
call ltg mkwgt
if errorlevel 1 goto errbat
call ltg gtpvew
if errorlevel 1 goto errbat
echo on
rem cleanup junk
del *.mod
del *.lib
del *.for
del *.inf
del *.bak
del *.min
del *.mnc
del opt
del opt90
del modtable.txt
goto OKbat
:errbat
echo on
echo Error see last log file in list below 
dir/od *.log
goto Endbat
:OKbat
echo JOB RAN OK
dir/od *.exe 
:endbat
