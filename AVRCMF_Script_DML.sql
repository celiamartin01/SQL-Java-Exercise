insert into departamento values(1, "Programación"),
	(2, "RRHH"),
	(3, "Marketing");
insert into empleado values(10, "Elvis", "Teck", 621234215, 3),
	(20, "Lucía", "Haba", 612542684, 1),
	(30, "Marta", "Lopez", 666666666, 2);
insert into cliente values(100, "Paco"),
	(200, "Julia"),
    (300, "Rosa");
insert into proyecto values(1,"Interfaces en java","Java",1,200),
	(2,"Contratación", null, 2, 100),
    (3,"Campaña en RRSS", null, 3, 300);
insert into facturacion values(10, 2000, sysdate(), 3),
	(20, 40000, sysdate(), 1),
    (30, 1500, sysdate(), 2);