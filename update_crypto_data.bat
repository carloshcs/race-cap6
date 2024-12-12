@echo off

REM Navigate to the working directory
cd "C:\Engenharia\Dashboard crypto\stream_test"

REM Run the Python script
python get_crypto_data.py

REM Check for errors during execution
IF ERRORLEVEL 1 (
    echo "Python script encountered an error."
    pause
    exit /b %ERRORLEVEL%
)

REM Wait for 1 hour
echo Waiting for 1 hour...
timeout /t 3600 /nobreak

REM Initialize Git if not already done
IF NOT EXIST ".git" (
    git init
    git remote add origin https://github.com/carloshcs/race-cap5.git
)

REM Verify Git remote
git remote -v

REM Stage all changes
git add .

REM Commit the changes
git commit -m "Prepare files for Heroku deployment"

REM Set the branch to main
git branch -M main

REM Force push to the remote repository
git push -u origin main --force

echo Data updated and pushed to GitHub.
pause
