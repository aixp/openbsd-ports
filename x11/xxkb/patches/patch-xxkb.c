--- xxkb.c.orig	Thu Mar 15 00:54:53 2007
+++ xxkb.c	Sun Jul  1 16:56:12 2007
@@ -122,7 +122,7 @@
 	scr = DefaultScreen(dpy);
 	root_win = RootWindow(dpy, scr);
 	base_mask = ~(dpy->resource_mask);
-	sprintf(buf, "_NET_SYSTEM_TRAY_S%d", scr);
+	(void)snprintf(buf, sizeof(buf), "_NET_SYSTEM_TRAY_S%d", scr);
 	systray_selection_atom = XInternAtom(dpy, buf, False);
 	take_focus_atom = XInternAtom(dpy, "WM_TAKE_FOCUS", False);
 	wm_del_win_atom = XInternAtom(dpy, "WM_DELETE_WINDOW", False);
@@ -1340,19 +1340,19 @@
 char*
 PrependProgramName(char *string)
 {
-	size_t len;
+	size_t result_size;
 	char *result;
 
-	len = strlen(APPNAME) + 1 + strlen(string);
+	result_size = strlen(APPNAME) + 1 + strlen(string) + 1;
 
-	result = malloc(len + 1);
+	result = (char *)malloc(result_size);
 	if (result == NULL) {
 		err(1, NULL);
 	}
 
-	strcpy(result, APPNAME);
-	strcat(result, ".");
-	strcat(result, string);
+	(void)strlcpy(result, APPNAME, result_size);
+	(void)strlcat(result, ".", result_size);
+	(void)strlcat(result, string, result_size);
 
 	return result;
 }
