-- PROCEDURE: public.sp_upsert_asp_pricing()

-- DROP PROCEDURE public.sp_upsert_asp_pricing();

CREATE OR REPLACE PROCEDURE public.sp_upsert_asp_pricing(
	)
LANGUAGE 'plpgsql'
AS $BODY$
begin
		
		--updating records which are already existing in cms schema
		UPDATE cms."ASP_Pricing_new" ASP
		SET "Date_Uploaded" = stg."Date_Uploaded",
			"Short_Description" = stg."Short_Description",
			"HCPCS_Code_Dosage" = stg."HCPCS_Code_Dosage",
			"Payment_Limit" = stg."Payment_Limit",
			"Vaccine_AWP%" = stg."Vaccine_AWP%",
			"Vaccine_Limit" = stg."Vaccine_Limit",
			"Blood_AWP%" = stg."Blood_AWP%",
			"Blood_limit" = stg."Blood_limit",
			"Clotting_Factor" = stg."Clotting_Factor",
			"Notes" = stg."Notes",
			"Date_created"  = stg."Date_created",
			modification_time = stg.modification_time,
			"UpdatedOn" = CURRENT_DATE,
			"IsUpdated" = TRUE
		FROM public."ASP Pricing" stg
		where ASP."HCPCS_Code" = stg."HCPCS_Code"
		and ASP.quarter = stg.quarter
		AND (COALESCE(ASP."Date_Uploaded",'') <> cOALESCE(stg."Date_Uploaded",'')
		OR COALESCE(ASP."Short_Description",'') <> cOALESCE(stg."Short_Description",'') 
		OR COALESCE(ASP."HCPCS_Code_Dosage",'') <> cOALESCE(stg."HCPCS_Code_Dosage",'')
		OR COALESCE(ASP."Payment_Limit",0.0) <> cOALESCE(stg."Payment_Limit",0.0)
		OR COALESCE(ASP."Vaccine_AWP%",0.0) <> cOALESCE(stg."Vaccine_AWP%",0.0)
		OR COALESCE(ASP."Vaccine_Limit",0.0) <> cOALESCE(stg."Vaccine_Limit",0.0)
		OR COALESCE(ASP."Blood_AWP%",0.0) <> cOALESCE(stg."Blood_AWP%",0.0)
		OR COALESCE(ASP."Blood_limit",0.0) <> cOALESCE(stg."Blood_limit",0.0)
		OR COALESCE(ASP."Clotting_Factor",0.0) <> cOALESCE(stg."Clotting_Factor",0.0)
		OR COALESCE(ASP."Notes",'') <> cOALESCE(stg."Notes",'')
		OR COALESCE(ASP.modification_time,'') <> cOALESCE(stg.modification_time,'') );
		
		--inserting new records which are not present in cms schema
		INSERT INTO cms."ASP_Pricing_new"("Date_Uploaded",
		"HCPCS_Code",
		"Short_Description",
		"HCPCS_Code_Dosage",
		"Payment_Limit",
		"Vaccine_AWP%",
		"Vaccine_Limit",
		"Blood_AWP%",
		"Blood_limit",
		"Clotting_Factor",
		"Notes",
		"Date_created",
		modification_time,
		quarter)
		select stg."Date_Uploaded",
		stg."HCPCS_Code",
		stg."Short_Description",
		stg."HCPCS_Code_Dosage",
		stg."Payment_Limit",
		stg."Vaccine_AWP%",
		stg."Vaccine_Limit",
		stg."Blood_AWP%",
		stg."Blood_limit",
		stg."Clotting_Factor",
		stg."Notes",
		stg."Date_created",
		stg.modification_time,
		stg.quarter 
		from public."ASP Pricing" stg
		left join cms."ASP_Pricing_new" ASP
		on stg."HCPCS_Code" = ASP."HCPCS_Code"
		and stg.quarter = ASP.quarter
		where ASP."HCPCS_Code" is null;
		
	end;
$BODY$;


-------------------------------------------
-- PROCEDURE: public.sp_upsert_asp_pricing()

-- DROP PROCEDURE public.sp_upsert_asp_pricing();

CREATE OR REPLACE PROCEDURE public.sp_upsert_asp_pricing(
	)
LANGUAGE 'plpgsql'
AS $BODY$
begin
		
		--updating records which are already existing in cms schema
		UPDATE cms."ASP_Pricing_new" ASP
		SET "Date_Uploaded" = stg."Date_Uploaded",
			"Short_Description" = stg."Short_Description",
			"HCPCS_Code_Dosage" = stg."HCPCS_Code_Dosage",
			"Payment_Limit" = stg."Payment_Limit",
			"Vaccine_AWP%" = stg."Vaccine_AWP%",
			"Vaccine_Limit" = stg."Vaccine_Limit",
			"Blood_AWP%" = stg."Blood_AWP%",
			"Blood_limit" = stg."Blood_limit",
			"Clotting_Factor" = stg."Clotting_Factor",
			"Notes" = stg."Notes",
			"Date_created"  = stg."Date_created",
			modification_time = stg.modification_time,
			"UpdatedOn" = CURRENT_DATE,
			"IsUpdated" = TRUE
		FROM public."ASP Pricing" stg
		where ASP."HCPCS_Code" = stg."HCPCS_Code"
		and ASP.quarter = stg.quarter
		AND (COALESCE(ASP."Date_Uploaded",'') <> cOALESCE(stg."Date_Uploaded",'')
		OR COALESCE(ASP."Short_Description",'') <> cOALESCE(stg."Short_Description",'') 
		OR COALESCE(ASP."HCPCS_Code_Dosage",'') <> cOALESCE(stg."HCPCS_Code_Dosage",'')
		OR COALESCE(ASP."Payment_Limit",0.0) <> cOALESCE(stg."Payment_Limit",0.0)
		OR COALESCE(ASP."Vaccine_AWP%",0.0) <> cOALESCE(stg."Vaccine_AWP%",0.0)
		OR COALESCE(ASP."Vaccine_Limit",0.0) <> cOALESCE(stg."Vaccine_Limit",0.0)
		OR COALESCE(ASP."Blood_AWP%",0.0) <> cOALESCE(stg."Blood_AWP%",0.0)
		OR COALESCE(ASP."Blood_limit",0.0) <> cOALESCE(stg."Blood_limit",0.0)
		OR COALESCE(ASP."Clotting_Factor",0.0) <> cOALESCE(stg."Clotting_Factor",0.0)
		OR COALESCE(ASP."Notes",'') <> cOALESCE(stg."Notes",'')
		OR COALESCE(ASP.modification_time,'') <> cOALESCE(stg.modification_time,'') );
		
		--inserting new records which are not present in cms schema
		INSERT INTO cms."ASP_Pricing_new"("Date_Uploaded",
		"HCPCS_Code",
		"Short_Description",
		"HCPCS_Code_Dosage",
		"Payment_Limit",
		"Vaccine_AWP%",
		"Vaccine_Limit",
		"Blood_AWP%",
		"Blood_limit",
		"Clotting_Factor",
		"Notes",
		"Date_created",
		modification_time,
		quarter)
		select stg."Date_Uploaded",
		stg."HCPCS_Code",
		stg."Short_Description",
		stg."HCPCS_Code_Dosage",
		stg."Payment_Limit",
		stg."Vaccine_AWP%",
		stg."Vaccine_Limit",
		stg."Blood_AWP%",
		stg."Blood_limit",
		stg."Clotting_Factor",
		stg."Notes",
		stg."Date_created",
		stg.modification_time,
		stg.quarter 
		from public."ASP Pricing" stg
		left join cms."ASP_Pricing_new" ASP
		on stg."HCPCS_Code" = ASP."HCPCS_Code"
		and stg.quarter = ASP.quarter
		where ASP."HCPCS_Code" is null;
		
	end;
$BODY$;


-- PROCEDURE: public.sp_upsert_asp_pricing()

-- DROP PROCEDURE public.sp_upsert_asp_pricing();

CREATE OR REPLACE PROCEDURE public.sp_upsert_asp_pricing(
	)
LANGUAGE 'plpgsql'
AS $BODY$
begin
		
		--updating records which are already existing in cms schema
		UPDATE cms."ASP_Pricing_new" ASP
		SET "Date_Uploaded" = stg."Date_Uploaded",
			"Short_Description" = stg."Short_Description",
			"HCPCS_Code_Dosage" = stg."HCPCS_Code_Dosage",
			"Payment_Limit" = stg."Payment_Limit",
			"Vaccine_AWP%" = stg."Vaccine_AWP%",
			"Vaccine_Limit" = stg."Vaccine_Limit",
			"Blood_AWP%" = stg."Blood_AWP%",
			"Blood_limit" = stg."Blood_limit",
			"Clotting_Factor" = stg."Clotting_Factor",
			"Notes" = stg."Notes",
			"Date_created"  = stg."Date_created",
			modification_time = stg.modification_time,
			"UpdatedOn" = CURRENT_DATE,
			"IsUpdated" = TRUE
		FROM public."ASP Pricing" stg
		where ASP."HCPCS_Code" = stg."HCPCS_Code"
		and ASP.quarter = stg.quarter
		AND (COALESCE(ASP."Date_Uploaded",'') <> cOALESCE(stg."Date_Uploaded",'')
		OR COALESCE(ASP."Short_Description",'') <> cOALESCE(stg."Short_Description",'') 
		OR COALESCE(ASP."HCPCS_Code_Dosage",'') <> cOALESCE(stg."HCPCS_Code_Dosage",'')
		OR COALESCE(ASP."Payment_Limit",0.0) <> cOALESCE(stg."Payment_Limit",0.0)
		OR COALESCE(ASP."Vaccine_AWP%",0.0) <> cOALESCE(stg."Vaccine_AWP%",0.0)
		OR COALESCE(ASP."Vaccine_Limit",0.0) <> cOALESCE(stg."Vaccine_Limit",0.0)
		OR COALESCE(ASP."Blood_AWP%",0.0) <> cOALESCE(stg."Blood_AWP%",0.0)
		OR COALESCE(ASP."Blood_limit",0.0) <> cOALESCE(stg."Blood_limit",0.0)
		OR COALESCE(ASP."Clotting_Factor",0.0) <> cOALESCE(stg."Clotting_Factor",0.0)
		OR COALESCE(ASP."Notes",'') <> cOALESCE(stg."Notes",'')
		OR COALESCE(ASP.modification_time,'') <> cOALESCE(stg.modification_time,'') );
		
		--inserting new records which are not present in cms schema
		INSERT INTO cms."ASP_Pricing_new"("Date_Uploaded",
		"HCPCS_Code",
		"Short_Description",
		"HCPCS_Code_Dosage",
		"Payment_Limit",
		"Vaccine_AWP%",
		"Vaccine_Limit",
		"Blood_AWP%",
		"Blood_limit",
		"Clotting_Factor",
		"Notes",
		"Date_created",
		modification_time,
		quarter)
		select stg."Date_Uploaded",
		stg."HCPCS_Code",
		stg."Short_Description",
		stg."HCPCS_Code_Dosage",
		stg."Payment_Limit",
		stg."Vaccine_AWP%",
		stg."Vaccine_Limit",
		stg."Blood_AWP%",
		stg."Blood_limit",
		stg."Clotting_Factor",
		stg."Notes",
		stg."Date_created",
		stg.modification_time,
		stg.quarter 
		from public."ASP Pricing" stg
		left join cms."ASP_Pricing_new" ASP
		on stg."HCPCS_Code" = ASP."HCPCS_Code"
		and stg.quarter = ASP.quarter
		where ASP."HCPCS_Code" is null;
		
	end;
$BODY$;

--------------------------------

-- PROCEDURE: public.sp_upsert_noc_ndc_hcpcs()

-- DROP PROCEDURE public.sp_upsert_noc_ndc_hcpcs();

CREATE OR REPLACE PROCEDURE public.sp_upsert_noc_ndc_hcpcs(
	)
LANGUAGE 'plpgsql'
AS $BODY$
-- select * from public."NOC Pricing"
-- select * from public."NOC NDC-HCPCS"
    begin  
        --updating records which are already existing in cms schema
        UPDATE cms."NOC_NDC_HCPCS" ASP
        SET "Date_Uploaded" = stg."Date_Uploaded",
            "Drug_Generic_Name" = stg."Drug Generic Name",
            "LABELER_NAME" = stg."LABELER NAME",
            "NDC" = stg."NDC or ALTERNATE ID",
            "Drug_Name" = stg."Drug Name",
            "Dosage" = stg."Dosage",
            "PKG_SIZE" = stg."PKG SIZE",
            "PKG_QTY" = stg."PKG QTY",
            "BILLUNITS" = stg."BILLUNITS",
            "BILLUNITSPKG" = stg."BILLUNITSPKG",
            "Date_created"  = stg."Date_created",
            modification_time = stg.modification_time,
            "IsUpdated" = TRUE
        FROM public."NOC NDC-HCPCS" stg
        where ASP."NDC" = stg."NDC or ALTERNATE ID"
		and ASP."LABELER_NAME" =stg."LABELER NAME"
        and ASP.quarter = stg.quarter 
		and (COALESCE (ASP."Date_Uploaded",'') <> cOALESCE (stg."Date_Uploaded",'')
        or   COALESCE (ASP."Drug_Generic_Name",'') <> COALESCE (stg."Drug Generic Name",'')
        or   	COALESCE (ASP."LABELER_NAME",'') <> COALESCE (stg."LABELER NAME",'')
        or   	COALESCE (ASP."NDC",'') <> COALESCE (stg."NDC or ALTERNATE ID",'')
        or    COALESCE (ASP."Drug_Name",'')<> COALESCE (stg."Drug Name",'')
        or    COALESCE (ASP."Dosage",'') <> COALESCE (stg."Dosage",'')
        or    COALESCE (ASP."PKG_SIZE",0.0) <> COALESCE (stg."PKG SIZE",0.0)
        or    COALESCE (ASP."PKG_QTY",0.0) <> COALESCE (stg."PKG QTY", 0.0)
        or    COALESCE (ASP."BILLUNITS",0.0) <> COALESCE (stg."BILLUNITS",0.0)
        or    COALESCE (ASP."BILLUNITSPKG",0.0) <> COALESCE (stg."BILLUNITSPKG",0.0)
        or    COALESCE (ASp.modification_time,'') <> COALESCE (stg.modification_time, '') );
           
       
       
        --inserting new records which are not present in cms schema
        INSERT INTO cms."NOC_NDC_HCPCS"("Date_Uploaded",
            "Drug_Generic_Name",
            "LABELER_NAME",
            "NDC",
            "Drug_Name",
            "Dosage",
            "PKG_SIZE",
            "PKG_QTY",
            "BILLUNITS",
            "BILLUNITSPKG",
            "Date_created",
            modification_time,
			quarter)
        select stg."Date_Uploaded",
            stg."Drug Generic Name",
            stg."LABELER NAME",
            stg."NDC or ALTERNATE ID",
            stg."Drug Name",
            stg."Dosage",
            stg."PKG SIZE",
            stg."PKG QTY",
            stg."BILLUNITS",
            stg."BILLUNITSPKG",
            stg."Date_created",
            stg.modification_time,
			stg.quarter
        from public."NOC NDC-HCPCS" stg
        left join cms."NOC_NDC_HCPCS" ASP
        on stg."NDC or ALTERNATE ID" = ASP."NDC"
		and stg."LABELER NAME"=ASP."LABELER_NAME"
        and stg.quarter = ASP.quarter
        where ASP."NDC" is null;
    end;
$BODY$;


-- PROCEDURE: public.sp_upsert_asp_ndc_hcpcs()

-- DROP PROCEDURE public.sp_upsert_asp_ndc_hcpcs();

CREATE OR REPLACE PROCEDURE public.sp_upsert_asp_ndc_hcpcs(
	)
LANGUAGE 'plpgsql'
AS $BODY$
begin
		
		--updating records which are already existing in cms schema
		UPDATE cms."ASP_NDC_HCPCS" ASP
		SET "Date_Uploaded" = stg."Date_Uploaded",
			--"Code" = stg."Code",
			"Short_Description" = stg."Short_Description",
			"LABELER_NAME" = stg."LABELER_NAME",
			--"NDC2" = stg."NDC2",
			"Drug_Name" = stg."Drug_Name",
			"HCPCS_dosage" = stg."HCPCS_dosage",
			"PKG_SIZE" = stg."PKG_SIZE",
			"PKG_QTY" = stg."PKG_QTY",
			"BILLUNITS" = stg."BILLUNITS",
			"BILLUNITSPKG"=stg."BILLUNITSPKG",		
			"Date_created"  = stg."Date_created",
			modification_time = stg.modification_time
			---"IsUpdated" = TRUE
		FROM public."ASP NDC-HCPCS" stg
		where ASP."NDC2"=stg."NDC2"
		and ASP."Code" = stg."Code"
		and ASP.quarter = stg.quarter
		and (coalesce (ASP."Date_Uploaded",'') <> COALESCE(stg."Date_Uploaded",'')
		or coalesce (ASP."Short_Description",'') <> COALESCE(stg."Short_Description",'')
		or coalesce (ASP."LABELER_NAME",'') <> coalesce(stg."LABELER_NAME",'')
		or coalesce (ASP."Drug_Name",'')<> coalesce(stg."Drug_Name", '')
		or coalesce (ASP."HCPCS_dosage",'')<> coalesce (stg."HCPCS_dosage", '')
		or coalesce (ASP."PKG_SIZE",'') <> coalesce( stg."PKG_SIZE",'')
		or coalesce (ASP."PKG_QTY",0.0) <> coalesce (stg."PKG_QTY",0.0)
		or coalesce (ASP."BILLUNITS",0.0) <> coalesce(stg."BILLUNITS",0.0)
		or coalesce (ASP."BILLUNITSPKG",0.0)<> coalesce(stg."BILLUNITSPKG",	0.0)	
		or coalesce (ASP.modification_time,'') <> coalesce(stg.modification_time,'') );

		--inserting new records which are not present in cms schema
		INSERT INTO cms."ASP_NDC_HCPCS"("Date_Uploaded",
			"Code",
			"Short_Description",
			"LABELER_NAME",
			"NDC2",
			"Drug_Name",
			"HCPCS_dosage",
			"PKG_SIZE",
			"PKG_QTY",
			"BILLUNITS",
			"BILLUNITSPKG",		
			"Date_created" ,
			modification_time ,
			quarter)
		select stg."Date_Uploaded", 
			stg."Code",
			stg."Short_Description",
			stg."LABELER_NAME",
			stg."NDC2",
			stg."Drug_Name",
			stg."HCPCS_dosage",
			stg."PKG_SIZE",
			stg."PKG_QTY",
			stg."BILLUNITS",
			stg."BILLUNITSPKG",		
			stg."Date_created" ,
			stg.modification_time ,
			stg.quarter
		from public."ASP NDC-HCPCS" stg
		left join  cms."ASP_NDC_HCPCS" ASP
		on stg."Code" = ASP."Code"
		and stg."NDC2" = ASP."NDC2"
		and stg.quarter = ASP.quarter
		where ASP."Code" is null;
		
	end;
$BODY$;
