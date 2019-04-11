DECLARE
	cursor 					cvendedor is
									select nom_ven, superior
									from tvendedor;
	x						cvendedor%rowtype;
	error_sup				exception;
BEGIN
	open cvendedor;
	loop
		fetch cvendedor into x;
		exit when cvendedor%notfound;
		if x.superior is null then
			raise error_sup;
		else
			dbms_output.put_line(x.nom_ven);
		end if;
	end loop;
	close cvendedor;
EXCEPTION
	when error_sup then
		dbms_output.put_line('No tiene superior ' || x.nom_ven);
END;
/		