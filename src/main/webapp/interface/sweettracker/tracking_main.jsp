<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<title>택배 배송현황 조회</title>
</head>
<body>
	<form name="frm" action="http://info.sweettracker.co.kr/tracking/5" method="post">
            <div class="form-group">
              <input type="hidden" class="form-control" id="t_key" name="t_key" value="<spring:eval expression="@property['smartbox.interface.key']"/>">
            </div>
            <div class="my-3">
              <label for="t_code" class="mb-3">택배사 선택</label>
              <select title="택배사 선택" class="form-select" name="t_code" id="t_code"> 
              		<option selected="" disabled="">택배사 선택</option> 
              		<option value="04" data-name="CJ대한통운">CJ대한통운</option> 
              		<option value="01" data-name="우체국택배">우체국택배</option> 
              		<option value="05" data-name="한진택배">한진택배</option> 
              		<option value="08" data-name="롯데택배">롯데택배</option> 
              		<option value="06" data-name="로젠택배">로젠택배</option> 
              		<option value="54" data-name="홈픽">홈픽</option> 
              		<option value="24" data-name="CVSnet 편의점택배(GS25)">CVSnet 편의점택배(GS25)</option> 
              		<option value="46" data-name="CU 편의점택배">CU 편의점택배</option> 
              		<option value="23" data-name="경동택배">경동택배</option> 
              		<option value="22" data-name="대신택배">대신택배</option> 
              		<option value="11" data-name="일양로지스">일양로지스</option> 
              		<option value="32" data-name="합동택배">합동택배</option> 
              		<option value="18" data-name="건영택배">건영택배</option> 
              		<option value="17" data-name="천일택배">천일택배</option> 
              		<option value="20" data-name="한덱스">한덱스</option> 
              		<option value="16" data-name="한의사랑택배">한의사랑택배</option> 
              		<option value="12" data-name="EMS">EMS</option> 
              		<option value="25" data-name="TNT Express">TNT Express</option> 
              		<option value="14" data-name="UPS">UPS</option> 
              		<option value="21" data-name="Fedex">Fedex</option> 
              		<option value="26" data-name="USPS">USPS</option> 
              		<option value="34" data-name="i-Parcel">i-Parcel</option> 
              		<option value="33" data-name="DHL Global Mail">DHL Global Mail</option> 
              		<option value="37" data-name="LX판토스">LX판토스</option> 
              		<option value="28" data-name="GSMNtoN">GSMNtoN</option> 
              		<option value="38" data-name="ECMS Express">ECMS Express</option> 
              		<option value="30" data-name="KGL네트웍스">KGL네트웍스</option> 
              		<option value="40" data-name="굿투럭">굿투럭</option> 
              		<option value="45" data-name="우리택배(구호남택배)">우리택배(구호남택배)</option> 
              		<option value="41" data-name="GSI Express">GSI Express</option> 
              		<option value="44" data-name="SLX택배">SLX택배</option> 
              		<option value="47" data-name="우리한방택배">우리한방택배</option> 
              		<option value="52" data-name="세방">세방</option> 
              		<option value="57" data-name="Cway Express">Cway Express</option> 
              		<option value="60" data-name="YJS글로벌(영국)">YJS글로벌(영국)</option> 
              		<option value="51" data-name="성원글로벌카고">성원글로벌카고</option> 
              		<option value="62" data-name="홈이노베이션로지스">홈이노베이션로지스</option> 
              		<option value="63" data-name="은하쉬핑">은하쉬핑</option> 
              		<option value="66" data-name="Giant Network Group">Giant Network Group</option> 
              		<option value="64" data-name="FLF퍼레버택배">FLF퍼레버택배</option> 
              		<option value="53" data-name="농협택배">농협택배</option> 
              		<option value="65" data-name="YJS글로벌(월드)">YJS글로벌(월드)</option> 
              		<option value="67" data-name="디디로지스">디디로지스</option> 
              		<option value="69" data-name="대림통운">대림통운</option> 
              		<option value="70" data-name="LOTOS CORPORATION">LOTOS CORPORATION</option> 
              		<option value="43" data-name="애니트랙">애니트랙</option> 
              		<option value="72" data-name="성훈물류">성훈물류</option> 
              		<option value="71" data-name="IK물류">IK물류</option> 
              		<option value="79" data-name="로지스밸리택배">로지스밸리택배</option> 
              		<option value="81" data-name="제니엘시스템">제니엘시스템</option> 
              		<option value="84" data-name="스마트로지스">스마트로지스</option> 
              		<option value="87" data-name="이투마스(ETOMARS)">이투마스(ETOMARS)</option> 
              		<option value="85" data-name="풀앳홈">풀앳홈</option> 
              		<option value="82" data-name="프레시솔루션">프레시솔루션</option> 
              		<option value="88" data-name="큐런택배">큐런택배</option> 
              		<option value="89" data-name="두발히어로">두발히어로</option> 
              		<option value="91" data-name="하이브시티">하이브시티</option> 
              		<option value="94" data-name="오늘의픽업">오늘의픽업</option> 
              		<option value="93" data-name="팬스타국제특송(PIEX)">팬스타국제특송(PIEX)</option> 
              		<option value="92" data-name="지니고 당일배송">지니고 당일배송</option> 
              		<option value="96" data-name="로지스밸리">로지스밸리</option> 
              		<option value="99" data-name="롯데국제특송">롯데국제특송</option> 
              		<option value="100" data-name="나은물류">나은물류</option> 
              		<option value="101" data-name="한샘서비스원 택배">한샘서비스원 택배</option> 
              		<option value="102" data-name="배송하기좋은날 (SHIPNERGY)">배송하기좋은날 (SHIPNERGY)</option> 
              		<option value="103" data-name="NDEX KOREA">NDEX KOREA</option> 
              		<option value="104" data-name="도도플렉스(dodoflex)">도도플렉스(dodoflex)</option> 
              		<option value="105" data-name="브릿지로지스㈜">브릿지로지스㈜</option> 
              		<option value="106" data-name="허브넷로지스틱스">허브넷로지스틱스</option> 
              		<option value="108" data-name="MEXGLOBAL">MEXGLOBAL</option> 
              		<option value="49" data-name="A.C.E EXPRESS INC">A.C.E EXPRESS INC</option> 
              		<option value="113" data-name="썬더히어로">썬더히어로</option> 
              		<option value="112" data-name="1004홈">1004홈</option> 
              		<option value="114" data-name="㈜캐나다쉬핑">㈜캐나다쉬핑</option> 
              		<option value="110" data-name="부릉">부릉</option> 
              		<option value="117" data-name="YUNDA EXPRESS">YUNDA EXPRESS</option> 
              		<option value="120" data-name="발렉스 특수물류">발렉스 특수물류</option> 
              		<option value="109" data-name="파테크해운항공">파테크해운항공</option> 
              		<option value="119" data-name="핑퐁">핑퐁</option> 
              		<option value="121" data-name="바바바(bababa)">바바바(bababa)</option> 
              		<option value="122" data-name="BAIMA EXPRESS">BAIMA EXPRESS</option> 
              		<option value="123" data-name="엔티엘피스">엔티엘피스</option> 
              		<option value="124" data-name="LTL">LTL</option> 
              		<option value="125" data-name="GTS 로지스">GTS 로지스</option> 
              		<option value="126" data-name="㈜올타코리아">㈜올타코리아</option> 
              		<option value="128" data-name="판월드로지스틱㈜">판월드로지스틱㈜</option> 
              		<option value="95" data-name="큐익스프레스">큐익스프레스</option> 
              		<option value="130" data-name="UFO로지스">UFO로지스</option> 
              		<option value="131" data-name="딜리래빗">딜리래빗</option> 
              		<option value="132" data-name="지오피">지오피</option> 
              		<option value="134" data-name="에이치케이홀딩스">에이치케이홀딩스</option> 
              		<option value="135" data-name="HTNS">HTNS</option> 
              		<option value="13" data-name="DHL">DHL</option> 
              		<option value="138" data-name="라스트마일">라스트마일</option> 
              		<option value="139" data-name="오늘회 러쉬">오늘회 러쉬</option> 
              		<option value="141" data-name="인터로지스">인터로지스</option> 
              		<option value="142" data-name="탱고앤고">탱고앤고</option> 
              		<option value="140" data-name="직구문">직구문</option> 
              		<option value="143" data-name="투데이">투데이</option> 
              	</select>
            </div>
            <div class="my-3">
              <label for="t_invoice" class="mb-3">운송장 번호</label>
              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
            </div>
            <div class="my-3">
            	<button type="submit" class="w-100 btn btn-primary btn-lg">조회하기</button>
            </div>
        </form>
        
</body>
</html>
