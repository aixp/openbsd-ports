MODULE Math2;

	(*
		А. В. Ширяев, 2010.02, 2011.05
	*)

	IMPORT Math;

	CONST
		pi* = 3.14159265358979323846;
		piPopolam* = 1.57079632679489661923;

	PROCEDURE ArcTan2* (CONST y, x: REAL): REAL;
		VAR res: REAL;
	BEGIN
		IF x > 0.0 THEN
			res := Math.Arctan(y / x)
		ELSIF x < 0.0 THEN (* Sign(y) * ( pi - ArcTan( |y/x| ) ) *)
			IF y > 0.0 THEN
				res := pi - Math.Arctan(- y / x)
			ELSIF y < 0.0 THEN
				res := Math.Arctan(y / x) - pi
			ELSE (* y = 0.0 *)
				res := 0.0
			END
		ELSIF y > 0.0 THEN (* x = 0.0 *)
			res := piPopolam
		ELSIF y < 0.0 THEN (* x = 0.0 *)
			res := - piPopolam
		ELSE (* x = 0.0, y = 0.0 *)
			res := 0.0
		END;
		RETURN res
	END ArcTan2;

	PROCEDURE ArcSin* (CONST x: REAL): REAL;
		VAR res: REAL;
	BEGIN
		ASSERT(x >= -1.0);
		ASSERT(x <= 1.0);
		IF x = 1.0 THEN
			res := piPopolam
		ELSIF x = -1.0 THEN
			res := -piPopolam
		ELSE (* -1.0 < x < 1.0 *)
			res := Math.Arctan(x / Math.Sqrt(1.0 - x * x))
		END;
		RETURN res
	END ArcSin;

END Math2.
