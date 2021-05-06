CREATE OR REPLACE FUNCTION public.fib(n integer)
	RETURNS integer
	LANGUAGE 'plpgsql'
AS $$
	DECLARE
	fn integer;
BEGIN
	IF n = 0 THEN
		fn := 0;
	ELSEIF n = 1 THEN
		fn := 1;
	ELSE
		fn := fib(n-1) + fib(n-2);
	END IF;
	--RAISE NOTICE '%   %', n, fn;
	RETURN fn;
END;
$$;

--SELECT fib(10);


--CREATE OR REPLACE PROCEDURE wypis(integer)
--LANGUAGE 'plpgsql'
--AS $$
--BEGIN
	--PERFORM fib($1);
--END;
--$$;


CREATE OR REPLACE PROCEDURE wypis(integer)
LANGUAGE 'plpgsql'
AS $$
	DECLARE
	n integer;
BEGIN
	n := 0;
	WHILE n <= $1 LOOP
		RAISE NOTICE '%   %', n, fib(n);
		n := n + 1;
	END LOOP;
END;
$$;


CALL wypis(10);

	