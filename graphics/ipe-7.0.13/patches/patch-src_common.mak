--- src/common.mak.orig	Fri Nov 26 07:17:25 2010
+++ src/common.mak	Tue Jan 18 15:59:16 2011
@@ -96,7 +96,6 @@ endif
 
 else
   # -------------------- Unix --------------------
-  CXXFLAGS	+= -g -O2
   ifdef MACOS
     DLL_LDFLAGS	+= -dynamiclib 
     soname      = -Wl,-dylib_install_name,lib$1.so.$(IPEVERS)
