MODULE CoordTransformTest;

	(*
		А. В. Ширяев, 2011.05
	*)

	IMPORT CoordTransform, Math2, Out;

	PROCEDURE T1 (B1, L1: REAL);
		VAR X, Y, Z, B, L, H: REAL;
	BEGIN
		B1 := B1 * Math2.pi / 180.0; L1 := L1 * Math2.pi / 180.0;
		CoordTransform.BLHtoXYZ(B1, L1, 0, X, Y, Z);
		(* Out.String("X = "); Out.Real(X);
			Out.String(", Y = "); Out.Real(Y);
			Out.String(", Z = "); Out.Real(Z); Out.Ln; *)

		CoordTransform.XYZtoBLH(X, Y, Z, B, L, H);
		(* Out.String("B = "); Out.Real(B * 180.0 / Math2.pi);
			Out.String(", L = "); Out.Real(L * 180.0 / Math2.pi);
			Out.String(", H = "); Out.Real(H); Out.Ln; *)

		IF (ABS(B1 - Math2.pi / 2.0) <= 1.0E-6) OR (ABS(B1 + Math2.pi / 2.0) <= 1.0E-6) THEN
			L := L1
		END;

		IF ABS(L1 + Math2.pi) <= 1.0E-6 THEN
			L := -L
		END;

		IF (ABS(B - B1) >= 1.0E-6) OR (ABS(L - L1) >= 1.0E-6) OR (ABS(H) >= 1.0) THEN
			Out.String("B = "); Out.Real(B1 * 180.0 / Math2.pi);
			Out.String(", L = "); Out.Real(L1 * 180.0 / Math2.pi);
			Out.String(", H = 0.0"); Out.String(" -> ");
			Out.String("B = "); Out.Real(B * 180.0 / Math2.pi);
			Out.String(", L = "); Out.Real(L * 180.0 / Math2.pi);
			Out.String(", H = "); Out.Real(H); Out.Ln
		END;

		(* Out.Ln *)
	END T1;

	PROCEDURE T2 (CONST latDeg, lonDeg: REAL);
	BEGIN
		T1(latDeg, lonDeg);
		T1(0.0, lonDeg);
		T1(latDeg, 0.0);
		T1(0.0, 0.0)
	END T2;

	PROCEDURE Do;
	BEGIN
		T2(55.0, 39.0);
		T2(-55.0, -39.0);
		T2(55.0, -39.0);
		T2(-55.0, 39.0);

		T2(89.0, 39.0);
		T2(-89.0, 39.0);
		T2(89.0, -39.0);
		T2(-89.0, -39.0);

		T2(90.0, 39.0);
		T2(-90.0, 39.0);
		T2(90.0, -39.0);
		T2(-90.0, -39.0);

		T2(89.0, 180.0);
		T2(89.0, -180.0)
	END Do;

BEGIN
	Do;
	Out.String("all done"); Out.Ln
END CoordTransformTest.
