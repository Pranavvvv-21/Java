@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2021 The Apache Software Foundation
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------

@echo off
setlocal

set MAVEN_PROJECT_DIR_FLAG=
set MAVEN_PROJECT_DIR_VALUE=
set MAVEN_SETTINGS_FLAG=
set MAVEN_SETTINGS_VALUE=
set MAVEN_BATCH_FLAG=
set MAVEN_DEBUG_FLAG=
set MAVEN_QUIET_FLAG=
set MAVEN_VERSION_FLAG=
set MAVEN_SHOW_VERSION_FLAG=
set MAVEN_ALSO_MAKE_FLAG=
set MAVEN_ALSO_MAKE_DEPENDENTS_FLAG=
set MAVEN_LOG_FILE_FLAG=
set MAVEN_LOG_FILE_VALUE=
set MAVEN_ENCRYPT_MASTER_PASSWORD_FLAG=
set MAVEN_ENCRYPT_MASTER_PASSWORD_VALUE=
set MAVEN_ENCRYPT_PASSWORD_FLAG=
set MAVEN_ENCRYPT_PASSWORD_VALUE=
set MAVEN_OFFLINE_FLAG=
set MAVEN_NON_RECURSIVE_FLAG=
set MAVEN_ERRORS_FLAG=
set MAVEN_UPDATE_SNAPSHOTS_FLAG=
set MAVEN_NO_PLUGIN_UPDATES_FLAG=
set MAVEN_CHECKSUM_FAILURE_POLICY_FLAG=
set MAVEN_CHECKSUM_WARNING_POLICY_FLAG=
set MAVEN_ALTERNATE_USER_SETTINGS_FLAG=
set MAVEN_ALTERNATE_USER_SETTINGS_VALUE=
set MAVEN_ALTERNATE_GLOBAL_SETTINGS_FLAG=
set MAVEN_ALTERNATE_GLOBAL_SETTINGS_VALUE=
set MAVEN_ALTERNATE_POM_FILE_FLAG=
set MAVEN_ALTERNATE_POM_FILE_VALUE=
set MAVEN_THREADS_FLAG=
set MAVEN_THREADS_VALUE=
set MAVEN_NO_TRANSFER_PROGRESS_FLAG=
set MAVEN_STRICT_CHECKSUMS_FLAG=
set MAVEN_FAIL_AT_END_FLAG=
set MAVEN_FAIL_FAST_FLAG=
set MAVEN_FAIL_NEVER_FLAG=
set MAVEN_RESUME_FROM_FLAG=
set MAVEN_RESUME_FROM_VALUE=
set MAVEN_PROJECTS_FLAG=
set MAVEN_PROJECTS_VALUE=
set MAVEN_DEFINE_FLAG=
set MAVEN_DEFINE_VALUE=
set MAVEN_PROFILES_FLAG=
set MAVEN_PROFILES_VALUE=
set MAVEN_HELP_FLAG=
set MAVEN_FORCE_UPDATE_FLAG=
set MAVEN_WRAPPER_QUIET_FLAG=
set MAVEN_WRAPPER_LAUNCHER_QUIET_FLAG=
set MAVEN_WRAPPER_INITIAL_MAVEN_VERSION_FLAG=
set MAVEN_WRAPPER_INITIAL_MAVEN_VERSION_VALUE=
set MAVEN_WRAPPER_MAVEN_USER_HOME_FLAG=
set MAVEN_WRAPPER_MAVEN_USER_HOME_VALUE=
set MAVEN_WRAPPER_VERBOSE_FLAG=

:loop
if "%1"=="" goto after_loop
  if "%1"=="-D" set MAVEN_DEFINE_FLAG=-D & set MAVEN_DEFINE_VALUE=%MAVEN_DEFINE_VALUE% %2 & shift
  if "%1"=="--define" set MAVEN_DEFINE_FLAG=--define & set MAVEN_DEFINE_VALUE=%MAVEN_DEFINE_VALUE% %2 & shift
  if "%1"=="-P" set MAVEN_PROFILES_FLAG=-P & set MAVEN_PROFILES_VALUE=%MAVEN_PROFILES_VALUE%,%2 & shift
  if "%1"=="--activate-profiles" set MAVEN_PROFILES_FLAG=--activate-profiles & set MAVEN_PROFILES_VALUE=%MAVEN_PROFILES_VALUE%,%2 & shift
  if "%1"=="-pl" set MAVEN_PROJECTS_FLAG=-pl & set MAVEN_PROJECTS_VALUE=%MAVEN_PROJECTS_VALUE%,%2 & shift
  if "%1"=="--projects" set MAVEN_PROJECTS_FLAG=--projects & set MAVEN_PROJECTS_VALUE=%MAVEN_PROJECTS_VALUE%,%2 & shift
  if "%1"=="-rf" set MAVEN_RESUME_FROM_FLAG=-rf & set MAVEN_RESUME_FROM_VALUE=%2 & shift
  if "%1"=="--resume-from" set MAVEN_RESUME_FROM_FLAG=--resume-from & set MAVEN_RESUME_FROM_VALUE=%2 & shift
  if "%1"=="-fn" set MAVEN_FAIL_NEVER_FLAG=-fn
  if "%1"=="--fail-never" set MAVEN_FAIL_NEVER_FLAG=--fail-never
  if "%1"=="-ff" set MAVEN_FAIL_FAST_FLAG=-ff
  if "%1"=="--fail-fast" set MAVEN_FAIL_FAST_FLAG=--fail-fast
  if "%1"=="-fae" set MAVEN_FAIL_AT_END_FLAG=-fae
  if "%1"=="--fail-at-end" set MAVEN_FAIL_AT_END_FLAG=--fail-at-end
  if "%1"=="-C" set MAVEN_STRICT_CHECKSUMS_FLAG=-C
  if "%1"=="--strict-checksums" set MAVEN_STRICT_CHECKSUMS_FLAG=--strict-checksums
  if "%1"=="-c" set MAVEN_CHECKSUM_WARNING_POLICY_FLAG=-c
  if "%1"=="--lax-checksums" set MAVEN_CHECKSUM_WARNING_POLICY_FLAG=--lax-checksums
  if "%1"=="-ntp" set MAVEN_NO_TRANSFER_PROGRESS_FLAG=-ntp
  if "%1"=="--no-transfer-progress" set MAVEN_NO_TRANSFER_PROGRESS_FLAG=--no-transfer-progress
  if "%1"=="-T" set MAVEN_THREADS_FLAG=-T & set MAVEN_THREADS_VALUE=%2 & shift
  if "%1"=="--threads" set MAVEN_THREADS_FLAG=--threads & set MAVEN_THREADS_VALUE=%2 & shift
  if "%1"=="-f" set MAVEN_ALTERNATE_POM_FILE_FLAG=-f & set MAVEN_ALTERNATE_POM_FILE_VALUE=%2 & shift
  if "%1"=="--file" set MAVEN_ALTERNATE_POM_FILE_FLAG=--file & set MAVEN_ALTERNATE_POM_FILE_VALUE=%2 & shift
  if "%1"=="-s" set MAVEN_ALTERNATE_USER_SETTINGS_FLAG=-s & set MAVEN_ALTERNATE_USER_SETTINGS_VALUE=%2 & shift
  if "%1"=="--settings" set MAVEN_ALTERNATE_USER_SETTINGS_FLAG=--settings & set MAVEN_ALTERNATE_USER_SETTINGS_VALUE=%2 & shift
  if "%1"=="-gs" set MAVEN_ALTERNATE_GLOBAL_SETTINGS_FLAG=-gs & set MAVEN_ALTERNATE_GLOBAL_SETTINGS_VALUE=%2 & shift
  if "%1"=="--global-settings" set MAVEN_ALTERNATE_GLOBAL_SETTINGS_FLAG=--global-settings & set MAVEN_ALTERNATE_GLOBAL_SETTINGS_VALUE=%2 & shift
  if "%1"=="-emp" set MAVEN_ENCRYPT_MASTER_PASSWORD_FLAG=-emp & set MAVEN_ENCRYPT_MASTER_PASSWORD_VALUE=%2 & shift
  if "%1"=="--encrypt-master-password" set MAVEN_ENCRYPT_MASTER_PASSWORD_FLAG=--encrypt-master-password & set MAVEN_ENCRYPT_MASTER_PASSWORD_VALUE=%2 & shift
  if "%1"=="-ep" set MAVEN_ENCRYPT_PASSWORD_FLAG=-ep & set MAVEN_ENCRYPT_PASSWORD_VALUE=%2 & shift
  if "%1"=="--encrypt-password" set MAVEN_ENCRYPT_PASSWORD_FLAG=--encrypt-password & set MAVEN_ENCRYPT_PASSWORD_VALUE=%2 & shift
  if "%1"=="-l" set MAVEN_LOG_FILE_FLAG=-l & set MAVEN_LOG_FILE_VALUE=%2 & shift
  if "%1"=="--log-file" set MAVEN_LOG_FILE_FLAG=--log-file & set MAVEN_LOG_FILE_VALUE=%2 & shift
  if "%1"=="-am" set MAVEN_ALSO_MAKE_FLAG=-am
  if "%1"=="--also-make" set MAVEN_ALSO_MAKE_FLAG=--also-make
  if "%1"=="-amd" set MAVEN_ALSO_MAKE_DEPENDENTS_FLAG=-amd
  if "%1"=="--also-make-dependents" set MAVEN_ALSO_MAKE_DEPENDENTS_FLAG=--also-make-dependents
  if "%1"=="-v" set MAVEN_VERSION_FLAG=-v
  if "%1"=="--version" set MAVEN_VERSION_FLAG=--version
  if "%1"=="-V" set MAVEN_SHOW_VERSION_FLAG=-V
  if "%1"=="--show-version" set MAVEN_SHOW_VERSION_FLAG=--show-version
  if "%1"=="-q" set MAVEN_QUIET_FLAG=-q
  if "%1"=="--quiet" set MAVEN_QUIET_FLAG=--quiet
  if "%1"=="-B" set MAVEN_BATCH_FLAG=-B
  if "%1"=="--batch-mode" set MAVEN_BATCH_FLAG=--batch-mode
  if "%1"=="-X" set MAVEN_DEBUG_FLAG=-X
  if "%1"=="--debug" set MAVEN_DEBUG_FLAG=--debug
  if "%1"=="-o" set MAVEN_OFFLINE_FLAG=-o
  if "%1"=="--offline" set MAVEN_OFFLINE_FLAG=--offline
  if "%1"=="-N" set MAVEN_NON_RECURSIVE_FLAG=-N
  if "%1"=="--non-recursive" set MAVEN_NON_RECURSIVE_FLAG=--non-recursive
  if "%1"=="-e" set MAVEN_ERRORS_FLAG=-e
  if "%1"=="--errors" set MAVEN_ERRORS_FLAG=--errors
  if "%1"=="-U" set MAVEN_UPDATE_SNAPSHOTS_FLAG=-U
  if "%1"=="--update-snapshots" set MAVEN_UPDATE_SNAPSHOTS_FLAG=--update-snapshots
  if "%1"=="-npu" set MAVEN_NO_PLUGIN_UPDATES_FLAG=-npu
  if "%1"=="--no-plugin-updates" set MAVEN_NO_PLUGIN_UPDATES_FLAG=--no-plugin-updates
  if "%1"=="-npr" set MAVEN_NO_PLUGIN_REGISTRY_FLAG=-npr
  if "%1"=="--no-plugin-registry" set MAVEN_NO_PLUGIN_REGISTRY_FLAG=--no-plugin-registry
  if "%1"=="-cpu" set MAVEN_CHECK_PLUGIN_UPDATES_FLAG=-cpu
  if "%1"=="--check-plugin-updates" set MAVEN_CHECK_PLUGIN_UPDATES_FLAG=--check-plugin-updates
  if "%1"=="-h" set MAVEN_HELP_FLAG=-h
  if "%1"=="--help" set MAVEN_HELP_FLAG=--help
  if "%1"=="-fup" set MAVEN_FORCE_UPDATE_PLUGINS_FLAG=-fup
  if "%1"=="--force-update-plugins" set MAVEN_FORCE_UPDATE_PLUGINS_FLAG=--force-update-plugins
  if "%1"=="-f" set MAVEN_FORCE_UPDATE_FLAG=-U
  if "%1"=="--force" set MAVEN_FORCE_UPDATE_FLAG=-U
  if "%1"=="--wrapper-quiet" set MAVEN_WRAPPER_QUIET_FLAG=true
  if "%1"=="--wrapper-launcher-quiet" set MAVEN_WRAPPER_LAUNCHER_QUIET_FLAG=true
  if "%1"=="--wrapper-initial-maven-version" set MAVEN_WRAPPER_INITIAL_MAVEN_VERSION_FLAG=--wrapper-initial-maven-version & set MAVEN_WRAPPER_INITIAL_MAVEN_VERSION_VALUE=%2 & shift
  if "%1"=="--wrapper-maven-user-home" set MAVEN_WRAPPER_MAVEN_USER_HOME_FLAG=--wrapper-maven-user-home & set MAVEN_WRAPPER_MAVEN_USER_HOME_VALUE=%2 & shift
  if "%1"=="--wrapper-verbose" set MAVEN_WRAPPER_VERBOSE_FLAG=true
  shift
  goto loop
:after_loop

set MAVEN_CMD_LINE_ARGS=%*

set WRAPPER_JAR=maven-wrapper.jar
set WRAPPER_VERSION=3.2.0
set DOWNLOAD_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/%WRAPPER_VERSION%/maven-wrapper-%WRAPPER_VERSION%.jar

set MAVEN_USER_HOME=%USERPROFILE%
if not "%MAVEN_USER_HOME%" == "" (
  set MAVEN_USER_HOME_WIN_STYLE=%MAVEN_USER_HOME%
) else (
  set MAVEN_USER_HOME_WIN_STYLE=%HOMEDRIVE%%HOMEPATH%
)

set MAVEN_WRAPPER_PROPERTIES_DIR=%MAVEN_USER_HOME_WIN_STYLE%\.m2\wrapper\dists
set MAVEN_WRAPPER_JAR_DIR=%MAVEN_WRAPPER_PROPERTIES_DIR%\maven-wrapper-%WRAPPER_VERSION%
set MAVEN_WRAPPER_JAR=%MAVEN_WRAPPER_JAR_DIR%\maven-wrapper-%WRAPPER_VERSION%.jar

if not exist "%MAVEN_WRAPPER_JAR%" (
  echo Downloading %DOWNLOAD_URL%
  if exist "%MAVEN_WRAPPER_PROPERTIES_DIR%" rmdir /S /Q "%MAVEN_WRAPPER_PROPERTIES_DIR%"
  mkdir "%MAVEN_WRAPPER_PROPERTIES_DIR%"
  mkdir "%MAVEN_WRAPPER_JAR_DIR%"
  powershell -Command "(New-Object Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%MAVEN_WRAPPER_JAR%')"
)

set MAVEN_OPTS=%MAVEN_OPTS%

set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
if not exist %JAVA_EXE% (
  set JAVA_EXE=java.exe
)

%JAVA_EXE% %MAVEN_OPTS% -jar "%MAVEN_WRAPPER_JAR%" %MAVEN_CMD_LINE_ARGS%

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
