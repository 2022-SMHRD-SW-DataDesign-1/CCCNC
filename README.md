<div align="center">
  👋효율적인 전기차 충전시설 위치선정을 위한

![image](https://user-images.githubusercontent.com/80088459/203006239-0f6ddc54-8d5b-4a0c-8cd6-2588694475ff.png)
<br>
_Cookie cookie new Cookie_
</div>

### ⚡ 서비스소개
---
* 서비스명 : 전기차 충전소 통계 자료를 기반으로 kakao Map api를 활용한 
데이터 시각화 위치 선정 플랫폼 
위치 선정 플랫폼
* 서비스설명 :전기차 대수에 비해서 전기차 충전소가 너무 적어 충전소가 많은 곳에 밀집화가 진행되고 충전소 부족 현상을 겪고 있는 상황에서 밀집화를 완화시켜주고 정부에서 밀고 있는 경제규제혁신 방안을 이용하여 민간 투자자들이 많아질 전망을 통해서 개인사업자, 중소 기업에게 효율적인 충전소 설치 위치를 제공하는 플랫폼
<br>

### 🗓 프로젝트기간
---
- 2022.10.04.(TUE) ~ 2022.11.16.(WED)   [44 Days]

![image](https://user-images.githubusercontent.com/80088459/203275593-c6ddbed7-4cca-414b-95a3-274ec6f14307.png)

- <2022.10.06 ~ 2022.10.11>
 기존 웹페이지 분석
- <2022.10.12 ~ 2022.10.14>
 기능 및 테이블 정의
- <2022.10.17 ~ 2022.10.21>
 시스템 아키텍처 설계
- <2022.10.20 ~ 2022.10.23>
 서비스 흐름도 설계
- <2022.10.24 ~ 2022.10.26>
 DB연결,테이블 생성
- <2022.10.27 ~ 2022.11.11>
 기능 구현
- <2022.11.01 ~ 2022.11.13>
 CSS 구현
- <2022.11.12 ~ 2022.10.15>
 테스트 및 트러블슈팅


<br>

### ⚙ 주요기능
---

<h3>
MainPage
</h3>
<br>

![image](https://user-images.githubusercontent.com/80088459/203279851-4ff19c7c-5a28-433b-9206-04b06b89dcef.png)

1. 각 도시의 충전기 포화도 맵
- 지역별 산출된 지역에 등록된 차량대비 해당지역의 충전기 수량의 포화도를 표현.
- 수치는 1을 초과하면 포화상태 0에 가까우면 충전기에 비해 차량이 너무 많음을 나타냄
- 각 도시의 상황을 포화, 비교적 안정, 불포화로 나누어 각 빨간색 초록색 파란색 마커로 표현
- 각 해당 마커를 클릭시 경향페이지 이동 맵 확대. 확대되어지는 부분은 마커에 해당하는 지역

2. 경향페이지 이동 맵
- 각 광역시,도지역마다 Circle을 표시함.
- 해당 Circle을 클릭할 경우 충전량에 대한 경향비교 페이지로 이동함.

3. 각 도시의 전기차 등록대수 및 일일 이용가능 대수 바 그래프
- 충전기 포화도 맵에서 클릭한 마커의 도시에 따라 하루에 이용가능한 차량수 및 해당 도시에 등록된 차량 수 확인가능

4. 각 지역별 차량등록대수 랭킹
- 각 지역별 등록된 전기차 차량수를 순위별로 도표화

5. 각 지역별 포화도 및 위도,경도 표
- 포화도 수치 및 위도경도 데이터를 도표화

6. 각 지역별 급속/완속 충전기 개수 그래프
- 각 지역의 충전기 구분별 충전기 개수 시각화

7. 각 지역별 충전소의 급속/완속 충전기 평균개수
- 충전소 마다 가지고 있는 충전기의 평균개수를 지역별로 시각화

<h3>
충전량에 대한 경향비교 Page
</h3>
<br>

![image](https://user-images.githubusercontent.com/80088459/203283220-00f8fd62-f42a-494e-a6de-f9ce2df1f87d.png)

1. 선택도시의 지도
- MainPage의 '경향페이지 이동 맵'에서 Circle 클릭한 도시의 확대 지도
- 해당 지역에 있는 충전소를 마커로 표시. 호버링시 해당 충전소의 이름 표기

2. 전체 도시의 평균 충전량 및 선택 지역별 급속/완속 충전기의 평균 충전량 그래프
- 선택된 도시의 1주부터 12주 동안의 평균충전량을 시각화. 평균은 해당 도시에 속한 시군구 단위의 충전량을 평균화함.
- 해당 그래프 위에 전국 도시의 평균 충전량을 계단그래프로 같이 표기. 전체 도시의 평균과 비교하기 편하게 함.

3. 전국 대비 선택지역별 충전량에 대한 비율 게이지 그래프
- %로 표기하여 전체 도시 중 해당 도시가 몇%의 충전량을 가지는지 시각화

4. 도시선택탭
- 중앙에 있는 도시선택탭을 클릭하여 타 도시의 데이터와 비교할 수 있게함.

<h3>
회원가입 및 로그인 페이지
</h3>
<br>

![image](https://user-images.githubusercontent.com/80088459/203287205-3ef1ca42-b4e5-4d9a-9182-7985377463f1.png)

1.회원가입 및 로그인
- 사용자는 사업자등록번호를 이용해 회원가입 가능
- 비밀번호 재확인기능 추가
- 사용자는 로그인을 할 경우 마이페이지 이용가능

<h3>
마이페이지
</h3>
<br>

![image](https://user-images.githubusercontent.com/80088459/203288199-9d46b847-18a4-4b06-97aa-e1d2711b0411.png)

1. 내정보
- 등록된 사업자 등록번호 및 사업자등록증을 확인할 수 있음.
- My충전소에서 등록한 충전소 위치정보를확인 할 수 있음.

2. My충전소
- 맵에 마커를 찍어 사용자의 충전소 위치를 등록 할 수 있음.

3. 개인정보수정
- 사업자등록증을 수정 할 수 있음.
- 비밀번호를 수정 할 수 있음.


<br>

### 🛠 **5.Tech Stack**
---

**Data & Server**
<img src="https://img.shields.io/badge/Apache Tomcat 9.0-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>  <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/> 

 **IDE**
<img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=Jupyter&logoColor=white"/> <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/> <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>


**Back-End**
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/> 

**Front-End**
<img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 

**Library & Api**
<img src="https://img.shields.io/badge/Kakao Map Api-FFCD00?style=for-the-badge&logo=KaKao Map Api&logoColor=white"> <img src="https://img.shields.io/badge/Chart.js-FF6384?style=for-the-badge&logo=Chart.js&logoColor=white"> 

**협업도구**
<img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=Slack&logoColor=white"> <img src="https://img.shields.io/badge/Microsoft Excel-217346?style=for-the-badge&logo=Microsoft Excel&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white">
<br>

### 🧱 시스템 아키텍처
---

<img src="https://user-images.githubusercontent.com/112475774/203485093-639adb4f-bdeb-4c57-bc26-7183b079e107.png">



<br>

### 🙋‍♂️ 유스케이스
---

<img src="https://user-images.githubusercontent.com/112475774/203482095-d5c38aa0-4b26-4876-8783-0de911ad00a5.png">

<br>

### 🔎 서비스 흐름도
---



![쿠쿠뉴쿠_서비스흐름도](https://user-images.githubusercontent.com/112459519/202892822-9bd5ecd9-7f99-4ddd-a5ed-8ff4980d7c3f.png)

</div>

- **메뉴구성**



![쿠쿠뉴쿠메뉴구성](https://user-images.githubusercontent.com/112459519/202892838-678e275a-d8dd-4b91-9a4c-88eec9919264.png)

</div>

<br>

### 🗃 er다이어그램
---
![image](https://user-images.githubusercontent.com/80088459/203277485-0e90496b-4fcd-4afb-8a02-c16518b7da5a.png)
<br>

### 🖥 화면구성
---
- 메인페이지 
![메인 1](https://user-images.githubusercontent.com/112475774/203485736-15263cf6-154d-4b0c-b233-943f2fa6c7ea.png)
![메인2](https://user-images.githubusercontent.com/112475774/203485768-75079de8-7aed-4da9-bf58-79f96f26eaae.png)
 
- **시도별페이지 화면**

![시도별페이지](https://user-images.githubusercontent.com/112459519/202892902-ca44722c-aa1a-4328-b093-4fafc5c367b1.PNG)

- **로그인 화면**

![로그인화면](https://user-images.githubusercontent.com/112459519/202892937-304a4152-363e-4d85-96ff-6477d10a6052.PNG)

- **회원가입 화면**

![회원가입페이지](https://user-images.githubusercontent.com/112459519/202892954-17b25d63-1e68-4a3d-bb3c-f0952982ab75.png)

- **내정보 화면**

![내정보 페이지](https://user-images.githubusercontent.com/112459519/202892966-8b8a595b-bb5f-41c5-ab49-294c085aec42.PNG)

- **충전소 위치 등록 화면**

![충전소 위치 등록](https://user-images.githubusercontent.com/112459519/202893012-099bc059-c723-4aa6-94ba-c7f6bfed1b7d.PNG)

- **내정보수정 화면**

![내정보수정페이지](https://user-images.githubusercontent.com/112459519/202893027-2b06038f-21a2-4c1d-a143-023be457bdc6.PNG)

<br>

### 👨‍👨‍👧‍👧 팀원역할
---
![활용방안](https://user-images.githubusercontent.com/112379360/203272096-f42ac432-13c7-4816-ac43-9376e4760f1f.PNG)
<table align="center">
  <tr align="center">
    <td>송승호</td>
    <td>이성재</td>
    <td>박민지</td>
    <td>주하영</td>
  </tr>
  <tr align="center">
    <td>PM</td>
    <td>Back-end</td>
    <td>Front</td>
    <td>Fullstack</td>
  </tr>
  <tr>
    <td>차트 데이터 정제<br> 카카오 맵 api 이벤트 구성<br>  총괄</td>
    <td>마이페이지 기능 구성<br> 차트 데이터 시각화<br> 카카오 맵 api 클러스터 기능 구성</td>
    <td>UI/UX 구성<br> chart js 라이브러리 구축<br> css 구현</td>
    <td>페이지 css 구성<br> 레이아웃 구성<br> 회원기능 구현</td>
  </tr>
</table>

### 🧨 트러블슈팅
---

![image](https://user-images.githubusercontent.com/80088459/203289475-571f3ba6-fc63-4af4-924b-2888fcafd573.png)

1. 충전량경향페이지 이동 속도 이슈
- 지도의 지역Circle을 클릭하고 페이지 이동하는데 8초를 넘는 시간이 걸리는 문제발생.
- System.current.TimeMillis() 함수를 이용해 속도저하가 가장 큰 코드 탐색
- 지도 마커 데이터를 담아주는 DAO객체가 속도저하의 원인임을 발견
- 해당 DAO는 4000개의 충전소 데이터가 넘어오는데 사용자는 특정 지역의 마커만 활용하면 되는 상황이였음.
- 선택된 지역마다 데이터 전송에 제한을 주어 해당 속도이슈 해결
- 결과적으로 974ms의 속도를 얻어 낼 수 있게됨

![image](https://user-images.githubusercontent.com/80088459/203290551-c832af6f-db7f-4be9-81db-78f337f28d7e.png)

2. Polygon 형태의 지역 클릭 이벤트 추가 시 속도 이슈
- polygon 형태의 지역선택개체를 만들기 위해 위도경도 point 데이터를 QGIS를 이용해 생성하려함.
- geojson파일이 생성되었으나 데이터 컨트롤의 미흡으로 전체 데이터 시각화 실패.
- 해당 데이터에 polygon type뿐 아닌 MultiPolygon 타입의 데이터도 다수 있었음.
- for문을 이용 전체 데이터를 가져오니 속도저하 발생.
- 프로젝트 기간을 고려해 Circle개체를 이용하기로 판단 및 해당 부분 대체
