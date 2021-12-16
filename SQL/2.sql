/*
INTCAP(앞글자 대문자), UPPER(대문자로), LOWER(소문자로) 함수는 한글에서 작동 안됨.
BUT 오류는 없음
*/
SELECT UPPER('홍길동')
FROM DUAL

/*
SUBSTR()로 원하는 부분 문구 추출
*/
SELECT SUBSTR('Is This the real life? Is this just fantasy?', -8) AS RESULT
FROM DUAL

/*
INSTR()로 특정 문구가 시작되는 지점으로 위치를 지정하여 추출
*/
SELECT SUBSTR('Is This the real life? Is this just fantasy?',
    INSTR('Is This the real life? Is this just fantasy?','fan')) AS RESULT
FROM DUAL

/*
익월 1일 날짜 반환 (LAST_DAY(): 그 달의 마지막 날 추출)
*/
SELECT TRUNC(LAST_DAY(SYSDATE) + 1, 'DD') AS ANSWER
FROM DUAL

/*
MONTHS_BETWEEN()을 통해 특정 2개의 날의 개월 수 차이를 추출
*/
SELECT A.*, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTHS
FROM EMPLOYEES A
WHERE EMPLOYEE_ID <= 110 

/*
REPLACE() 함수로 전화번호 형식 바꾸기
*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, REPLACE(PHONE_NUMBER,'.','-') PHONE
FROM EMPLOYEES

/*
'번지_주소' 형식으로 되어있는 주소 컬럼에서 번지를 제외한 주소만 가져오기
-> 첫번째 띄어쓰기로 분리되어 있는 것을 이용
*/
SELECT SUBSTR(STREET_ADDRESS, INSTR(STREET_ADDRESS, ' ')+1)
FROM LOCATIONS
WHERE LOCATION_ID <= 2400

/*
기준된 날짜의 해당 월 마지막 날 요일구하기
*/
SELECT TO_CHAR(LAST_DAY(TO_DATE('2023-08-20')), 'DAY') AS DAY
FROM DUAL

/*
NULL 값 없애기
1. CASE WHEN 으로 조건 달기
2. NVL(A, B) 함수 
    - NULL이 아니면 A, NULL이면 B
3. DECODE(A,B,C,D,E,F....) 함수
    - A가 B이면 C, D이면 E, 아무것도 아니면 F (조건을 더 추가 가능)
*/

/*
NVL() 함수를 이용하여 NULL값일 때와 아닐 때를 구분하여 값 넣기
*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT
    , SALARY + NVL(SALARY * COMMISSION_PCT, 0) AS REAL_SALARY
FROM EMPLOYEES

/*
DECODE() 함수를 이용하여 특정 값일 때 반환해주는 값 설정
*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT
    , DECODE(COMMISSION_PCT, NULL, SALARY, SALARY + SALARY* COMMISSION_PCT) AS REAL_SALARY
FROM EMPLOYEES

/*
현재 일자 기준 1년 후의 날짜 조회
TO_CHAR(, 'DL') 이면 연월일과 요일까지 출력
*/
SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 12), 'DL') AS DAY
FROM DUAL


/*
현재 일자 기준 3년 후의 날짜 조회
*/
SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 36), 'DL') AS DAY
FROM DUAL

/*
특정일과 특정일의 차이 계산
TO_DATE()형태에서 빼기 연산으로 차이 계산
*/
SELECT TO_DATE('2021-10-31', 'YYYY-MM-DD') - TO_DATE('0001-01-01', 'YYYY-MM-DD')
FROM DUAL
