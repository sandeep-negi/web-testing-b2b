# Changelog

All notable changes to this project will be documented in this file.

## 3.0 (28-07-2021)
* [Core] keyword driven framework

## 2.5 (09-06-2020)

#### Added
* [Test] Sprint 8 & 9
* [Core] Single google account for all purpose with same credentials
* [Core] Assignment Builder
* [Test] GA & GTM Testing
* [TDM] CSV file for google users

#### Changed
* [Core] split hooks for social sign up

#### Removed
* Deprecated methods


## 2.4 (29-04-2020)

#### Added
* [Test] Sprint 7
* [Core] New Architecture to manage Services POJO
* [Core] Added Scenario Context to share data between steps 

#### Changed
* [Core] Mapping Data of builder classes with directly with API
* [Core] Scrapping data from some screens using JSoup
* [Core] Performance improvements

## 2.3 (26-03-2020)

#### Added
* [Test] Sprint 6
* [Test] Application pop-ups handling for new user sign up, new class and user login.
* [Core] Secondary teacher and klasses

#### Changed
* [TDM] Using same test data file for f2 and staging as they share same db.
* [CI/CD] Shared volume for docker containers as existing volumes were causing access issues.
* [Core] TeacherServicesLibrary builder set up methods to work with new user sign ups.
* [Core] Added Teacher id in KlassBuilder to indentify secondary classes 

#### Fix
* [CI/CD] Fixed firefox issue on docker containers
    
## 2.2 (24-02-2020)
#### Added
* [Test] Sprint 5 (Home Access)
* [CI/CD] Use Project as root directory for all downloads and share it with docker containers.
* [Core] Added an email box for scenarios related to email validations e.g. PTL Sign Up.
* [CI/CD] Added firefox headless support.  

#### Changed
* [Core] Locate Students based on id instead of name.

#### Fix
* [TDM] Added setNotInUse to executorService instead of direct call.

## 2.1 (15-01-2020)
#### Added
* [Test] Sprint 3 & Sprint 4.
* [TDM] Created pool service to read/write from csv to support parallel execution (thread-safe).
* [Core] Added shareable reports (ReportBuilderJava)
* [Core] Used API's to populate data builder classes.
* [Core] Support multiple browsers in single session (BrowserFactory.java).
* [CI/CD] Console logs

#### Removed
* [Core] Trivago HTML Reports.
