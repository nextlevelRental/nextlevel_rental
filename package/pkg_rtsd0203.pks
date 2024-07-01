CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0203 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0203
   PURPOSE   개인신용조회전문

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SAFE KEY IR 전문 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0203Count(
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,          /*인증번호            */
    v_Seq            IN RTSD0203.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY IR 전문 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*인증번호              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*순번                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF 성공여부           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[송신]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[송신]전문송신기관코드*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[송신]전문구분코드    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[송신]거래구분코드    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[송신]송신 FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[송신]단말기구분      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[송신]응답코드        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[송신]참가기관ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[송신]기관전문 관리번 */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[송신]기관전문 전송시 */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[송신]NICE 전문 관리번*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[송신]NICE 전문 전송시*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[송신]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[송신]조회동의사유코드*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[송신]개인_법인 구분  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[송신]주민번호        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[송신]조회사유코드    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[송신]조회자 식별코드 */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[송신]재요청횟수      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[송신]인증번호        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[송신]평점서비스 수신 */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[송신]평점서비스 요청 */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[송신]평점정보구분    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[송신]평점정보코드    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[수신]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[수신]전문수신기관코드*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[수신]전문구분코드    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[수신]거래구분코드    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[수신]수신 FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[수신]단말기구분      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[수신]응답코드        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[수신]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[수신]기관전문 관리번 */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[수신]기관전문 전송시 */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[수신]NICE 전문 관리번*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[수신]NICE 전문 전송시*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[수신]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*공란                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[수신]개인_법인 구분  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[수신]주민번호        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[수신]정보연속        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[수신]재요청 횟수     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[수신]성명            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[수신]인증번호        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[수신]평점 총건수     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[수신]평점 응답건수   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[수신]요약1 정보구분  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[수신]요약코드1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[수신]평점 정보구분   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[수신]평점 평점결과코 */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[수신]평점 CB 스코어구*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[수신]평점 평점사유1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[수신]평점 평점사유2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[수신]평점 평점사유3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[수신]평점 평점사유4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[수신]평점 평점사유5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[수신]평점 평점사유6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[수신]평점 신용평점   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[수신]평점 신용등급   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[수신]평점 결과값1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[수신]평점 결과값2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[수신]평점 결과값3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[수신]에러코드        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*공란                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- SAFE KEY IR 전문 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*인증번호              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*순번                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF 성공여부           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[송신]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[송신]전문송신기관코드*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[송신]전문구분코드    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[송신]거래구분코드    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[송신]송신 FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[송신]단말기구분      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[송신]응답코드        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[송신]참가기관ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[송신]기관전문 관리번 */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[송신]기관전문 전송시 */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[송신]NICE 전문 관리번*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[송신]NICE 전문 전송시*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[송신]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[송신]조회동의사유코드*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[송신]개인_법인 구분  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[송신]주민번호        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[송신]조회사유코드    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[송신]조회자 식별코드 */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[송신]재요청횟수      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[송신]인증번호        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[송신]평점서비스 수신 */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[송신]평점서비스 요청 */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[송신]평점정보구분    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[송신]평점정보코드    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[수신]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[수신]전문수신기관코드*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[수신]전문구분코드    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[수신]거래구분코드    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[수신]수신 FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[수신]단말기구분      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[수신]응답코드        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[수신]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[수신]기관전문 관리번 */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[수신]기관전문 전송시 */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[수신]NICE 전문 관리번*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[수신]NICE 전문 전송시*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[수신]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*공란                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[수신]개인_법인 구분  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[수신]주민번호        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[수신]정보연속        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[수신]재요청 횟수     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[수신]성명            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[수신]인증번호        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[수신]평점 총건수     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[수신]평점 응답건수   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[수신]요약1 정보구분  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[수신]요약코드1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[수신]평점 정보구분   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[수신]평점 평점결과코 */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[수신]평점 CB 스코어구*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[수신]평점 평점사유1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[수신]평점 평점사유2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[수신]평점 평점사유3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[수신]평점 평점사유4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[수신]평점 평점사유5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[수신]평점 평점사유6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[수신]평점 신용평점   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[수신]평점 신용등급   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[수신]평점 결과값1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[수신]평점 결과값2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[수신]평점 결과값3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[수신]에러코드        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*공란                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY IR 전문 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*인증번호              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*순번                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF 성공여부           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[송신]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[송신]전문송신기관코드*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[송신]전문구분코드    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[송신]거래구분코드    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[송신]송신 FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[송신]단말기구분      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[송신]응답코드        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[송신]참가기관ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[송신]기관전문 관리번 */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[송신]기관전문 전송시 */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[송신]NICE 전문 관리번*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[송신]NICE 전문 전송시*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[송신]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[송신]조회동의사유코드*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[송신]개인_법인 구분  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[송신]주민번호        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[송신]조회사유코드    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[송신]조회자 식별코드 */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[송신]재요청횟수      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[송신]인증번호        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[송신]평점서비스 수신 */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[송신]평점서비스 요청 */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[송신]평점정보구분    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[송신]평점정보코드    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[수신]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[수신]전문수신기관코드*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[수신]전문구분코드    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[수신]거래구분코드    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[수신]수신 FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[수신]단말기구분      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[수신]응답코드        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[수신]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[수신]기관전문 관리번 */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[수신]기관전문 전송시 */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[수신]NICE 전문 관리번*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[수신]NICE 전문 전송시*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[수신]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*공란                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[수신]개인_법인 구분  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[수신]주민번호        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[수신]정보연속        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[수신]재요청 횟수     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[수신]성명            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[수신]인증번호        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[수신]평점 총건수     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[수신]평점 응답건수   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[수신]요약1 정보구분  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[수신]요약코드1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[수신]평점 정보구분   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[수신]평점 평점결과코 */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[수신]평점 CB 스코어구*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[수신]평점 평점사유1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[수신]평점 평점사유2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[수신]평점 평점사유3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[수신]평점 평점사유4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[수신]평점 평점사유5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[수신]평점 평점사유6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[수신]평점 신용평점   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[수신]평점 신용등급   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[수신]평점 결과값1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[수신]평점 결과값2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[수신]평점 결과값3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[수신]에러코드        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*공란                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY IR 전문 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*인증번호              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인신용조회전문(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0203 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*인증번호              */
    v_Seq            IN OUT RTSD0203.SEQ%TYPE,        /*순번                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF 성공여부           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[송신]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[송신]전문송신기관코드*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[송신]전문구분코드    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[송신]거래구분코드    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[송신]송신 FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[송신]단말기구분      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[송신]응답코드        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[송신]참가기관ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[송신]기관전문 관리번 */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[송신]기관전문 전송시 */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[송신]NICE 전문 관리번*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[송신]NICE 전문 전송시*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[송신]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[송신]조회동의사유코드*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[송신]개인_법인 구분  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[송신]주민번호        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[송신]조회사유코드    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[송신]조회자 식별코드 */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[송신]재요청횟수      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[송신]인증번호        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[송신]평점서비스 수신 */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[송신]평점서비스 요청 */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[송신]평점정보구분    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[송신]평점정보코드    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[수신]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[수신]전문수신기관코드*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[수신]전문구분코드    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[수신]거래구분코드    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[수신]수신 FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[수신]단말기구분      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[수신]응답코드        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[수신]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[수신]기관전문 관리번 */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[수신]기관전문 전송시 */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[수신]NICE 전문 관리번*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[수신]NICE 전문 전송시*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[수신]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*공란                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[수신]개인_법인 구분  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[수신]주민번호        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[수신]정보연속        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[수신]재요청 횟수     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[수신]성명            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[수신]인증번호        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[수신]평점 총건수     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[수신]평점 응답건수   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[수신]요약1 정보구분  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[수신]요약코드1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[수신]평점 정보구분   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[수신]평점 평점결과코 */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[수신]평점 CB 스코어구*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[수신]평점적용배제사유*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[수신]평점 평점사유1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[수신]평점 평점사유2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[수신]평점 평점사유3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[수신]평점 평점사유4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[수신]평점 평점사유5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[수신]평점 평점사유6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[수신]평점 신용평점   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[수신]평점 신용등급   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[수신]평점 결과값1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[수신]평점 결과값2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[수신]평점 결과값3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[수신]에러코드        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*공란                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- SAFE KEY IR 전문 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0203Seq(
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE           /*인증번호            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0203;
/
