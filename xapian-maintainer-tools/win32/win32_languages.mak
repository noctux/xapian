# Makefile for Microsoft Visual C++ 7.0 (or compatible)
# Originally by Ulrik Petersen
# Modified by Charlie Hull, Lemur Consulting Ltd.
# www.lemurconsulting.com
# 17th March 2006

# Will build a Win32 static library (non-debug) liblanguages.lib


!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!INCLUDE ..\win32\config.mak

CPP=cl.exe
RSC=rc.exe


OUTDIR=..\win32\Release\libs
INTDIR=.\

SBL_OPTIONS=-c++ -u 
SBL=compiler\snowball.exe

ALL : "$(OUTDIR)\liblanguages.lib" 

LIBLANGUAGES_OBJS= \
                 $(INTDIR)\stem.obj \
                 $(INTDIR)\steminternal.obj \
                 $(INTDIR)\danish.obj \
                 $(INTDIR)\dutch.obj \
                 $(INTDIR)\english.obj \
                 $(INTDIR)\french.obj \
                 $(INTDIR)\german.obj \
		 $(INTDIR)\german2.obj \
		 $(INTDIR)\hungarian.obj \
                 $(INTDIR)\italian.obj \
                 $(INTDIR)\norwegian.obj \
                 $(INTDIR)\porter.obj \
                 $(INTDIR)\portuguese.obj \
                 $(INTDIR)\russian.obj \
                 $(INTDIR)\spanish.obj \
                 $(INTDIR)\swedish.obj \
		 $(INTDIR)\romanian1.obj \
		 $(INTDIR)\romanian2.obj \
		 $(INTDIR)\kraaij_pohlmann.obj \
		 $(INTDIR)\turkish.obj 

LIBLANGUAGES_SOURCES= \
                 $(INTDIR)\danish.cc \
                 $(INTDIR)\dutch.cc \
                 $(INTDIR)\english.cc \
                 $(INTDIR)\french.cc \
                 $(INTDIR)\german.cc \
		 $(INTDIR)\german2.cc \
		 $(INTDIR)\hungarian.cc \
                 $(INTDIR)\italian.cc \
                 $(INTDIR)\norwegian.cc \
                 $(INTDIR)\porter.cc \
                 $(INTDIR)\portuguese.cc \
                 $(INTDIR)\russian.cc \
                 $(INTDIR)\spanish.cc \
                 $(INTDIR)\swedish.cc \
		 $(INTDIR)\romanian1.cc \
		 $(INTDIR)\romanian2.cc \
		 $(INTDIR)\kraaij_pohlmann.cc \
		 $(INTDIR)\turkish.cc 

LIBLANGUAGES_HEADERS= \
                 $(INTDIR)\danish.cc \
                 $(INTDIR)\dutch.cc \
                 $(INTDIR)\english.cc \
                 $(INTDIR)\french.cc \
                 $(INTDIR)\german.cc \
		 $(INTDIR)\german2.cc \
		 $(INTDIR)\hungarian.cc \
                 $(INTDIR)\italian.cc \
                 $(INTDIR)\norwegian.cc \
                 $(INTDIR)\porter.cc \
                 $(INTDIR)\portuguese.cc \
                 $(INTDIR)\russian.cc \
                 $(INTDIR)\spanish.cc \
                 $(INTDIR)\swedish.cc \
		 $(INTDIR)\romanian1.cc \
		 $(INTDIR)\romanian2.cc \
		 $(INTDIR)\kraaij_pohlmann.cc \
		 $(INTDIR)\turkish.cc 
		 

#                 $(INTDIR)\snowball_finnish.obj \ AND .cc and .h
#                 $(INTDIR)\snowball_lovins.obj \AND .cc and .h

		 
CLEAN :
	-@erase "$(OUTDIR)\liblanguages.lib"
	-@erase "*.pch"
        -@erase $(LIBLANGUAGES_OBJS)
	-@erase $(LIBLANGUAGES_SOURCES)
	-@erase $(LIBLANGUAGES_HEADERS)
	


"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=$(CPPFLAGS_EXTRA)  \
 /I"..\languages" \
 /Fo"$(INTDIR)\\" /Tp$(INPUTNAME)
CPP_OBJS=..\win32\Release
CPP_SBRS=.

LIB32=link.exe -lib
LIB32_FLAGS=/nologo  $(LIBFLAGS)

"$(OUTDIR)\LIBLANGUAGES.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIBLANGUAGES_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) /out:"$(OUTDIR)\liblanguages.lib" $(DEF_FLAGS) $(LIBLANGUAGES_OBJS)
<<


# Generate .h and .cc files from Snowball algorithms using Snowball compiler
	
".\danish.h" ".\danish.cc" : ".\danish.sbl"
	$(SBL) danish.sbl $(SBL_OPTIONS) -o danish -n InternalStemDanish -p Stem::Internal

".\dutch.h" ".\dutch.cc" : ".\dutch.sbl"
	$(SBL) dutch.sbl $(SBL_OPTIONS) -o dutch -n InternalStemDutch -p Stem::Internal

".\english.h" ".\english.cc" : ".\english.sbl"
	$(SBL) english.sbl $(SBL_OPTIONS) -o english -n InternalStemEnglish -p Stem::Internal

".\french.h" ".\french.cc" : ".\french.sbl"
	$(SBL) french.sbl $(SBL_OPTIONS) -o french -n InternalStemFrench -p Stem::Internal

".\german.h" ".\german.cc" : ".\german.sbl"
	$(SBL) german.sbl $(SBL_OPTIONS) -o german -n InternalStemGerman -p Stem::Internal

".\german2.h" ".\german2.cc" : ".\german2.sbl"
	$(SBL) german2.sbl $(SBL_OPTIONS) -o german2 -n InternalStemGerman2 -p Stem::Internal

".\hungarian.h" ".\hungarian.cc" : ".\hungarian.sbl"
	$(SBL) hungarian.sbl $(SBL_OPTIONS) -o hungarian -n InternalStemHungarian -p Stem::Internal

".\italian.h" ".\italian.cc" : ".\italian.sbl"
	$(SBL) italian.sbl $(SBL_OPTIONS) -o italian -n InternalStemItalian -p Stem::Internal

".\norwegian.h" ".\norwegian.cc" : ".\norwegian.sbl"
	$(SBL) norwegian.sbl $(SBL_OPTIONS) -o norwegian -n InternalStemNorwegian -p Stem::Internal

".\porter.h" ".\porter.cc" : ".\porter.sbl"
	$(SBL) porter.sbl $(SBL_OPTIONS) -o porter -n InternalStemPorter -p Stem::Internal

".\portuguese.h" ".\portuguese.cc" : ".\portuguese.sbl"
	$(SBL) portuguese.sbl $(SBL_OPTIONS) -o portuguese -n InternalStemPortuguese -p Stem::Internal

".\russian.h" ".\russian.cc" : ".\russian.sbl"
	$(SBL) russian.sbl $(SBL_OPTIONS) -o russian -n InternalStemRussian -p Stem::Internal

".\spanish.h" ".\spanish.cc" : ".\spanish.sbl"
	$(SBL) spanish.sbl $(SBL_OPTIONS) -o spanish -n InternalStemSpanish -p Stem::Internal

".\swedish.h" ".\swedish.cc" : ".\swedish.sbl"
	$(SBL) swedish.sbl $(SBL_OPTIONS) -o swedish -n InternalStemSwedish -p Stem::Internal

".\kraaij_pohlmann.h" ".\kraaij_pohlmann.cc" : ".\kraaij_pohlmann.sbl"
	$(SBL) kraaij_pohlmann.sbl $(SBL_OPTIONS) -o kraaij_pohlmann -n InternalStemKraaij_pohlmann -p Stem::Internal
		
".\romanian1.h" ".\romanian1.cc" : ".\romanian1.sbl"
	$(SBL) romanian1.sbl $(SBL_OPTIONS) -o romanian1 -n InternalStemRomanian1 -p Stem::Internal	

".\romanian2.h" ".\romanian2.cc" : ".\romanian2.sbl"
	$(SBL) romanian2.sbl $(SBL_OPTIONS) -o romanian2 -n InternalStemRomanian2 -p Stem::Internal	

".\turkish.h" ".\turkish.cc" : ".\turkish.sbl"
	$(SBL) turkish.sbl $(SBL_OPTIONS) -o turkish -n InternalStemTurkish -p Stem::Internal	

# Currently unused
#	
#".\finnish.h" ".\finnish.cc" : ".\finnish.sbl"
#	$(SBL) finnish.sbl $(SBL_OPTIONS) -o finnish -n InternalStemFinnish -p Stem::Internal

#".\lovins.h" ".\lovins.cc" : ".\lovins.sbl"
#	$(SBL) lovins.sbl $(SBL_OPTIONS) -o lovins -n InternalStemLovins -p Stem::Internal


"$(INTDIR)\stem.obj" : ".\stem.cc" $(LIBLANGUAGES_SOURCES)
    $(CPP) @<<
  $(CPP_PROJ) $**
<<


"$(INTDIR)\steminternal.obj" : ".\steminternal.cc" 
    $(CPP) @<<
  $(CPP_PROJ) $**
<<
