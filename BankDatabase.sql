

--tabele

CREATE TABLE LOKACIJE_17434(lokacija_id INTEGER,
                           lokacija_ime VARCHAR(20) NOT NULL ,
                           CONSTRAINT c_lok_PK PRIMARY KEY(lokacija_id));




CREATE TABLE POSLOVNICE_17434(poslovnica_id INTEGER,
                              lokacija_id INTEGER NOT NULL,
                              nadredjena_id INTEGER,
                              stanje DECIMAL(19,9) NOT NULL,
                              CONSTRAINT c_pos_PK PRIMARY KEY(poslovnica_id),
                              CONSTRAINT pos_lok_FK FOREIGN KEY(lokacija_id) REFERENCES lokacije_17434(lokacija_id),
                              CONSTRAINT pos_pos_FK FOREIGN KEY(nadredjena_id) REFERENCES poslovnice_17434(poslovnica_id));


CREATE TABLE ODJELI_17434(odjel_id INTEGER,
                          odjel_naziv VARCHAR(15) NOT NULL,
                          poslovnica_id INTEGER NOT NULL,
                          CONSTRAINT c_odj_PK PRIMARY KEY(odjel_id),
                          CONSTRAINT odj_pos_FK FOREIGN KEY(poslovnica_id) REFERENCES poslovnice_17434(poslovnica_id));
                                                                                       
                                      DROP TABLE zaposleni_17434;

CREATE TABLE ZAPOSLENI_17434(zaposleni_id INTEGER,
                            zaposleni_ime VARCHAR(20)NOT NULL,
                            zaposleni_prezime VARCHAR(20)NOT NULL,
                            odjel_id INTEGER,
                            plata DECIMAL(15,6) NOT NULL,
                            CONSTRAINT c_zapp_PK PRIMARY KEY(zaposleni_id),
                            CONSTRAINT zap_odj_FK foreign KEY(odjel_id) REFERENCES odjeli_17434(odjel_id));

                            
CREATE TABLE BANKOMATI_17434(bankomat_id INTEGER NOT NULL,
                             lokacija_id INTEGER NOT NULL,
                             stanje DECIMAL(19,9) NOT NULL,
                             CONSTRAINT c_bank_PK PRIMARY KEY(bankomat_id),
                             CONSTRAINT bank_lok_FK FOREIGN KEY(lokacija_id) REFERENCES lokacije_17434(lokacija_id));
                           
                           
                                      DROP TABLE bankomati_17434;
                                      DROP SEQUENCE bankomati_seq;
                                     SELECT * FROM racuni_17434;
                                                                           
                               DROP TABLE musterije_17434;                                                       

CREATE TABLE musterije_17434(musterija_id INTEGER,
                             musterija_ime VARCHAR(20)NOT NULL,
                             musterija_prezime VARCHAR(20)NOT NULL,
                             poslovnica_id INTEGER NOT NULL,
                             zaposlenje VARCHAR(20),
                             dugovanja DECIMAL(19,6),
                             broj_licne_karte VARCHAR(9) NOT NULL UNIQUE,
                             CONSTRAINT c_must_PK PRIMARY KEY(musterija_id));

                               
CREATE TABLE racuni_17434(racun_id INTEGER,
                          tip VARCHAR(20)NOT NULL,
                          musterija_id INTEGER NOT NULL,
                          CONSTRAINT c_rac_PK PRIMARY KEY(racun_id),
                          CONSTRAINT rac_must_FK FOREIGN KEY(musterija_id) REFERENCES musterije_17434(musterija_id));

CREATE TABLE kartice_17434(kartica_id INTEGER,
                           racun_id INTEGER unique,
                           CONSTRAINT c_kart_PK PRIMARY KEY(kartica_id),
                           CONSTRAINT kart_rac_FK FOREIGN KEY(racun_id) REFERENCES racuni_17434);         


                        
CREATE TABLE krediti_17434(kredit_id INTEGER,
                           musterija_id INTEGER NOT NULL,
                           tip_kredita VARCHAR(20)NOT NULL,
                           rata_placeno INTEGER NOT NULL,
                           rata_ostalo INTEGER NOT NULL,
                           kamatna_stopa FLOAT NOT NULL,
                           iznos_kredita DECIMAL(19,6) NOT NULL,
                           CONSTRAINT c_kred_PK PRIMARY KEY(kredit_id),
                           CONSTRAINT kred_must_FK FOREIGN KEY(musterija_id) REFERENCES musterije_17434);
                                                                    
CREATE TABLE ziranti_17434(zirant_id INTEGER,
                           broj_licne_karte varchar(9) NOT NULL,
                           zirant_ime VARCHAR(20) NOT NULL,
                           zirant_prezime VARCHAR(20) NOT NULL,
                           kredit_id INTEGER NOT NULL,
                           zaposlenje VARCHAR(20),
                           CONSTRAINT c_zir_PK PRIMARY KEY(zirant_id),
                           CONSTRAINT zir_kred_FK FOREIGN KEY(kredit_id) REFERENCES krediti_17434);

                                



--sekvence

CREATE SEQUENCE ziranti_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
NOCACHE
NOCYCLE;
                                                           



CREATE SEQUENCE lokacije_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 100
NOCACHE
NOCYCLE;

CREATE SEQUENCE zaposleni_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 10000
NOCACHE
NOCYCLE;      
CREATE SEQUENCE odjeli_seq
INCREMENT BY 10
START WITH 10
MAXVALUE 500
NOCACHE
NOCYCLE;

CREATE SEQUENCE poslovnice_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 200
NOCACHE
NOCYCLE;

CREATE SEQUENCE musterije_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 100000
NOCACHE
NOCYCLE;

CREATE SEQUENCE krediti_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 1000000
NOCACHE
NOCYCLE;

CREATE SEQUENCE racuni_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 1000100
NOCACHE
NOCYCLE;

CREATE SEQUENCE bankomati_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 5000
NOCACHE
NOCYCLE;                                  

CREATE SEQUENCE kartice_seq
INCREMENT BY 1
START WITH 1000
MAXVALUE 9999
NOCACHE
NOCYCLE;                                                                                                            

--unosenje podataka
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'New York');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Sarajevo');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Zenica');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Mostar');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Konjic');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Travnik');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Brcko');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Banja Luka');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Tuzla');
INSERT INTO lokacije_17434(lokacija_id, lokacija_ime)
VALUES (lokacije_seq.NEXTVAL, 'Olovo');                           
               
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,1000000, 1, null);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,45532.564, 2, 1);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,30022.123, 3, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,23454.334, 4, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,9993.5343, 5, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,7865.234, 6, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,6543.323, 7, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,40324.212, 8, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,30746.3246, 9, 2);
INSERT INTO poslovnice_17434(poslovnica_id, stanje, lokacija_id, nadredjena_id)
VALUES (poslovnice_seq.NEXTVAL,9872.45, 10, 2);

                                            
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Glavni IT', 1);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Finansije', 2);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Marketing', 2);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'IT', 2);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Kontrola', 3);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Menadžment', 4);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Finansije', 5);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Finansije', 6);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'It', 7);
INSERT INTO odjeli_17434(odjel_id, odjel_naziv,poslovnica_id )
VALUES (odjeli_seq.NEXTVAL, 'Marketing', 8);
                                       
                                       
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Glavna', 'Riba', NULL,5000);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Sefika', 'Sefikic', 60,1000);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Sabaheta', 'Sabahetic', 70,2000);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Mujo', 'Mujic', 80,1200);
iNSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Lara', 'Croft', 80,2200);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Sebastian', 'Bach', 110,1300.23);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Brad', 'Pitt', 20,800.33);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Antonio', 'Vivaldi',30,2311);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Karabaja', 'Karabajic', 40,1000);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Sejo', 'Sexon', 50,800);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Ibro', 'Dirka', 90,600);
INSERT INTO zaposleni_17434(zaposleni_id, zaposleni_ime, zaposleni_prezime, odjel_id,plata)
VALUES(zaposleni_seq.NEXTVAL, 'Abid', 'Abidic', 100,700);




INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 2, 3787.877  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 2, 4687.811  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 3, 2287.877  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 4, 1987.877  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 5, 987.877  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 6, 3733.832  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 7, 3435.845357  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 8, 3247.75466  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 9, 3457.83457  );
INSERT INTO bankomati_17434(bankomat_id, lokacija_id, stanje)
VALUES (bankomati_seq.NEXTVAL, 10, 997.536  );
                                          

                                                             
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'murga', 'murgic', 6, 'drot',2000,'GH35GF21J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'darth', 'vader', 1, 'zlo',300,'GH35G4231');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'tinky', 'winky', 2, 'teletabis',100,'S425GF21J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'nunu', 'nunic', 3, 'usisivac',null,'GHKH3F21J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'dora', 'explorer', 6, 'explorer',330.3,'GH35GFJ73');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'dipsy', 'dipsych', 4, 'teletabis'123.53,'G563GF21J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'mojo', 'jojo', 5, 'zlo',null,'GH35GGV48');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'popaj', 'popajic', 7, 'fitness trener',600,'GH35V571J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'tom', 'tomic', 8, 'cica maca',1500,'J862GF21J');
INSERT into musterije_17434(musterija_id, musterija_ime, musterija_prezime, poslovnica_id, zaposlenje,dugovanja,broj_licne_karte)
VALUES (musterije_seq.NEXTVAL, 'lik', 'likic', 9, 'drot',10000,'GHHJ7521J');

                                                          
INSERT INTO racuni_17434(racun_id, tip, musterija_id) 
VALUES(racuni_seq.NEXTVAL, 'stedni',10);                         
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'studentski',3);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'stedni',4);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'stedni' ,5);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'tekuci',6);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'tekuci', 7);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'stedni', 8);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'studentski' ,9);
INSERT INTO racuni_17434(racun_id, tip, musterija_id)
VALUES(racuni_seq.NEXTVAL, 'stedni', 2);


                                                                  
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 2, 'neki', 2, 18, 2.23, 2000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 3, 'neki2', 1, 18, 1.223, 12000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 4, 'neki', 12, 3, 4.3, 5000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 5, 'neki', 21, 4, 1.0, 22000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 5, 'neki', 3, 17, 2.1, 5000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 6, 'neki', 11, 9, 2.3, 2000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 7, 'neki',10, 10, 1.13, 12000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 8, 'neki', 9, 11, 1.99, 10000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 9, 'neki', 8, 12, 2.99, 3000);
INSERT INTO krediti_17434(kredit_id, musterija_id, tip_kredita, rata_placeno, rata_ostalo, kamatna_stopa, iznos_kredita)
VALUES (krediti_seq.NEXTVAL, 10, 'neki', 19,1 , 1.00, 42000);
                                                                                

INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)   
VALUES (ziranti_seq.NEXTVAL, 'D120JT812', 'Haso', 'Hasic', 3,'brat');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, '4B90JT824', 'Deen', 'Deenic', 4,'maneken');                                                             
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, 'D12G43812', 'Neko', 'Nekic', 5,'nestic');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, 'JHG432G34', 'Oliva', 'Popaj', 6,'fitness trenerica');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, 'M23HJ4J24', 'Semsudin', 'Semso', 7,'portir');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, 'B34HG5G3H', 'Mig', 'Migic', 8,'mis');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, '1J2B3HG44', 'Tom', 'Cruz', 9,'glumac');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, '35JH3JBV2', 'Covjek', 'Covjekcic', 10,'covjek');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, '34HH2GN45', 'Hasna', 'Hasnic', 12,'diktator');
INSERT INTO ziranti_17434(zirant_id, broj_licne_karte,zirant_ime, zirant_prezime, kredit_id,zaposlenje)
VALUES (ziranti_seq.NEXTVAL, 'L34OJ552J', 'Sena', 'Senic', 11,'plesacica');

                                                        
INSERT INTO kartice_17434(kartica_id, racun_id)
VALUES (kartice_seq.NEXTVAL, 101);
INSERT INTO kartice_17434(kartica_id, racun_id)
VALUES (kartice_seq.NEXTVAL, 109);
INSERT INTO kartice_17434(kartica_id, racun_id)
VALUES (kartice_seq.NEXTVAL, 110);
INSERT INTO kartice_17434(kartica_id, racun_id)
VALUES (kartice_seq.NEXTVAL, 111);
INSERT INTO kartice_17434(kartica_id, racun_id)
VALUES (kartice_seq.NEXTVAL, 112);



 --10 jednostavnijih upita
SELECT zaposleni_ime||' '||zaposleni_prezime, zaposleni_id,plata, o.odjel_naziv
FROM zaposleni_17434 z, odjeli_17434 o
WHERE  z.odjel_id = o.odjel_id AND o.odjel_naziv = 'Marketing';

SELECT musterija_ime||' '||musterija_prezime
FROM musterije_17434
WHERE zaposlenje IS NULL;

SELECT kredit_id, musterija_ime||' '||musterija_prezime
FROM krediti_17434 k, musterije_17434 m
WHERE k.rata_ostalo = 1 AND k.musterija_id = m.musterija_id;

SELECT bankomat_id, l.lokacija_id, lokacija_ime
FROM bankomati_17434 b, lokacije_17434 l
WHERE b.lokacija_id = l.lokacija_id AND b.stanje < 100;

SELECT poslovnica_id, stanje
FROM poslovnice_17434 p, lokacije_17434 l
WHERE p.lokacija_id = l.lokacija_id AND l.lokacija_ime = 'New York';

SELECT kredit_id, tip_kredita, rata_placeno, rata_ostalo
FROM krediti_17434 k, musterije_17434 m, poslovnice_17434 p, lokacije_17434 l
WHERE k.musterija_id = m.musterija_id and m.poslovnica_id = p.poslovnica_id  AND p.lokacija_id = l.lokacija_id AND l.lokacija_ime = 'Sarajevo';



SELECT b.bankomat_id, l.lokacija_ime
FROM bankomati_17434 b, lokacije_17434 l
WHERE b.lokacija_id = l.lokacija_id AND lokacija_ime = 'Sarajevo';


SELECT  lokacija_ime, odjel_id, odjel_naziv
FROM lokacije_17434 l, odjeli_17434 o, poslovnice_17434 p
WHERE lokacija_ime = 'Zenica' AND l.lokacija_id = p.lokacija_id AND p.poslovnica_id = o.poslovnica_id;

SELECT musterija_ime||' '||musterija_prezime, k.iznos_kredita
FROM musterije_17434 m, krediti_17434 k
WHERE m.musterija_id = k.musterija_id AND k.iznos_kredita > 10000;




  --5 s grupnim funkcijama

SELECT Round(Avg(iznos_kredita),5)
FROM krediti_17434
WHERE tip_kredita = 'neki';

SELECT Count(bankomat_id)
FROM bankomati_17434
WHERE stanje<100;

SELECT musterija_ime, musterija_prezime, Avg(iznos_kredita), Sum(iznos_kredita)
FROM musterije_17434 m, krediti_17434 k
WHERE m.musterija_id = k.musterija_id
GROUP BY musterija_ime, musterija_prezime
HAVING Avg(iznos_kredita) > 2000;

SELECT odjel_naziv, Count(musterija_id)
FROM odjeli_17434 o, musterije_17434 m, poslovnice_17434 p, lokacije_17434 l
WHERE o.poslovnica_id = p.poslovnica_id AND p.poslovnica_id = m.poslovnica_id AND l.lokacija_id = p.lokacija_id
GROUP BY odjel_naziv
HAVING Count(musterija_id) > 1;


SELECT l.lokacija_ime, Max(b.stanje)
FROM lokacije_17434 l, bankomati_17434 b
WHERE l.lokacija_id = b.lokacija_id
GROUP BY l.lokacija_ime
HAVING Max(b.stanje) >100;

 

--5 s podupitima 

SELECT z.zaposleni_ime, z.zaposleni_prezime, odjel_id
FROM zaposleni_17434 z
WHERE odjel_id in (SELECT za.odjel_id
                  FROM zaposleni_17434 za
                  WHERE za.zaposleni_ime = 'Mujo' AND z.zaposleni_id!=za.zaposleni_id); 

SELECT musterija_id, musterija_ime, musterija_prezime
FROM musterije_17434
WHERE poslovnica_id IN (SELECT poslovnica_id
                        FROM poslovnice_17434 p, lokacije_17434 l
                        WHERE p.lokacija_id = l.lokacija_id AND l.lokacija_ime = 'Sarajevo' AND p.stanje > 2000);


SELECT o.zaposleni_ime, o.zaposleni_prezime, o.plata , o.zaposleni_id
FROM zaposleni_17434 o
WHERE o.plata != (SELECT Min(p.plata)
                FROM zaposleni_17434 p
                WHERE  p.odjel_id = o.odjel_id) AND o.plata<4500
ORDER BY o.zaposleni_ime, o.zaposleni_prezime, o.plata;



SELECT k.kredit_id,k.iznos_kredita
FROM krediti_17434 k
WHERE k.rata_ostalo < (SELECT Avg(ka.rata_ostalo)
                       FROM krediti_17434 ka);


SELECT o.zaposleni_ime, o.zaposleni_prezime, o.plata, od.odjel_naziv
FROM zaposleni_17434 o, odjeli_17434 od
WHERE o.odjel_id = od.odjel_id AND o.plata < (SELECT Avg(z.plata)
                FROM zaposleni_17434 z
                WHERE z.odjel_id = o.odjel_id
                GROUP BY o.odjel_id) ;


--5 sa više od jednog nivoa podupita


SELECT  o.odjel_naziv, Round(Avg(z.plata),6)
FROM odjeli_17434 o, zaposleni_17434 z
WHERE o.odjel_id = z.odjel_id AND o.odjel_id IN (SELECT d.odjel_id
                                                    FROM odjeli_17434 d
                                                    WHERE d.poslovnica_id IN (SELECT p.poslovnica_id
                                                                              FROM poslovnice_17434 p
                                                                              WHERE p.stanje <30000))
GROUP BY o.odjel_naziv;

          
SELECT z.zaposleni_ime, z.zaposleni_prezime, z.plata
FROM zaposleni_17434 z
WHERE z.plata > (SELECT min(p.plata)
                 FROM zaposleni_17434 p
                 WHERE z.odjel_id = p.odjel_id AND p.odjel_id IN(select o.odjel_id
                                                                 FROM odjeli_17434 o, poslovnice_17434 pos, lokacije_17434 l
                                                                 WHERE o.poslovnica_id = pos.poslovnica_id AND pos.lokacija_id = l.lokacija_id AND l.lokacija_ime = 'Sarajevo'));

SELECT b.bankomat_id, b.stanje
FROM bankomati_17434 b
WHERE b.lokacija_id IN(SELECT p.lokacija_id
                       FROM poslovnice_17434 p
                       WHERE p.stanje > (SELECT min(l.stanje)
                                        FROM poslovnice_17434 l
                                        ));    

SELECT m.musterija_ime, m.musterija_prezime
FROM musterije_17434 m
WHERE musterija_id IN (SELECT k.musterija_id
                       FROM krediti_17434 k
                       WHERE k.rata_placeno < (SELECT Avg(kr.rata_placeno)
                                              FROM krediti_17434 kr
                                              WHERE kr.iznos_kredita>2000));

SELECT k.kredit_id, k.tip_kredita, k.iznos_kredita
FROM krediti_17434 k
WHERE k.musterija_id IN(SELECT m.musterija_id
                        FROM musterije_17434 m
                        WHERE m.zaposlenje IS NOT NULL and m.poslovnica_id IN(SELECT p.poslovnica_id
                                                                              FROM poslovnice_17434 p
                                                                              WHERE p.lokacija_id = (SELECT l.lokacija_id
                                                                                                     FROM lokacije_17434 l
                                                                                          
                                                                                                     WHERE l.lokacija_ime = 'Tuzla')));

--2 sa subtotalima(rollup,cube, Grouping sets)

 SELECT o.poslovnica_id,z.odjel_id,  Sum(z.plata)
 FROM zaposleni_17434 z, odjeli_17434 o
 WHERE z.odjel_id = o.odjel_id
 GROUP BY rollup(o.poslovnica_id,z.odjel_id);

 SELECT  tip_kredita,musterija_id,
  Sum(iznos_kredita)
 FROM krediti_17434
 GROUP BY cube( tip_kredita,musterija_id);

 --1 sa UNION, SET
 SELECT lokacija_id
 FROM bankomati_17434
 WHERE stanje > 600
 intersect
 SELECT lokacija_id
 FROM poslovnice_17434
 WHERE stanje < 31000;


 --2 sa TOP-N analizom
 SELECT ROWNUM AS TOP5, zaposleni_ime, zaposleni_prezime, plata
 FROM (SELECT zaposleni_ime, zaposleni_prezime, plata
      FROM zaposleni_17434
      ORDER BY plata DESC)
WHERE ROWNUM<=5;


SELECT ROWNUM AS Najveci_krediti, kredit_id, iznos_kredita
FROM(SELECT kredit_id, iznos_kredita
     FROM krediti_17434
     ORDER BY iznos_kredita DESC)
WHERE ROWNUM <=3;  


--5 indexa
CREATE INDEX lokacija_lokacija_id_indx
ON lokacije_17434(lokacija_ime);                 

 /*Zelim ubrzati pretragu lokacija po njihovom imenu jer cesto u navedenim upitima, a i u upitima koji bi se mogli nametati u buducnosti
                                                    imamo potrebu da vrsimo upravo to pretrazivanje, cesto je koristena u WHERE klauzuli. Ako zelimo npr da pronadjemo sve poslovnice
                                                    ili prebrojimo sve bankomate u odredjenom gradu koristit cemo lokacija_ime. */

CREATE INDEX zaposleni_plata_indx
ON zaposleni_17434(plata);      
                 /*U trenutnim upitima je cesto koristena plata u WHERE klauzulama, a u buducnosti kada nam je potreban izvjestaj o platama zaposlenih u 
                                                   odjelima (mjesecni, godisnji izvjestaj), kada je potrebno nekom zaposleniku dati promaknuce koristit cemo upravo platu.*/
CREATE INDEX bankomati_stanje_indx
ON bankomati_17434(stanje);       
               /*Posto je potrebno u bankomat unijeti novac nakon sto njegovo stanje padne ispod odredjene kolicine novca cesto ce biti u upotrebi.*/

CREATE INDEX poslovnice_stanje_indx
ON poslovnice_17434(stanje);       
              /*Receno je da poslovnice moraju slati mjesecne/godisnje izvjestaje svojim nadredjenim poslovnicama (regionalnim) i potom glavnoj
                                                   poslovnici u New Yorku, pa æe stanje u poslovnicama biti jako cesto koristeno. Upotrijebljeno za izvjestaje da li data poslovnica
                                                   posluje dobro, da li treba "ugasiti" neku poslovnicu na odredjenoj lokaciji i sl.*/


CREATE INDEX krediti_tip_kredita_indx
ON krediti_17434(tip_kredita);     
               /*S obzirom da postoji samo nekoliko tipova kredita, cesto je potrebno razvrstati kredite po ovom kriterijumu. Prilikom izvjestaja
                                                    koje pravi poslovnica takoðe æe biti upotrijebljeni. Korisno je da se ovo pretrazivanje brze izvrsava*/


--triggeri

                                                    

CREATE OR REPLACE TRIGGER nelegalan_br_licne_musterije
BEFORE INSERT ON musterije_17434
FOR EACH ROW
WHEN(Length(NEW.broj_licne_karte)<9)
BEGIN
RAISE_APPLICATION_ERROR (-20502,'Nelegalan broj licne karte') ;
END;
                 


CREATE OR REPLACE TRIGGER ako_je_plata_prevelika
before INSERT ON zaposleni_17434
FOR EACH ROW 
WHEN(NEW.plata>5000)
BEGIN
:new.plata := :NEW.plata * 0.7 ;
END;  


CREATE TRIGGER nelegalan_br_licne_ziranta
BEFORE INSERT ON ziranti_17434
FOR EACH ROW
WHEN(Length(NEW.broj_licne_karte)<9)
BEGIN
RAISE_APPLICATION_ERROR (-20503,'Nelegalan broj licne karte');
END;
     
CREATE TRIGGER nelegalan_iznos_kredita
BEFORE INSERT ON krediti_17434
FOR EACH ROW
WHEN(NEW.iznos_kredita >500000)
BEGIN
RAISE_APPLICATION_ERROR (-20504,'Nelegalan iznos kredita');
END;
               

CREATE TRIGGER update_iznos_kredita
BEFORE UPDATE OF iznos_kredita ON krediti_17434
FOR EACH ROW
BEGIN
RAISE_APPLICATION_ERROR (-20506,'Nije moguce naknadno promijeniti iznos kredita.');
END;


CrEATE OR REPLACE TRIGGER  ako_je_plata_premala
before INSERT ON zaposleni_17434
FOR EACH ROW 
WHEN(NEW.plata<500)
BEGIN  
 :NEW.plata := :NEW.plata * 1.3;

END;  


CREATE OR REPLACE TRIGGER update_plate
BEFORE UPDATE OF plata ON zaposleni_17434
FOR EACH ROW
BEGIN       
IF(:NEW.plata < :old.plata) OR
(:new.plata > :old.plata * 1.1)
THEN
RAISE_APPLICATION_ERROR (-20505,
'Nije moguce povecati platu za iznos veæi od 10% ili je smanjiti.');
END IF;
END;

CREATE TRIGGER update_kamatne_stope
BEFORE UPDATE OF kamatna_stopa ON krediti_17434
FOR EACH ROW
BEGIN
RAISE_APPLICATION_ERROR (-20507,
'Nije moguce naknadno promijeniti kamatnu stopu kredita.');
END;                   

CREATE TRIGGER update_tipa_kredita
BEFORE UPDATE OF tip_kredita ON krediti_17434
FOR EACH ROW
BEGIN
RAISE_APPLICATION_ERROR (-20508,
'Nije moguce naknadno promijeniti tip kredita.');
END;

CREATE TRIGGER update_insert_stanja_bankomat
BEFORE INSERT OR UPDATE OF stanje ON bankomati_17434
FOR EACH ROW
WHEN(NEW.stanje>10000)
BEGIN
RAISE_APPLICATION_ERROR (-20509,
'Nije moguce pohraniti tu sumu novca u jedan bankomat.');
END;


  
--10 funkcija

CREATE OR REPLACE FUNCTION uvecaj_platu_10posto(pl zaposleni_17434.plata%TYPE)
RETURN zaposleni_17434.plata%TYPE
IS
plata zaposleni_17434.plata%TYPE := pl;          
BEGIN            
plata := pl*1.1;
RETURN plata;
END;  


CREATE OR REPLACE FUNCTION vrati_platu(zid zaposleni_17434.zaposleni_id%TYPE)
RETURN zaposleni_17434.plata%TYPE
IS
pl zaposleni_17434.plata%TYPE := 0;
BEGIN
SELECT plata
into pl
FROM zaposleni_17434
WHERE zaposleni_17434.zaposleni_id = zid;
RETURN pl;
END;



CREATE OR REPLACE FUNCTION vrati_mjesecnu_ratu_kredita(kid krediti_17434.kredit_id%TYPE)
RETURN float
IS
vrati float := 0;
broj_rata INTEGER := 0;
broj1 INTEGER := 0;
broj2 INTEGER := 0;
stopa krediti_17434.kamatna_stopa%TYPE := 0;
iznos krediti_17434.iznos_kredita%TYPE := 0;
BEGIN
SELECT kamatna_stopa, iznos_kredita, rata_placeno, rata_ostalo
INTO stopa, iznos, broj1,broj2
FROM krediti_17434
WHERE krediti_17434.kredit_id = kid;
vrati := (iznos*stopa)/(broj1+broj1);
RETURN vrati;
END;

CREATE OR REPLACE FUNCTION vrati_licnu_ziranta(zid ziranti_17434.zirant_id%TYPE)
RETURN ziranti_17434.broj_licne_karte%TYPE
IS
vrati ziranti_17434.broj_licne_karte%TYPE := 0;
BEGIN
SELECT broj_licne_karte
INTO vrati
FROM ziranti_17434
WHERE ziranti_17434.zirant_id = zid;
RETURN vrati;
END;


CREATE OR REPLACE FUNCTION izracunaj_regres(zid zaposleni_17434.zaposleni_id%TYPE)
RETURN zaposleni_17434.plata%TYPE
IS
vrati  zaposleni_17434.plata%TYPE := 0;
godisnja  zaposleni_17434.plata%TYPE := 0;
BEGIN 
SELECT plata
INTO godisnja
FROM zaposleni_17434
WHERE zaposleni_17434.zaposleni_id = zid;
godisnja := 12*godisnja;
vrati := godisnja * 0.5;
RETURN vrati;
END;

CREATE OR REPLACE FUNCTION prosjecna_plata_odjela(oid odjeli_17434.odjel_id%TYPE)
RETURN zaposleni_17434.plata%type
IS
vrati zaposleni_17434.plata%TYPE := 0;
broj INTEGER := 0;
BEGIN
SELECT Avg(z.plata),Count(z.plata)
INTO vrati,broj
FROM zaposleni_17434 z, odjeli_17434 o
WHERE z.odjel_id = o.odjel_id AND o.odjel_id = oid;
RETURN vrati/broj;
END;


CREATE OR REPLACE FUNCTION vrati_broj_ziranata(kid krediti_17434.kredit_id%TYPE)
RETURN INTEGER
IS
broj INTEGER := 0;
BEGIN
SELECT Count(z.zirant_id)
INTO broj
FROM ziranti_17434 z
WHERE z.kredit_id = kid;
RETURN broj;
END;


CREATE OR REPLACE FUNCTION vrati_broj_bankomata(lid lokacije_17434.lokacija_id%TYPE, kriticno_stanje bankomati_17434.stanje%TYPE)
RETURN INTEGER
IS
vrati INTEGER := 0;
BEGIN
SELECT Count(b.bankomat_id)
INTO vrati
FROM bankomati_17434 b
WHERE b.lokacija_id = lid AND b.stanje <= kriticno_stanje;
RETURN vrati;
END;

CREATE OR REPLACE FUNCTION  umanji_kamatnu_stopu(kid krediti_17434.kredit_id%TYPE, umanjenje krediti_17434.kamatna_stopa%TYPE)
RETURN krediti_17434.kamatna_stopa%TYPE
IS
vrati krediti_17434.kamatna_stopa%TYPE := 0;
BEGIN
SELECT k.kamatna_stopa*umanjenje
INTO vrati
FROM krediti_17434 k
WHERE k.kredit_id = kid;
RETURN vrati;
END;

CREATE OR REPLACE FUNCTION umanji_platu(zid zaposleni_17434.zaposleni_id%TYPE, minimum zaposleni_17434.plata%TYPE, umanjenje FLOAT)
RETURN zaposleni_17434.plata%TYPE
IS
vrati zaposleni_17434.plata%TYPE := 0;
BEGIN
SELECT z.plata
INTO vrati
FROM zaposleni_17434 z
where z.zaposleni_id = zid;
vrati := vrati*umanjenje;
IF(vrati<minimum) THEN RETURN vrati/umanjenje;
END IF;
 RETURN vrati;
END;


--10 procedura

CREATE OR REPLACE PROCEDURE najmanja_stopa_uvecaj(uvecanje IN krediti_17434.kamatna_stopa%TYPE , kid OUT krediti_17434.kredit_id%TYPE , nova OUT krediti_17434.kamatna_stopa%TYPE )
IS
BEGIN
SELECT k.kredit_id, k.kamatna_stopa
INTO kid, nova
FROM krediti_17434  k
WHERE k.kamatna_stopa = (SELECT Min(ka.kamatna_stopa)
                     FROM krediti_17434 ka) ;
nova := nova*uvecanje;
END;


CREATE OR REPLACE PROCEDURE dopuni_bankomat(bid IN bankomati_17434.bankomat_id%TYPE, dopuna IN bankomati_17434.stanje%TYPE)
IS
trenutno bankomati_17434.stanje%TYPE := 0;
BEGIN
SELECT stanje
INTO trenutno
FROM bankomati_17434
WHERE bankomat_id = bid;
UPDATE bankomati_17434
SET stanje = trenutno + dopuna
WHERE bankomat_id = bid;
END;


CREATE OR REPLACE PROCEDURE oduzmi_od_poslovnice(pid in poslovnice_17434.poslovnica_id%TYPE, kolicina IN poslovnice_17434.stanje%TYPE)
IS
trenutno poslovnice_17434.stanje%TYPE := 0;
BEGIN
SELECT stanje
INTO trenutno 
FROM poslovnice_17434
WHERE poslovnica_id = pid;
IF(trenutno<=kolicina) THEN Raise_Application_Error(-26000,'Nedovoljno novca u poslovnici');
ELSE 
UPDATE poslovnice_17434
SET stanje = trenutno - kolicina
WHERE poslovnica_id = pid;
END IF;
END;
                    

CREATE OR REPLACE PROCEDURE daj_povisicu(zid IN zaposleni_17434.zaposleni_id%TYPE, povisica IN FLOAT)
IS
BEGIN
UPDATE zaposleni_17434
SET plata = plata * povisica
WHERE zaposleni_id = zid;
END;

CREATE OR REPLACE PROCEDURE promijeni_odjel_zaposlenog( zid IN zaposleni_17434.zaposleni_id%TYPE, oid IN odjeli_17434.odjel_id%TYPE, broj_zaposlenih OUT integer)
IS
BEGIN
UPDATE zaposleni_17434
SET odjel_id = oid
WHERE zaposleni_id = zid;
SELECT Count(zaposleni_id)
INTO broj_zaposlenih
FROM zaposleni_17434
WHERE odjel_id = oid;
END;

CREATE OR REPLACE PROCEDURE uplacena_rata(kid IN krediti_17434.kredit_id%TYPE, ostalo OUT INTEGER)
IS
uplaceno INTEGER := 0;
BEGIN
SELECT rata_ostalo, rata_placeno
INTO ostalo, uplaceno
FROM krediti_17434
WHERE kredit_id = kid;
IF(ostalo = 0) THEN Raise_Application_Error(-25002, 'Sve rate vec su isplacene');
RETURN;
END IF;
UPDATE krediti_17434
SET rata_ostalo = ostalo-1, rata_placeno = uplaceno +1
WHERE kredit_id = kid;
END;




CREATE OR REPLACE PROCEDURE transfer_novca_u_nadredjenu(poslovnica IN poslovnice_17434.poslovnica_id%TYPE, kolicina IN poslovnice_17434.stanje%TYPE)
IS
nadredjena poslovnice_17434.poslovnica_id%TYPE := 0;
stanje1  poslovnice_17434.stanje%TYPE := 0;
stanje2 poslovnice_17434.stanje%TYPE := 0;
BEGIN
SELECT Nvl(nadredjena_id,0), stanje
INTO nadredjena,stanje1
FROM poslovnice_17434
WHERE poslovnica_id = poslovnica;
IF(poslovnica = 0) THEN  Raise_Application_Error(-25062, 'Ova poslovnica nema nadredjenu poslovnicu.'); return;
ELSIF(stanje1<=kolicina) THEN Raise_Application_Error(-25006, 'Ova poslovnica nema na raspolaganju dovoljnu svotu novca.'); return;
END IF;

SELECT stanje
INTO stanje2
FROM poslovnice_17434
WHERE poslovnica_id = nadredjena;

UPDATE poslovnice_17434
SET stanje = stanje1 - kolicina
WHERE poslovnica_id = poslovnica;

UPDATE poslovnice_17434
SET stanje = stanje2 + kolicina
WHERE poslovnica_id = nadredjena; 
END;




CREATE OR REPLACE PROCEDURE promijeni_zaposlenje(mid IN musterije_17434.musterija_id%type, novo IN musterije_17434.zaposlenje%TYPE)
IS
BEGIN
UPDATE musterije_17434
SET zaposlenje = novo
WHERE musterija_id = mid;
END;


CREATE OR REPLACE PROCEDURE update_dugovanja(mid IN musterije_17434.musterija_id%type, novo IN musterije_17434.dugovanja%TYPE) 
IS
BEGIN
UPDATE musterije_17434
SET dugovanja = novo
WHERE musterija_id = mid;
END;




CREATE OR REPLACE PROCEDURE podizanje_s_bankomata(bid IN bankomati_17434.bankomat_id%TYPE, podignuto IN bankomati_17434.stanje%TYPE, ostalo OUT bankomati_17434.stanje%TYPE)
IS
BEGIN
SELECT stanje
INTO ostalo
FROM bankomati_17434
WHERE bankomat_id = bid;

IF(ostalo<=podignuto) THEN  Raise_Application_Error(-25061, 'Ovaj bankomat nema dovoljno novca za transakciju.'); return;
END IF;

UPDATE bankomati_17434
SET stanje = ostalo - podignuto
WHERE bankomat_id = bid;

ostalo := ostalo - podignuto;
END;



--PL/SQL skripta 
/*
skripta vrsi automatizaciju procesa dopunjavanja bankomata koji imaju najmanju kolicinu sredstava dostupnu i imaju nedovoljnu kolicinu novca za daljnje funkcionisanje.
Pronalazi se takav bankomat, zatim se na lokaciji na kojoj se nalazi pronalazi poslovnica cije je stanje trenutno najbolje, tj.
koja ima najvecu kolicinu novca dostupnu, zatim se vrsi transfer novca iz te poslovnice na bankomat. Ukoliko nijedna poslovnica na toj
lokaciji nema dovoljnu kolicinu novca, vrsi se transfer iz nadredjene, a potom ako ni ona nema novca, iz glavne banke u New Yorku 
*/

DECLARE 
kriza bankomati_17434.bankomat_id%TYPE := 0;
poslovnica poslovnice_17434.poslovnica_id%TYPE := 0;
stanje_poslovnice poslovnice_17434.stanje%TYPE := 0;
stanje_bankomata bankomati_17434.stanje%TYPE := 0;
lokacija lokacije_17434.lokacija_id%TYPE := 0;
nadredjena poslovnice_17434.poslovnica_id%TYPE := 0;
BEGIN
SELECT bankomat_id, stanje
INTO kriza, stanje_bankomata
FROM bankomati_17434
WHERE stanje = (SELECT Min(b.stanje)
                FROM bankomati_17434 b)
                AND stanje < 500;

SELECT lokacija_id
INTO lokacija
FROM bankomati_17434
WHERE bankomat_id = kriza;

SELECT poslovnica_id, stanje
INTO poslovnica, stanje_poslovnice
FROM  poslovnice_17434
WHERE  stanje = (SELECT Max(p.stanje)
                 FROM poslovnice_17434 p
                 WHERE p.lokacija_id = lokacija);

IF(stanje_poslovnice>5000)
THEN 
  UPDATE poslovnice_17434
  SET stanje = stanje_poslovnice-2000
  WHERE poslovnica_id = poslovnica;
  UPDATE bankomati_17434
  SET stanje = stanje_bankomata+2000
  WHERE bankomat_id = kriza;

ELSIF(stanje_poslovnice<5000)
THEN
  SELECT nadredjena_id
  INTO nadredjena
  FROM poslovnice_17434
  WHERE poslovnica_id = poslovnica;

  poslovnica := nadredjena;

  SELECT stanje
  INTO stanje_poslovnice
  FROM poslovnice_17434
  WHERE poslovnica_id = poslovnica;

  IF(stanje_poslovnice>5000)
  THEN 
    UPDATE poslovnice_17434
    SET stanje = stanje_poslovnice-2000
    WHERE poslovnica_id = poslovnica;
    UPDATE bankomati_17434
    SET stanje = stanje_bankomata+2000
    WHERE bankomat_id = kriza;
  ELSIF(stanje_poslovnice<5000)
  THEN 
    SELECT p.poslovnica_id, p.stanje
    INTO poslovnica, stanje_poslovnice
    FROM poslovnice_17434 p  
    WHERE  p.lokacija_id = 1;

    IF(stanje_poslovnice<5000) THEN Raise_Application_Error(-26000,'Propada ti banka'); 
    END IF;

    UPDATE poslovnice_17434
    SET stanje = stanje_poslovnice-2000
    WHERE poslovnica_id = poslovnica;
    UPDATE bankomati_17434
    SET stanje = stanje_bankomata+2000
    WHERE bankomat_id = kriza;
  END IF;
END IF;
END;
     





