-- Table: public.address

-- DROP TABLE public.address;

CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL,
    address_type character varying(250) COLLATE pg_catalog."default",
    country character varying(250) COLLATE pg_catalog."default",
    state character varying(250) COLLATE pg_catalog."default",
    city character varying(250) COLLATE pg_catalog."default",
    postal_code character varying(150) COLLATE pg_catalog."default",
    address character varying(500) COLLATE pg_catalog."default",
    deleted_status character varying(20) COLLATE pg_catalog."default",
    date_modified timestamp(3) without time zone,
    date_created timestamp(3) without time zone,
    modified_by integer,
    created_by integer
)

TABLESPACE pg_default;



    -- Table: public.ASP NDC-HCPCS

-- DROP TABLE public."ASP NDC-HCPCS";

CREATE TABLE IF NOT EXISTS public."ASP NDC-HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC2" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "HCPCS_dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" text COLLATE pg_catalog."default",
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: public.ASP Pricing

-- DROP TABLE public."ASP Pricing";

CREATE TABLE IF NOT EXISTS public."ASP Pricing"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "HCPCS_Code_Dosage" text COLLATE pg_catalog."default",
    "Payment_Limit" double precision,
    "Vaccine_AWP%" double precision,
    "Vaccine_Limit" double precision,
    "Blood_AWP%" double precision,
    "Blood_limit" double precision,
    "Clotting_Factor" double precision,
    "Notes" text COLLATE pg_catalog."default",
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: public.AWP NDC-HCPCS

-- DROP TABLE public."AWP NDC-HCPCS";

CREATE TABLE IF NOT EXISTS public."AWP NDC-HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default",
    "Short_Descriptor" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC" text COLLATE pg_catalog."default",
    "DRUG_NAME" text COLLATE pg_catalog."default",
    "HCPCS_DOSAGE" text COLLATE pg_catalog."default",
    "PKG_SIZE" double precision,
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: public.NOC NDC-HCPCS

-- DROP TABLE public."NOC NDC-HCPCS";

CREATE TABLE IF NOT EXISTS public."NOC NDC-HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug Generic Name" text COLLATE pg_catalog."default",
    "LABELER NAME" text COLLATE pg_catalog."default",
    "NDC or ALTERNATE ID" text COLLATE pg_catalog."default",
    "Drug Name" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "PKG SIZE" double precision,
    "PKG QTY" bigint,
    "BILLUNITS" bigint,
    "BILLUNITSPKG" bigint,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: public.NOC Pricing

-- DROP TABLE public."NOC Pricing";

CREATE TABLE IF NOT EXISTS public."NOC Pricing"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug Generic Name (Trade Name)" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "Payment Limit" text COLLATE pg_catalog."default",
    "Notes" text COLLATE pg_catalog."default",
    "Unnamed: 4" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: public.OPPS NDC-HCPCS

-- DROP TABLE public."OPPS NDC-HCPCS";

CREATE TABLE IF NOT EXISTS public."OPPS NDC-HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Short_Descriptor" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC_or_ALTERNATE_ID" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "HCPCS_Dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" text COLLATE pg_catalog."default",
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: cms.ASP_NDC_HCPCS

-- DROP TABLE cms."ASP_NDC_HCPCS";

CREATE TABLE IF NOT EXISTS cms."ASP_NDC_HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC2" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "HCPCS_dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" text COLLATE pg_catalog."default",
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    "IsUpdated" boolean
)

TABLESPACE pg_default;

-- Table: cms.ASP_Pricing

-- DROP TABLE cms."ASP_Pricing";

CREATE TABLE IF NOT EXISTS cms."ASP_Pricing"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default" NOT NULL,
    "Short_Description" text COLLATE pg_catalog."default",
    "HCPCS_Code_Dosage" text COLLATE pg_catalog."default",
    "Payment_Limit" double precision,
    "Vaccine_AWP_" double precision,
    "Vaccine_Limit" double precision,
    "Blood_AWP_" double precision,
    "Blood_limit" double precision,
    "Clotting_Factor" double precision,
    "Notes" text COLLATE pg_catalog."default",
    "Date_created" timestamp without time zone,
    modification_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    quarter bigint NOT NULL,
    CONSTRAINT "ASP_Pricing_pk" PRIMARY KEY ("HCPCS_Code", quarter)
)

TABLESPACE pg_default;

-- Table: cms.ASP_Pricing_new

-- DROP TABLE cms."ASP_Pricing_new";

CREATE TABLE IF NOT EXISTS cms."ASP_Pricing_new"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default" NOT NULL,
    "Short_Description" text COLLATE pg_catalog."default",
    "HCPCS_Code_Dosage" text COLLATE pg_catalog."default",
    "Payment_Limit" double precision,
    "Vaccine_AWP%" double precision,
    "Vaccine_Limit" double precision,
    "Blood_AWP%" double precision,
    "Blood_limit" double precision,
    "Clotting_Factor" double precision,
    "Notes" text COLLATE pg_catalog."default",
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default" NOT NULL,
    "IsUpdated" boolean,
    "UpdatedOn" date,
    CONSTRAINT asp_pricing_new_pk PRIMARY KEY ("HCPCS_Code", quarter)
)

TABLESPACE pg_default;

-- Table: cms.AWP_NDC_HCPCS

-- DROP TABLE cms."AWP_NDC_HCPCS";

CREATE TABLE IF NOT EXISTS cms."AWP_NDC_HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default",
    "Short_Descriptor" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC" text COLLATE pg_catalog."default",
    "DRUG_NAME" text COLLATE pg_catalog."default",
    "HCPCS_DOSAGE" text COLLATE pg_catalog."default",
    "PKG_SIZE" double precision,
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

-- Table: cms.NOC_NDC_HCPCS

-- DROP TABLE cms."NOC_NDC_HCPCS";

CREATE TABLE IF NOT EXISTS cms."NOC_NDC_HCPCS"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug_Generic_Name" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" double precision,
    "PKG_QTY" bigint,
    "BILLUNITS" bigint,
    "BILLUNITSPKG" bigint,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    "IsUpdated" boolean
)

TABLESPACE pg_default;

-- Table: cms.NOC_NDC_HCPCS_audit

-- DROP TABLE cms."NOC_NDC_HCPCS_audit";

CREATE TABLE IF NOT EXISTS cms."NOC_NDC_HCPCS_audit"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug_Generic_Name" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" double precision,
    "PKG_QTY" bigint,
    "BILLUNITS" bigint,
    "BILLUNITSPKG" bigint,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    action character varying(20) COLLATE pg_catalog."default",
    auditdate timestamp without time zone
)

TABLESPACE pg_default;

-- Table: cms.NOC_Pricing

-- DROP TABLE cms."NOC_Pricing";

CREATE TABLE IF NOT EXISTS cms."NOC_Pricing"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug_Generic_Name_Trade_Name" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "Payment Limit" text COLLATE pg_catalog."default",
    "Notes" text COLLATE pg_catalog."default",
    "Unnamed: 4" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

-- Table: cms.NOC_Pricing

-- DROP TABLE cms."NOC_Pricing";

CREATE TABLE IF NOT EXISTS cms."NOC_Pricing"
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Drug_Generic_Name_Trade_Name" text COLLATE pg_catalog."default",
    "Dosage" text COLLATE pg_catalog."default",
    "Payment Limit" text COLLATE pg_catalog."default",
    "Notes" text COLLATE pg_catalog."default",
    "Unnamed: 4" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


-- Table: cms.asp_crosswalk

-- DROP TABLE cms.asp_crosswalk;

CREATE TABLE IF NOT EXISTS cms.asp_crosswalk
(
    date_created timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_uploaded text COLLATE pg_catalog."default" NOT NULL,
    code text COLLATE pg_catalog."default" NOT NULL,
    short_description text COLLATE pg_catalog."default" NOT NULL,
    labeler_name text COLLATE pg_catalog."default" NOT NULL,
    ndc2 text COLLATE pg_catalog."default" NOT NULL,
    drug_name text COLLATE pg_catalog."default" NOT NULL,
    hcpcs_dosage text COLLATE pg_catalog."default" NOT NULL,
    pkg_size text COLLATE pg_catalog."default" NOT NULL,
    pkg_qty integer NOT NULL,
    billunits double precision NOT NULL,
    billunitspkg double precision NOT NULL,
    quarter integer NOT NULL,
    CONSTRAINT asp_crosswalk_pk PRIMARY KEY (ndc2, quarter, code)
)

TABLESPACE pg_default;

-- Table: cms.asp_ndc_hcpcs_audit

-- DROP TABLE cms.asp_ndc_hcpcs_audit;

CREATE TABLE IF NOT EXISTS cms.asp_ndc_hcpcs_audit
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "LABELER_NAME" text COLLATE pg_catalog."default",
    "NDC2" text COLLATE pg_catalog."default",
    "Drug_Name" text COLLATE pg_catalog."default",
    "HCPCS_dosage" text COLLATE pg_catalog."default",
    "PKG_SIZE" text COLLATE pg_catalog."default",
    "PKG_QTY" bigint,
    "BILLUNITS" double precision,
    "BILLUNITSPKG" double precision,
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    action character varying(20) COLLATE pg_catalog."default",
    auditdate timestamp without time zone
)

TABLESPACE pg_default;

-- Table: cms.asp_pricing_new

-- DROP TABLE cms.asp_pricing_new;

CREATE TABLE IF NOT EXISTS cms.asp_pricing_new
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "HCPCS_Code_Dosage" text COLLATE pg_catalog."default",
    "Payment_Limit" double precision,
    "Vaccine_AWP%" double precision,
    "Vaccine_Limit" double precision,
    "Blood_AWP%" double precision,
    "Blood_limit" double precision,
    "Clotting_Factor" double precision,
    "Notes" text COLLATE pg_catalog."default",
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    "IsUpdated" boolean,
    "UpdatedOn" date
)

TABLESPACE pg_default;

-- Table: cms.asppricing_audit

-- DROP TABLE cms.asppricing_audit;

CREATE TABLE IF NOT EXISTS cms.asppricing_audit
(
    "Date_Uploaded" text COLLATE pg_catalog."default",
    "HCPCS_Code" text COLLATE pg_catalog."default",
    "Short_Description" text COLLATE pg_catalog."default",
    "HCPCS_Code_Dosage" text COLLATE pg_catalog."default",
    "Payment_Limit" double precision,
    "Vaccine_AWP%" double precision,
    "Vaccine_Limit" double precision,
    "Blood_AWP%" double precision,
    "Blood_limit" double precision,
    "Clotting_Factor" double precision,
    "Notes" text COLLATE pg_catalog."default",
    "Date_created" text COLLATE pg_catalog."default",
    modification_time text COLLATE pg_catalog."default",
    quarter text COLLATE pg_catalog."default",
    action character varying(20) COLLATE pg_catalog."default",
    auditdate timestamp without time zone
)

TABLESPACE pg_default;

-- FUNCTION: cms.asp_ndc_hcpcs_audit_information()

-- DROP FUNCTION cms.asp_ndc_hcpcs_audit_information();

CREATE FUNCTION cms.asp_ndc_hcpcs_audit_information()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
if (TG_OP = 'DELETE') THEN
insert into cms.asp_ndc_hcpcs_audit("Date_Uploaded", "Code", "Short_Description", "LABELER_NAME", "NDC2", "Drug_Name", "HCPCS_dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", "Date_created", modification_time, quarter, action, auditdate)
SELECT old."Date_Uploaded",old."Code", old."Short_Description", old."LABELER_NAME", old."NDC2", old."Drug_Name", old."HCPCS_dosage", old."PKG_SIZE", old."PKG_QTY", old."BILLUNITS", old."BILLUNITSPKG", old."Date_created", old.modification_time, old.quarter, 'Deleted', now();
elsif (TG_OP = 'UPDATE') THEN
insert into cms.asp_ndc_hcpcs_audit("Date_Uploaded", "Code", "Short_Description", "LABELER_NAME", "NDC2", "Drug_Name", "HCPCS_dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", "Date_created", modification_time, quarter, action, auditdate)
SELECT old."Date_Uploaded",old."Code", old."Short_Description", old."LABELER_NAME", old."NDC2", old."Drug_Name", old."HCPCS_dosage", old."PKG_SIZE", old."PKG_QTY", old."BILLUNITS", old."BILLUNITSPKG", old."Date_created", old.modification_time, old.quarter, 'Updated', now();
elsif (TG_OP = 'INSERT') THEN
insert into cms.asp_ndc_hcpcs_audit("Date_Uploaded", "Code", "Short_Description", "LABELER_NAME", "NDC2", "Drug_Name", "HCPCS_dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", "Date_created", modification_time, quarter, action, auditdate)
SELECT NEW."Date_Uploaded",NEW."Code", NEW."Short_Description", NEW."LABELER_NAME", NEW."NDC2", NEW."Drug_Name", NEW."HCPCS_dosage", NEW."PKG_SIZE", NEW."PKG_QTY", NEW."BILLUNITS", NEW."BILLUNITSPKG", NEW."Date_created", NEW.modification_time, NEW.quarter, 'Inserted', now();
end if;
return null;
end;
$BODY$;

-- FUNCTION: cms.asppricing_audit_information()

-- DROP FUNCTION cms.asppricing_audit_information();

CREATE FUNCTION cms.asppricing_audit_information()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
if (TG_OP = 'DELETE') THEN
insert into cms.asppricing_audit("Date_Uploaded","HCPCS_Code","Short_Description","HCPCS_Code_Dosage","Payment_Limit","Vaccine_AWP%","Vaccine_Limit","Blood_AWP%",
    "Blood_limit","Clotting_Factor","Notes","Date_created",modification_time,quarter,"action",auditdate) 
SELECT OLD."Date_Uploaded",OLD."HCPCS_Code",OLD."Short_Description",OLD."HCPCS_Code_Dosage",OLD."Payment_Limit",OLD."Vaccine_AWP%",OLD."Vaccine_Limit",OLD."Blood_AWP%",
    OLD."Blood_limit",OLD."Clotting_Factor",OLD."Notes",OLD."Date_created",OLD.modification_time,OLD.quarter,'Deleted', now();
elsif (TG_OP = 'UPDATE') THEN
insert into cms.asppricing_audit("Date_Uploaded","HCPCS_Code","Short_Description","HCPCS_Code_Dosage","Payment_Limit","Vaccine_AWP%","Vaccine_Limit","Blood_AWP%",
    "Blood_limit","Clotting_Factor","Notes","Date_created",modification_time,quarter,"action",auditdate) 
SELECT OLD."Date_Uploaded",OLD."HCPCS_Code",OLD."Short_Description",OLD."HCPCS_Code_Dosage",OLD."Payment_Limit",OLD."Vaccine_AWP%",OLD."Vaccine_Limit",OLD."Blood_AWP%",
    OLD."Blood_limit",OLD."Clotting_Factor",OLD."Notes",OLD."Date_created",OLD.modification_time,OLD.quarter,'Updated', now();
elsif (TG_OP = 'INSERT') THEN
insert into cms.asppricing_audit("Date_Uploaded","HCPCS_Code","Short_Description","HCPCS_Code_Dosage","Payment_Limit","Vaccine_AWP%","Vaccine_Limit","Blood_AWP%",
    "Blood_limit","Clotting_Factor","Notes","Date_created",modification_time,quarter,"action",auditdate) 
SELECT NEW."Date_Uploaded",NEW."HCPCS_Code",NEW."Short_Description",NEW."HCPCS_Code_Dosage",NEW."Payment_Limit",NEW."Vaccine_AWP%",NEW."Vaccine_Limit",NEW."Blood_AWP%",
    NEW."Blood_limit",NEW."Clotting_Factor",NEW."Notes",NEW."Date_created",NEW.modification_time,NEW.quarter,'Inserted', now();
end if;
return null;
end;
$BODY$;

-- FUNCTION: cms.noc_ndc_hcpcs_audit_information()

-- DROP FUNCTION cms.noc_ndc_hcpcs_audit_information();

CREATE FUNCTION cms.noc_ndc_hcpcs_audit_information()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
if (TG_OP = 'DELETE') THEN
INSERT INTO cms."NOC_NDC_HCPCS_audit"(
    "Date_Uploaded", "Drug_Generic_Name", "LABELER_NAME", "NDC", "Drug_Name", "Dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", 
    "Date_created", modification_time, quarter, "action","auditdate")
SELECT old."Date_Uploaded", old."Drug_Generic_Name", old."LABELER_NAME", old."NDC", old."Drug_Name", old."Dosage", old."PKG_SIZE", old."PKG_QTY", 
old."BILLUNITS", old."BILLUNITSPKG", old."Date_created", old.modification_time, old.quarter, 'deleted',now();
elsif (TG_OP = 'UPDATE') THEN
INSERT INTO cms."NOC_NDC_HCPCS_audit"(
    "Date_Uploaded", "Drug_Generic_Name", "LABELER_NAME", "NDC", "Drug_Name", "Dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", 
    "Date_created", modification_time, quarter, "action","auditdate")
SELECT old."Date_Uploaded", old."Drug_Generic_Name", old."LABELER_NAME", old."NDC", old."Drug_Name", old."Dosage", old."PKG_SIZE", old."PKG_QTY", 
old."BILLUNITS", old."BILLUNITSPKG", old."Date_created", old.modification_time, old.quarter, 'Updated',now();
elsif (TG_OP = 'Insert') THEN
INSERT INTO cms."NOC_NDC_HCPCS_audit"(
    "Date_Uploaded", "Drug_Generic_Name", "LABELER_NAME", "NDC", "Drug_Name", "Dosage", "PKG_SIZE", "PKG_QTY", "BILLUNITS", "BILLUNITSPKG", 
    "Date_created", modification_time, quarter, "action","auditdate")
SELECT new."Date_Uploaded", new."Drug_Generic_Name", new."LABELER_NAME", new."NDC", new."Drug_Name", new."Dosage", new."PKG_SIZE", new."PKG_QTY", 
new."BILLUNITS", new."BILLUNITSPKG", new."Date_created", new.modification_time, new.quarter, 'Inserted',now();
end if;
return null;
end;
$BODY$;




