include /ioc/tools/driver.makefile
EXCLUDE_VERSIONS=3.13
BUILDCLASSES=Linux
CROSS_COMPILER_TARGET_ARCHS=$(EPICS_HOST_ARCH)

SOURCES+=slsDetectorApp/slsDetectorSrc/slsDetectorDriver.cpp
DBDS+=slsDetectorApp/slsDetectorSrc/slsDetectorSupport.dbd

SLS_DET_SOFTWARE = /afs/psi.ch/user/w/wang_x1/software/slsDetectorSoftware
#SLS_DET_SOFTWARE = /afs/psi.ch/project/mythen/newMythenSoftware/slsDetectorSoftware

USR_INCLUDES+=-I$(SLS_DET_SOFTWARE)/commonFiles \
			  -I$(SLS_DET_SOFTWARE)/slsDetector \
			  -I$(SLS_DET_SOFTWARE)/slsDetectorAnalysis \
			  -I$(SLS_DET_SOFTWARE)/multiSlsDetector
USR_CFLAGS+=-DVERBOSE -g
USR_LDFLAGS +=  -L$(SLS_DET_SOFTWARE) -Wl,-rpath $(SLS_DET_SOFTWARE)
USR_LIBS += SlsDetector pthread
