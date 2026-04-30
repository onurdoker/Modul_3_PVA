/* PSID DATA CENTER *****************************************************
   JOBID            : 361365                            
   DATA_DOMAIN      : TAi                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : CDS Kids Only                     
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : SAS Statements                    
   CODEBOOK_TYPE    : HTML                              
   N_OF_VARIABLES   : 36                                
   N_OF_OBSERVATIONS: 3165                              
   MAX_REC_LENGTH   : 99                                
   DATE & TIME      : April 30, 2026 @ 5:19:50
************************************************************************/

FILENAME myfile "[path]\J361365.txt" ;

DATA J361365 ;
   ATTRIB
      TAS             LABEL="Sum of All TAS Flags"                     FORMAT=F1.  
      TAS21           LABEL="TAS2021 = 1 if exists, else missing"      FORMAT=F1.  
      TAS23           LABEL="TAS2023 = 1 if exists, else missing"      FORMAT=F1.  
      ER30000         LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      ER30001         LABEL="1968 INTERVIEW NUMBER"                    FORMAT=F4.  
      ER30002         LABEL="PERSON NUMBER                         68" FORMAT=F3.  
      ER32000         LABEL="SEX OF INDIVIDUAL"                        FORMAT=F1.  
      ER32006         LABEL="WHETHER SAMPLE OR NONSAMPLE"              FORMAT=F1.  
      ER78001         LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      ER78025         LABEL="REFERENCE PERSON MARITAL STATUS"          FORMAT=F1.  
      ER81575         LABEL="# OF INDIVIDUAL RECORDS"                  FORMAT=F2.  
      ER81775         LABEL="TOTAL FAMILY INCOME-2020"                 FORMAT=F7.  
      ER34901         LABEL="2021 INTERVIEW NUMBER"                    FORMAT=F5.  
      ER34902         LABEL="SEQUENCE NUMBER                       21" FORMAT=F2.  
      ER34903         LABEL="RELATION TO REFERENCE PERSON          21" FORMAT=F2.  
      ER34904         LABEL="AGE OF INDIVIDUAL                     21" FORMAT=F3.  
      ER34952         LABEL="YEARS COMPLETED EDUCATION             21" FORMAT=F2.  
      ER35049         LABEL="OFUM TOTAL TAXABLE INCOME - IMPUTED   21" FORMAT=F7.  
      ER35064         LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   21" FORMAT=F7.3 
      TA210001        LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      TA212332        LABEL="SCALE SCORE: PHQ-9 DEPRESS SCREEN"        FORMAT=F1.  
      TA212346        LABEL="SCALE: LONELINESS"                        FORMAT=F2.  
      ER82001         LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      ER82026         LABEL="REFERENCE PERSON MARITAL STATUS"          FORMAT=F1.  
      ER85429         LABEL="# OF INDIVIDUAL RECORDS"                  FORMAT=F2.  
      ER85629         LABEL="TOTAL FAMILY INCOME-2022"                 FORMAT=F7.  
      ER35101         LABEL="2023 INTERVIEW NUMBER"                    FORMAT=F5.  
      ER35102         LABEL="SEQUENCE NUMBER                       23" FORMAT=F2.  
      ER35103         LABEL="RELATION TO REFERENCE PERSON          23" FORMAT=F2.  
      ER35104         LABEL="AGE OF INDIVIDUAL                     23" FORMAT=F3.  
      ER35152         LABEL="YEARS COMPLETED EDUCATION             23" FORMAT=F2.  
      ER35249         LABEL="OFUM TOTAL TAXABLE INCOME - IMPUTED   23" FORMAT=F7.  
      ER35264         LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   23" FORMAT=F7.3 
      TA230001        LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      TA232339        LABEL="SCALE SCORE: PHQ-9 DEPRESS SCREEN"        FORMAT=F1.  
      TA232353        LABEL="SCALE: LONELINESS"                        FORMAT=F2.  
   ;
   INFILE myfile LRECL = 99 ; 
   INPUT 
      TAS                  1 - 1           TAS21                2 - 2           TAS23                3 - 3     
      ER30000              4 - 4           ER30001              5 - 8           ER30002              9 - 11    
      ER32000             12 - 12          ER32006             13 - 13          ER78001             14 - 14    
      ER78025             15 - 15          ER81575             16 - 17          ER81775             18 - 24    
      ER34901             25 - 29          ER34902             30 - 31          ER34903             32 - 33    
      ER34904             34 - 36          ER34952             37 - 38          ER35049             39 - 45    
      ER35064             46 - 52          TA210001            53 - 53          TA212332            54 - 54    
      TA212346            55 - 56          ER82001             57 - 57          ER82026             58 - 58    
      ER85429             59 - 60          ER85629             61 - 67          ER35101             68 - 72    
      ER35102             73 - 74          ER35103             75 - 76          ER35104             77 - 79    
      ER35152             80 - 81          ER35249             82 - 88          ER35264             89 - 95    
      TA230001            96 - 96          TA232339            97 - 97          TA232353            98 - 99    
   ;
run ;
