use finaliweb_g5;
insert into tiposervicios(nombreServicio) 
		values ("Impresion 3D"),
			("Corte laser"),
            ("Escaneo Digital 3D");

insert into tipo (tipo) values ("interno"), ("externo");


insert into usuarios (nombre, correo, password,idTipo)
					values ("gil", "a202003334@pucp.edu.pe", sha2("gil",512),"1"),
							("diego", "diego.edu.pe", sha2("diego",512),"1");
                    
insert into servicios(idTipoServicios,idUsuario,borradoLogico,fecha) values("1","1",true,date(now())),
														("2","1",true,date(now())),
                                                        ("3","1",true,date(now()));
                                                        

