@ECHO off

:: The following uses SQLCMD utility to run a SQL script that creates
:: the Halloween database.  If the one using localhost\SQLExpress results in error
:: messages, comment it out, and uncomment the other SQLCMD line that currently
:: is commented out - the one using localdb v11.0.  That creates a local database file. 

ECHO Attempting to create the Halloween database . . . 

sqlcmd -S localhost\SQLExpress -E /i create_database.sql

:: sqlcmd -S (localdb)\v11.0 -i create_database.sql

ECHO.
ECHO If no error message is shown, then the database was created successfully.
ECHO.
PAUSE