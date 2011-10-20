--- testSuite/cocopTester.py.orig	Wed Dec 19 19:25:58 2007
+++ testSuite/cocopTester.py	Tue Aug  9 13:23:03 2011
@@ -186,7 +186,7 @@ class CocoTester( object ):
       
       if not atgFilename.lower().endswith( '.atg' ):
          baseName = atgFilename
-         atgFilename += '.atg'
+         atgFilename += '.ATG'
       else:
          baseName = os.path.splitext( os.path.basename( atgFilename ) )[0]
       
@@ -211,20 +211,20 @@ class CocoTester( object ):
    def check( self, name, isErrorTest=False ):
       print 'Running test: %s' % name
       
-      shell( '%s %s.atg >output.txt' % (self._compiler, name) )
+      shell( '%s %s.ATG >output.txt' % (self._compiler, name) )
       if compareFiles( 'trace.txt', '%s_Trace.txt' % name ):
-         print 'trace files differ for %s' % name
+         print 'trace file differs for %s' % name
          return False
       if compareFiles( 'output.txt', '%s_Output.txt' % name ):
-         print 'output files differ for %s' % name
+         print 'output file differs for %s' % name
          return False
       
       if not isErrorTest:
          if compareFiles( 'Parser.py', '%s_Parser.py' % name ):
-            print 'output files differ for %s' % name
+            print 'parser file differs for %s' % name
             return False
          if compareFiles( 'Scanner.py', '%s_Scanner.py' % name ):
-            print 'output files differ for %s' % name
+            print 'scanner file differs for %s' % name
             return False
       
       deleteFiles( '*.py.old', 'Parser.py', 'Scanner.py', 'output.txt', 'trace.txt' )
@@ -268,6 +268,6 @@ suite = [
       ( 'TestCasing',         False )
       ]
    
-tester = CocoTester( 'python ..\\coco.py', 'py', suite )
+tester = CocoTester( '%%PYTHON%% ../CocoPy/Coco.py', 'py', suite )
 tester.checkall( )
 
