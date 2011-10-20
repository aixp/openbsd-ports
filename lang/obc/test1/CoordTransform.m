MODULE CoordTransform;

	(*
		Encoding of this file is KOI8-R

		А. В. Ширяев, 2011.05

		Преобразования координат

		ЗАМЕЧАНИЯ:
			X, Y, Z - геоцентрические координаты, м
			B, L, H - географические координаты
				B - широта, рад; -pi/2 <= B <= pi/2
				L - долгота, рад; -pi < L <= pi
				H - высота, м

			a - большая полуось
			alpha - сжатие
			e2 - квадрат эксцентриситета
				e2 = e^2 = 2.0 * alpha - alpha * alpha
					0.0 < e^2 < 1.0
	*)

	IMPORT Math, Math2;

	CONST
	(*
		(* ПЗ (ГОСТ Р 51794-2001) *)
			a = 6378136.0; (* м *)
			alpha = 0.0033528037351842955; (* 1.0 / 298.25784 *)
			e2 = 0.0066943661774819252; (* 2.0 * alpha - alpha * alpha *)
	*)

		(* МГС (ГОСТ Р 51794-2001) *)
		(* WGS 84 (en.Wikipedia, 14.05.2011) *)
			a = 6378137.0; (* м *)
			alpha = 0.0033528106647474805; (* 1.0 / 298.257223563 *)
			e2 = 0.0066943799901413165; (* 2.0 * alpha - alpha * alpha *)

	(* ГОСТ Р 51794-2001 *)
	PROCEDURE BLHtoXYZ* (CONST B, L, H: REAL; VAR X, Y, Z: REAL);
		VAR sinB, cosB: REAL;
			N: REAL; (* первый вертикал *)
	BEGIN
		sinB := Math.Sin(B);
		cosB := Math.Cos(B);

		N := a / Math.Sqrt(1.0 - e2 * sinB * sinB);

		X := (N + H) * cosB * Math.Cos(L);
		Y := (N + H) * cosB * Math.Sin(L);
		Z := ( (1.0 - e2) * N + H ) * sinB
	END BLHtoXYZ;

	(* ГОСТ Р 51794-2001 *)
	PROCEDURE XYZtoBLH* (CONST X, Y, Z: REAL; VAR B, L, H: REAL);
		(* CONST eps = 1.0E-10; *)
		CONST eps = 4.8E-10;
		VAR D, sinb, La, r, c, p, s1, s2, b, d, tmp: REAL;
			n: INTEGER;
	BEGIN
		D := Math.Sqrt(X * X + Y * Y);

		IF D > 0.0 THEN
			La := Math2.ArcSin(Y / D);
			(* исправлено: *)
			IF X >= 0.0 THEN
				L := La
			ELSE (* X < 0.0 *)
				L := Math2.pi - La
			END
			(* было:
			IF Y >= 0.0 THEN
				IF X >= 0.0 THEN
					L := La
				ELSE (* X < 0.0 *)
					L := Math2.pi - La
				END
			ELSE (* Y < 0.0 *)
				IF X >= 0.0 THEN
					L := 2.0 * Math2.pi - La
				ELSE (* X < 0.0 *)
					L := 2.0 * Math2.pi + La
				END
			END
			*)
		ELSE (* D = 0.0 *)
			IF Z >= 0.0 THEN
				B := Math2.piPopolam
			ELSE (* Z < 0.0 *)
				B := - Math2.piPopolam
			END;
			L := 0.0;
			sinb := Math.Sin(B);
			H := Z * sinb - a * Math.Sqrt(1.0 - e2 * sinb * sinb)
		END;

		IF Z = 0.0 THEN (* экваториальная плоскость *)
			B := 0.0;
			H := D - a
		ELSE
			r := Math.Sqrt(X * X + Y * Y + Z * Z);
			IF r > 0.0 THEN
				c := Math2.ArcSin(Z / r);
				p := e2 * a / 2.0 / r;

				n := 100;
				s1 := 0.0;
				REPEAT DEC(n);
					b := c + s1;

					sinb := Math.Sin(b);
					tmp := Math.Sqrt(1.0 - e2 * sinb * sinb);

					s2 := Math2.ArcSin(p * Math.Sin(2.0 * b) / tmp);
					d := ABS(s2 - s1);
					s1 := s2
				UNTIL (d < eps) OR (n = 0);
				B := b;
				H := D * Math.Cos(B) + Z * sinb - a * tmp
			ELSE
				B := 0.0;
				L := 0.0;
				H := 0.0
			END
		END
	END XYZtoBLH;

END CoordTransform.
