--- src/config.mak.orig	Wed Sep  7 00:01:44 2011
+++ src/config.mak	Wed Oct 19 21:26:06 2011
@@ -18,15 +18,15 @@ IPEUI 	     ?= QT
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
 # ------------------------------------------------------------------
 # Include and linking options for libraries
@@ -94,7 +94,6 @@ endif
 #
 # The C++ compiler (only g++ is properly tested)
 #
-CXX = g++
 #
 # Special compilation flags for compiling shared libraries
 # 64-bit Linux requires shared libraries to be compiled as
@@ -134,14 +133,14 @@ IPEBINDIR  = $(IPEPREFIX)/bin
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
 # Where Lua code will be installed
 # (This is the part of the Ipe program written in the Lua language)
-IPELUADIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/lua
+IPELUADIR = $(IPEPREFIX)/share/ipe/lua
 #
 # Directory where Ipe will look for scripts
 # (standard scripts will also be installed here)
@@ -149,22 +148,22 @@ IPESCRIPTDIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/scrip
 #
 # Directory where Ipe will look for style files
 # (standard Ipe styles will also be installed here)
-IPESTYLEDIR = $(IPEPREFIX)/share/ipe/$(IPEVERS)/styles
+IPESTYLEDIR = $(IPEPREFIX)/share/ipe/styles
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
