CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0203 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0203
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
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY IR ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0203 (
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE,        /*������ȣ              */
    v_Seq            IN RTSD0203.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );


  /*****************************************************************************
  -- SAFE KEY IR ���� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0203Seq(
    v_Safekey        IN RTSD0203.SAFEKEY%TYPE           /*������ȣ            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0203;
/
