--- src/config.mak.orig	Fri Nov 26 07:17:25 2010
+++ src/config.mak	Tue Jan 18 15:59:16 2011
@@ -22,15 +22,15 @@ CAIRO_LIBS    ?= $(shell pkg-config --libs cairo)
 # for Latex conversion?  (Useful for Japanese, Korean, Russian, etc.)
 # If so, uncomment the following line:
 #
-#IPE_USE_ICONV = -DIPE_USE_ICONV
+IPE_USE_ICONV = -DIPE_USE_ICONV
 #
 # If you enabled this feature, Ipe will need the functions
 # iconv_open, iconv, and iconv_close.
 # On Linux, these are simply in libc, and you need to do nothing extra.
 # On other systems, install libiconv and uncomment the following lines:
 #
-#ICONV_CFLAGS =
-#ICONV_LIBS   = -liconv
+ICONV_CFLAGS = -I$(IPEPREFIX)/include
+ICONV_LIBS   = -liconv -L$(IPEPREFIX)/lib
 #
 ifndef MACOS
 LUA_CFLAGS    ?= $(shell pkg-config --cflags lua5.1)
@@ -64,7 +64,6 @@ endif
 #
 # The C++ compiler (only g++ is properly tested)
 #
-CXX = g++
 #
 # Special compilation flags for compiling shared libraries
 # 64-bit Linux requires shared libraries to be compiled with -fPIC
@@ -102,10 +101,10 @@ IPEBINDIR  = $(IPEPREFIX)/bin
 IPELIBDIR  = $(IPEPREFIX)/lib
 #
 # Where the header files for Ipelib will be installed:
-IPEHEADERDIR = $(IPEPREFIX)/include
+IPEHEADERDIR = $(IPEPREFIX)/include/ipe
 #
 # Where Ipelets will be installed:
-IPELETDIR = $(IPEPREFIX)/lib/ipe/$(IPEVERS)/ipelets
+IPELETDIR = $(IPEPREFIX)/lib/ipe/ipelets
 #
 # List of paths where Ipe will search for Ipelets:
 # (Individual paths are separated by ";" on both Windows and Unix!)
@@ -113,7 +112,7 @@ IPELETPATH = $(IPELETDIR)
 #
 # Where Lua code will be installed
 # (This is the part of the Ipe program written in the Lua language)
-IPELUADIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/lua
+IPELUADIR = $(IPEPREFIX)/share/ipe/lua
 #
 # List of patterns where Ipe will search for Lua code:
 # (Individual paths are separated by ";" on both Windows and Unix!)
@@ -122,22 +121,22 @@ IPELUAPATH = $(IPELUADIR)/?.lua
 # Directory where Ipe will look for style files
 # (standard Ipe styles will also be installed here)
 #
-IPESTYLES = $(IPEPREFIX)/share/ipe/$(IPEVERS)/styles
+IPESTYLES = $(IPEPREFIX)/share/ipe/styles
 #
 # IPEICONDIR contains the icons used in the Ipe user interface
 #
-IPEICONDIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/icons
+IPEICONDIR = $(IPEPREFIX)/share/ipe/icons
 #
 # IPEDOCDIR contains the Ipe documentation (mostly html files)
 #
-IPEDOCDIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/doc
+IPEDOCDIR = $(IPEPREFIX)/share/doc/ipe
 #
 # The Ipe manual pages are installed into IPEMANDIR
 #
-IPEMANDIR = $(IPEPREFIX)/share/man/man1
+IPEMANDIR = $(IPEPREFIX)/man/man1
 #
 # The full path to the Ipe fontmap
 #
-IPEFONTMAP = $(IPEPREFIX)/share/ipe/$(IPEVERS)/fontmap.xml
+IPEFONTMAP = $(IPEPREFIX)/share/ipe/fontmap.xml
 #
 # --------------------------------------------------------------------
