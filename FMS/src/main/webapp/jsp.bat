for /r %1\WEB-INF\view %%i in (*.jsp) do del /q "%%i"
for /r %1\WEB-INF\view %%i in (*.html) do ren "%%i" "%%~ni.jsp"