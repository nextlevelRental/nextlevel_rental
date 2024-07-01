CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0203 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0203
   PURPOSE   ���νſ���ȸ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SAFE KEY IR ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0203Count(
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,          /*������ȣ            */
    v_Seq            IN RTSD0203.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0203
    WHERE   SAFEKEY = v_Safekey
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0203Count;

  /*****************************************************************************
  -- SAFE KEY IR ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*����                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF ��������           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[�۽�]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[�۽�]�����۽ű���ڵ�*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[�۽�]���������ڵ�    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[�۽�]�ŷ������ڵ�    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[�۽�]�۽� FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[�۽�]�ܸ��ⱸ��      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[�۽�]�����ڵ�        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[�۽�]�������ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[�۽�]������� ������ */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[�۽�]������� ���۽� */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[�۽�]NICE ���� ������*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[�۽�]NICE ���� ���۽�*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[�۽�]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[�۽�]��ȸ���ǻ����ڵ�*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[�۽�]����_���� ����  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[�۽�]�ֹι�ȣ        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[�۽�]��ȸ�����ڵ�    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[�۽�]��ȸ�� �ĺ��ڵ� */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[�۽�]���ûȽ��      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[�۽�]������ȣ        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[�۽�]�������� ���� */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[�۽�]�������� ��û */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[�۽�]������������    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[�۽�]���������ڵ�    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[����]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[����]�������ű���ڵ�*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[����]���������ڵ�    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[����]�ŷ������ڵ�    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[����]���� FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[����]�ܸ��ⱸ��      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[����]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[����]������� ������ */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[����]������� ���۽� */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[����]NICE ���� ������*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[����]NICE ���� ���۽�*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[����]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*����                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[����]����_���� ����  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[����]�ֹι�ȣ        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[����]��������        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[����]���û Ƚ��     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[����]����            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[����]������ȣ        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[����]���� �ѰǼ�     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[����]���� ����Ǽ�   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[����]���1 ��������  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[����]����ڵ�1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[����]���� ��������   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[����]���� ��������� */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[����]���� CB ���ھ*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[����]���������������*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[����]���������������*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[����]���������������*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[����]���� ��������1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[����]���� ��������2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[����]���� ��������3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[����]���� ��������4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[����]���� ��������5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[����]���� ��������6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[����]���� �ſ�����   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[����]���� �ſ���   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[����]���� �����1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[����]���� �����2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[����]���� �����3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFEKEY,                   /*������ȣ            */
            A.SEQ,                       /*����                */
            A.YN,                        /*IF ��������         */
            A.I_ND01,                    /*[�۽�]Transaction Co*/
            A.I_ND02,                    /*[�۽�]�����۽ű����*/
            A.I_ND03,                    /*[�۽�]���������ڵ�  */
            A.I_ND04,                    /*[�۽�]�ŷ������ڵ�  */
            A.I_ND05,                    /*[�۽�]�۽� FLAG     */
            A.I_ND06,                    /*[�۽�]�ܸ��ⱸ��    */
            A.I_ND07,                    /*[�۽�]�����ڵ�      */
            A.I_ND08,                    /*[�۽�]�������ID    */
            A.I_ND09,                    /*[�۽�]������� ���� */
            A.I_ND10,                    /*[�۽�]������� ���� */
            A.I_ND11,                    /*[�۽�]NICE ���� ����*/
            A.I_ND12,                    /*[�۽�]NICE ���� ����*/
            A.I_ND13,                    /*[�۽�]Primary Bitmap*/
            A.I_ND14,                    /*[�۽�]��ȸ���ǻ�����*/
            A.I_ND15,                    /*[�۽�]����_���� ����*/
            A.I_ND16,                    /*[�۽�]�ֹι�ȣ      */
            A.I_ND17,                    /*[�۽�]��ȸ�����ڵ�  */
            A.I_ND18,                    /*[�۽�]��ȸ�� �ĺ��� */
            A.I_ND19,                    /*[�۽�]���ûȽ��    */
            A.I_ND20,                    /*[�۽�]������ȣ      */
            A.I_ND21,                    /*[�۽�]�������� �� */
            A.I_ND22,                    /*[�۽�]�������� �� */
            A.I_ND23,                    /*[�۽�]������������  */
            A.I_ND24,                    /*[�۽�]���������ڵ�  */
            A.E_ND01,                    /*[����]Transaction Co*/
            A.E_ND02,                    /*[����]�������ű����*/
            A.E_ND03,                    /*[����]���������ڵ�  */
            A.E_ND04,                    /*[����]�ŷ������ڵ�  */
            A.E_ND05,                    /*[����]���� FLAG     */
            A.E_ND06,                    /*[����]�ܸ��ⱸ��    */
            A.E_ND07,                    /*[����]�����ڵ�      */
            A.E_ND08,                    /*[����]User ID       */
            A.E_ND09,                    /*[����]������� ���� */
            A.E_ND10,                    /*[����]������� ���� */
            A.E_ND11,                    /*[����]NICE ���� ����*/
            A.E_ND12,                    /*[����]NICE ���� ����*/
            A.E_ND13,                    /*[����]Primary Bitmap*/
            A.E_ND14,                    /*����                */
            A.E_ND15,                    /*[����]����_���� ����*/
            A.E_ND16,                    /*[����]�ֹι�ȣ      */
            A.E_ND17,                    /*[����]��������      */
            A.E_ND18,                    /*[����]���û Ƚ��   */
            A.E_ND19,                    /*[����]����          */
            A.E_ND20,                    /*[����]������ȣ      */
            A.E_ND21,                    /*[����]���� �ѰǼ�   */
            A.E_ND22,                    /*[����]���� ����Ǽ� */
            A.E_ND23,                    /*[����]���1 ��������*/
            A.E_ND24,                    /*[����]����ڵ�1     */
            A.E_ND25,                    /*[����]���� �������� */
            A.E_ND26,                    /*[����]���� ������� */
            A.E_ND27,                    /*[����]���� CB ���ھ�*/
            A.E_ND28,                    /*[����]�������������*/
            A.E_ND29,                    /*[����]�������������*/
            A.E_ND30,                    /*[����]�������������*/
            A.E_ND31,                    /*[����]���� ��������1*/
            A.E_ND32,                    /*[����]���� ��������2*/
            A.E_ND33,                    /*[����]���� ��������3*/
            A.E_ND34,                    /*[����]���� ��������4*/
            A.E_ND35,                    /*[����]���� ��������5*/
            A.E_ND36,                    /*[����]���� ��������6*/
            A.E_ND37,                    /*[����]���� �ſ����� */
            A.E_ND38,                    /*[����]���� �ſ��� */
            A.E_ND39,                    /*[����]���� �����1  */
            A.E_ND40,                    /*[����]���� �����2  */
            A.E_ND41,                    /*[����]���� �����3  */
            A.E_ND42,                    /*[����]�����ڵ�      */
            A.E_ND43,                    /*Profile Code 1      */
            A.E_ND44,                    /*Profile Code 2      */
            A.E_ND45,                    /*Profile Code 3      */
            A.E_ND46,                    /*����                */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0203 A
    WHERE   A.SAFEKEY = DECODE(v_Safekey, NULL, A.SAFEKEY, v_Safekey)
    AND     A.SEQ     = DECODE(v_Seq    , NULL, A.SEQ    , v_Seq)
    AND     A.YN      = DECODE(v_Yn     , NULL, A.YN     , v_Yn)
    AND     A.I_ND01  = DECODE(v_I_Nd01 , NULL, A.I_ND01 , v_I_Nd01)
    AND     A.I_ND02  = DECODE(v_I_Nd02 , NULL, A.I_ND02 , v_I_Nd02)
    AND     A.I_ND03  = DECODE(v_I_Nd03 , NULL, A.I_ND03 , v_I_Nd03)
    AND     A.I_ND04  = DECODE(v_I_Nd04 , NULL, A.I_ND04 , v_I_Nd04)
    AND     A.I_ND05  = DECODE(v_I_Nd05 , NULL, A.I_ND05 , v_I_Nd05)
    AND     A.I_ND06  = DECODE(v_I_Nd06 , NULL, A.I_ND06 , v_I_Nd06)
    AND     A.I_ND07  = DECODE(v_I_Nd07 , NULL, A.I_ND07 , v_I_Nd07)
    AND     A.I_ND08  = DECODE(v_I_Nd08 , NULL, A.I_ND08 , v_I_Nd08)
    AND     A.I_ND09  = DECODE(v_I_Nd09 , NULL, A.I_ND09 , v_I_Nd09)
    AND     A.I_ND10  = DECODE(v_I_Nd10 , NULL, A.I_ND10 , v_I_Nd10)
    AND     A.I_ND11  = DECODE(v_I_Nd11 , NULL, A.I_ND11 , v_I_Nd11)
    AND     A.I_ND12  = DECODE(v_I_Nd12 , NULL, A.I_ND12 , v_I_Nd12)
    AND     A.I_ND13  = DECODE(v_I_Nd13 , NULL, A.I_ND13 , v_I_Nd13)
    AND     A.I_ND14  = DECODE(v_I_Nd14 , NULL, A.I_ND14 , v_I_Nd14)
    AND     A.I_ND15  = DECODE(v_I_Nd15 , NULL, A.I_ND15 , v_I_Nd15)
    AND     A.I_ND16  = DECODE(v_I_Nd16 , NULL, A.I_ND16 , v_I_Nd16)
    AND     A.I_ND17  = DECODE(v_I_Nd17 , NULL, A.I_ND17 , v_I_Nd17)
    AND     A.I_ND18  = DECODE(v_I_Nd18 , NULL, A.I_ND18 , v_I_Nd18)
    AND     A.I_ND19  = DECODE(v_I_Nd19 , NULL, A.I_ND19 , v_I_Nd19)
    AND     A.I_ND20  = DECODE(v_I_Nd20 , NULL, A.I_ND20 , v_I_Nd20)
    AND     A.I_ND21  = DECODE(v_I_Nd21 , NULL, A.I_ND21 , v_I_Nd21)
    AND     A.I_ND22  = DECODE(v_I_Nd22 , NULL, A.I_ND22 , v_I_Nd22)
    AND     A.I_ND23  = DECODE(v_I_Nd23 , NULL, A.I_ND23 , v_I_Nd23)
    AND     A.I_ND24  = DECODE(v_I_Nd24 , NULL, A.I_ND24 , v_I_Nd24)
    AND     A.E_ND01  = DECODE(v_E_Nd01 , NULL, A.E_ND01 , v_E_Nd01)
    AND     A.E_ND02  = DECODE(v_E_Nd02 , NULL, A.E_ND02 , v_E_Nd02)
    AND     A.E_ND03  = DECODE(v_E_Nd03 , NULL, A.E_ND03 , v_E_Nd03)
    AND     A.E_ND04  = DECODE(v_E_Nd04 , NULL, A.E_ND04 , v_E_Nd04)
    AND     A.E_ND05  = DECODE(v_E_Nd05 , NULL, A.E_ND05 , v_E_Nd05)
    AND     A.E_ND06  = DECODE(v_E_Nd06 , NULL, A.E_ND06 , v_E_Nd06)
    AND     A.E_ND07  = DECODE(v_E_Nd07 , NULL, A.E_ND07 , v_E_Nd07)
    AND     A.E_ND08  = DECODE(v_E_Nd08 , NULL, A.E_ND08 , v_E_Nd08)
    AND     A.E_ND09  = DECODE(v_E_Nd09 , NULL, A.E_ND09 , v_E_Nd09)
    AND     A.E_ND10  = DECODE(v_E_Nd10 , NULL, A.E_ND10 , v_E_Nd10)
    AND     A.E_ND11  = DECODE(v_E_Nd11 , NULL, A.E_ND11 , v_E_Nd11)
    AND     A.E_ND12  = DECODE(v_E_Nd12 , NULL, A.E_ND12 , v_E_Nd12)
    AND     A.E_ND13  = DECODE(v_E_Nd13 , NULL, A.E_ND13 , v_E_Nd13)
    AND     A.E_ND14  = DECODE(v_E_Nd14 , NULL, A.E_ND14 , v_E_Nd14)
    AND     A.E_ND15  = DECODE(v_E_Nd15 , NULL, A.E_ND15 , v_E_Nd15)
    AND     A.E_ND16  = DECODE(v_E_Nd16 , NULL, A.E_ND16 , v_E_Nd16)
    AND     A.E_ND17  = DECODE(v_E_Nd17 , NULL, A.E_ND17 , v_E_Nd17)
    AND     A.E_ND18  = DECODE(v_E_Nd18 , NULL, A.E_ND18 , v_E_Nd18)
    AND     A.E_ND19  = DECODE(v_E_Nd19 , NULL, A.E_ND19 , v_E_Nd19)
    AND     A.E_ND20  = DECODE(v_E_Nd20 , NULL, A.E_ND20 , v_E_Nd20)
    AND     A.E_ND21  = DECODE(v_E_Nd21 , NULL, A.E_ND21 , v_E_Nd21)
    AND     A.E_ND22  = DECODE(v_E_Nd22 , NULL, A.E_ND22 , v_E_Nd22)
    AND     A.E_ND23  = DECODE(v_E_Nd23 , NULL, A.E_ND23 , v_E_Nd23)
    AND     A.E_ND24  = DECODE(v_E_Nd24 , NULL, A.E_ND24 , v_E_Nd24)
    AND     A.E_ND25  = DECODE(v_E_Nd25 , NULL, A.E_ND25 , v_E_Nd25)
    AND     A.E_ND26  = DECODE(v_E_Nd26 , NULL, A.E_ND26 , v_E_Nd26)
    AND     A.E_ND27  = DECODE(v_E_Nd27 , NULL, A.E_ND27 , v_E_Nd27)
    AND     A.E_ND28  = DECODE(v_E_Nd28 , NULL, A.E_ND28 , v_E_Nd28)
    AND     A.E_ND29  = DECODE(v_E_Nd29 , NULL, A.E_ND29 , v_E_Nd29)
    AND     A.E_ND30  = DECODE(v_E_Nd30 , NULL, A.E_ND30 , v_E_Nd30)
    AND     A.E_ND31  = DECODE(v_E_Nd31 , NULL, A.E_ND31 , v_E_Nd31)
    AND     A.E_ND32  = DECODE(v_E_Nd32 , NULL, A.E_ND32 , v_E_Nd32)
    AND     A.E_ND33  = DECODE(v_E_Nd33 , NULL, A.E_ND33 , v_E_Nd33)
    AND     A.E_ND34  = DECODE(v_E_Nd34 , NULL, A.E_ND34 , v_E_Nd34)
    AND     A.E_ND35  = DECODE(v_E_Nd35 , NULL, A.E_ND35 , v_E_Nd35)
    AND     A.E_ND36  = DECODE(v_E_Nd36 , NULL, A.E_ND36 , v_E_Nd36)
    AND     A.E_ND37  = DECODE(v_E_Nd37 , NULL, A.E_ND37 , v_E_Nd37)
    AND     A.E_ND38  = DECODE(v_E_Nd38 , NULL, A.E_ND38 , v_E_Nd38)
    AND     A.E_ND39  = DECODE(v_E_Nd39 , NULL, A.E_ND39 , v_E_Nd39)
    AND     A.E_ND40  = DECODE(v_E_Nd40 , NULL, A.E_ND40 , v_E_Nd40)
    AND     A.E_ND41  = DECODE(v_E_Nd41 , NULL, A.E_ND41 , v_E_Nd41)
    AND     A.E_ND42  = DECODE(v_E_Nd42 , NULL, A.E_ND42 , v_E_Nd42)
    AND     A.E_ND43  = DECODE(v_E_Nd43 , NULL, A.E_ND43 , v_E_Nd43)
    AND     A.E_ND44  = DECODE(v_E_Nd44 , NULL, A.E_ND44 , v_E_Nd44)
    AND     A.E_ND45  = DECODE(v_E_Nd45 , NULL, A.E_ND45 , v_E_Nd45)
    AND     A.E_ND46  = DECODE(v_E_Nd46 , NULL, A.E_ND46 , v_E_Nd46)
    AND     A.REG_ID  = DECODE(v_Reg_Id , NULL, A.REG_ID , v_Reg_Id);

  END p_sRtsd0203;

  /*****************************************************************************
  -- SAFE KEY IR ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*����                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF ��������           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[�۽�]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[�۽�]�����۽ű���ڵ�*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[�۽�]���������ڵ�    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[�۽�]�ŷ������ڵ�    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[�۽�]�۽� FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[�۽�]�ܸ��ⱸ��      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[�۽�]�����ڵ�        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[�۽�]�������ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[�۽�]������� ������ */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[�۽�]������� ���۽� */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[�۽�]NICE ���� ������*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[�۽�]NICE ���� ���۽�*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[�۽�]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[�۽�]��ȸ���ǻ����ڵ�*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[�۽�]����_���� ����  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[�۽�]�ֹι�ȣ        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[�۽�]��ȸ�����ڵ�    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[�۽�]��ȸ�� �ĺ��ڵ� */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[�۽�]���ûȽ��      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[�۽�]������ȣ        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[�۽�]�������� ���� */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[�۽�]�������� ��û */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[�۽�]������������    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[�۽�]���������ڵ�    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[����]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[����]�������ű���ڵ�*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[����]���������ڵ�    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[����]�ŷ������ڵ�    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[����]���� FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[����]�ܸ��ⱸ��      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[����]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[����]������� ������ */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[����]������� ���۽� */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[����]NICE ���� ������*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[����]NICE ���� ���۽�*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[����]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*����                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[����]����_���� ����  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[����]�ֹι�ȣ        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[����]��������        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[����]���û Ƚ��     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[����]����            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[����]������ȣ        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[����]���� �ѰǼ�     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[����]���� ����Ǽ�   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[����]���1 ��������  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[����]����ڵ�1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[����]���� ��������   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[����]���� ��������� */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[����]���� CB ���ھ*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[����]���������������*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[����]���������������*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[����]���������������*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[����]���� ��������1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[����]���� ��������2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[����]���� ��������3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[����]���� ��������4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[����]���� ��������5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[����]���� ��������6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[����]���� �ſ�����   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[����]���� �ſ���   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[����]���� �����1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[����]���� �����2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[����]���� �����3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0203 (
            SAFEKEY,
            SEQ,
            YN,
            I_ND01,
            I_ND02,
            I_ND03,
            I_ND04,
            I_ND05,
            I_ND06,
            I_ND07,
            I_ND08,
            I_ND09,
            I_ND10,
            I_ND11,
            I_ND12,
            I_ND13,
            I_ND14,
            I_ND15,
            I_ND16,
            I_ND17,
            I_ND18,
            I_ND19,
            I_ND20,
            I_ND21,
            I_ND22,
            I_ND23,
            I_ND24,
            E_ND01,
            E_ND02,
            E_ND03,
            E_ND04,
            E_ND05,
            E_ND06,
            E_ND07,
            E_ND08,
            E_ND09,
            E_ND10,
            E_ND11,
            E_ND12,
            E_ND13,
            E_ND14,
            E_ND15,
            E_ND16,
            E_ND17,
            E_ND18,
            E_ND19,
            E_ND20,
            E_ND21,
            E_ND22,
            E_ND23,
            E_ND24,
            E_ND25,
            E_ND26,
            E_ND27,
            E_ND28,
            E_ND29,
            E_ND30,
            E_ND31,
            E_ND32,
            E_ND33,
            E_ND34,
            E_ND35,
            E_ND36,
            E_ND37,
            E_ND38,
            E_ND39,
            E_ND40,
            E_ND41,
            E_ND42,
            E_ND43,
            E_ND44,
            E_ND45,
            E_ND46,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Safekey,
            v_Seq,
            v_Yn,
            v_I_Nd01,
            v_I_Nd02,
            v_I_Nd03,
            v_I_Nd04,
            v_I_Nd05,
            v_I_Nd06,
            v_I_Nd07,
            v_I_Nd08,
            v_I_Nd09,
            v_I_Nd10,
            v_I_Nd11,
            v_I_Nd12,
            v_I_Nd13,
            v_I_Nd14,
            v_I_Nd15,
            v_I_Nd16,
            v_I_Nd17,
            v_I_Nd18,
            v_I_Nd19,
            v_I_Nd20,
            v_I_Nd21,
            v_I_Nd22,
            v_I_Nd23,
            v_I_Nd24,
            v_E_Nd01,
            v_E_Nd02,
            v_E_Nd03,
            v_E_Nd04,
            v_E_Nd05,
            v_E_Nd06,
            v_E_Nd07,
            v_E_Nd08,
            v_E_Nd09,
            v_E_Nd10,
            v_E_Nd11,
            v_E_Nd12,
            v_E_Nd13,
            v_E_Nd14,
            v_E_Nd15,
            v_E_Nd16,
            v_E_Nd17,
            v_E_Nd18,
            v_E_Nd19,
            v_E_Nd20,
            v_E_Nd21,
            v_E_Nd22,
            v_E_Nd23,
            v_E_Nd24,
            v_E_Nd25,
            v_E_Nd26,
            v_E_Nd27,
            v_E_Nd28,
            v_E_Nd29,
            v_E_Nd30,
            v_E_Nd31,
            v_E_Nd32,
            v_E_Nd33,
            v_E_Nd34,
            v_E_Nd35,
            v_E_Nd36,
            v_E_Nd37,
            v_E_Nd38,
            v_E_Nd39,
            v_E_Nd40,
            v_E_Nd41,
            v_E_Nd42,
            v_E_Nd43,
            v_E_Nd44,
            v_E_Nd45,
            v_E_Nd46,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0203;

  /*****************************************************************************
  -- SAFE KEY IR ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*����                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF ��������           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[�۽�]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[�۽�]�����۽ű���ڵ�*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[�۽�]���������ڵ�    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[�۽�]�ŷ������ڵ�    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[�۽�]�۽� FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[�۽�]�ܸ��ⱸ��      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[�۽�]�����ڵ�        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[�۽�]�������ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[�۽�]������� ������ */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[�۽�]������� ���۽� */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[�۽�]NICE ���� ������*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[�۽�]NICE ���� ���۽�*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[�۽�]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[�۽�]��ȸ���ǻ����ڵ�*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[�۽�]����_���� ����  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[�۽�]�ֹι�ȣ        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[�۽�]��ȸ�����ڵ�    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[�۽�]��ȸ�� �ĺ��ڵ� */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[�۽�]���ûȽ��      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[�۽�]������ȣ        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[�۽�]�������� ���� */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[�۽�]�������� ��û */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[�۽�]������������    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[�۽�]���������ڵ�    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[����]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[����]�������ű���ڵ�*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[����]���������ڵ�    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[����]�ŷ������ڵ�    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[����]���� FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[����]�ܸ��ⱸ��      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[����]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[����]������� ������ */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[����]������� ���۽� */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[����]NICE ���� ������*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[����]NICE ���� ���۽�*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[����]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*����                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[����]����_���� ����  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[����]�ֹι�ȣ        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[����]��������        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[����]���û Ƚ��     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[����]����            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[����]������ȣ        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[����]���� �ѰǼ�     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[����]���� ����Ǽ�   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[����]���1 ��������  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[����]����ڵ�1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[����]���� ��������   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[����]���� ��������� */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[����]���� CB ���ھ*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[����]���������������*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[����]���������������*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[����]���������������*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[����]���� ��������1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[����]���� ��������2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[����]���� ��������3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[����]���� ��������4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[����]���� ��������5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[����]���� ��������6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[����]���� �ſ�����   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[����]���� �ſ���   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[����]���� �����1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[����]���� �����2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[����]���� �����3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0203
    SET    YN      = v_Yn,
           I_ND01  = v_I_Nd01,
           I_ND02  = v_I_Nd02,
           I_ND03  = v_I_Nd03,
           I_ND04  = v_I_Nd04,
           I_ND05  = v_I_Nd05,
           I_ND06  = v_I_Nd06,
           I_ND07  = v_I_Nd07,
           I_ND08  = v_I_Nd08,
           I_ND09  = v_I_Nd09,
           I_ND10  = v_I_Nd10,
           I_ND11  = v_I_Nd11,
           I_ND12  = v_I_Nd12,
           I_ND13  = v_I_Nd13,
           I_ND14  = v_I_Nd14,
           I_ND15  = v_I_Nd15,
           I_ND16  = v_I_Nd16,
           I_ND17  = v_I_Nd17,
           I_ND18  = v_I_Nd18,
           I_ND19  = v_I_Nd19,
           I_ND20  = v_I_Nd20,
           I_ND21  = v_I_Nd21,
           I_ND22  = v_I_Nd22,
           I_ND23  = v_I_Nd23,
           I_ND24  = v_I_Nd24,
           E_ND01  = v_E_Nd01,
           E_ND02  = v_E_Nd02,
           E_ND03  = v_E_Nd03,
           E_ND04  = v_E_Nd04,
           E_ND05  = v_E_Nd05,
           E_ND06  = v_E_Nd06,
           E_ND07  = v_E_Nd07,
           E_ND08  = v_E_Nd08,
           E_ND09  = v_E_Nd09,
           E_ND10  = v_E_Nd10,
           E_ND11  = v_E_Nd11,
           E_ND12  = v_E_Nd12,
           E_ND13  = v_E_Nd13,
           E_ND14  = v_E_Nd14,
           E_ND15  = v_E_Nd15,
           E_ND16  = v_E_Nd16,
           E_ND17  = v_E_Nd17,
           E_ND18  = v_E_Nd18,
           E_ND19  = v_E_Nd19,
           E_ND20  = v_E_Nd20,
           E_ND21  = v_E_Nd21,
           E_ND22  = v_E_Nd22,
           E_ND23  = v_E_Nd23,
           E_ND24  = v_E_Nd24,
           E_ND25  = v_E_Nd25,
           E_ND26  = v_E_Nd26,
           E_ND27  = v_E_Nd27,
           E_ND28  = v_E_Nd28,
           E_ND29  = v_E_Nd29,
           E_ND30  = v_E_Nd30,
           E_ND31  = v_E_Nd31,
           E_ND32  = v_E_Nd32,
           E_ND33  = v_E_Nd33,
           E_ND34  = v_E_Nd34,
           E_ND35  = v_E_Nd35,
           E_ND36  = v_E_Nd36,
           E_ND37  = v_E_Nd37,
           E_ND38  = v_E_Nd38,
           E_ND39  = v_E_Nd39,
           E_ND40  = v_E_Nd40,
           E_ND41  = v_E_Nd41,
           E_ND42  = v_E_Nd42,
           E_ND43  = v_E_Nd43,
           E_ND44  = v_E_Nd44,
           E_ND45  = v_E_Nd45,
           E_ND46  = v_E_Nd46,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  SAFEKEY = v_Safekey
    AND    SEQ     = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0203;

  /*****************************************************************************
  -- SAFE KEY IR ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0203
    WHERE  SAFEKEY = v_Safekey
    AND    SEQ     = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0203.f_DeleteRtsd0203(1)', '������ȣ', v_Safekey);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0203.f_DeleteRtsd0203(1)', '����', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0203.f_DeleteRtsd0203(1)', '����� ID', v_Reg_Id);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0203;

  /*****************************************************************************
  -- ���νſ���ȸ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0203 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN OUT RTSD0203.SEQ%TYPE,        /*����                  */
    v_Yn             IN RTSD0203.YN%TYPE,             /*IF ��������           */
    v_I_Nd01         IN RTSD0203.I_ND01%TYPE,         /*[�۽�]Transaction Code*/
    v_I_Nd02         IN RTSD0203.I_ND02%TYPE,         /*[�۽�]�����۽ű���ڵ�*/
    v_I_Nd03         IN RTSD0203.I_ND03%TYPE,         /*[�۽�]���������ڵ�    */
    v_I_Nd04         IN RTSD0203.I_ND04%TYPE,         /*[�۽�]�ŷ������ڵ�    */
    v_I_Nd05         IN RTSD0203.I_ND05%TYPE,         /*[�۽�]�۽� FLAG       */
    v_I_Nd06         IN RTSD0203.I_ND06%TYPE,         /*[�۽�]�ܸ��ⱸ��      */
    v_I_Nd07         IN RTSD0203.I_ND07%TYPE,         /*[�۽�]�����ڵ�        */
    v_I_Nd08         IN RTSD0203.I_ND08%TYPE,         /*[�۽�]�������ID      */
    v_I_Nd09         IN RTSD0203.I_ND09%TYPE,         /*[�۽�]������� ������ */
    v_I_Nd10         IN RTSD0203.I_ND10%TYPE,         /*[�۽�]������� ���۽� */
    v_I_Nd11         IN RTSD0203.I_ND11%TYPE,         /*[�۽�]NICE ���� ������*/
    v_I_Nd12         IN RTSD0203.I_ND12%TYPE,         /*[�۽�]NICE ���� ���۽�*/
    v_I_Nd13         IN RTSD0203.I_ND13%TYPE,         /*[�۽�]Primary Bitmap  */
    v_I_Nd14         IN RTSD0203.I_ND14%TYPE,         /*[�۽�]��ȸ���ǻ����ڵ�*/
    v_I_Nd15         IN RTSD0203.I_ND15%TYPE,         /*[�۽�]����_���� ����  */
    v_I_Nd16         IN RTSD0203.I_ND16%TYPE,         /*[�۽�]�ֹι�ȣ        */
    v_I_Nd17         IN RTSD0203.I_ND17%TYPE,         /*[�۽�]��ȸ�����ڵ�    */
    v_I_Nd18         IN RTSD0203.I_ND18%TYPE,         /*[�۽�]��ȸ�� �ĺ��ڵ� */
    v_I_Nd19         IN RTSD0203.I_ND19%TYPE,         /*[�۽�]���ûȽ��      */
    v_I_Nd20         IN RTSD0203.I_ND20%TYPE,         /*[�۽�]������ȣ        */
    v_I_Nd21         IN RTSD0203.I_ND21%TYPE,         /*[�۽�]�������� ���� */
    v_I_Nd22         IN RTSD0203.I_ND22%TYPE,         /*[�۽�]�������� ��û */
    v_I_Nd23         IN RTSD0203.I_ND23%TYPE,         /*[�۽�]������������    */
    v_I_Nd24         IN RTSD0203.I_ND24%TYPE,         /*[�۽�]���������ڵ�    */
    v_E_Nd01         IN RTSD0203.E_ND01%TYPE,         /*[����]Transaction Code*/
    v_E_Nd02         IN RTSD0203.E_ND02%TYPE,         /*[����]�������ű���ڵ�*/
    v_E_Nd03         IN RTSD0203.E_ND03%TYPE,         /*[����]���������ڵ�    */
    v_E_Nd04         IN RTSD0203.E_ND04%TYPE,         /*[����]�ŷ������ڵ�    */
    v_E_Nd05         IN RTSD0203.E_ND05%TYPE,         /*[����]���� FLAG       */
    v_E_Nd06         IN RTSD0203.E_ND06%TYPE,         /*[����]�ܸ��ⱸ��      */
    v_E_Nd07         IN RTSD0203.E_ND07%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd08         IN RTSD0203.E_ND08%TYPE,         /*[����]User ID         */
    v_E_Nd09         IN RTSD0203.E_ND09%TYPE,         /*[����]������� ������ */
    v_E_Nd10         IN RTSD0203.E_ND10%TYPE,         /*[����]������� ���۽� */
    v_E_Nd11         IN RTSD0203.E_ND11%TYPE,         /*[����]NICE ���� ������*/
    v_E_Nd12         IN RTSD0203.E_ND12%TYPE,         /*[����]NICE ���� ���۽�*/
    v_E_Nd13         IN RTSD0203.E_ND13%TYPE,         /*[����]Primary Bitmap  */
    v_E_Nd14         IN RTSD0203.E_ND14%TYPE,         /*����                  */
    v_E_Nd15         IN RTSD0203.E_ND15%TYPE,         /*[����]����_���� ����  */
    v_E_Nd16         IN RTSD0203.E_ND16%TYPE,         /*[����]�ֹι�ȣ        */
    v_E_Nd17         IN RTSD0203.E_ND17%TYPE,         /*[����]��������        */
    v_E_Nd18         IN RTSD0203.E_ND18%TYPE,         /*[����]���û Ƚ��     */
    v_E_Nd19         IN RTSD0203.E_ND19%TYPE,         /*[����]����            */
    v_E_Nd20         IN RTSD0203.E_ND20%TYPE,         /*[����]������ȣ        */
    v_E_Nd21         IN RTSD0203.E_ND21%TYPE,         /*[����]���� �ѰǼ�     */
    v_E_Nd22         IN RTSD0203.E_ND22%TYPE,         /*[����]���� ����Ǽ�   */
    v_E_Nd23         IN RTSD0203.E_ND23%TYPE,         /*[����]���1 ��������  */
    v_E_Nd24         IN RTSD0203.E_ND24%TYPE,         /*[����]����ڵ�1       */
    v_E_Nd25         IN RTSD0203.E_ND25%TYPE,         /*[����]���� ��������   */
    v_E_Nd26         IN RTSD0203.E_ND26%TYPE,         /*[����]���� ��������� */
    v_E_Nd27         IN RTSD0203.E_ND27%TYPE,         /*[����]���� CB ���ھ*/
    v_E_Nd28         IN RTSD0203.E_ND28%TYPE,         /*[����]���������������*/
    v_E_Nd29         IN RTSD0203.E_ND29%TYPE,         /*[����]���������������*/
    v_E_Nd30         IN RTSD0203.E_ND30%TYPE,         /*[����]���������������*/
    v_E_Nd31         IN RTSD0203.E_ND31%TYPE,         /*[����]���� ��������1  */
    v_E_Nd32         IN RTSD0203.E_ND32%TYPE,         /*[����]���� ��������2  */
    v_E_Nd33         IN RTSD0203.E_ND33%TYPE,         /*[����]���� ��������3  */
    v_E_Nd34         IN RTSD0203.E_ND34%TYPE,         /*[����]���� ��������4  */
    v_E_Nd35         IN RTSD0203.E_ND35%TYPE,         /*[����]���� ��������5  */
    v_E_Nd36         IN RTSD0203.E_ND36%TYPE,         /*[����]���� ��������6  */
    v_E_Nd37         IN RTSD0203.E_ND37%TYPE,         /*[����]���� �ſ�����   */
    v_E_Nd38         IN RTSD0203.E_ND38%TYPE,         /*[����]���� �ſ���   */
    v_E_Nd39         IN RTSD0203.E_ND39%TYPE,         /*[����]���� �����1    */
    v_E_Nd40         IN RTSD0203.E_ND40%TYPE,         /*[����]���� �����2    */
    v_E_Nd41         IN RTSD0203.E_ND41%TYPE,         /*[����]���� �����3    */
    v_E_Nd42         IN RTSD0203.E_ND42%TYPE,         /*[����]�����ڵ�        */
    v_E_Nd43         IN RTSD0203.E_ND43%TYPE,         /*Profile Code 1        */
    v_E_Nd44         IN RTSD0203.E_ND44%TYPE,         /*Profile Code 2        */
    v_E_Nd45         IN RTSD0203.E_ND45%TYPE,         /*Profile Code 3        */
    v_E_Nd46         IN RTSD0203.E_ND46%TYPE,         /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ������ȣ, ����� ID    
    IF TRIM(v_Safekey) IS NULL THEN
        v_Return_Message := '������ȣ('||v_Safekey||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN
        
        v_Seq := f_sRtsd0203Seq(v_Safekey);
        
        IF 0 != f_InsertRtsd0203(v_Safekey, v_Seq, v_Yn, v_I_Nd01, 
                                 v_I_Nd02, v_I_Nd03, v_I_Nd04, v_I_Nd05, 
                                 v_I_Nd06, v_I_Nd07, v_I_Nd08, v_I_Nd09, 
                                 v_I_Nd10, v_I_Nd11, v_I_Nd12, v_I_Nd13, 
                                 v_I_Nd14, v_I_Nd15, v_I_Nd16, v_I_Nd17, 
                                 v_I_Nd18, v_I_Nd19, v_I_Nd20, v_I_Nd21, 
                                 v_I_Nd22, v_I_Nd23, v_I_Nd24, v_E_Nd01, 
                                 v_E_Nd02, v_E_Nd03, v_E_Nd04, v_E_Nd05, 
                                 v_E_Nd06, v_E_Nd07, v_E_Nd08, v_E_Nd09, 
                                 v_E_Nd10, v_E_Nd11, v_E_Nd12, v_E_Nd13, 
                                 v_E_Nd14, v_E_Nd15, v_E_Nd16, v_E_Nd17, 
                                 v_E_Nd18, v_E_Nd19, v_E_Nd20, v_E_Nd21, 
                                 v_E_Nd22, v_E_Nd23, v_E_Nd24, v_E_Nd25, 
                                 v_E_Nd26, v_E_Nd27, v_E_Nd28, v_E_Nd29, 
                                 v_E_Nd30, v_E_Nd31, v_E_Nd32, v_E_Nd33, 
                                 v_E_Nd34, v_E_Nd35, v_E_Nd36, v_E_Nd37, 
                                 v_E_Nd38, v_E_Nd39, v_E_Nd40, v_E_Nd41, 
                                 v_E_Nd42, v_E_Nd43, v_E_Nd44, v_E_Nd45, 
                                 v_E_Nd46, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���νſ���ȸ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0203Count(v_Safekey, v_Seq) THEN
            v_Return_Message := '��ϵ� �����Ͱ� �������� �������� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0203(v_Safekey, v_Seq, v_Yn, v_I_Nd01, 
                                     v_I_Nd02, v_I_Nd03, v_I_Nd04, v_I_Nd05, 
                                     v_I_Nd06, v_I_Nd07, v_I_Nd08, v_I_Nd09, 
                                     v_I_Nd10, v_I_Nd11, v_I_Nd12, v_I_Nd13, 
                                     v_I_Nd14, v_I_Nd15, v_I_Nd16, v_I_Nd17, 
                                     v_I_Nd18, v_I_Nd19, v_I_Nd20, v_I_Nd21, 
                                     v_I_Nd22, v_I_Nd23, v_I_Nd24, v_E_Nd01, 
                                     v_E_Nd02, v_E_Nd03, v_E_Nd04, v_E_Nd05, 
                                     v_E_Nd06, v_E_Nd07, v_E_Nd08, v_E_Nd09, 
                                     v_E_Nd10, v_E_Nd11, v_E_Nd12, v_E_Nd13, 
                                     v_E_Nd14, v_E_Nd15, v_E_Nd16, v_E_Nd17, 
                                     v_E_Nd18, v_E_Nd19, v_E_Nd20, v_E_Nd21, 
                                     v_E_Nd22, v_E_Nd23, v_E_Nd24, v_E_Nd25, 
                                     v_E_Nd26, v_E_Nd27, v_E_Nd28, v_E_Nd29, 
                                     v_E_Nd30, v_E_Nd31, v_E_Nd32, v_E_Nd33, 
                                     v_E_Nd34, v_E_Nd35, v_E_Nd36, v_E_Nd37, 
                                     v_E_Nd38, v_E_Nd39, v_E_Nd40, v_E_Nd41, 
                                     v_E_Nd42, v_E_Nd43, v_E_Nd44, v_E_Nd45, 
                                     v_E_Nd46, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���νſ���ȸ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0203(v_Safekey, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���νſ���ȸ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0203.p_IUDRtsd0203(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0203.p_IUDRtsd0203(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0203;

  /*****************************************************************************
  -- SAFE KEY IR ���� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0203Seq(
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE           /*������ȣ            */
    ) RETURN NUMBER IS
    v_Seq   RTSD0203.SEQ%TYPE DEFAULT NULL;             /*����                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0203
                 WHERE   SAFEKEY = v_Safekey)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;
    
    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0203Seq;
  
END Pkg_Rtsd0203;
/
