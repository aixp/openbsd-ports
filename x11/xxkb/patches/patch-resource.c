--- resource.c.orig	Thu Mar 15 00:54:53 2007
+++ resource.c	Sun Jul  1 17:26:48 2007
@@ -161,7 +161,7 @@
 		if (*((char**) value) == NULL) {
 			err(1, "Failed to allocate memory for the string");
 		}
-		strcpy(*((char**) value), val.addr);
+		(void)strlcpy(*((char**) value), val.addr, len + 1);
 		break;
 
 	case T_bool:
@@ -237,7 +237,8 @@
 {
 	int i;
 	Bool labels_enabled;
-	char res_name[64], *str_geom, *str_gravity;
+	size_t res_name_size;
+	char *res_name, *str_geom, *str_gravity;
 	Pixmap *pixmap = element->pictures;
 	Pixmap *shape = element->shapemask;
 #ifdef SHAPE_EXT
@@ -245,7 +246,13 @@
 #endif
 	Geometry *geom = &element->geometry;
 
-	sprintf(res_name, "%s.geometry", window_name);
+	res_name_size = strlen(window_name) + 20 + 20 + 1;
+	res_name = (char *)malloc(res_name_size);
+	if (res_name == NULL) {
+		err(1, NULL);
+	}
+	
+	(void)snprintf(res_name, res_name_size, "%s.geometry", window_name);
 	GetRes(db, res_name, T_string, True, &str_geom);
 	geom->mask = XParseGeometry(str_geom, &geom->x, &geom->y, &geom->width, &geom->height);
 	if (~geom->mask & AllValues) {
@@ -253,7 +260,7 @@
 	}
 	
 	str_gravity = NULL;
-	sprintf(res_name, "%s.gravity", window_name);
+	(void)snprintf(res_name, res_name_size, "%s.gravity", window_name);
 	GetRes(db, res_name, T_string, False, &str_gravity);
 	if (str_gravity == NULL) {
 		/* Get the gravity from the geometry */
@@ -284,23 +291,23 @@
 	free(str_geom);
 
 	/* images or labels? */
-	sprintf(res_name, "%s.label.enable", window_name);
+	(void)snprintf(res_name, res_name_size, "%s.label.enable", window_name);
 	GetRes(db, res_name, T_bool, True, &labels_enabled);
 	if (labels_enabled) {
 		/* labels */
 		unsigned int background, foreground;
 		char *font, *label;
 
-		sprintf(res_name, "%s.label.font", window_name);
+		(void)snprintf(res_name, res_name_size, "%s.label.font", window_name);
 		GetRes(db, res_name, T_string, True, &font);
 
-		sprintf(res_name, "%s.label.background", window_name);
+		(void)snprintf(res_name, res_name_size, "%s.label.background", window_name);
 		GetColorRes(dpy, db, res_name, &background);
-		sprintf(res_name, "%s.label.foreground", window_name);
+		(void)snprintf(res_name, res_name_size, "%s.label.foreground", window_name);
 		GetColorRes(dpy, db, res_name, &foreground);
 
 		for (i = 0; i < MAX_GROUP; i++) {
-			sprintf(res_name, "%s.label.text.%d", window_name, i + 1);
+			(void)snprintf(res_name, res_name_size, "%s.label.text.%d", window_name, i + 1);
 			label = NULL;
 			GetRes(db, res_name, T_string, False, &label);
 			if (label == NULL) {
@@ -335,13 +342,13 @@
 	} 
 	else {
 		/* images */
-		char res_name[64], *filename, *fullname, *imgpath;
+		char *filename, *fullname, *imgpath;
 		size_t len;
 
 		GetRes(db, "image.path", T_string, True, &imgpath);
 
 		for (i = 0; i < MAX_GROUP; i++) {
-			sprintf(res_name, "%s.image.%d", window_name, i + 1);
+			(void)snprintf(res_name, res_name_size, "%s.image.%d", window_name, i + 1);
 			GetRes(db, res_name, T_string, True, &filename);
 			if (filename != NULL && *filename != '\0') {
 				if (*filename == '/') {
@@ -363,7 +370,7 @@
 #endif
 						continue;
 					}
-					sprintf(fullname, "%s/%s", imgpath, filename);
+					(void)snprintf(fullname, len + 1, "%s/%s", imgpath, filename);
 					LoadImage(dpy, element, &pixmap[i], &shape[i], fullname);
 #ifdef SHAPE_EXT
 					CreateShade(dpy, element, &shape[i], &bound[i]);
@@ -585,7 +592,7 @@
 		warn(NULL);
 		return 1;
 	}
-	sprintf(filename, "%s/%s", APPDEFDIR, APPDEFFILE);
+	(void)snprintf(filename, len + 1, "%s/%s", APPDEFDIR, APPDEFFILE);
 #endif
 	db = XrmGetFileDatabase(filename);
 	if (db == NULL) {
@@ -613,7 +620,7 @@
 		XrmDestroyDatabase(db);
 		return 1;
 	}
-	sprintf(filename, "%s/%s", homedir, USERDEFFILE);
+	(void)snprintf(filename, len + 1, "%s/%s", homedir, USERDEFFILE);
 #endif
 	/*
 	 * merge settings
@@ -630,7 +637,7 @@
 	conf->user_config = filename;
 
 	for (i = 0; i < countof(ControlsTable); i++) {
-		sprintf(res_ctrls, "controls.%s", ControlsTable[i].name);
+		(void)snprintf(res_ctrls, sizeof(res_ctrls), "controls.%s", ControlsTable[i].name);
 		GetControlRes(db, res_ctrls, &conf->controls, ControlsTable[i].flag);
 	}
 
@@ -774,10 +781,10 @@
 	/* fill in the new list */
 	*new_list = '\0';
 	if (orig_list != NULL) {
-		strcat(new_list, orig_list);
-		strcat(new_list, " ");
+		(void)strlcat(new_list, orig_list, len + 1);
+		(void)strlcat(new_list, " ", len + 1);
 	}
-	strcat(new_list, app_ident);
+	(void)strlcat(new_list, app_ident, len + 1);
 	/* parse the new list */
 	list = MakeSearchList(new_list);
 	if (list == NULL) {
@@ -930,7 +937,7 @@
 		return NULL;
 	}
 
-	sprintf(res_name, res_patt, match, action);
+	(void)snprintf(res_name, len + 1, res_patt, match, action);
 
 	return res_name;
 }
