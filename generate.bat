echo off
setlocal enabledelayedexpansion

rem Repeat for all files ending with the extension '.jmx'
FOR %%f IN (test/*.jmx) DO (
  	echo "current folder:" %CD%

    set fname=%%f
    echo "File Name: "%%f

    cd test
    IF not exist Reports (
    	echo "Inside rep exist"
    	mkdir Reports
    )

	cd Reports
	if exist %%f-reports (
		echo "Inside exist"
		rmdir /s /q %%f-reports
		mkdir %%f-reports
		if exist %%f-reports.csv ( del %%f-reports.csv )
	) else (
		mkdir %%f-reports
	)
	cd..
	catemeter -Jport=5556 -n -t %%f -l Reports/%%f-reports.csv -e -o Reports/%%f-reports
)
cd..
pause
