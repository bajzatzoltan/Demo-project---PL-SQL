----------------------------------------------------------------------------------------------------------------
-- Inserts
----------------------------------------------------------------------------------------------------------------
insert into "Közterület tipus" ("Közterület megnevezése") values ('utca');
insert into "Közterület tipus" ("Közterület megnevezése") values ('körút');
insert into "Közterület tipus" ("Közterület megnevezése") values ('út');
insert into "Közterület tipus" ("Közterület megnevezése") values ('tér');

insert into "Ország" ( "Országnév", "Ország kód") values( 'Magyarország', 'HU');
insert into "Ország" ( "Országnév", "Ország kód") values( 'Szlovákia', 'SK');
insert into "Ország" ( "Országnév", "Ország kód") values( 'Románia', 'RO');

insert into "Település" ( "Településnév", "Irányítószám", "Ország ID") values( 'Eger', '3300', 1 );
insert into "Település" ( "Településnév", "Irányítószám", "Ország ID") values( 'Miskolc', '3500', 1 );
insert into "Település" ( "Településnév", "Irányítószám", "Ország ID") values( 'Temesvár', '300028', 3 );
insert into "Település" ( "Településnév", "Irányítószám", "Ország ID") values( 'Kassa', '04001', 2 );

insert into "Megye" (   "Megye", "Megye kód", "Ország ID" ) values( 'Heves megye', null, 1);
insert into "Megye" (   "Megye", "Megye kód", "Ország ID" ) values( 'Borsod-Abaúj-Zemplén megye', null, 1);
insert into "Megye" (   "Megye", "Megye kód", "Ország ID" ) values( 'Kosice', null, 2);
insert into "Megye" (   "Megye", "Megye kód", "Ország ID" ) values( 'Temes', null, 3);

insert into "Partner" ("Partnernév",  "Közterület neve", "Közterület tipus ID", "Házszám", "Épület", "Lépcsõház", "Emelet", "Ajtó",
                        "Helyrajzi szám", "Ország ID", "Település ID", "Megye ID" ) 
                        values ('Microsoft GMBH', 'Szoftver', 1, 5, null, 5, 1, 3, 
                        'hrsz1000', 1, 1, 1);
insert into "Partner" ("Partnernév",  "Közterület neve", "Közterület tipus ID", "Házszám", "Épület", "Lépcsõház", "Emelet", "Ajtó", 
                        "Helyrajzi szám", "Ország ID", "Település ID", "Megye ID" ) 
                        values ('Slovakia GMBH', 'Main', 2, 1, 'A', 7, 2, 4, 
                        '20013', 2, 4, 3);
insert into "Partner" ("Partnernév",  "Közterület neve", "Közterület tipus ID", "Házszám", "Épület", "Lépcsõház", "Emelet", "Ajtó", 
                        "Helyrajzi szám", "Ország ID", "Település ID", "Megye ID" ) 
                        values ('Romania GMBH', 'Népköztárssaság', 3, 2, 'C', 7, 3, 3, 
                        '300000', 3, 4, 3);

commit;

