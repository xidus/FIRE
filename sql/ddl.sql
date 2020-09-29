-----------------------------------------------------------------------------------------
--                                TABLE CREATION
-----------------------------------------------------------------------------------------

CREATE TABLE beregning (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36)
);


CREATE TABLE beregning_koordinat (
  beregningobjektid INTEGER NOT NULL,
  koordinatobjektid INTEGER NOT NULL,
  PRIMARY KEY (beregningobjektid, koordinatobjektid)
);


CREATE TABLE beregning_observation (
  beregningobjektid INTEGER NOT NULL,
  observationobjektid INTEGER NOT NULL,
  PRIMARY KEY (beregningobjektid, observationobjektid)
);


CREATE TABLE eventtype (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  beskrivelse VARCHAR2(4000) NOT NULL,
  event VARCHAR2(4000) NOT NULL,
  eventtypeid INTEGER NOT NULL
);


CREATE TABLE geometriobjekt (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36),
  geometri SDO_GEOMETRY NOT NULL,
  punktid VARCHAR2(36) NOT NULL
);

INSERT INTO
  user_sdo_geom_metadata (table_name, column_name, diminfo, srid)
VALUES
  (
    'GEOMETRIOBJEKT',
    'GEOMETRI',
    MDSYS.SDO_DIM_ARRAY(
      MDSYS.SDO_DIM_ELEMENT('Longitude', -180.0000, 180.0000, 0.005),
      MDSYS.SDO_DIM_ELEMENT('Latitude', -90.0000, 90.0000, 0.005)
    ),
    4326
  );


CREATE TABLE herredsogn (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  kode VARCHAR2(6) NOT NULL,
  geometri SDO_GEOMETRY NOT NULL
);

INSERT INTO
  user_sdo_geom_metadata (table_name, column_name, diminfo, srid)
VALUES
  (
    'HERREDSOGN',
    'GEOMETRI',
    MDSYS.SDO_DIM_ARRAY(
      MDSYS.SDO_DIM_ELEMENT('Longitude', -180.0000, 180.0000, 0.005),
      MDSYS.SDO_DIM_ELEMENT('Latitude', -90.0000, 90.0000, 0.005)
    ),
    4326
  );

CREATE TABLE koordinat (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36),
  sridid INTEGER NOT NULL,
  sx NUMBER,
  sy NUMBER,
  sz NUMBER,
  t TIMESTAMP WITH TIME ZONE NOT NULL,
  fejlmeldt VARCHAR2(5) NOT NULL,
  transformeret VARCHAR2(5) NOT NULL,
  artskode INTEGER,
  x NUMBER,
  y NUMBER,
  z NUMBER,
  punktid VARCHAR2(36) NOT NULL
);


CREATE TABLE konfiguration (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  dir_skitser VARCHAR(200) NOT NULL,
  dir_materiale VARCHAR(200) NOT NULL
);


CREATE TABLE observation (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  id VARCHAR2(36) NOT NULL,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  value1 NUMBER,
  value2 NUMBER,
  value3 NUMBER,
  value4 NUMBER,
  value5 NUMBER,
  value6 NUMBER,
  value7 NUMBER,
  value8 NUMBER,
  value9 NUMBER,
  value10 NUMBER,
  value11 NUMBER,
  value12 NUMBER,
  value13 NUMBER,
  value14 NUMBER,
  value15 NUMBER,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36),
  observationstypeid INTEGER NOT NULL,
  antal INTEGER NOT NULL,
  gruppe INTEGER,
  observationstidspunkt TIMESTAMP WITH TIME ZONE NOT NULL,
  opstillingspunktid VARCHAR2(36) NOT NULL,
  sigtepunktid VARCHAR2(36)
);


CREATE TABLE observationstype (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  observationstypeid INTEGER NOT NULL,
  observationstype VARCHAR2(4000) NOT NULL,
  beskrivelse VARCHAR2(4000) NOT NULL,
  sigtepunkt VARCHAR2(5) NOT NULL,
  value1 VARCHAR2(4000),
  value2 VARCHAR2(4000),
  value3 VARCHAR2(4000),
  value4 VARCHAR2(4000),
  value5 VARCHAR2(4000),
  value6 VARCHAR2(4000),
  value7 VARCHAR2(4000),
  value8 VARCHAR2(4000),
  value9 VARCHAR2(4000),
  value10 VARCHAR2(4000),
  value11 VARCHAR2(4000),
  value12 VARCHAR2(4000),
  value13 VARCHAR2(4000),
  value14 VARCHAR2(4000),
  value15 VARCHAR2(4000)
);


CREATE TABLE punkt (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36),
  id VARCHAR2(36) NOT NULL
);


CREATE TABLE punktinfo (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  sagseventfraid VARCHAR2(36) NOT NULL,
  sagseventtilid VARCHAR2(36),
  infotypeid INTEGER NOT NULL,
  tal NUMBER,
  tekst VARCHAR2(4000),
  punktid VARCHAR2(36) NOT NULL
);


CREATE TABLE punktinfotype (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  infotypeid INTEGER NOT NULL,
  infotype VARCHAR2(4000) NOT NULL,
  anvendelse VARCHAR2(9) NOT NULL,
  beskrivelse VARCHAR2(4000) NOT NULL
);


CREATE TABLE sag (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  id VARCHAR2(36) NOT NULL,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL
);


CREATE TABLE sagsevent (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  id VARCHAR2(36) NOT NULL,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  eventtypeid INTEGER NOT NULL,
  sagsid VARCHAR2(36) NOT NULL
);


CREATE TABLE sagseventinfo (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  beskrivelse VARCHAR2(4000),
  sagseventid VARCHAR2(36) NOT NULL
);


CREATE TABLE sagseventinfo_html (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  html CLOB NOT NULL,
  sagseventinfoobjektid INTEGER NOT NULL
);


CREATE TABLE SAGSEVENTINFO_MATERIALE (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  md5sum VARCHAR2(32) NOT NULL,
  sti VARCHAR2(4000) NOT NULL,
  sagseventinfoobjektid INTEGER NOT NULL
);


CREATE TABLE sagsinfo (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  aktiv VARCHAR2(5) NOT NULL,
  registreringfra TIMESTAMP WITH TIME ZONE NOT NULL,
  registreringtil TIMESTAMP WITH TIME ZONE,
  journalnummer VARCHAR2(4000),
  behandler VARCHAR2(4000) NOT NULL,
  beskrivelse VARCHAR2(4000),
  sagsid VARCHAR2(36) NOT NULL
);


CREATE TABLE sridtype (
  objektid INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH
      1 INCREMENT BY 1 ORDER NOCACHE
  ) PRIMARY KEY,
  x VARCHAR2(4000),
  y VARCHAR2(4000),
  z VARCHAR2(4000),
  sridid INTEGER NOT NULL,
  srid VARCHAR2(36) NOT NULL,
  beskrivelse VARCHAR2(4000) NOT NULL
);


-----------------------------------------------------------------------------------------
--                                  CONSTRAINTS & INDEX
-----------------------------------------------------------------------------------------

-- Check constraints på
ALTER TABLE
  koordinat
ADD
  CONSTRAINT ck_koordinat_transformer248 CHECK (transformeret IN ('true', 'false'));

ALTER TABLE
  koordinat
ADD
  CONSTRAINT ck_koordinat_fejlmeldt CHECK (fejlmeldt IN ('true', 'false'));

ALTER TABLE
  observationstype
ADD
  CONSTRAINT ck_observation_sigtepunkt085 CHECK (sigtepunkt IN ('true', 'false'));

ALTER TABLE
  punktinfotype
ADD
  CONSTRAINT ck_punktinfoty_anvendelse138 CHECK (anvendelse IN ('FLAG', 'TAL', 'TEKST'));

ALTER TABLE
  sagsinfo
ADD
  CONSTRAINT ck_sagsinfo_aktiv060 CHECK (aktiv IN ('true', 'false'));

-- Constraints der sikrer at namespacedelen er korrekt i PUNKTINFOTYPE
ALTER TABLE
  punktinfotype
ADD
  CONSTRAINT punktinfotype_con_0001 CHECK (
    substr(infotype, 1, instr(infotype, ':') -1) IN ('AFM', 'ATTR', 'IDENT', 'NET', 'REGION', 'SKITSE')
  ) ENABLE VALIDATE;

-- Constraints der sikrer at namespacedelen er korrekt i SRIDTYPE
ALTER TABLE
  sridtype
ADD
  CONSTRAINT ot_srid_0001 CHECK (
    substr(SRID, 1, instr(SRID, ':') -1) IN ('DK', 'EPSG', 'GL', 'TS')
  ) ENABLE VALIDATE;


-- Index sikrer at der kun kan indsættes een række i tabellen
CREATE UNIQUE INDEX only_one_row ON konfiguration ('1');

-- Index der skal sikre at der til samme punkt ikke tilføjes en koordinat
-- med samme SRIDID, hvis denne ikke er afregistreret
CREATE UNIQUE INDEX koor_uniq_001 ON koordinat (sridid, punktid, registreringtil);

-- Spatiale index
CREATE INDEX idx_geometriobjekt_geometri ON geometriobjekt (geometri) INDEXTYPE IS MDSYS.SPATIAL_INDEX PARAMETERS('layer_gtype=point');
CREATE INDEX idx_herredsogn_geometri ON herredsogn (geometri) INDEXTYPE IS MDSYS.SPATIAL_INDEX PARAMETERS ('layer_gtype=polygon');


-- Unique index på alle kolonner med ID'er.
CREATE UNIQUE INDEX id_idx_0001 ON punkt (id);

ALTER TABLE
  punkt
ADD
  (
    CONSTRAINT punkt_r01 UNIQUE (id) USING INDEX id_idx_0001 ENABLE VALIDATE
  );

CREATE UNIQUE INDEX id_idx_0002 ON observation (id);

ALTER TABLE
  observation
ADD
  (
    CONSTRAINT observation_r02 UNIQUE (id) USING INDEX id_idx_0002 ENABLE VALIDATE
  );

CREATE UNIQUE INDEX sridtype_u01 ON sridtype (sridid);

ALTER TABLE
  sridtype
ADD
  CONSTRAINT sridtype_u01 UNIQUE (sridid) USING INDEX sridtype_u01 ENABLE VALIDATE;

CREATE UNIQUE INDEX eventtype_u01 ON eventtype (eventtypeid);

ALTER TABLE
  eventtype
ADD
  CONSTRAINT eventtype_u01 UNIQUE (eventtypeid) USING INDEX eventtype_u01 ENABLE VALIDATE;

CREATE UNIQUE INDEX punktinfotype_idx_01 ON punktinfotype (infotypeid);

ALTER TABLE
  punktinfotype
ADD
  CONSTRAINT punktinfotype_u01 UNIQUE (infotypeid) USING INDEX punktinfotype_idx_01 ENABLE VALIDATE;

CREATE UNIQUE INDEX observationstype_idx_001 ON observationstype (observationstypeid);

ALTER TABLE
  observationstype
ADD
  CONSTRAINT observationstype_u01 UNIQUE (observationstypeid) USING INDEX observationstype_idx_001 ENABLE VALIDATE;

ALTER TABLE
  sag
ADD
  CONSTRAINT sag_u01 UNIQUE (id) ENABLE VALIDATE;

ALTER TABLE
  sagsevent
ADD
  CONSTRAINT sagsevent_u01 UNIQUE (id) ENABLE VALIDATE;


-- Foreign keys til punktid, sridid og infotypeid, der sikrer at der ikke
-- indsættes rækker med henvisninger til objekter der ikke findes
ALTER TABLE
  koordinat
ADD
  CONSTRAINT koordinat_r01 FOREIGN KEY (sridid) REFERENCES sridtype (sridid) ENABLE VALIDATE;

ALTER TABLE
  koordinat
ADD
  CONSTRAINT punktid_con_0001 FOREIGN KEY (punktid) REFERENCES punkt (id) ENABLE VALIDATE;

ALTER TABLE
  observation
ADD
  CONSTRAINT Observation_sp_con_0001 FOREIGN KEY (sigtepunktid) REFERENCES punkt (id) ENABLE VALIDATE;

ALTER TABLE
  observation
ADD
  CONSTRAINT observation_op1_con_0001 FOREIGN KEY (opstillingspunktid) REFERENCES punkt (id) ENABLE VALIDATE;

ALTER TABLE
  observation
ADD
  CONSTRAINT observation_r01 FOREIGN KEY (observationstypeid) REFERENCES observationstype (observationstypeid) ENABLE VALIDATE;

ALTER TABLE
  punktinfo
ADD
  CONSTRAINT punktinfo_con_001 FOREIGN KEY (punktid) REFERENCES punkt (id) ENABLE VALIDATE;

ALTER TABLE
  punktinfo
ADD
  CONSTRAINT punktinfo_r01 FOREIGN KEY (infotypeid) REFERENCES punktinfotype (infotypeid) ENABLE VALIDATE;

ALTER TABLE
  sagsinfo
ADD
  CONSTRAINT sagsinfo_r01 FOREIGN KEY (sagsid) REFERENCES sag (id) ENABLE VALIDATE;

ALTER TABLE
  sagsevent
ADD
  CONSTRAINT sagsevent_r01 FOREIGN KEY (sagsid) REFERENCES sag (id) ENABLE VALIDATE;

ALTER TABLE
  sagsevent
ADD
  CONSTRAINT sagsevent_r02 FOREIGN KEY (eventtypeid) REFERENCES eventtype (eventtypeid) ENABLE VALIDATE;

ALTER TABLE
  sagseventinfo
ADD
  CONSTRAINT sagseventinfo_r01 FOREIGN KEY (sagseventid) REFERENCES sagsevent (id) ENABLE VALIDATE;


-- Diverse index

CREATE INDEX idx_punktinfo_pid ON punktinfo(punktid);

CREATE INDEX idx_koordinat_pid ON koordinat(punktid);

CREATE INDEX idx_geomobj_pid ON geometriobjekt(punktid);

CREATE INDEX idx_observ_opid ON observation(opstillingspunktid);

CREATE INDEX idx_observ_spid ON observation(sigtepunktid);

CREATE INDEX idx_punktinfotyp_anv ON punktinfotype(anvendelse);

CREATE INDEX idx_punktinfotyp_typ ON punktinfotype(infotype);


--- --  Dette bør lægges på ifm indlæsning fra REFGEO
CREATE UNIQUE INDEX geomobj_datopid ON geometriobjekt(punktid, registreringfra);

-- Constraint der tjekker at registreringtil er større end registreringfra
ALTER TABLE
  beregning
ADD
  CONSTRAINT beregning_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  geometriobjekt
ADD
  CONSTRAINT geometriobjekt_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  koordinat
ADD
  CONSTRAINT koordinat_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  observation
ADD
  CONSTRAINT observation_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  punkt
ADD
  CONSTRAINT punkt_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  punktinfo
ADD
  CONSTRAINT punktinfo_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  sagsinfo
ADD
  CONSTRAINT sagsinfo_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;

ALTER TABLE
  sagseventinfo
ADD
  CONSTRAINT sagseventinfo_con_0001 CHECK (
    nvl(
      registreringtil,
      to_timestamp_tz(
        '31/12/2099 00:00:00.000000 +1:00',
        'dd/mm/yyyy hh24:mi:ss.ff tzh:tzm'
      )
    ) >= registreringfra
  ) ENABLE VALIDATE;



-----------------------------------------------------------------------------------------
--                                     COMMENTS
-----------------------------------------------------------------------------------------


COMMENT ON TABLE beregning IS 'Sammenknytter beregnede koordinater med de anvendte observationer.';
COMMENT ON COLUMN beregning.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN beregning.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN beregning.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN beregning.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';
COMMENT ON COLUMN beregning_koordinat.koordinatobjektid IS 'Udpegning af de koordinater der er indgået i en beregning.';
COMMENT ON COLUMN beregning_observation.observationobjektid IS 'Udpegning af de observationer der er brugt i en beregning.';

COMMENT ON TABLE eventtype IS 'Objekt til at holde en liste over lovlige typer af events i fikspunktsforvaltningssystemet, samt en beskrivelse hvad eventtypen dækker over.';
COMMENT ON COLUMN eventtype.beskrivelse IS 'Kort beskrivelse af en eventtype.';
COMMENT ON COLUMN eventtype.event IS 'Navngivning af en eventtype.';
COMMENT ON COLUMN eventtype.eventtypeid IS 'Identifikation af typen af en sagsevent.';

COMMENT ON TABLE geometriobjekt IS 'Objekt indeholdende et punkts placeringsgeometri.';
COMMENT ON COLUMN geometriobjekt.geometri IS 'Geometri til brug for visning i f.eks et GIS system.';
COMMENT ON COLUMN geometriobjekt.punktid IS 'Punkt som har en placeringsgeometri tilknyttet.';
COMMENT ON COLUMN geometriobjekt.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN geometriobjekt.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN geometriobjekt.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN geometriobjekt.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';

COMMENT ON TABLE koordinat IS 'Generisk 4D koordinat.';
COMMENT ON COLUMN koordinat.punktid IS 'Punkt som koordinaten hører til.';
COMMENT ON COLUMN koordinat.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN koordinat.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN koordinat.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN koordinat.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';
COMMENT ON COLUMN koordinat.sridid IS 'Unik ID i fikspunktsforvaltningssystemet for et et koordinatsystem.';
COMMENT ON COLUMN koordinat.sx IS 'A posteriori spredning på førstekoordinaten.';
COMMENT ON COLUMN koordinat.sy IS 'A posteriori spredning på andenkoordinaten.';
COMMENT ON COLUMN koordinat.sz IS 'A posteriori spredning på tredjekoordinaten.';
COMMENT ON COLUMN koordinat.t IS 'Observationstidspunktet.';
COMMENT ON COLUMN koordinat.fejlmeldt IS 'Markering af at en koordinat er udgået fordi den er fejlbehæftet';
COMMENT ON COLUMN koordinat.transformeret IS 'Angivelse om positionen er målt, eller transformeret fra et andet koordinatsystem';
COMMENT ON COLUMN koordinat.artskode IS 'Fra REFGEO. Værdierne skal forstås som følger:

 artskode = 1 control point in fundamental network, first order.
 artskode = 2 control point in superior plane network.
 artskode = 2 control point in superior height network.
 artskode = 3 control point in network of high quality.
 artskode = 4 control point in network of lower or unknown quality.
 artskode = 5 coordinate computed on just a few measurements.
 artskode = 6 coordinate transformed from local or an not valid coordinate system.
 artskode = 7 coordinate computed on an not valid coordinate system, or system of unknown origin.
 artskode = 8 coordinate computed on few measurements, and on an not valid coordinate system.
 artskode = 9 location coordinate or location height.

 Artskode er kun tilgængelig for koordinater der stammer fra REFGEO.';
COMMENT ON COLUMN koordinat.x IS 'Førstekoordinat.';
COMMENT ON COLUMN koordinat.y IS 'Andenkoordinat.';
COMMENT ON COLUMN koordinat.z IS 'Tredjekoordinat.';

COMMENT ON TABLE observation IS 'Generisk observationsobjekt indeholdende informationer om en observation.';
COMMENT ON COLUMN observation.antal IS 'Antal gentagne observationer hvoraf en middelobservationen er fremkommet.';
COMMENT ON COLUMN observation.gruppe IS 'ID der angiver observationsgruppen for en observation der indgår i en gruppe.';
COMMENT ON COLUMN observation.observationstidspunkt IS 'Tidspunktet hvor observationen er foretaget';
COMMENT ON COLUMN observation.observationstypeid IS 'Identifikation af en observations type.';
COMMENT ON COLUMN observation.opstillingspunktid IS 'Udpegning af det punkt der er anvendt ved opstilling ved en observation.';
COMMENT ON COLUMN observation.registreringfrA IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN observation.registreringtiL IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN observation.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN observation.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';
COMMENT ON COLUMN observation.sigtepunktid IS 'Udpegning af punkt der er sigtet til ved en observation.';
COMMENT ON COLUMN observation.value1 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value2 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value3 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value4 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value5 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value6 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value7 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value8 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value9 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value10 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value11 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value12 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value13 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value14 IS 'En værdi for en observation.';
COMMENT ON COLUMN observation.value15 IS 'En værdi for en observation.';

COMMENT ON TABLE observationstype IS 'Objekttype til beskrivelse af hvorledes en Observation skal læses, ud fra typen af observation.';
COMMENT ON COLUMN observationstype.beskrivelse IS 'Overordnet beskrivelse af denne observationstype.';
COMMENT ON COLUMN observationstype.observationstype IS 'Kortnavn for observationstypen, fx dH';
COMMENT ON COLUMN observationstype.observationstypeid IS 'Identifikation af observationenst type.';
COMMENT ON COLUMN observationstype.sigtepunkt IS 'Indikator for om Sigtepunkt anvendes for denne observationstype.';
COMMENT ON COLUMN observationstype.value1 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value2 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value3 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value4 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value5 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value6 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value7 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value8 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value9 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value10 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value11 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value12 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value13 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value14 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';
COMMENT ON COLUMN observationstype.value15 IS 'Beskrivelse af en observations værdis betydning for afhænging af observationens type.';

COMMENT ON TABLE punkt IS 'Abstrakt repræsentation af et fysisk punkt. Knytter alle punktinformationer sammen.';
COMMENT ON COLUMN punkt.id IS 'Persistent unik nøgle.';
COMMENT ON COLUMN punkt.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN punkt.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN punkt.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN punkt.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';

COMMENT ON TABLE punktinfo IS 'Generisk information om et punkt.';
COMMENT ON COLUMN punktinfo.infotypeid IS 'Unik ID for typen af Punktinfo.';
COMMENT ON COLUMN punktinfo.punktid IS 'Punktet som punktinfo er holder information om.';
COMMENT ON COLUMN punktinfo.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN punktinfo.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN punktinfo.sagseventfraid IS 'Angivelse af den hændelse der har bevirket registrering af et fikspunktsobjekt';
COMMENT ON COLUMN punktinfo.sagseventtilid IS 'Angivelse af den hændelse der har bevirket afregistrering af et fikspunktsobjekt';
COMMENT ON COLUMN punktinfo.tal IS 'Værdien for numeriske informationselementer';
COMMENT ON COLUMN punktinfo.tekst IS 'Værdien for tekstinformationselementer';

COMMENT ON TABLE punktinfotype IS 'Udfaldsrum for punktinforobjekter med definition af hvordan PunktInfo skal læses og beskrivelse af typen af punktinfo.';
COMMENT ON COLUMN punktinfotype.anvendelse IS 'Er det reelTal, tekst, eller ingen af disse, der angiver værdien';
COMMENT ON COLUMN punktinfotype.beskrivelse IS 'Beskrivelse af denne informationstypes art.';
COMMENT ON COLUMN punktinfotype.infotype IS 'Arten af dette informationselement';
COMMENT ON COLUMN punktinfotype.infotypeid IS 'Unik ID for typen af Punktinfo.';

COMMENT ON TABLE sag IS 'Samling af administrativt relaterede sagshændelser.';
COMMENT ON COLUMN sag.id IS 'Persistent unik nøgle.';
COMMENT ON COLUMN sag.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';

COMMENT ON TABLE sagsevent IS 'Udvikling i sag som kan, men ikke behøver, medføre opdateringer af fikspunktregisterobjekter.';
COMMENT ON COLUMN sagsevent.eventtypeid IS 'Identifikation af typen af en sagsevent.';
COMMENT ON COLUMN sagsevent.id IS 'Persistent unik nøgle.';
COMMENT ON COLUMN sagsevent.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN sagsevent.sagsid IS 'Udpegning af den sag i fikspunktsforvalningssystemet som en event er foretaget i.';

COMMENT ON TABLE sagseventinfo IS 'Informationer der knytter sig til en et sagsevent.';
COMMENT ON COLUMN sagseventinfo.beskrivelse IS 'Specifik beskrivelse af den aktuelle fremdrift.';
COMMENT ON COLUMN sagseventinfo.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN sagseventinfo.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN Sagseventinfo.sagseventid IS 'Den sagsevent som sagseventinfo har information om.';
COMMENT ON COLUMN sagseventinfo_html.html IS 'Generisk operatørlæsbart orienterende rapportmateriale.';

COMMENT ON TABLE sagseventinfo_materiale IS 'Eksternt placeret materiale knyttet til en event';
COMMENT ON COLUMN sagseventinfo_materiale.md5sum IS 'Sum brugt til at kontrollere materialets integritet.';
COMMENT ON COLUMN sagseventinfo_materiale.sti IS 'Placering af materialet.';

COMMENT ON TABLE sagsinfo IS 'Samling af administrativt relaterede sagshændelser.';
COMMENT ON COLUMN sagsinfo.aktiv IS 'Markerer om sagen er åben eller lukket.';
COMMENT ON COLUMN sagsinfo.behandler IS 'Angivelse af en sagsbehandler.';
COMMENT ON COLUMN sagsinfo.beskrivelse IS 'Kort beskrivelse af en fikspunktssag.';
COMMENT ON COLUMN sagsinfo.journalnummer IS 'Sagsmappeidentifikation i opmålings- og beregningssagsregistret.';
COMMENT ON COLUMN sagsinfo.registreringfra IS 'Tidspunktet hvor registreringen er foretaget.';
COMMENT ON COLUMN sagsinfo.registreringtil IS 'Tidspunktet hvor en ny registrering er foretaget på objektet, og hvor denne version således ikke længere er den seneste.';
COMMENT ON COLUMN sagsinfo.sagsid IS 'Den sag som sagsinfo holder information for.';

COMMENT ON TABLE sridtype IS 'Udfaldsrum for SRID-koordinatbeskrivelser.';
COMMENT ON COLUMN sridtype.beskrivelse IS 'Generel beskrivelse af systemet.';
COMMENT ON COLUMN sridtype.srid IS 'Den egentlige referencesystemindikator.';
COMMENT ON COLUMN sridtype.sridid IS 'Unik ID i fikspunktsforvaltningssystemet for et et koordinatsystem.';
COMMENT ON COLUMN sridtype.x IS 'Beskrivelse af x-koordinatens indhold';
COMMENT ON COLUMN sridtype.y IS 'Beskrivelse af y-koordinatens indhold.';
COMMENT ON COLUMN sridtype.z IS 'Beskrivelse af z-koordinatens indhold.';


-----------------------------------------------------------------------------------------
--                                      TRIGGERS
-----------------------------------------------------------------------------------------

-- Triggere der sikrer at kun registreringtil kan opdateres i en tabel
CREATE OR REPLACE TRIGGER aud#beregning
AFTER UPDATE ON beregning FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sagseventfraid != :old.sagseventfraid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;
END;
/


CREATE OR REPLACE TRIGGER aud#geometriobjekt
AFTER UPDATE ON geometriobjekt FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sagseventfraid != :old.sagseventfraid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.punktid != :old.punktid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER aud#koordinat
AFTER UPDATE ON koordinat
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sridid != :old.sridid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sx != :old.sx THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sy != :old.sy THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sz != :old.sz THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.t != :old.t THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.transformeret != :old.transformeret THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.x != :old.x THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.y != :old.y THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.z != :old.z THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.sagseventfraid != :old.sagseventfraid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.punktid != :old.punktid THEN
    RAISE_APPLICATION_ERROR(-20000, 'You cannot update this column ');
  END IF;

  IF :new.fejlmeldt != :old.fejlmeldt AND :new.registreringtil IS NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Registreringtil skal sættes når en koordinat fejlmeldes');
  END IF;

END;
/

CREATE OR REPLACE TRIGGER aud#observation
AFTER UPDATE ON observation
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.antal != :old.antal THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.gruppe != :old.gruppe THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.observationstypeid != :old.observationstypeid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value1 != :old.value1 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value2 != :old.value2 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value3 != :old.value3 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value4 != :old.value4 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value5 != :old.value5 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value6 != :old.value6 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value7 != :old.value7 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value8 != :old.value8 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value9 != :old.value9 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value10 != :old.value10 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value11 != :old.value11 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value12 != :old.value12 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value13 != :old.value13 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value14 != :old.value14 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.value15 != :old.value15 THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sagseventfraid != :old.sagseventfraid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.opstillingspunktid != :old.opstillingspunktid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sigtepunktid != :old.sigtepunktid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/

-- Trigger der sikrer at indeholdet i tabellen KOORDINAT matcher hvad der er
-- specificeret omkring SRID i SRIDTYPE tabellen
CREATE OR REPLACE TRIGGER aiu#koordinat
AFTER INSERT OR UPDATE ON koordinat
FOR EACH ROW
DECLARE
  valX VARCHAR2(4000) := '';
  valY VARCHAR2(4000) := '';
  valZ VARCHAR2(4000) := '';
BEGIN
  SELECT x, y, z
  INTO valX, valY, valZ
  FROM
    sridtype a
  WHERE
    a.sridid = :new.sridid;

  IF (:new.x IS NULL OR :new.sx IS NULL) AND valX IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Hverken X eller SX må ikke være NULL');
  END IF;

  IF (:new.y IS NULL OR :new.sy IS NULL) AND valY IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Hverken Y eller SY må ikke være NULL');
  END IF;

  IF (:new.Z IS NULL OR :new.SZ IS NULL) AND valZ IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Hverken Z eller SZ må ikke være NULL');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER aud#punkt
AFTER UPDATE ON punkt
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.id != :old.id THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sagseventfraid != :old.sagseventfraid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/


CREATE OR REPLACE TRIGGER aud#sag
BEFORE UPDATE ON sag
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.id != :old.id THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/


CREATE OR REPLACE TRIGGER aud#sagsevent
AFTER UPDATE ON sagsevent
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column(a) ');
  END IF;

  IF :new.id != :old.id THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column(b) ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column(c) ');
  END IF;

  IF :new.sagsid != :old.sagsid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column(d) ');
  END IF;

end;
/



CREATE OR REPLACE TRIGGER aud#sagseventinfo
BEFORE UPDATE ON sagseventinfo
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sagseventid != :old.sagseventid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.beskrivelse != :old.beskrivelse THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/


CREATE OR REPLACE TRIGGER aud#sagsinfo
BEFORE UPDATE ON sagsinfo
FOR EACH ROW
BEGIN
  IF :new.objektid != :old.objektid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.sagsid != :old.sagsid THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.registreringfra != :old.registreringfra THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.aktiv != :old.aktiv THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.journalnummer != :old.journalnummer THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.behandler != :old.behandler THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;

  IF :new.beskrivelse != :old.beskrivelse THEN
    RAISE_APPLICATION_ERROR(-20000,'You cannot update this column ');
  END IF;
END;
/


-- Trigger der sikrer at sageevents kun knyttes til en aktiv sag
CREATE OR REPLACE TRIGGER aid#sagsevent
AFTER INSERT ON sagsevent
FOR EACH ROW
DECLARE
  cnt NUMBER := 0;
BEGIN
  BEGIN
    SELECT
      1 INTO cnt
    FROM
      sagsinfo
    WHERE
      aktiv = 'true'
      AND registreringtil IS NULL
      AND sagsid = :new.sagsid;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN cnt := 0;
  END;

  IF cnt = 0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Ingen aktiv sag fundet paa sagsid ' || :new.sagsid);
  END IF;
END;
/


-- Trigger der skal sikre at inholdet i Observation-tabellen matcher hvad
-- der er defineret observationstype-tabellen
CREATE OR REPLACE TRIGGER aid#observation
AFTER INSERT OR UPDATE ON observation
FOR EACH ROW
DECLARE
   val1  varchar2(4000):= '';
   val2  varchar2(4000):= '';
   val3  varchar2(4000):= '';
   val4  varchar2(4000):= '';
   val5  varchar2(4000):= '';
   val6  varchar2(4000):= '';
   val7  varchar2(4000):= '';
   val8  varchar2(4000):= '';
   val9  varchar2(4000):= '';
   val10 varchar2(4000):= '';
   val11 varchar2(4000):= '';
   val12 varchar2(4000):= '';
   val13 varchar2(4000):= '';
   val14 varchar2(4000):= '';
   val15 varchar2(4000):= '';
BEGIN
  SELECT
    value1, value2, value3, value4, value5,
    value6, value7, value8, value9, value10,
    value11, value12, value13, value14, value15
  INTO
    val1, val2, val3, val4, val5,
    val6, val7, val8, val9, val10,
    val11, val12, val13, val14, val15
  FROM
    observationstype A
  WHERE
    a.observationstypeid = :new.observationstypeid;

  IF :new.value1 IS NULL AND val1 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value1 må ikke være NULL');
  END IF;

  IF :new.value2 IS NULL AND val2 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value2 må ikke være NULL');
  END IF;

  IF :new.value3 IS NULL AND val3 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value3 må ikke være NULL');
  END IF;

  IF :new.value4 IS NULL AND val4 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value4 må ikke være NULL');
  END IF;

  IF :new.value5 IS NULL AND val5 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value5 må ikke være NULL');
  END IF;

  IF :new.value6 IS NULL AND val6 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value6 må ikke være NULL');
  END IF;

  IF :new.value7 IS NULL AND val7 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value7 må ikke være NULL');
  END IF;

  IF :new.value8 IS NULL AND val8 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value8 må ikke være NULL');
  END IF;

  IF :new.value9 IS NULL AND val9 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value9 må ikke være NULL');
  END IF;

  IF :new.value10 IS NULL AND val10 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value10 må ikke være NULL');
  END IF;

  IF :new.value11 IS NULL AND val11 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value11 må ikke være NULL');
  END IF;

  IF :new.value12 IS NULL AND val12 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value12 må ikke være NULL');
  END IF;

  IF :new.value13 IS NULL AND val13 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value13 må ikke være NULL');
  END IF;

  IF :new.value14 IS NULL AND val14 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value14 må ikke være NULL');
  END IF;

  IF :new.value15 IS NULL AND val15 IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Value15 må ikke være NULL');
  END IF;
END;
/


-- Sikrer at infotype i PUNKTINFO eksisterer i PUNKTINFOTYPE, og at data i PUNKTINFO matcher definition i PUNKTINFOTYPE
-- og at tidligere version af punktinfo afregistreres korrekt ved indsættelse af ny
CREATE OR REPLACE TRIGGER punktinfo_type_valid_trg
BEFORE INSERT OR UPDATE ON punktinfo
FOR EACH ROW
DECLARE
  this_andv varchar2(10);
  cnt NUMBER;
BEGIN
  BEGIN
    SELECT
      anvendelse INTO this_andv
    FROM
      punktinfotype
    WHERE
      infotypeid = :new.infotypeid;
  EXCEPTION
    WHEN no_data_found THEN RAISE_APPLICATION_ERROR(-20000, 'No infotype found(!)');
  END;

  IF this_andv = 'FLAG' AND (:new.tekst IS NOT NULL OR :new.tal IS NOT NULL) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Incorrect data (A)(!)');
  END IF;

  IF this_andv = 'TEKST' AND :new.tal IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Incorrect data (B)(!)');
  END IF;

  IF this_andv = 'TAL' AND :new.tekst IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Incorrect data (C)(!)');
  END IF;

  -- afregistrer forrige version af punktinfo når nyt indsættes
  IF :new.registreringtil IS NULL THEN
    SELECT
      count(*) INTO cnt
    FROM
      punktinfo
    WHERE
      punktid = :new.punktid AND infotypeid = :new.infotypeid AND registreringtil IS NULL;

    IF cnt = 1 THEN
      UPDATE
        punktinfo
      SET
        registreringtil = :new.registreringfra,
        sagseventtilid = :new.sagseventfraid
      WHERE
        objektid = (
          SELECT
            objektid
          FROM
            punktinfo
          WHERE
            punktid = :new.punktid
            AND infotypeid = :new.infotypeid
            AND registreringtil IS NULL
        );
    END IF;
  END IF;
END;
/


CREATE OR REPLACE TRIGGER bid#punkt
BEFORE INSERT ON punkt
FOR EACH ROW
DECLARE
  cnt1 NUMBER;
BEGIN
  IF :new.registreringfra = :new.registreringtil THEN
    SELECT
      count(*) INTO cnt1
    FROM
      punkt
    WHERE
      registreringtil = :new.registreringfra;

    IF cnt1 = 0 THEN
      RAISE_APPLICATION_ERROR(-20000,'No parent record found (!) ');
    END IF;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER bid#koordinat
BEFORE INSERT ON koordinat
FOR EACH ROW
DECLARE
  cnt NUMBER;
BEGIN
  IF :new.registreringfra = :new.registreringtil THEN
    SELECT
      count(*) INTO cnt
    FROM
      koordinat
    WHERE
      registreringtil = :new.registreringfra;

    if cnt = 0 THEN
      RAISE_APPLICATION_ERROR(-20000,'No parent record found (!) ');
    END IF;
  END IF;

  IF :new.registreringtil IS NULL THEN
    SELECT
      count(*) INTO cnt
    FROM
      koordinat
    WHERE
      punktid = :new.punktid
      AND sridid = :new.sridid
      AND registreringtil IS NULL;

    IF cnt = 1 THEN
      UPDATE
        koordinat
      SET
        registreringtil = :new.registreringfra,
        sagseventtilid = :new.sagseventfraid
      WHERE
        objektid = (
          SELECT
            objektid
          FROM
            koordinat
          WHERE
            punktid = :new.punktid
            AND sridid = :new.sridid
            AND registreringtil IS NULL
        );
    END IF;
  END IF;

  IF :new.fejlmeldt = 'true' THEN
    RAISE_APPLICATION_ERROR(-20000, 'Indsættelse af fejlmeldt koordinat ikke tilladt');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER bid#sagsinfo
BEFORE INSERT ON sagsinfo
FOR EACH ROW
DECLARE
  cnt number;
BEGIN
  IF :new.registreringtil IS NULL THEN
    SELECT
      count(*) INTO cnt
    FROM
      sagsinfo
    WHERE
      sagsid = :new.sagsid
      AND registreringtil IS NULL;

    IF cnt = 1 THEN
    UPDATE
      sagsinfo
    SET
      registreringtil = :new.registreringfra
    WHERE
      objektid = (
        SELECT
          objektid
        FROM
          sagsinfo
        WHERE
          sagsid = :new.sagsid
          AND registreringtil IS NULL
      );
    END IF;
  END IF;
END;
/


CREATE OR REPLACE TRIGGER bid#sagseventinfo
BEFORE INSERT ON sagseventinfo
FOR EACH ROW
DECLARE
  cnt number;
BEGIN
  IF :new.registreringtil IS NULL THEN
    SELECT
      count(*) INTO cnt
    FROM
      sagseventinfo
    WHERE
      sagseventid = :new.sagseventid
      AND registreringtil IS NULL;

    IF cnt = 1 THEN
    UPDATE
      sagseventinfo
    SET
      registreringtil = :new.registreringfra
    WHERE
      objektid = (
        SELECT
          objektid
        FROM
          sagseventinfo
        WHERE
          sagseventid = :new.sagseventid
          AND registreringtil IS NULL
      );
    END IF;
  END IF;
END;
/


-----------------------------------------------------------------------------------------
--                            PRÆDEFINERET TABELINDHOLD
-----------------------------------------------------------------------------------------

--
-- Geometrisk nivellement
--
INSERT INTO observationstype (
    -- Overordnet beskrivelse
    beskrivelse,
    OBSERVATIONSTYPEID,
    observationstype,
    sigtepunkt,

    -- Observationen
    value1,
    value2,
    value3,

    -- Nøjagtighedsestimat og korrektion
    value4,
    value5,
    value6,

    -- Historisk administrative grupperinger
    value7
)
VALUES (
    -- Overordnet beskrivelse
    'Koteforskel fra fikspunkt1 til fikspunkt2 (h2-h1) opmålt geometrisk',
     1,
    'geometrisk_koteforskel',
    'true',

    -- Observationen 1-3
    'Koteforskel [m]',
    'Nivellementslængde [m]',
    'Antal opstillinger',

    -- Nøjagtighedsestimat og korrektion 4-6
    'Variabel vedr. eta_1 (refraktion) [m^3]',
    'Empirisk spredning pr. afstandsenhed [mm/sqrt(km)]',
    'Empirisk centreringsfejl pr. opstilling [mm]',

    -- Historisk administrative grupperinger 7
    'Præcisionsnivellement [0,1,2,3]'

    -- Ikke anvendt value8-value15
);

--
-- Trigonometrisk nivellement
--
INSERT INTO observationstype (
    -- Overordnet beskrivelse
    beskrivelse,
    observationstypeid,
    observationstype,
    sigtepunkt,

    -- Observationen
    value1,
    value2,
    value3,

    -- Nøjagtighedsestimat
    value4,
    value5
)
VALUES (
    -- Overordnet beskrivelse
    'Koteforskel fra fikspunkt1 til fikspunkt2 (h2-h1) opmålt trigonometrisk',
     2 ,
    'trigonometrisk_koteforskel',
    'true',

    -- Observationen 1-3
    'Koteforskel [m]',
    'Nivellementslængde [m]',
    'Antal opstillinger',

    -- Nøjagtighedsestimat 4-5
    'Empirisk spredning pr. afstandsenhed [mm/sqrt(km)]',
    'Empirisk centreringsfejl pr. opstilling [mm]'

    -- Ikke anvendt value6-value15
);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('Horisontal retning med uret fra opstilling til sigtepunkt (reduceret til ellipsoiden)', 3 , 'retning', 'true','Retning [m]', 'Varians  retning hidrørende instrument, pr. sats  [rad^2]', 'Samlet centreringsvarians for instrument prisme [m^2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('Horisontal afstand mellem opstilling og sigtepunkt (reduceret til ellipsoiden)', 4 , 'horisontalafstand', 'true','Afstand [m]', 'Afstandsafhængig varians afstandsmåler [m^2/m^2]', 'Samlet varians for centrering af instrument og prisme, samt grundfejl på afstandsmåler [m^2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('Skråafstand mellem opstilling og sigtepunkt', 5 , 'skråafstand', 'true','Afstand [m]', 'Afstandsafhængig varians afstandsmåler pr. måling [m^2/m^2]', 'Samlet varians for centrering af instrument og prisme, samt grundfejl på afstandsmåler pr. måling [m^2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('Zenitvinkel mellem opstilling og sigtepunkt', 6 , 'zenitvinkel', 'true','Zenitvinkel [rad]', 'Instrumenthøjde [m]', 'Højde sigtepunkt [m]', 'Varians zenitvinkel hidrørende instrument, pr. sats  [rad^2]', 'Samlet varians instrumenthøjde/højde sigtepunkt [m^2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('Vektor der beskriver koordinatforskellen fra punkt 1 til punkt 2 (v2-v1)', 7 , 'vektor', 'true','dx [m]', 'dy [m]', 'dz [m]', 'Afstandsafhængig varians [m^2/m^2]', 'Samlet varians for centrering af antenner [m^2]', 'Varians dx [m^2]', 'Varians dy [m^2]', 'Varians dz [m^2]', 'Covarians dx, dy [m^2]', 'Covarians dx, dz [m^2]', 'Covarians dy, dz [m^2]', NULL, NULL, NULL, NULL);

INSERT INTO observationstype (beskrivelse, observationstypeid, observationstype, sigtepunkt, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15)
VALUES ('observation nummer nul, indlagt fra start i observationstabellen, så der kan refereres til den i de mange beregningsevents der fører til population af koordinattabellen', 8 , 'nulobservation', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



-- Oprettelse af eventtyper i FIRE
INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når koordinater indsættes efter en beregning.', 'koordinat_beregnet', 1);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når en koordinat nedlægges.', 'koordinat_nedlagt', 2);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Indsættelse af en eller flere observationer.', 'observation_indsat', 3);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når en observation aflyses fordi den er fejlbehæftet.', 'observation_nedlagt', 4);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når der tilføjes Punktinfo til et eller flere punkter.', 'punktinfo_tilføjet', 5);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når Punktinfo fjernes fra et eller flere punkter.', 'punktinfo_fjernet', 6);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når et punkt og tilhørende geometri oprettes.', 'punkt_oprettet', 7);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges når et punkt og tilhørende geometri nedlægges.', 'punkt_nedlagt', 8);

INSERT INTO eventtype (beskrivelse, event, eventtypeid)
VALUES ('Bruges til at tilføje fritekst-kommentarer til sagen i tilfælde af at der er behov for at påhæfte sagen yderligere information, som ikke passer i andre hændelser. Bruges fx også til påhæftning af materiale på sagen.', 'kommentar', 9);
