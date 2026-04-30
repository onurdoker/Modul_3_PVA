PROC FORMAT ; 
   VALUE ER30000F
         1 = 'Release number 1, May 2025'
         2 = 'Release number 2, December 2025'
   ;
   VALUE ER32000F
         1 = 'Male'
         2 = 'Female'
         9 = 'NA'
   ;
   VALUE ER32006F
         0 = 'This individual is nonsample and not part of the elderly group (ER30002=170-229 and ER30609<64 and ER30645<64 and ER30692<64 and ER30736<64 and ER30809<64 and ER33104<64)'
         1 = 'This individual is original sample (ER30002=001-026)'
         2 = 'This individual is born-in sample (ER30002=030-169)'
         3 = 'This individual is moved-in sample'
         4 = 'This individual is joint inclusion sample'
         5 = 'This individual was a followable nonsample parent'
         6 = 'This individual is nonsample elderly (ER30002=170-229 and ER30609=64-120 or ER30645=64-120 or ER30692=64-120 or ER30736=64-120 or ER30809=64-120 or ER33104=64-120)'
   ;
   VALUE ER34902F
    1 - 20 = 'Individuals in the family at the time of the 2021 interview'
   51 - 59 = 'Individuals in institutions at the time of the 2021 interview'
   71 - 80 = 'Individuals who moved out of the FU or out of institutions and established their own households between the 2019 and 2021 interviews'
   81 - 89 = 'Individuals who were living in 2019 but died by the time of the 2021 interview'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2021 or mover-out nonresponse by 2019 (ER34901=0)'
   ;
   VALUE ER34903F
        10 = 'Reference Person in 2021; 2019 Reference Person who was mover-out nonresponse by the time of the 20121 interview'
        20 = 'Legal Spouse in 2021; 2019 Spouse who was mover-out nonresponse by the time of the 2021 interview'
        22 = 'Partner--cohabitor who has lived with Reference Person for 12 months or more; 2019 Partner who was mover-out nonresponse by the time of the 2021 interview'
        30 = 'Son or daughter of Reference Person (includes adopted children but not stepchildren)'
        33 = 'Stepson or stepdaughter of Reference Person (children of legal Spouse [code 20] who are not children of Reference Person)'
        35 = 'Son or daughter of Partner but not Reference Person (includes only those children of mothers whose relationship to Reference Person is 22 but who are not children of Reference Person)'
        37 = 'Son-in-law or daughter-in-law of Reference Person (includes stepchildren-in-law)'
        38 = 'Foster son or foster daughter, not legally adopted'
        40 = 'Brother or sister of Reference Person (includes step and half sisters and brothers)'
        47 = 'Brother-in-law or sister-in-law of Reference Person (i.e., brother or sister of legal Spouse; spouse of HD''s brother or sister; spouse of legal Spouse''s brother or sister)'
        48 = 'Brother or sister of Reference Person''s cohabitor (the cohabitor is coded 22 or 88)'
        50 = 'Father or mother of Reference Person (includes stepparents)'
        57 = 'Father-in-law or mother-in-law of Reference Person (includes parents of legal spouses [code 20] only)'
        58 = 'Father or mother of Reference Person''s cohabitor (the cohabitor is coded 22 or 88)'
        60 = 'Grandson or granddaughter of Reference Person (includes grandchildren of legal Spouse [code 20] only; those of a cohabitor are coded 97)'
        65 = 'Great-grandson or great-granddaughter of Reference Person (includes great-grandchildren of legal Spouse [code 20]; those of a cohabitor are coded 97)'
        66 = 'Grandfather or grandmother of Reference Person (includes stepgrandparents)'
        67 = 'Grandfather or grandmother of legal Spouse (code 20)'
        68 = 'Great-grandfather or great-grandmother of Reference Person'
        69 = 'Great-grandfather or great-grandmother of legal Spouse (code 20)'
        70 = 'Nephew or niece of Reference Person'
        71 = 'Nephew or niece of legal Spouse (code 20)'
        72 = 'Uncle or Aunt of Reference Person'
        73 = 'Uncle or Aunt of legal Spouse (code 20)'
        74 = 'Cousin of Reference Person'
        75 = 'Cousin of legal Spouse (code 20)'
        83 = 'Children of first-year cohabitor but not of Reference Person (the parent of this child is coded 88)'
        88 = 'First-year cohabitor of Reference Person'
        90 = 'Uncooperative legal spouse of Reference Person (this individual is unable or unwilling to be designated as Reference Person or Spouse)'
        92 = 'Uncooperative partner of Reference Person (this individual is unable or unwilling to be designated as Partner)'
        95 = 'Other relative of Reference Person'
        96 = 'Other relative of legal Spouse (code 20)'
        97 = 'Other relative of cohabitor (the cohabitor is code 22 or 88)'
        98 = 'Other nonrelatives (includes friends of children of the FU, boyfriend/girlfriend of son/daughter, et al.)'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2021 or mover-out nonresponse by 2019 (ER34902=0)'
   ;
   VALUE ER34952F
    1 - 17 = 'Highest grade or year of school completed'
        99 = 'DK; NA; refused'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2021 or mover-out nonresponse by 2019 (ER34701=0); in an institution in both 2019 and 2021 (ER34702=51-59 and ER34908=0); not'
             ' a person aged 16 or older (ER34904=001-015, 999); associated with 2021 FU but actually moved out before 2020 (ER34908=5, 6, or 8 and ER34910<2020) or moved in in 2021 and was not a Reference Person o'
             'r Spouse/Partner (ER34908=1 and ER34910=2021 and ER34702 GE 2 and ER34703 GE 30)'
   ;
   VALUE ER35102F
    1 - 20 = 'Individuals in the family at the time of the 2023 interview'
   51 - 59 = 'Individuals in institutions at the time of the 2023 interview'
   71 - 80 = 'Individuals who moved out of the FU or out of institutions and established their own households between the 2021 and 2023 interviews'
   81 - 89 = 'Individuals who were living in 2021 but died by the time of the 2023 interview'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2023 or mover-out nonresponse by 2021 (ER35101=0)'
   ;
   VALUE ER35103F
        10 = 'Reference Person in 2023; 2021 Reference Person who was mover-out nonresponse by the time of the 20121 interview'
        20 = 'Legal Spouse in 2023; 2021 Spouse who was mover-out nonresponse by the time of the 2023 interview'
        22 = 'Partner--cohabitor who has lived with Reference Person for 12 months or more; 2021 Partner who was mover-out nonresponse by the time of the 2023 interview'
        30 = 'Son or daughter of Reference Person (includes adopted children but not stepchildren)'
        33 = 'Stepson or stepdaughter of Reference Person (children of legal Spouse [code 20] who are not children of Reference Person)'
        35 = 'Son or daughter of Partner but not Reference Person (includes only those children of mothers whose relationship to Reference Person is 22 but who are not children of Reference Person)'
        37 = 'Son-in-law or daughter-in-law of Reference Person (includes stepchildren-in-law)'
        38 = 'Foster son or foster daughter, not legally adopted'
        40 = 'Brother or sister of Reference Person (includes step and half sisters and brothers)'
        47 = 'Brother-in-law or sister-in-law of Reference Person (i.e., brother or sister of legal Spouse; spouse of HD''s brother or sister; spouse of legal Spouse''s brother or sister)'
        48 = 'Brother or sister of Reference Person''s cohabitor (the cohabitor is coded 22 or 88)'
        50 = 'Father or mother of Reference Person (includes stepparents)'
        57 = 'Father-in-law or mother-in-law of Reference Person (includes parents of legal spouses [code 20] only)'
        58 = 'Father or mother of Reference Person''s cohabitor (the cohabitor is coded 22 or 88)'
        60 = 'Grandson or granddaughter of Reference Person (includes grandchildren of legal Spouse [code 20] only; those of a cohabitor are coded 97)'
        65 = 'Great-grandson or great-granddaughter of Reference Person (includes great-grandchildren of legal Spouse [code 20]; those of a cohabitor are coded 97)'
        66 = 'Grandfather or grandmother of Reference Person (includes stepgrandparents)'
        67 = 'Grandfather or grandmother of legal Spouse (code 20)'
        68 = 'Great-grandfather or great-grandmother of Reference Person'
        69 = 'Great-grandfather or great-grandmother of legal Spouse (code 20)'
        70 = 'Nephew or niece of Reference Person'
        71 = 'Nephew or niece of legal Spouse (code 20)'
        72 = 'Uncle or Aunt of Reference Person'
        73 = 'Uncle or Aunt of legal Spouse (code 20)'
        74 = 'Cousin of Reference Person'
        75 = 'Cousin of legal Spouse (code 20)'
        83 = 'Children of first-year cohabitor but not of Reference Person (the parent of this child is coded 88)'
        88 = 'First-year cohabitor of Reference Person'
        90 = 'Uncooperative legal spouse of Reference Person (this individual is unable or unwilling to be designated as Reference Person or Spouse)'
        92 = 'Uncooperative partner of Reference Person (this individual is unable or unwilling to be designated as Partner)'
        95 = 'Other relative of Reference Person'
        96 = 'Other relative of legal Spouse (code 20)'
        97 = 'Other relative of cohabitor (the cohabitor is code 22 or 88)'
        98 = 'Other nonrelatives (includes friends of children of the FU, boyfriend/girlfriend of son/daughter, et al.)'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2023 or mover-out nonresponse by 2021 (ER35102=0)'
   ;
   VALUE ER35152F
    1 - 17 = 'Highest grade or year of school completed'
        99 = 'DK; NA; refused'
         0 = 'Inap.:  from Latino sample (ER30001=7001-9308); main family nonresponse by 2023 or mover-out nonresponse by 2021 (ER34901=0); in an institution in both 2021 and 2023 (ER34902=51-59 and ER35108=0); not'
             ' a person aged 16 or older (ER35104=001-015, 999); associated with 2023 FU but actually moved out before 2022 (ER35108=5, 6, or 8 and ER35110<2022) or moved in in 2023 and was not a Reference Person o'
             'r Spouse/Partner (ER35108=1 and ER35110=2023 and ER34902 GE 2 and ER34903 GE 30)'
   ;
   VALUE ER78001F
         1 = 'Release number 1, June 2023'
         2 = 'Release number 2, October 2023'
         3 = 'Release number 3, May 2025'
   ;
   VALUE ER78025F
         1 = 'Married'
         2 = 'Never married'
         3 = 'Widowed'
         4 = 'Divorced, annulled'
         5 = 'Separated'
         8 = 'DK'
         9 = 'NA; refused'
   ;
   VALUE ER81575F
    1 - 20 = 'Actual number of individual records'
   ;
   VALUE ER82001F
         1 = 'Release number 1, May 2025'
   ;
   VALUE ER82026F
         1 = 'Married'
         2 = 'Never married'
         3 = 'Widowed'
         4 = 'Divorced, annulled'
         5 = 'Separated'
         8 = 'DK'
         9 = 'NA; refused'
   ;
   VALUE ER85429F
    1 - 20 = 'Actual number of individual records'
   ;
   VALUE TA210001F
         1 = 'Release number 1, March 2024'
   ;
   VALUE TA212332F
         1 = 'None-minimal'
         2 = 'Mild depression'
         3 = 'Moderate depression'
         4 = 'Moderately severe depression'
         5 = 'Severe depression'
         9 = 'All items are DK/NA/refused'
   ;
   VALUE TA212346F
     1 - 9 = 'Actual value'
        99 = 'All items are DK/NA/refused'
   ;
   VALUE TA230001F
         1 = 'Release number 1, November 2025'
   ;
   VALUE TA232339F
         1 = 'None-minimal'
         2 = 'Mild depression'
         3 = 'Moderate depression'
         4 = 'Moderately severe depression'
         5 = 'Severe depression'
         9 = 'All items are DK/NA/refused'
   ;
   VALUE TA232353F
     1 - 9 = 'Actual value'
        99 = 'All items are DK/NA/refused'
   ;
RUN ;

FORMAT 
    ER30000    ER30000F.
    ER32000    ER32000F.
    ER32006    ER32006F.
    ER34902    ER34902F.
    ER34903    ER34903F.
    ER34952    ER34952F.
    ER35102    ER35102F.
    ER35103    ER35103F.
    ER35152    ER35152F.
    ER78001    ER78001F.
    ER78025    ER78025F.
    ER81575    ER81575F.
    ER82001    ER82001F.
    ER82026    ER82026F.
    ER85429    ER85429F.
    TA210001   TA210001F.
    TA212332   TA212332F.
    TA212346   TA212346F.
    TA230001   TA230001F.
    TA232339   TA232339F.
    TA232353   TA232353F.
;
