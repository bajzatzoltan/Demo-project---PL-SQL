----------------------------------------------------------------------------------------------------------------
-- Inserts
----------------------------------------------------------------------------------------------------------------
insert into "K�zter�let tipus" ("K�zter�let megnevez�se") values ('utca');
insert into "K�zter�let tipus" ("K�zter�let megnevez�se") values ('k�r�t');
insert into "K�zter�let tipus" ("K�zter�let megnevez�se") values ('�t');
insert into "K�zter�let tipus" ("K�zter�let megnevez�se") values ('t�r');

insert into "Orsz�g" ( "Orsz�gn�v", "Orsz�g k�d") values( 'Magyarorsz�g', 'HU');
insert into "Orsz�g" ( "Orsz�gn�v", "Orsz�g k�d") values( 'Szlov�kia', 'SK');
insert into "Orsz�g" ( "Orsz�gn�v", "Orsz�g k�d") values( 'Rom�nia', 'RO');

insert into "Telep�l�s" ( "Telep�l�sn�v", "Ir�ny�t�sz�m", "Orsz�g ID") values( 'Eger', '3300', 1 );
insert into "Telep�l�s" ( "Telep�l�sn�v", "Ir�ny�t�sz�m", "Orsz�g ID") values( 'Miskolc', '3500', 1 );
insert into "Telep�l�s" ( "Telep�l�sn�v", "Ir�ny�t�sz�m", "Orsz�g ID") values( 'Temesv�r', '300028', 3 );
insert into "Telep�l�s" ( "Telep�l�sn�v", "Ir�ny�t�sz�m", "Orsz�g ID") values( 'Kassa', '04001', 2 );

insert into "Megye" (   "Megye", "Megye k�d", "Orsz�g ID" ) values( 'Heves megye', null, 1);
insert into "Megye" (   "Megye", "Megye k�d", "Orsz�g ID" ) values( 'Borsod-Aba�j-Zempl�n megye', null, 1);
insert into "Megye" (   "Megye", "Megye k�d", "Orsz�g ID" ) values( 'Kosice', null, 2);
insert into "Megye" (   "Megye", "Megye k�d", "Orsz�g ID" ) values( 'Temes', null, 3);

insert into "Partner" ("Partnern�v",  "K�zter�let neve", "K�zter�let tipus ID", "H�zsz�m", "�p�let", "L�pcs�h�z", "Emelet", "Ajt�",
                        "Helyrajzi sz�m", "Orsz�g ID", "Telep�l�s ID", "Megye ID" ) 
                        values ('Microsoft GMBH', 'Szoftver', 1, 5, null, 5, 1, 3, 
                        'hrsz1000', 1, 1, 1);
insert into "Partner" ("Partnern�v",  "K�zter�let neve", "K�zter�let tipus ID", "H�zsz�m", "�p�let", "L�pcs�h�z", "Emelet", "Ajt�", 
                        "Helyrajzi sz�m", "Orsz�g ID", "Telep�l�s ID", "Megye ID" ) 
                        values ('Slovakia GMBH', 'Main', 2, 1, 'A', 7, 2, 4, 
                        '20013', 2, 4, 3);
insert into "Partner" ("Partnern�v",  "K�zter�let neve", "K�zter�let tipus ID", "H�zsz�m", "�p�let", "L�pcs�h�z", "Emelet", "Ajt�", 
                        "Helyrajzi sz�m", "Orsz�g ID", "Telep�l�s ID", "Megye ID" ) 
                        values ('Romania GMBH', 'N�pk�zt�rssas�g', 3, 2, 'C', 7, 3, 3, 
                        '300000', 3, 4, 3);

commit;

