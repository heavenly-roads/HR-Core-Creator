@echo off
setlocal EnableDelayedExpansion

cd /d "%~dp0"

:: ==========================================================
:: Configuration
:: ==========================================================

:: Enable optimizations (1 = Yes, 0 = No)
set OPTIMIZE_PNG=1
set OPTIMIZE_OGG=1

:: PNG settings
set PNG_QUALITY=80-90
set PNG_SPEED=1
set OXIPNG_LEVEL=6

:: OGG settings (Vorbis quality: 0-10)
:: q0  ≈ 64 kbps
:: q1  ≈ 80 kbps
:: q2  ≈ 96 kbps
:: q3  ≈ 112 kbps
:: q4  ≈ 128 kbps
:: q5  ≈ 160 kbps
:: q6  ≈ 192 kbps
:: q7  ≈ 224 kbps
:: q8  ≈ 256 kbps
:: q9  ≈ 320 kbps
:: q10 ≈ 500+ kbps

:: OGG quality by folder
set OGG_SOUNDS_QUALITY=0
set OGG_MUSIC_QUALITY=3

:: ==========================================================
:: Check required tools
:: ==========================================================

if "%OPTIMIZE_PNG%"=="1" (
    if not exist "pngquant.exe" (
        echo ERROR: pngquant.exe not found.
        pause
        exit /b
    )

    if not exist "oxipng.exe" (
        echo ERROR: oxipng.exe not found.
        pause
        exit /b
    )
)

if "%OPTIMIZE_OGG%"=="1" (
    if not exist "ffmpeg.exe" (
        echo ERROR: ffmpeg.exe not found.
        pause
        exit /b
    )
)

:: ==========================================================
:: Count files
:: ==========================================================

set TOTAL=0

if "%OPTIMIZE_PNG%"=="1" (
    for /R %%f in (*.png) do (
        set /A TOTAL+=1
    )
)

if "%OPTIMIZE_OGG%"=="1" (
    for /R %%f in (*.ogg) do (
        set /A TOTAL+=1
    )
)

if %TOTAL%==0 (
    echo No files to optimize.
    pause
    exit /b
)

echo ==========================================
echo Files found: %TOTAL%
echo ==========================================
echo.

:: ==========================================================
:: Process files
:: ==========================================================

set COUNT=0

:: ---------- PNG ----------

if "%OPTIMIZE_PNG%"=="1" (

    for /R %%f in (*.png) do (

        set /A COUNT+=1
        set /A PERCENT=COUNT*100/TOTAL

        echo [!COUNT!/!TOTAL!] !PERCENT!%% PNG  - %%~nxf

        pngquant.exe ^
            --quality=%PNG_QUALITY% ^
            --speed %PNG_SPEED% ^
            --force ^
            --ext .png ^
            "%%f" >nul

        oxipng.exe ^
            -o %OXIPNG_LEVEL% ^
            --strip all ^
            --force ^
            "%%f" >nul
    )

)

:: ---------- OGG ----------

if "%OPTIMIZE_OGG%"=="1" (

    for /R %%f in (*.ogg) do (

        set /A COUNT+=1
        set /A PERCENT=COUNT*100/TOTAL

        :: Determine OGG quality based on folder
        set "OGG_QUALITY=%OGG_MUSIC_QUALITY%"

        echo %%f | findstr /I /R "\\Sounds\\" >nul
        if not errorlevel 1 set "OGG_QUALITY=%OGG_SOUNDS_QUALITY%"

        echo [!COUNT!/!TOTAL!] !PERCENT!%% OGG  - %%~nxf [q!OGG_QUALITY!]

        ffmpeg.exe ^
            -y ^
            -loglevel error ^
            -i "%%f" ^
            -map_metadata -1 ^
            -c:a libvorbis ^
            -q:a !OGG_QUALITY! ^
            "%%~dpf%%~nf.tmp.ogg"

        if exist "%%~dpf%%~nf.tmp.ogg" (
            move /Y "%%~dpf%%~nf.tmp.ogg" "%%f" >nul
        )

    )

)

echo.
echo ==========================================
echo 100%% Complete.
echo Optimization finished successfully.
echo ==========================================

pause