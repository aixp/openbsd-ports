--- src/common.mak.orig	Wed Sep  7 00:01:44 2011
+++ src/common.mak	Wed Oct 19 21:19:22 2011
@@ -129,7 +129,6 @@ endif
 
 else
   # -------------------- Unix --------------------
-  CXXFLAGS	+= -g -O2
   ifdef MACOS
     DLL_LDFLAGS	+= -dynamiclib 
     # IPELIBDIRINFO can be overridden as @executable_path/../lib
