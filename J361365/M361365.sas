/* PSID DATA CENTER *****************************************************
   JOBID            : 361365                            
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : SAS Statements                    
   N_OF_VARIABLES   : 101                               
   N_OF_OBSERVATIONS: 19686                             
   MAX_REC_LENGTH   : 259                               
   DATE & TIME      : April 30, 2026 @ 5:19:50
************************************************************************/

FILENAME myfile "[path]\M361365.txt" ;

DATA M361365 ;
   ATTRIB
      CDSCUMREL       LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      CDSCUMID68      LABEL="1968 INTERVIEW NUMBER"                    FORMAT=F4.  
      CDSCUMPN        LABEL="PERSON NUMBER 68"                         FORMAT=F3.  
      CDSTYPE97       LABEL="CDS PERSON TYPE                       97" FORMAT=F1.  
      CRFID97         LABEL="CORE FAMILY INTERVIEW NUMBER          97" FORMAT=F5.  
      CRSN97          LABEL="CORE SEQUENCE NUMBER                  97" FORMAT=F2.  
      CDS_HID97       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        97" FORMAT=F5.  
      CDS_SN97        LABEL="CDS SEQUENCE NUMBER                   97" FORMAT=F2.  
      ID68PCG97       LABEL="PCG 1968 INTERVIEW NUMBER             97" FORMAT=F4.  
      PNPCG97         LABEL="PCG PERSON NUMBER                     97" FORMAT=F3.  
      CRPCGFID97      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      97" FORMAT=F5.  
      CRPCGSN97       LABEL="PCG CORE SEQUENCE NUMBER              97" FORMAT=F2.  
      ID68OCG97       LABEL="OCG 1968 INTERVIEW NUMBER             97" FORMAT=F4.  
      PNOCG97         LABEL="OCG PERSON NUMBER                     97" FORMAT=F3.  
      CROCGFID97      LABEL="OCG CORE FAMILY INTERVIEW NUMBER      97" FORMAT=F5.  
      CROCGSN97       LABEL="OCG CORE SEQUENCE NUMBER              97" FORMAT=F2.  
      DEMOG_97        LABEL="CDS DEMOG FILE                        97" FORMAT=F1.  
      PCGHH_97        LABEL="CDS PCG HOUSEHOLD FILE                97" FORMAT=F1.  
      PCGCH_97        LABEL="CDS PCG CHILD FILE                    97" FORMAT=F1.  
      CHILD_97        LABEL="CDS CHILD FILE                        97" FORMAT=F1.  
      CDSTYPE02       LABEL="CDS PERSON TYPE                       02" FORMAT=F1.  
      CRFID02         LABEL="CORE FAMILY INTERVIEW NUMBER          02" FORMAT=F5.  
      CRSN02          LABEL="CORE SEQUENCE NUMBER                  02" FORMAT=F2.  
      CDS_HID02       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        02" FORMAT=F5.  
      CDS_SN02        LABEL="CDS SEQUENCE NUMBER                   02" FORMAT=F2.  
      ID68PCG02       LABEL="PCG 1968 INTERVIEW NUMBER             02" FORMAT=F4.  
      PNPCG02         LABEL="PCG PERSON NUMBER                     02" FORMAT=F3.  
      CRPCGFID02      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      02" FORMAT=F5.  
      CRPCGSN02       LABEL="PCG CORE SEQUENCE NUMBER              02" FORMAT=F2.  
      ID68OCG02       LABEL="OCG 1968 INTERVIEW NUMBER             02" FORMAT=F4.  
      PNOCG02         LABEL="OCG PERSON NUMBER                     02" FORMAT=F3.  
      CROCGFID02      LABEL="OCG CORE FAMILY INTERVIEW NUMBER      02" FORMAT=F5.  
      CROCGSN02       LABEL="OCG CORE SEQUENCE NUMBER              02" FORMAT=F2.  
      DEMOG_02        LABEL="CDS DEMOG FILE                        02" FORMAT=F1.  
      PCGHH_02        LABEL="CDS PCG HOUSEHOLD FILE                02" FORMAT=F1.  
      PCGCH_02        LABEL="CDS PCG CHILD FILE                    02" FORMAT=F1.  
      CHILD_02        LABEL="CDS CHILD FILE                        02" FORMAT=F1.  
      CDSTYPE07       LABEL="CDS PERSON TYPE                       07" FORMAT=F1.  
      CRFID07         LABEL="CORE FAMILY INTERVIEW NUMBER          07" FORMAT=F5.  
      CRSN07          LABEL="CORE SEQUENCE NUMBER                  07" FORMAT=F2.  
      CDS_HID07       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        07" FORMAT=F5.  
      CDS_SN07        LABEL="CDS SEQUENCE NUMBER                   07" FORMAT=F2.  
      ID68PCG07       LABEL="PCG 1968 INTERVIEW NUMBER             07" FORMAT=F4.  
      PNPCG07         LABEL="PCG PERSON NUMBER                     07" FORMAT=F3.  
      CRPCGFID07      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      07" FORMAT=F5.  
      CRPCGSN07       LABEL="PCG CORE SEQUENCE NUMBER              07" FORMAT=F2.  
      ID68OCG07       LABEL="OCG 1968 INTERVIEW NUMBER             07" FORMAT=F4.  
      PNOCG07         LABEL="OCG PERSON NUMBER                     07" FORMAT=F3.  
      CROCGFID07      LABEL="OCG CORE FAMILY INTERVIEW NUMBER      07" FORMAT=F5.  
      CROCGSN07       LABEL="OCG CORE SEQUENCE NUMBER              07" FORMAT=F2.  
      DEMOG_07        LABEL="CDS DEMOG FILE                        07" FORMAT=F1.  
      PCGHH_07        LABEL="CDS PCG HOUSEHOLD FILE                07" FORMAT=F1.  
      PCGCH_07        LABEL="CDS PCG CHILD FILE                    07" FORMAT=F1.  
      CHILD_07        LABEL="CDS CHILD FILE                        07" FORMAT=F1.  
      CDSTYPE14       LABEL="CDS PERSON TYPE                       14" FORMAT=F1.  
      CRFID14         LABEL="CORE FAMILY INTERVIEW NUMBER          14" FORMAT=F5.  
      CRSN14          LABEL="CORE SEQUENCE NUMBER                  14" FORMAT=F2.  
      CDS_HID14       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        14" FORMAT=F5.  
      CDS_SN14        LABEL="CDS SEQUENCE NUMBER                   14" FORMAT=F2.  
      ID68PCG14       LABEL="PCG 1968 INTERVIEW NUMBER             14" FORMAT=F4.  
      PNPCG14         LABEL="PCG PERSON NUMBER                     14" FORMAT=F3.  
      CRPCGFID14      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      14" FORMAT=F5.  
      CRPCGSN14       LABEL="PCG CORE SEQUENCE NUMBER              14" FORMAT=F2.  
      CDSPCGSN14      LABEL="PCG CDS SEQUENCE NUMBER               14" FORMAT=F2.  
      PCGHHNO14       LABEL="CDS HOUSEHOLD PCG INDICATOR           14" FORMAT=F1.  
      DEMOG_14        LABEL="CDS DEMOG FILE                        14" FORMAT=F1.  
      PCGHH_14        LABEL="CDS PCG HOUSEHOLD FILE                14" FORMAT=F1.  
      PCGCH_14        LABEL="CDS PCG CHILD FILE                    14" FORMAT=F1.  
      CHILD_14        LABEL="CDS CHILD FILE                        14" FORMAT=F1.  
      CDSTYPE19       LABEL="CDS PERSON TYPE                       19" FORMAT=F1.  
      CRFID19         LABEL="CORE FAMILY INTERVIEW NUMBER          19" FORMAT=F5.  
      CRSN19          LABEL="CORE SEQUENCE NUMBER                  19" FORMAT=F2.  
      CDS_HID19       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        19" FORMAT=F5.  
      CDS_SN19        LABEL="CDS SEQUENCE NUMBER                   19" FORMAT=F2.  
      ID68PCG19       LABEL="PCG 1968 INTERVIEW NUMBER             19" FORMAT=F4.  
      PNPCG19         LABEL="PCG PERSON NUMBER                     19" FORMAT=F3.  
      CRPCGFID19      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      19" FORMAT=F5.  
      CRPCGSN19       LABEL="PCG CORE SEQUENCE NUMBER              19" FORMAT=F2.  
      CDSPCGSN19      LABEL="PCG CDS SEQUENCE NUMBER               19" FORMAT=F2.  
      PCGHHNO19       LABEL="CDS HOUSEHOLD PCG INDICATOR           19" FORMAT=F1.  
      DEMOG_19        LABEL="CDS DEMOG FILE                        19" FORMAT=F1.  
      PCGHH_19        LABEL="CDS PCG HOUSEHOLD FILE                19" FORMAT=F1.  
      PCGCH_19        LABEL="CDS PCG CHILD FILE                    19" FORMAT=F1.  
      CHILD_19        LABEL="CDS CHILD FILE                        19" FORMAT=F1.  
      PCGHH_20        LABEL="CDS PCG HOUSEHOLD FILE                20" FORMAT=F1.  
      PCGCH_20        LABEL="CDS PCG CHILD FILE                    20" FORMAT=F1.  
      CDSTYPE21       LABEL="CDS PERSON TYPE                       21" FORMAT=F1.  
      CRFID21         LABEL="CORE FAMILY INTERVIEW NUMBER          21" FORMAT=F5.  
      CRSN21          LABEL="CORE SEQUENCE NUMBER                  21" FORMAT=F2.  
      CDS_HID21       LABEL="CDS HOUSEHOLD INTERVIEW NUMBER        21" FORMAT=F5.  
      CDS_SN21        LABEL="CDS SEQUENCE NUMBER                   21" FORMAT=F2.  
      ID68PCG21       LABEL="PCG 1968 INTERVIEW NUMBER             21" FORMAT=F4.  
      PNPCG21         LABEL="PCG PERSON NUMBER                     21" FORMAT=F3.  
      CRPCGFID21      LABEL="PCG CORE FAMILY INTERVIEW NUMBER      21" FORMAT=F5.  
      CRPCGSN21       LABEL="PCG CORE SEQUENCE NUMBER              21" FORMAT=F2.  
      CDSPCGSN21      LABEL="PCG CDS SEQUENCE NUMBER               21" FORMAT=F2.  
      PCGHHNO21       LABEL="CDS HOUSEHOLD PCG INDICATOR           21" FORMAT=F1.  
      DEMOG_21        LABEL="CDS DEMOG FILE                        21" FORMAT=F1.  
      PCGHH_21        LABEL="CDS PCG HOUSEHOLD FILE                21" FORMAT=F1.  
      PCGCH_21        LABEL="CDS PCG CHILD FILE                    21" FORMAT=F1.  
      CHILD_21        LABEL="CDS CHILD FILE                        21" FORMAT=F1.  
   ;
   INFILE myfile LRECL = 259 ; 
   INPUT 
      CDSCUMREL            1 - 1           CDSCUMID68           2 - 5           CDSCUMPN             6 - 8     
      CDSTYPE97            9 - 9           CRFID97             10 - 14          CRSN97              15 - 16    
      CDS_HID97           17 - 21          CDS_SN97            22 - 23          ID68PCG97           24 - 27    
      PNPCG97             28 - 30          CRPCGFID97          31 - 35          CRPCGSN97           36 - 37    
      ID68OCG97           38 - 41          PNOCG97             42 - 44          CROCGFID97          45 - 49    
      CROCGSN97           50 - 51          DEMOG_97            52 - 52          PCGHH_97            53 - 53    
      PCGCH_97            54 - 54          CHILD_97            55 - 55          CDSTYPE02           56 - 56    
      CRFID02             57 - 61          CRSN02              62 - 63          CDS_HID02           64 - 68    
      CDS_SN02            69 - 70          ID68PCG02           71 - 74          PNPCG02             75 - 77    
      CRPCGFID02          78 - 82          CRPCGSN02           83 - 84          ID68OCG02           85 - 88    
      PNOCG02             89 - 91          CROCGFID02          92 - 96          CROCGSN02           97 - 98    
      DEMOG_02            99 - 99          PCGHH_02           100 - 100         PCGCH_02           101 - 101   
      CHILD_02           102 - 102         CDSTYPE07          103 - 103         CRFID07            104 - 108   
      CRSN07             109 - 110         CDS_HID07          111 - 115         CDS_SN07           116 - 117   
      ID68PCG07          118 - 121         PNPCG07            122 - 124         CRPCGFID07         125 - 129   
      CRPCGSN07          130 - 131         ID68OCG07          132 - 135         PNOCG07            136 - 138   
      CROCGFID07         139 - 143         CROCGSN07          144 - 145         DEMOG_07           146 - 146   
      PCGHH_07           147 - 147         PCGCH_07           148 - 148         CHILD_07           149 - 149   
      CDSTYPE14          150 - 150         CRFID14            151 - 155         CRSN14             156 - 157   
      CDS_HID14          158 - 162         CDS_SN14           163 - 164         ID68PCG14          165 - 168   
      PNPCG14            169 - 171         CRPCGFID14         172 - 176         CRPCGSN14          177 - 178   
      CDSPCGSN14         179 - 180         PCGHHNO14          181 - 181         DEMOG_14           182 - 182   
      PCGHH_14           183 - 183         PCGCH_14           184 - 184         CHILD_14           185 - 185   
      CDSTYPE19          186 - 186         CRFID19            187 - 191         CRSN19             192 - 193   
      CDS_HID19          194 - 198         CDS_SN19           199 - 200         ID68PCG19          201 - 204   
      PNPCG19            205 - 207         CRPCGFID19         208 - 212         CRPCGSN19          213 - 214   
      CDSPCGSN19         215 - 216         PCGHHNO19          217 - 217         DEMOG_19           218 - 218   
      PCGHH_19           219 - 219         PCGCH_19           220 - 220         CHILD_19           221 - 221   
      PCGHH_20           222 - 222         PCGCH_20           223 - 223         CDSTYPE21          224 - 224   
      CRFID21            225 - 229         CRSN21             230 - 231         CDS_HID21          232 - 236   
      CDS_SN21           237 - 238         ID68PCG21          239 - 242         PNPCG21            243 - 245   
      CRPCGFID21         246 - 250         CRPCGSN21          251 - 252         CDSPCGSN21         253 - 254   
      PCGHHNO21          255 - 255         DEMOG_21           256 - 256         PCGHH_21           257 - 257   
      PCGCH_21           258 - 258         CHILD_21           259 - 259   
   ;
run ;
