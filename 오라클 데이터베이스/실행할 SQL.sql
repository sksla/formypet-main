-----------------해당 계정 내에 존재하는 DB 객체들 삭제하는 PLSQL문------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
------------------------------------------------------------------






--------------------------------------------------------
--  파일이 생성됨 - 목요일-3월-28-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ANO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ANO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 344 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 51 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_DNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 226 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ENO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 13 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 29 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MAC
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MAC"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ODNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ODNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1045 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 586 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PAY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PAY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PKG_NO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PKG_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 291 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_QNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RVNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RVNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_UNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 60 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_WNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_WNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 639 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ATTACHMENT
--------------------------------------------------------

  CREATE TABLE "ATTACHMENT" 
   (	"FILE_NO" NUMBER, 
	"REF_BNO" NUMBER, 
	"REF_TYPE" CHAR(1 BYTE), 
	"ORIGIN_NAME" VARCHAR2(100 BYTE), 
	"CHANGE_NAME" VARCHAR2(300 BYTE), 
	"FILE_PATH" VARCHAR2(500 BYTE), 
	"UPLOAD_DATE" DATE DEFAULT SYSDATE, 
	"FILE_LEVEL" NUMBER, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "ATTACHMENT"."REF_TYPE" IS '(B|P|R|Q|E) 포토,상품,리뷰,문의,이벤트';
   COMMENT ON COLUMN "ATTACHMENT"."FILE_LEVEL" IS '1(썸네일)|2(상세)';
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BOARD_NO" NUMBER, 
	"BOARD_WRITER" NUMBER, 
	"BOARD_TYPE" NUMBER, 
	"BOARD_TITLE" VARCHAR2(200 BYTE), 
	"BOARD_CONTENT" VARCHAR2(4000 BYTE), 
	"READ_COUNT" NUMBER DEFAULT 0, 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '회원번호';
   COMMENT ON COLUMN "BOARD"."BOARD_TYPE" IS '1(자유) | 2(포토)';
   COMMENT ON COLUMN "BOARD"."STATUS" IS '(Y,N)';
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "CART" 
   (	"CART_NO" NUMBER, 
	"CART_USER" NUMBER, 
	"CART_PRO" NUMBER, 
	"CART_COUNT" NUMBER DEFAULT 1, 
	"CART_DATE" DATE DEFAULT SYSDATE, 
	"CART_PRICE" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "CART"."CART_USER" IS '회원번호';
--------------------------------------------------------
--  DDL for Table DELIVERY
--------------------------------------------------------

  CREATE TABLE "DELIVERY" 
   (	"DELIVERY_NO" NUMBER, 
	"DELIVERY_USER_NO" NUMBER, 
	"DELIVERY_NAME" VARCHAR2(50 BYTE), 
	"DELIVERY_RECEIVER" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(13 BYTE), 
	"POST" VARCHAR2(7 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"ADDRESS_DETAIL" VARCHAR2(100 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE)
   ) ;

   COMMENT ON COLUMN "DELIVERY"."DELIVERY_USER_NO" IS '회원번호';
   COMMENT ON COLUMN "DELIVERY"."STATUS" IS '기본배송지 여부 Y | N';
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "EVENT" 
   (	"EVENT_NO" NUMBER, 
	"EVENT_TITLE" VARCHAR2(200 BYTE), 
	"START_DATE" DATE DEFAULT SYSDATE, 
	"END_DATE" DATE DEFAULT SYSDATE, 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"EVENT_SHOW" CHAR(1 BYTE) DEFAULT 'Y', 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "EVENT"."EVENT_SHOW" IS '(Y|N)';
   COMMENT ON COLUMN "EVENT"."STATUS" IS '(Y,N)';
--------------------------------------------------------
--  DDL for Table EVENT_PRODUCT
--------------------------------------------------------

  CREATE TABLE "EVENT_PRODUCT" 
   (	"EVENT_NO" NUMBER, 
	"PRO_NO" NUMBER, 
	"DISCOUNT" NUMBER
   ) ;

   COMMENT ON COLUMN "EVENT_PRODUCT"."DISCOUNT" IS '각 이벤트 상품에 대한 할인율';
--------------------------------------------------------
--  DDL for Table FAQ
--------------------------------------------------------

  CREATE TABLE "FAQ" 
   (	"FAQ_NO" NUMBER, 
	"FAQ_TITLE" VARCHAR2(200 BYTE), 
	"FAQ_CONTENT" VARCHAR2(4000 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "FAQ"."FAQ_NO" IS 'HIDDEN';
   COMMENT ON COLUMN "FAQ"."STATUS" IS '(Y|N)';
--------------------------------------------------------
--  DDL for Table MACRO
--------------------------------------------------------

  CREATE TABLE "MACRO" 
   (	"MACRO_NO" NUMBER, 
	"MACRO_CONTENT" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(15 BYTE), 
	"USER_PWD" VARCHAR2(30 BYTE), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"USER_BIRTH" VARCHAR2(20 BYTE), 
	"GENDER" CHAR(1 BYTE) DEFAULT 'M', 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(13 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"ADDRESS_DETAIL" VARCHAR2(100 BYTE), 
	"ADDRESS_POST" VARCHAR2(7 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"STATUS_SNS" NUMBER DEFAULT 0, 
	"STATUS_EMAIL" NUMBER DEFAULT 0, 
	"RESIGN_DATE" DATE, 
	"PET_TYPE" CHAR(1 BYTE) DEFAULT 'N', 
	"PET_NAME" VARCHAR2(50 BYTE), 
	"PET_KIND" VARCHAR2(50 BYTE), 
	"PET_AGE" NUMBER, 
	"PET_GENDER" CHAR(1 BYTE)
   ) ;

   COMMENT ON COLUMN "MEMBER"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "MEMBER"."USER_ID" IS '회원아이디';
   COMMENT ON COLUMN "MEMBER"."USER_PWD" IS '회원비밀번호';
   COMMENT ON COLUMN "MEMBER"."USER_NAME" IS '회원이름';
   COMMENT ON COLUMN "MEMBER"."USER_BIRTH" IS '회원생년월일';
   COMMENT ON COLUMN "MEMBER"."GENDER" IS '성별(M|F)';
   COMMENT ON COLUMN "MEMBER"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "MEMBER"."PHONE" IS '전화번호';
   COMMENT ON COLUMN "MEMBER"."ADDRESS" IS '주소';
   COMMENT ON COLUMN "MEMBER"."ADDRESS_DETAIL" IS '상세주소';
   COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원가입일';
   COMMENT ON COLUMN "MEMBER"."MODIFY_DATE" IS '회원정보변경일';
   COMMENT ON COLUMN "MEMBER"."STATUS" IS '회원상태(Y|N|A)';
   COMMENT ON COLUMN "MEMBER"."STATUS_SNS" IS 'SNS수신(0|1)';
   COMMENT ON COLUMN "MEMBER"."STATUS_EMAIL" IS 'EMAIL수신(0|1)';
   COMMENT ON COLUMN "MEMBER"."RESIGN_DATE" IS '회원탈퇴일';
   COMMENT ON COLUMN "MEMBER"."PET_TYPE" IS '(N|D|C)';
   COMMENT ON COLUMN "MEMBER"."PET_GENDER" IS '(M|F)';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NOTICE" 
   (	"NOTICE_NO" NUMBER, 
	"NOTICE_WRITER" NUMBER, 
	"NOTICE_TITLE" VARCHAR2(200 BYTE), 
	"NOTICE_CONTENT" VARCHAR2(4000 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "NOTICE"."NOTICE_WRITER" IS '회원번호';
   COMMENT ON COLUMN "NOTICE"."STATUS" IS '(Y,N)';
--------------------------------------------------------
--  DDL for Table ORDER_DETAIL
--------------------------------------------------------

  CREATE TABLE "ORDER_DETAIL" 
   (	"OD_DETAIL_NO" NUMBER, 
	"ORDER_NO" NUMBER, 
	"PRO_NO" NUMBER, 
	"COUNT" NUMBER, 
	"PRICE" NUMBER, 
	"REFUND" CHAR(1 BYTE) DEFAULT 'Y', 
	"DELI_STATUS" NUMBER DEFAULT 1, 
	"PACKAGE_NO" NUMBER, 
	"TRACKING_NO" NUMBER, 
	"STATUS" NUMBER DEFAULT 1
   ) ;

   COMMENT ON COLUMN "ORDER_DETAIL"."REFUND" IS '(Y|N)';
   COMMENT ON COLUMN "ORDER_DETAIL"."DELI_STATUS" IS '1(배송준비)|2(배송중)|3(배송완료)';
   COMMENT ON COLUMN "ORDER_DETAIL"."STATUS" IS '1(주문)|2(취소)|3(교환)|4(반품)';
--------------------------------------------------------
--  DDL for Table PACKAGE
--------------------------------------------------------

  CREATE TABLE "PACKAGE" 
   (	"PACKAGE_NO" NUMBER, 
	"PACKAGE_NAME" VARCHAR2(50 BYTE), 
	"PACKAGE_CODE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table POINT
--------------------------------------------------------

  CREATE TABLE "POINT" 
   (	"USER_NO" NUMBER, 
	"ORDER_NO" NUMBER, 
	"POINT_DATE" DATE DEFAULT SYSDATE, 
	"POINT_ADD_LIST" NUMBER DEFAULT 0, 
	"POINT_USE_LIST" NUMBER DEFAULT 0, 
	"POINT_REASON" NUMBER
   ) ;

   COMMENT ON COLUMN "POINT"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "POINT"."POINT_REASON" IS '1(회원가입)|2(쇼핑)';
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"PRO_NO" NUMBER, 
	"PRO_NAME" VARCHAR2(100 BYTE), 
	"PRO_CATE_CODE" CHAR(1 BYTE), 
	"PRO_MIDD_NO" NUMBER, 
	"PRICE" NUMBER, 
	"STOCK" NUMBER DEFAULT 0, 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"PRO_MAIN_IMAGE" VARCHAR2(500 BYTE), 
	"KEYWORD" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "PRODUCT"."PRO_CATE_CODE" IS 'A|C|D';
   COMMENT ON COLUMN "PRODUCT"."PRO_MIDD_NO" IS '1|2|3';
   COMMENT ON COLUMN "PRODUCT"."STATUS" IS '(Y,N,E)';
   COMMENT ON COLUMN "PRODUCT"."PRO_MAIN_IMAGE" IS 'resources/xxxxx/xxxxxxxxx.jpg';
--------------------------------------------------------
--  DDL for Table PRO_CATEGORY
--------------------------------------------------------

  CREATE TABLE "PRO_CATEGORY" 
   (	"CATEGORY_CODE" CHAR(1 BYTE), 
	"CATEGORY_NAME" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "PRO_CATEGORY"."CATEGORY_CODE" IS 'A|C|D';
   COMMENT ON COLUMN "PRO_CATEGORY"."CATEGORY_NAME" IS '공통|고양이|강아지';
--------------------------------------------------------
--  DDL for Table PRO_CATEGORY_MIDD
--------------------------------------------------------

  CREATE TABLE "PRO_CATEGORY_MIDD" 
   (	"CATE_MIDD_NO" NUMBER, 
	"CATE_MIDD_NAME" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "PRO_CATEGORY_MIDD"."CATE_MIDD_NO" IS '1|2|3';
   COMMENT ON COLUMN "PRO_CATEGORY_MIDD"."CATE_MIDD_NAME" IS '사료|간식|용품';
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"QNA_NO" NUMBER, 
	"QNA_WRITER" NUMBER, 
	"CATEGORY" NUMBER, 
	"QNA_TITLE" VARCHAR2(200 BYTE), 
	"QNA_CONTENT" VARCHAR2(4000 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'N', 
	"ANSWER_WRITER" NUMBER, 
	"ANSWER_CONTENT" VARCHAR2(4000 BYTE), 
	"ANSWER_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "QNA"."QNA_WRITER" IS '회원번호';
   COMMENT ON COLUMN "QNA"."STATUS" IS 'Y(답완)|N(답대)|D(삭제)';
--------------------------------------------------------
--  DDL for Table QNA_CATEGORY
--------------------------------------------------------

  CREATE TABLE "QNA_CATEGORY" 
   (	"CATEGORY_NO" NUMBER, 
	"CATEGORY_NAME" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "REPLY" 
   (	"REPLY_NO" NUMBER, 
	"REPLY_WRITER" NUMBER, 
	"REPLY_BNO" NUMBER, 
	"REPLY_CONTENT" VARCHAR2(500 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "REPLY"."REPLY_WRITER" IS '회원번호';
   COMMENT ON COLUMN "REPLY"."STATUS" IS 'Y|N';
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" 
   (	"RE_NO" NUMBER, 
	"PRO_NO" NUMBER, 
	"RE_WRITER" NUMBER, 
	"RE_TITLE" VARCHAR2(200 BYTE), 
	"RE_CONTENT" VARCHAR2(4000 BYTE), 
	"RE_STAR" NUMBER, 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"READ_COUNT" NUMBER DEFAULT 0, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'N', 
	"MACRO_NO" NUMBER, 
	"REVIEW" VARCHAR2(4000 BYTE)
   ) ;

   COMMENT ON COLUMN "REVIEW"."RE_WRITER" IS '회원번호';
   COMMENT ON COLUMN "REVIEW"."STATUS" IS 'Y(답완)|N(답대)|D(삭제)';
--------------------------------------------------------
--  DDL for Table STOCK
--------------------------------------------------------

  CREATE TABLE "STOCK" 
   (	"STOCK_NO" NUMBER, 
	"PRO_NO" NUMBER, 
	"COUNT" NUMBER, 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" CHAR(1 BYTE) DEFAULT 'I'
   ) ;

   COMMENT ON COLUMN "STOCK"."STATUS" IS '(I|O)';
--------------------------------------------------------
--  DDL for Table TB_ORDER
--------------------------------------------------------

  CREATE TABLE "TB_ORDER" 
   (	"ORDER_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"ORDER_DATE" DATE DEFAULT SYSDATE, 
	"POST" VARCHAR2(7 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"ADDRESS_DETAIL" VARCHAR2(300 BYTE), 
	"RECEIVER" VARCHAR2(15 BYTE), 
	"PHONE" VARCHAR2(13 BYTE), 
	"PAYMENT_NO" NUMBER, 
	"PAYMENT_TYPE" VARCHAR2(30 BYTE), 
	"PAYMENT_STATUS" NUMBER, 
	"ORDER_MESSAGE" VARCHAR2(100 BYTE), 
	"TOTAL_AMOUNT" NUMBER, 
	"POINT_USE" NUMBER
   ) ;

   COMMENT ON COLUMN "TB_ORDER"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_ORDER"."PAYMENT_NO" IS '주문날짜+순차번호';
   COMMENT ON COLUMN "TB_ORDER"."PAYMENT_TYPE" IS '카드,은행,무통장입금,간편결제';
   COMMENT ON COLUMN "TB_ORDER"."PAYMENT_STATUS" IS '0(입금대기)|1(결제완료)';
   COMMENT ON COLUMN "TB_ORDER"."POINT_USE" IS '주문 건당 사용내역';
--------------------------------------------------------
--  DDL for Table WISH
--------------------------------------------------------

  CREATE TABLE "WISH" 
   (	"WISH_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"PRO_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "WISH"."USER_NO" IS '회원번호';
REM INSERTING into ATTACHMENT
SET DEFINE OFF;
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (1,42,'B','city1.jpg','20240328120330_47720.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (2,42,'B','city2.jpg','20240328120330_37256.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (3,42,'B','city3.jpg','20240328120330_47101.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (4,43,'B','forest1.jpg','20240328120539_14639.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (5,43,'B','forest2.jpg','20240328120539_57916.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (6,44,'B','flower1.jpg','20240328120730_80035.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (7,44,'B','flower4.jpg','20240328120730_95399.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (8,44,'B','flower5.jpg','20240328120730_21660.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (9,44,'B','flower3.jpg','20240328120730_15452.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (10,45,'B','강아지사진.jpg','20240328120921_97123.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (11,46,'B','00503871_20190404.jpg','20240328121336_44011.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (12,46,'B','_126241775_getty_cats.png','20240328121336_34341.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (13,48,'B','KakaoTalk_20240328_105822335.jpg','20240328121737_67480.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (14,48,'B','KakaoTalk_20240328_105822335_01.jpg','20240328121737_17410.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (15,49,'B','KakaoTalk_20240328_105822335_11.jpg','20240328122046_24625.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (16,3,'Q','bgsample.jpg','20240328122804_54906.jpg','resources/upfiles/',to_date('24/03/28','RR/MM/DD'),null,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (17,12,'Q','river1.jpg','20240328123716_78412.jpg','resources/upfiles/',to_date('24/03/28','RR/MM/DD'),null,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (18,13,'Q','river3.jpg','20240328123824_35297.jpg','resources/upfiles/',to_date('24/03/28','RR/MM/DD'),null,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (19,1,'R','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (20,1,'R','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (21,2,'R','test.png','20240321194834_22822.jpeg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (22,2,'R','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (23,9,'R','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (24,14,'R','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (25,16,'R','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (26,16,'R','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (27,16,'R','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (28,22,'R','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (29,1,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (30,2,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (31,3,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (32,4,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (33,5,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (34,6,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (35,7,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (36,8,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (37,9,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (38,10,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (39,11,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (40,12,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (41,13,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (42,14,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (43,15,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (44,16,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (45,17,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (46,18,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (47,19,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (48,20,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (49,21,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (50,22,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (51,23,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (52,24,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (53,25,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (54,26,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (55,27,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (56,28,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (57,29,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (58,30,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (59,31,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (60,32,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (61,33,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (62,34,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (63,35,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (64,36,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (65,37,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (66,38,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (67,39,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (68,40,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (69,41,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (70,42,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (71,43,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (72,44,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (73,45,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (74,46,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (75,47,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (76,48,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (77,49,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (78,50,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (79,51,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (80,52,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (81,53,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (82,54,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (83,55,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (84,56,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (85,57,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (86,58,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (87,59,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (88,60,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (89,61,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (90,62,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (91,63,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (92,64,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (93,65,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (94,66,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (95,67,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (96,68,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (97,69,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (98,70,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (99,71,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (100,72,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (101,73,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (102,74,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (103,75,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (104,76,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (105,77,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (106,78,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (107,79,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (108,80,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (109,81,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (110,82,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (111,83,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (112,84,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (113,85,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (114,86,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (115,87,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (116,88,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (117,89,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (118,90,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (119,91,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (120,92,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (121,93,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (122,94,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (123,95,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (124,96,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (125,97,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (126,98,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (127,99,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (128,100,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (129,101,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (130,102,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (131,103,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (132,104,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (133,105,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (134,106,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (135,107,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (136,108,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (137,109,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (138,110,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (139,111,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (140,112,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (141,113,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (142,114,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (143,115,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (144,116,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (145,117,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (146,118,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (147,119,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (148,120,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (149,121,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (150,122,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (151,123,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (152,124,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (153,125,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (154,126,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (155,127,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (156,128,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (157,129,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (158,130,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (159,131,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (160,132,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (161,133,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (162,134,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (163,135,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (164,136,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (165,137,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (166,138,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (167,139,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (168,140,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (169,141,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (170,142,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (171,143,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (172,144,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (173,145,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (174,146,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (175,147,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (176,148,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (177,149,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (178,150,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (179,151,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (180,152,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (181,153,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (182,154,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (183,155,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (184,156,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (185,157,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (186,158,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (187,159,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (188,160,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (189,161,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (190,162,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (191,163,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (192,164,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (193,165,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (194,166,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (195,167,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (196,168,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (197,169,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (198,170,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (199,171,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (200,172,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (201,173,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (202,174,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (203,175,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (204,176,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (205,177,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (206,178,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (207,179,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (208,180,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (209,181,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (210,182,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (211,183,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (212,184,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (213,185,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (214,186,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (215,187,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (216,188,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (217,189,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (218,190,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (219,191,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (220,192,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (221,193,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (222,194,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (223,195,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (224,196,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (225,197,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (226,198,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (227,199,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (228,200,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (229,201,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (230,202,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (231,203,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (232,204,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (233,205,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (234,206,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (235,207,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (236,208,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (237,209,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (238,210,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (239,211,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (240,212,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (241,213,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (242,214,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (243,215,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (244,216,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (245,217,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (246,218,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (247,219,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (248,220,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (249,221,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (250,222,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (251,223,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (252,224,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (253,225,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (254,226,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (255,227,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (256,228,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (257,229,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (258,230,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (259,231,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (260,232,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (261,233,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (262,234,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (263,235,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (264,236,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (265,237,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (266,238,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (267,239,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (268,240,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (269,241,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (270,242,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (271,243,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (272,244,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (273,245,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (274,246,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (275,247,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (276,248,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (277,249,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (278,250,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (279,251,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (280,252,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (281,253,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (282,254,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (283,255,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (284,256,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (285,257,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (286,258,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (287,259,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (288,260,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (289,261,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (290,262,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (291,263,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (292,264,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (293,265,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (294,266,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (295,267,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (296,268,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (297,269,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (298,270,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (299,271,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (300,272,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (301,273,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (302,274,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (303,275,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (304,276,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (305,277,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (306,278,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (307,279,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (308,280,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (309,281,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (310,282,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (311,283,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (312,284,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (313,285,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (314,286,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (315,287,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (316,288,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (317,289,'P','test.png','20240320165140_67436.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (318,290,'P','flower2.jpg','20240328155258_89926.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (319,12,'E','flower5.jpg','20240328155753_79265.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (320,12,'E','forest1.jpg','20240328155753_61609.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (321,17,'Q','city3.jpg','20240328161128_81143.jpg','resources/upfiles/',to_date('24/03/28','RR/MM/DD'),null,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (322,1,'E','test.png','event_signUp.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (323,1,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (324,2,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (325,2,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (326,3,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (327,3,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (328,4,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (329,4,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (330,5,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (331,5,'E','test.png','20240326175045_82942.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (332,6,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (333,6,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (334,7,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (335,7,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (336,8,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (337,8,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (338,9,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (339,9,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (340,10,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (341,10,'E','test.png','20240326174227_57926.png','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (342,50,'B','KakaoTalk_20240328_105822335_06.jpg','20240328190738_82022.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),1,'Y');
Insert into ATTACHMENT (FILE_NO,REF_BNO,REF_TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS) values (343,50,'B','KakaoTalk_20240328_105822335_05.jpg','20240328190738_84884.jpg','resources/thumbnail_upfiles/',to_date('24/03/28','RR/MM/DD'),2,'Y');
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (1,2,1,'글 제목 입니다1','글 내용 입니다1',20,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (2,4,1,'글 제목 입니다3','글 내용 입니다3',7,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (3,5,1,'글 제목 입니다4','글 내용 입니다4',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (4,6,1,'글 제목 입니다5','글 내용 입니다5',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (5,7,1,'글 제목 입니다6','글 내용 입니다6',35,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (6,13,1,'글 제목 입니다12','글 내용 입니다12',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (7,15,1,'글 제목 입니다14','글 내용 입니다14',30,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (8,17,1,'글 제목 입니다16','글 내용 입니다16',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (9,18,1,'글 제목 입니다17','글 내용 입니다17',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (10,19,1,'글 제목 입니다18','글 내용 입니다18',35,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (11,20,1,'글 제목 입니다19','글 내용 입니다19',18,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (12,21,1,'글 제목 입니다20','글 내용 입니다20',40,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (13,22,1,'글 제목 입니다21','글 내용 입니다21',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (14,23,1,'글 제목 입니다22','글 내용 입니다22',7,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (15,26,1,'글 제목 입니다25','글 내용 입니다25',20,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (16,29,1,'글 제목 입니다28','글 내용 입니다28',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (17,30,1,'글 제목 입니다29','글 내용 입니다29',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (18,31,1,'글 제목 입니다30','글 내용 입니다30',35,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (19,32,1,'글 제목 입니다31','글 내용 입니다31',18,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (20,33,1,'글 제목 입니다32','글 내용 입니다32',40,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (21,34,1,'글 제목 입니다33','글 내용 입니다33',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (22,35,1,'글 제목 입니다34','글 내용 입니다34',7,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (23,36,1,'글 제목 입니다35','글 내용 입니다35',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (24,37,1,'글 제목 입니다36','글 내용 입니다36',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (25,41,1,'글 제목 입니다40','글 내용 입니다40',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (26,42,1,'글 제목 입니다41','글 내용 입니다41',12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (27,43,1,'글 제목 입니다42','글 내용 입니다42',35,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (28,44,1,'글 제목 입니다43','글 내용 입니다43',18,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (29,45,1,'글 제목 입니다44','글 내용 입니다44',40,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (30,48,1,'글 제목 입니다47','글 내용 입니다47',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (31,49,1,'글 제목 입니다48','글 내용 입니다48',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (32,50,1,'글 제목 입니다49','글 내용 입니다49',20,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (33,51,1,'글 제목 입니다50','글 내용 입니다50',30,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (34,52,1,'글 제목 입니다51','글 내용 입니다51',7,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (35,53,1,'글 제목 입니다52','글 내용 입니다52',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (36,55,1,'글 제목 입니다54','글 내용 입니다54',35,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (37,56,1,'글 제목 입니다55','글 내용 입니다55',21,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (38,2,1,'글 제목 입니다56','글 내용 입니다56',42,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (39,3,1,'안녕하세요?','저는 유저 3입니다 !',14,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (40,3,1,'고양이 사료 추천해주실분','3살 하이랜드폴드에요~ㅎㅎ',18,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (41,3,1,'고양이 사료 추천해주실분2222','1살 코숏남아 2살 코숏여아도 있어요!! 로얄캐닌먹이다가 너무 돼지뚱냥이 돼서 바꾸려구요ㅠㅠ',205,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (42,5,2,'도시의 풍경이 너무 아름답네요^^','여러분도 보시면 좋을 것 같아서 도시의 풍경 사진 몇 개 올립니다.
다들 오늘 좋은 하루 되세요!!',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (43,6,2,'숲의 풍경이 너무 좋네요','가끔은 복잡한 도심을 벗어나 자연을 느끼는 것도 좋을 것 같습니다 ^^
다들 숲 사진 보시고 힐링 하세요!!',1,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (44,7,2,'다들 꽃 좋아하시나요?','저는 좋아합니다.
꽃 너무 아름답지 않나요?
그런 기념으로
꽃 몇 송이 놓고 갑니다..
@->-->
그럼 이만 총총,,,',2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (45,8,2,'우리 애기가 너무 귀여워어어어어어어어요오오오오오오오오','진짜 개졸귀탱 어떻게 이렇게 귀엽지??
지구뿌셔 우주뿌셔ㅠㅠㅠㅠㅠㅠ다뿌셔어어어어어어어ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (46,2,2,'도도한 녀석....ㅡㅡ^','그래두 난...네가 참 좋ㄷr.....
날 바라봐주지 않아도.. 날 귀찮아해도..!!!!
넌 너무 귀여워 사랑스러워',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (47,3,1,'우리집 애기가 너무 귀여운 것 같은데 어떡하죠????','진짜 누가 데려가면 어쩌려고 이렇게 귀엽지 진짜???
하...진심으로 걱정이네요 어휴...ㅎ',1,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (48,4,2,'꺄아아아아아아악 날 쳐다봐줬어어어어어어어어억!!!!!!!!!!!!!','웬일이야 진짜ㅠㅠㅠ
사랑해애애애애애애애애애애애애애애애애애애애애애액!!!!!!!!!!!!!!!!!!!!!!
김영희!!!!!!!!!!!!!!!!!!!!!!!!!!!!',0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (49,5,2,'누가 산책 소리를 내었는가..........','누가 산책 소리를 내었어....!!!!!!!

....

ㅜㅜㅜㅜ티비보다가 산책 소리가 나서 반응한 김레오ㅠㅠ
우리... 아침에 산책 다녀왔자나...ㅎㅎㅎㅎ......ㅎㅎ.ㅎㅎ
............
............
ㅎㅎ 산책 다시 다녀와야겠네요....ㅎㅎㅎㅎㅎㅎㅎ
그래도 넌 참 귀여워 ',9,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TYPE,BOARD_TITLE,BOARD_CONTENT,READ_COUNT,ENROLL_DATE,MODIFY_DATE,STATUS) values (50,2,2,'우리집 귀염둥이 자랑합니다 히히','넘 귀엽졍??',2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
REM INSERTING into CART
SET DEFINE OFF;
Insert into CART (CART_NO,CART_USER,CART_PRO,CART_COUNT,CART_DATE,CART_PRICE) values (585,2,288,3,to_date('24/03/28','RR/MM/DD'),66000);
REM INSERTING into DELIVERY
SET DEFINE OFF;
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (1,2,'김승건','김승건의 집1','044-850-5314','30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ',to_date('10/03/15','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (2,2,'김승건','김승건의 집2','044-850-5314','08505','서울특별시 금천구','가산디지털10로 95',to_date('10/03/25','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (4,2,'김승건','김승건의 집3','044-850-5314','08505','서울특별시 강남구','가산디지털2로 30',to_date('10/04/14','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (5,3,'오상은','오상은의 집1','063-530-6931','56171','전북 정읍시','서부산업도로 502 (수성동 985-3)',to_date('10/05/05','RR/MM/DD'),to_date('10/05/05','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (6,3,'오상은','오상은의 집2','063-530-6931','08505','서울특별시 금천구','가산디지털10로 95',to_date('10/05/15','RR/MM/DD'),to_date('10/05/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (7,3,'오상은','오상은의 집3','063-530-6931','08505','서울특별시 강남구','가산디지털2로 200',to_date('10/05/25','RR/MM/DD'),to_date('10/05/25','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (8,3,'오상은','오상은의 집4','063-530-6931','08505','서울특별시 중구','가산디지털2로 30',to_date('10/06/04','RR/MM/DD'),to_date('10/06/04','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (9,4,'김성희','김성희의 집1','031-936-5115','10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층',to_date('10/09/29','RR/MM/DD'),to_date('10/09/29','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (10,4,'김성희','김성희의 집2','031-936-5115','08505','서울특별시 금천구','가산디지털10로 95',to_date('10/10/09','RR/MM/DD'),to_date('10/10/09','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (11,4,'김성희','김성희의 집3','031-936-5115','08505','서울특별시 강남구','가산디지털2로 200',to_date('10/10/19','RR/MM/DD'),to_date('10/10/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (12,4,'김성희','김성희의 집4','031-936-5115','08505','서울특별시 중구','가산디지털2로 30',to_date('10/10/29','RR/MM/DD'),to_date('10/10/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (13,5,'임정은','임정은의 집1','043-299-6022','28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)',to_date('10/12/17','RR/MM/DD'),to_date('10/12/17','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (14,5,'임정은','임정은의 집2','043-299-6022','08505','서울특별시 금천구','가산디지털10로 95',to_date('10/12/27','RR/MM/DD'),to_date('10/12/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (15,5,'임정은','임정은의 집3','043-299-6022','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/01/06','RR/MM/DD'),to_date('11/01/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (16,5,'임정은','임정은의 집4','043-299-6022','08505','서울특별시 중구','가산디지털2로 30',to_date('11/01/16','RR/MM/DD'),to_date('11/01/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (17,6,'나미리','나미리의 집1','062-370-6114','61902','광주광역시 서구','천변우하로 391(동천동 584) ',to_date('11/02/11','RR/MM/DD'),to_date('11/02/11','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (18,6,'나미리','나미리의 집2','062-370-6114','08505','서울특별시 금천구','가산디지털10로 95',to_date('11/02/21','RR/MM/DD'),to_date('11/02/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (19,6,'나미리','나미리의 집3','062-370-6114','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/03/03','RR/MM/DD'),to_date('11/03/03','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (20,6,'나미리','나미리의 집4','062-370-6114','08505','서울특별시 중구','가산디지털2로 30',to_date('11/03/13','RR/MM/DD'),to_date('11/03/13','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (21,7,'임지호','임지호의 집1','041-406-2213','32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층',to_date('11/03/22','RR/MM/DD'),to_date('11/03/22','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (22,7,'임지호','임지호의 집2','041-406-2213','08505','서울특별시 금천구','가산디지털10로 95',to_date('11/04/01','RR/MM/DD'),to_date('11/04/01','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (23,7,'임지호','임지호의 집3','041-406-2213','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/04/11','RR/MM/DD'),to_date('11/04/11','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (24,7,'임지호','임지호의 집4','041-406-2213','08505','서울특별시 중구','가산디지털2로 30',to_date('11/04/21','RR/MM/DD'),to_date('11/04/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (25,8,'박정은','박정은의 집1','041-660-8105','32000','충남 서산시','석림1로 67 (석림동 793-3)',to_date('11/06/28','RR/MM/DD'),to_date('11/06/28','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (26,8,'박정은','박정은의 집2','041-660-8105','08505','서울특별시 금천구','가산디지털10로 95',to_date('11/07/08','RR/MM/DD'),to_date('11/07/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (27,8,'박정은','박정은의 집3','041-660-8105','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/07/18','RR/MM/DD'),to_date('11/07/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (28,8,'박정은','박정은의 집4','041-660-8105','08505','서울특별시 중구','가산디지털2로 30',to_date('11/07/28','RR/MM/DD'),to_date('11/07/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (29,9,'박현정','박현정의 집1','032-460-2733','14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호',to_date('11/09/06','RR/MM/DD'),to_date('11/09/06','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (30,9,'박현정','박현정의 집2','032-460-2733','08505','서울특별시 금천구','가산디지털10로 95',to_date('11/09/16','RR/MM/DD'),to_date('11/09/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (31,9,'박현정','박현정의 집3','032-460-2733','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/09/26','RR/MM/DD'),to_date('11/09/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (32,9,'박현정','박현정의 집4','032-460-2733','08505','서울특별시 중구','가산디지털2로 30',to_date('11/10/06','RR/MM/DD'),to_date('11/10/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (33,10,'고미옥','고미옥의 집1','02-2110-7713','06675','서울 서초구','방배천로 91, 구암타워 지하1층',to_date('11/11/07','RR/MM/DD'),to_date('11/11/07','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (34,10,'고미옥','고미옥의 집2','02-2110-7713','08505','서울특별시 금천구','가산디지털10로 95',to_date('11/11/17','RR/MM/DD'),to_date('11/11/17','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (35,10,'고미옥','고미옥의 집3','02-2110-7713','08505','서울특별시 강남구','가산디지털2로 200',to_date('11/11/27','RR/MM/DD'),to_date('11/11/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (36,10,'고미옥','고미옥의 집4','02-2110-7713','08505','서울특별시 중구','가산디지털2로 30',to_date('11/12/07','RR/MM/DD'),to_date('11/12/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (37,11,'박성춘','박성춘의 집1','055-344-2503','51004',' 경남 김해시','계동로 195(장유2동 298-10)',to_date('12/01/09','RR/MM/DD'),to_date('12/01/09','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (38,11,'박성춘','박성춘의 집2','055-344-2503','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/01/19','RR/MM/DD'),to_date('12/01/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (39,11,'박성춘','박성춘의 집3','055-344-2503','08505','서울특별시 강남구','가산디지털2로 200',to_date('12/01/29','RR/MM/DD'),to_date('12/01/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (40,11,'박성춘','박성춘의 집4','055-344-2503','08505','서울특별시 중구','가산디지털2로 30',to_date('12/02/08','RR/MM/DD'),to_date('12/02/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (41,12,'최정미','최정미의 집1','053-609-6534','41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층',to_date('12/02/23','RR/MM/DD'),to_date('12/02/23','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (42,12,'최정미','최정미의 집2','053-609-6534','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/03/04','RR/MM/DD'),to_date('12/03/04','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (43,12,'최정미','최정미의 집3','053-609-6534','08505','서울특별시 강남구','가산디지털2로 200',to_date('12/03/14','RR/MM/DD'),to_date('12/03/14','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (44,12,'최정미','최정미의 집4','053-609-6534','08505','서울특별시 중구','가산디지털2로 30',to_date('12/03/24','RR/MM/DD'),to_date('12/03/24','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (45,13,'서세승','서세승의 집1','055-760-8845','50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)',to_date('12/06/15','RR/MM/DD'),to_date('12/06/15','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (46,13,'서세승','서세승의 집2','055-760-8845','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/06/25','RR/MM/DD'),to_date('12/06/25','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (47,13,'서세승','서세승의 집3','055-760-8845','08505','서울특별시 강남구','가산디지털2로 200',to_date('12/07/05','RR/MM/DD'),to_date('12/07/05','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (48,14,'김보경','김보경의 집1','054-530-6515','37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)',to_date('12/07/08','RR/MM/DD'),to_date('12/07/08','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (49,13,'서세승','서세승의 집4','055-760-8845','08505','서울특별시 중구','가산디지털2로 30',to_date('12/07/15','RR/MM/DD'),to_date('12/07/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (50,14,'김보경','김보경의 집2','054-530-6515','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/07/18','RR/MM/DD'),to_date('12/07/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (51,14,'김보경','김보경의 집3','054-530-6515','08505','서울특별시 강남구','가산디지털2로 200',to_date('12/07/28','RR/MM/DD'),to_date('12/07/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (52,14,'김보경','김보경의 집4','054-530-6515','08505','서울특별시 중구','가산디지털2로 30',to_date('12/08/07','RR/MM/DD'),to_date('12/08/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (53,15,'권민희','권민희의 집1','052-279-4015','44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)',to_date('12/09/07','RR/MM/DD'),to_date('12/09/07','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (54,15,'권민희','권민희의 집2','052-279-4015','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/09/17','RR/MM/DD'),to_date('12/09/17','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (55,15,'권민희','권민희의 집3','052-279-4015','08505','서울특별시 강남구','가산디지털2로 200',to_date('12/09/27','RR/MM/DD'),to_date('12/09/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (56,15,'권민희','권민희의 집4','052-279-4015','08505','서울특별시 중구','가산디지털2로 30',to_date('12/10/07','RR/MM/DD'),to_date('12/10/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (57,16,'성정희','성정희의 집1','031-659-0400','17851','경기도 평택시','비전2로 77(비전동 1002) 2층',to_date('12/12/19','RR/MM/DD'),to_date('12/12/19','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (58,16,'성정희','성정희의 집2','031-659-0400','08505','서울특별시 금천구','가산디지털10로 95',to_date('12/12/29','RR/MM/DD'),to_date('12/12/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (59,16,'성정희','성정희의 집3','031-659-0400','08505','서울특별시 강남구','가산디지털2로 200',to_date('13/01/08','RR/MM/DD'),to_date('13/01/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (60,16,'성정희','성정희의 집4','031-659-0400','08505','서울특별시 중구','가산디지털2로 30',to_date('13/01/18','RR/MM/DD'),to_date('13/01/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (61,17,'천민경','천민경의 집1','055-640-0713','53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)',to_date('13/07/19','RR/MM/DD'),to_date('13/07/19','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (62,17,'천민경','천민경의 집2','055-640-0713','08505','서울특별시 금천구','가산디지털10로 95',to_date('13/07/29','RR/MM/DD'),to_date('13/07/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (63,17,'천민경','천민경의 집3','055-640-0713','08505','서울특별시 강남구','가산디지털2로 200',to_date('13/08/08','RR/MM/DD'),to_date('13/08/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (64,17,'천민경','천민경의 집4','055-640-0713','08505','서울특별시 중구','가산디지털2로 30',to_date('13/08/18','RR/MM/DD'),to_date('13/08/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (65,18,'전은남','전은남의 집1','033-370-5200','26231','강원 영월군','영월읍 중앙로202(덕포리600) ',to_date('13/09/22','RR/MM/DD'),to_date('13/09/22','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (66,19,'전진희','전진희의 집1','054-820-0103','36725','경북 안동시','마들6길 62 (용상동 1517-250)',to_date('13/10/01','RR/MM/DD'),to_date('13/10/01','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (67,18,'전은남','전은남의 집2','033-370-5200','08505','서울특별시 금천구','가산디지털10로 95',to_date('13/10/02','RR/MM/DD'),to_date('13/10/02','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (68,19,'전진희','전진희의 집2','054-820-0103','08505','서울특별시 금천구','가산디지털10로 95',to_date('13/10/11','RR/MM/DD'),to_date('13/10/11','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (69,18,'전은남','전은남의 집3','033-370-5200','08505','서울특별시 강남구','가산디지털2로 200',to_date('13/10/12','RR/MM/DD'),to_date('13/10/12','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (70,19,'전진희','전진희의 집3','054-820-0103','08505','서울특별시 강남구','가산디지털2로 200',to_date('13/10/21','RR/MM/DD'),to_date('13/10/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (71,18,'전은남','전은남의 집4','033-370-5200','08505','서울특별시 중구','가산디지털2로 30',to_date('13/10/22','RR/MM/DD'),to_date('13/10/22','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (72,19,'전진희','전진희의 집4','054-820-0103','08505','서울특별시 중구','가산디지털2로 30',to_date('13/10/31','RR/MM/DD'),to_date('13/10/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (73,20,'양지수','양지수의 집1','061-750-6562','59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)',to_date('14/04/07','RR/MM/DD'),to_date('14/04/07','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (74,20,'양지수','양지수의 집2','061-750-6562','08505','서울특별시 금천구','가산디지털10로 95',to_date('14/04/17','RR/MM/DD'),to_date('14/04/17','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (75,20,'양지수','양지수의 집3','061-750-6562','08505','서울특별시 강남구','가산디지털2로 200',to_date('14/04/27','RR/MM/DD'),to_date('14/04/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (76,20,'양지수','양지수의 집4','061-750-6562','08505','서울특별시 중구','가산디지털2로 30',to_date('14/05/07','RR/MM/DD'),to_date('14/05/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (77,21,'윤성일','윤성일의 집1','054-459-6552','39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)',to_date('14/08/21','RR/MM/DD'),to_date('14/08/21','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (78,21,'윤성일','윤성일의 집2','054-459-6552','08505','서울특별시 금천구','가산디지털10로 95',to_date('14/08/31','RR/MM/DD'),to_date('14/08/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (79,21,'윤성일','윤성일의 집3','054-459-6552','08505','서울특별시 강남구','가산디지털2로 200',to_date('14/09/10','RR/MM/DD'),to_date('14/09/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (80,21,'윤성일','윤성일의 집4','054-459-6552','08505','서울특별시 중구','가산디지털2로 30',to_date('14/09/20','RR/MM/DD'),to_date('14/09/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (81,22,'박영희','박영희의 집1','061-850-6120','59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)',to_date('14/10/06','RR/MM/DD'),to_date('14/10/06','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (82,22,'박영희','박영희의 집2','061-850-6120','08505','서울특별시 금천구','가산디지털10로 95',to_date('14/10/16','RR/MM/DD'),to_date('14/10/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (83,22,'박영희','박영희의 집3','061-850-6120','08505','서울특별시 강남구','가산디지털2로 200',to_date('14/10/26','RR/MM/DD'),to_date('14/10/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (84,22,'박영희','박영희의 집4','061-850-6120','08505','서울특별시 중구','가산디지털2로 30',to_date('14/11/05','RR/MM/DD'),to_date('14/11/05','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (85,23,'최유림','최유림의 집1','031-640-9411','17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층',to_date('14/11/29','RR/MM/DD'),to_date('14/11/29','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (86,23,'최유림','최유림의 집2','031-640-9411','08505','서울특별시 금천구','가산디지털10로 95',to_date('14/12/09','RR/MM/DD'),to_date('14/12/09','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (87,23,'최유림','최유림의 집3','031-640-9411','08505','서울특별시 강남구','가산디지털2로 200',to_date('14/12/19','RR/MM/DD'),to_date('14/12/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (88,23,'최유림','최유림의 집4','031-640-9411','08505','서울특별시 중구','가산디지털2로 30',to_date('14/12/29','RR/MM/DD'),to_date('14/12/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (89,24,'박하얀','박하얀의 집1','031-780-0614','13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ',to_date('15/03/17','RR/MM/DD'),to_date('15/03/17','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (90,24,'박하얀','박하얀의 집2','031-780-0614','08505','서울특별시 금천구','가산디지털10로 95',to_date('15/03/27','RR/MM/DD'),to_date('15/03/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (91,24,'박하얀','박하얀의 집3','031-780-0614','08505','서울특별시 강남구','가산디지털2로 200',to_date('15/04/06','RR/MM/DD'),to_date('15/04/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (92,24,'박하얀','박하얀의 집4','031-780-0614','08505','서울특별시 중구','가산디지털2로 30',to_date('15/04/16','RR/MM/DD'),to_date('15/04/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (93,25,'김소연','김소연의 집1','033-769-3701','26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층',to_date('15/06/08','RR/MM/DD'),to_date('15/06/08','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (94,25,'김소연','김소연의 집2','033-769-3701','08505','서울특별시 금천구','가산디지털10로 95',to_date('15/06/18','RR/MM/DD'),to_date('15/06/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (95,25,'김소연','김소연의 집3','033-769-3701','08505','서울특별시 강남구','가산디지털2로 200',to_date('15/06/28','RR/MM/DD'),to_date('15/06/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (96,25,'김소연','김소연의 집4','033-769-3701','08505','서울특별시 중구','가산디지털2로 30',to_date('15/07/08','RR/MM/DD'),to_date('15/07/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (97,26,'박지현','박지현의 집1','032-460-2617','21573','인천 남동구','인하로 507번길 66 (구월1동 1460)',to_date('15/07/25','RR/MM/DD'),to_date('15/07/25','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (98,26,'박지현','박지현의 집2','032-460-2617','08505','서울특별시 금천구','가산디지털10로 95',to_date('15/08/04','RR/MM/DD'),to_date('15/08/04','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (99,26,'박지현','박지현의 집3','032-460-2617','08505','서울특별시 강남구','가산디지털2로 200',to_date('15/08/14','RR/MM/DD'),to_date('15/08/14','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (100,26,'박지현','박지현의 집4','032-460-2617','08505','서울특별시 중구','가산디지털2로 30',to_date('15/08/24','RR/MM/DD'),to_date('15/08/24','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (101,27,'이주연','이주연의 집1','010-1522-3232','34121','대전 유성구',' 대덕대로 516 38층',to_date('15/09/20','RR/MM/DD'),to_date('15/09/20','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (102,27,'이주연','이주연의 집2','010-1522-3232','08505','서울특별시 금천구','가산디지털10로 95',to_date('15/09/30','RR/MM/DD'),to_date('15/09/30','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (103,27,'이주연','이주연의 집3','010-1522-3232','08505','서울특별시 강남구','가산디지털2로 200',to_date('15/10/10','RR/MM/DD'),to_date('15/10/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (104,27,'이주연','이주연의 집4','010-1522-3232','08505','서울특별시 중구','가산디지털2로 30',to_date('15/10/20','RR/MM/DD'),to_date('15/10/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (105,28,'백현희','백현희의 집1','061-430-6120','59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ',to_date('15/11/18','RR/MM/DD'),to_date('15/11/18','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (106,28,'백현희','백현희의 집2','061-430-6120','08505','서울특별시 금천구','가산디지털10로 95',to_date('15/11/28','RR/MM/DD'),to_date('15/11/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (107,28,'백현희','백현희의 집3','061-430-6120','08505','서울특별시 강남구','가산디지털2로 200',to_date('15/12/08','RR/MM/DD'),to_date('15/12/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (108,28,'백현희','백현희의 집4','061-430-6120','08505','서울특별시 중구','가산디지털2로 30',to_date('15/12/18','RR/MM/DD'),to_date('15/12/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (109,29,'김동범','김동범의 집1','041-520-9254','31107','충남 천안시','서북구 오성로 89 (두정동 839)',to_date('16/05/30','RR/MM/DD'),to_date('16/05/30','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (110,29,'김동범','김동범의 집2','041-520-9254','08505','서울특별시 금천구','가산디지털10로 95',to_date('16/06/09','RR/MM/DD'),to_date('16/06/09','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (111,29,'김동범','김동범의 집3','041-520-9254','08505','서울특별시 강남구','가산디지털2로 200',to_date('16/06/19','RR/MM/DD'),to_date('16/06/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (112,29,'김동범','김동범의 집4','041-520-9254','08505','서울특별시 중구','가산디지털2로 30',to_date('16/06/29','RR/MM/DD'),to_date('16/06/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (113,30,'이진','이진의 집1','02-6327-3943','03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실',to_date('16/07/16','RR/MM/DD'),to_date('16/07/16','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (114,30,'이진','이진의 집2','02-6327-3943','08505','서울특별시 금천구','가산디지털10로 95',to_date('16/07/26','RR/MM/DD'),to_date('16/07/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (115,30,'이진','이진의 집3','02-6327-3943','08505','서울특별시 강남구','가산디지털2로 200',to_date('16/08/05','RR/MM/DD'),to_date('16/08/05','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (116,30,'이진','이진의 집4','02-6327-3943','08505','서울특별시 중구','가산디지털2로 30',to_date('16/08/15','RR/MM/DD'),to_date('16/08/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (117,31,'전현주','전현주의 집1','055-213-0124','50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ',to_date('16/08/20','RR/MM/DD'),to_date('16/08/20','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (118,31,'전현주','전현주의 집2','055-213-0124','08505','서울특별시 금천구','가산디지털10로 95',to_date('16/08/30','RR/MM/DD'),to_date('16/08/30','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (119,31,'전현주','전현주의 집3','055-213-0124','08505','서울특별시 강남구','가산디지털2로 200',to_date('16/09/09','RR/MM/DD'),to_date('16/09/09','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (120,31,'전현주','전현주의 집4','055-213-0124','08505','서울특별시 중구','가산디지털2로 30',to_date('16/09/19','RR/MM/DD'),to_date('16/09/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (121,32,'서정숙','서정숙의 집1','063-630-6022','55777','전북 남원시','요천로 1393 (천거동 160-5)',to_date('16/11/01','RR/MM/DD'),to_date('16/11/01','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (122,32,'서정숙','서정숙의 집2','063-630-6022','08505','서울특별시 금천구','가산디지털10로 95',to_date('16/11/11','RR/MM/DD'),to_date('16/11/11','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (123,32,'서정숙','서정숙의 집3','063-630-6022','08505','서울특별시 강남구','가산디지털2로 200',to_date('16/11/21','RR/MM/DD'),to_date('16/11/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (124,32,'서정숙','서정숙의 집4','063-630-6022','08505','서울특별시 중구','가산디지털2로 30',to_date('16/12/01','RR/MM/DD'),to_date('16/12/01','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (125,33,'박소영','박소영의 집1','064-728-5803','63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호',to_date('17/03/18','RR/MM/DD'),to_date('17/03/18','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (126,33,'박소영','박소영의 집2','064-728-5803','08505','서울특별시 금천구','가산디지털10로 95',to_date('17/03/28','RR/MM/DD'),to_date('17/03/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (127,33,'박소영','박소영의 집3','064-728-5803','08505','서울특별시 강남구','가산디지털2로 200',to_date('17/04/07','RR/MM/DD'),to_date('17/04/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (128,33,'박소영','박소영의 집4','064-728-5803','08505','서울특별시 중구','가산디지털2로 30',to_date('17/04/17','RR/MM/DD'),to_date('17/04/17','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (129,34,'류미란','류미란의 집1','055-760-8841','52709','경남 진주시','진주대로 963 (강남동 145)',to_date('17/08/27','RR/MM/DD'),to_date('17/08/27','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (130,34,'류미란','류미란의 집2','055-760-8841','08505','서울특별시 금천구','가산디지털10로 95',to_date('17/09/06','RR/MM/DD'),to_date('17/09/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (131,34,'류미란','류미란의 집3','055-760-8841','08505','서울특별시 강남구','가산디지털2로 200',to_date('17/09/16','RR/MM/DD'),to_date('17/09/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (132,34,'류미란','류미란의 집4','055-760-8841','08505','서울특별시 중구','가산디지털2로 30',to_date('17/09/26','RR/MM/DD'),to_date('17/09/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (133,35,'김선옥','김선옥의 집1','031-860-3502','11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층',to_date('17/10/11','RR/MM/DD'),to_date('17/10/11','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (134,35,'김선옥','김선옥의 집2','031-860-3502','08505','서울특별시 금천구','가산디지털10로 95',to_date('17/10/21','RR/MM/DD'),to_date('17/10/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (135,35,'김선옥','김선옥의 집3','031-860-3502','08505','서울특별시 강남구','가산디지털2로 200',to_date('17/10/31','RR/MM/DD'),to_date('17/10/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (136,35,'김선옥','김선옥의 집4','031-860-3502','08505','서울특별시 중구','가산디지털2로 30',to_date('17/11/10','RR/MM/DD'),to_date('17/11/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (137,36,'윤연주','윤연주의 집1','053-609-6542','38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소',to_date('17/12/27','RR/MM/DD'),to_date('17/12/27','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (138,37,'정선인','정선인의 집1','051-850-5532','47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실',to_date('18/01/01','RR/MM/DD'),to_date('18/01/01','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (139,36,'윤연주','윤연주의 집2','053-609-6542','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/01/06','RR/MM/DD'),to_date('18/01/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (140,37,'정선인','정선인의 집2','051-850-5532','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/01/11','RR/MM/DD'),to_date('18/01/11','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (141,36,'윤연주','윤연주의 집3','053-609-6542','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/01/16','RR/MM/DD'),to_date('18/01/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (142,37,'정선인','정선인의 집3','051-850-5532','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/01/21','RR/MM/DD'),to_date('18/01/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (143,36,'윤연주','윤연주의 집4','053-609-6542','08505','서울특별시 중구','가산디지털2로 30',to_date('18/01/26','RR/MM/DD'),to_date('18/01/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (144,37,'정선인','정선인의 집4','051-850-5532','08505','서울특별시 중구','가산디지털2로 30',to_date('18/01/31','RR/MM/DD'),to_date('18/01/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (145,38,'김교희','김교희의 집1','054-780-5811','36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)',to_date('18/04/15','RR/MM/DD'),to_date('18/04/15','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (146,38,'김교희','김교희의 집2','054-780-5811','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/04/25','RR/MM/DD'),to_date('18/04/25','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (147,38,'김교희','김교희의 집3','054-780-5811','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/05/05','RR/MM/DD'),to_date('18/05/05','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (148,38,'김교희','김교희의 집4','054-780-5811','08505','서울특별시 중구','가산디지털2로 30',to_date('18/05/15','RR/MM/DD'),to_date('18/05/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (149,39,'신윤정','신윤정의 집1','054-870-5703','37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)',to_date('18/05/31','RR/MM/DD'),to_date('18/05/31','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (150,39,'신윤정','신윤정의 집2','054-870-5703','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/06/10','RR/MM/DD'),to_date('18/06/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (151,39,'신윤정','신윤정의 집3','054-870-5703','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/06/20','RR/MM/DD'),to_date('18/06/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (152,40,'최아람','최아람의 집1','033-258-3675','24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층',to_date('18/06/28','RR/MM/DD'),to_date('18/06/28','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (153,39,'신윤정','신윤정의 집4','054-870-5703','08505','서울특별시 중구','가산디지털2로 30',to_date('18/06/30','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (154,40,'최아람','최아람의 집2','033-258-3675','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/07/08','RR/MM/DD'),to_date('18/07/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (155,40,'최아람','최아람의 집3','033-258-3675','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/07/18','RR/MM/DD'),to_date('18/07/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (156,40,'최아람','최아람의 집4','033-258-3675','08505','서울특별시 중구','가산디지털2로 30',to_date('18/07/28','RR/MM/DD'),to_date('18/07/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (157,41,'이희석','이희석의 집1','031-230-0706','16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)',to_date('18/08/18','RR/MM/DD'),to_date('18/08/18','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (158,41,'이희석','이희석의 집2','031-230-0706','08505','서울특별시 금천구','가산디지털10로 95',to_date('18/08/28','RR/MM/DD'),to_date('18/08/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (159,41,'이희석','이희석의 집3','031-230-0706','08505','서울특별시 강남구','가산디지털2로 200',to_date('18/09/07','RR/MM/DD'),to_date('18/09/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (160,41,'이희석','이희석의 집4','031-230-0706','08505','서울특별시 중구','가산디지털2로 30',to_date('18/09/17','RR/MM/DD'),to_date('18/09/17','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (161,42,'이정아','이정아의 집1','031-560-7011','11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층',to_date('19/01/21','RR/MM/DD'),to_date('19/01/21','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (162,42,'이정아','이정아의 집2','031-560-7011','08505','서울특별시 금천구','가산디지털10로 95',to_date('19/01/31','RR/MM/DD'),to_date('19/01/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (163,42,'이정아','이정아의 집3','031-560-7011','08505','서울특별시 강남구','가산디지털2로 200',to_date('19/02/10','RR/MM/DD'),to_date('19/02/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (164,42,'이정아','이정아의 집4','031-560-7011','08505','서울특별시 중구','가산디지털2로 30',to_date('19/02/20','RR/MM/DD'),to_date('19/02/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (165,43,'주정희','주정희의 집1','061-260-6120','58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ',to_date('19/07/29','RR/MM/DD'),to_date('19/07/29','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (166,43,'주정희','주정희의 집2','061-260-6120','08505','서울특별시 금천구','가산디지털10로 95',to_date('19/08/08','RR/MM/DD'),to_date('19/08/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (167,43,'주정희','주정희의 집3','061-260-6120','08505','서울특별시 강남구','가산디지털2로 200',to_date('19/08/18','RR/MM/DD'),to_date('19/08/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (168,43,'주정희','주정희의 집4','061-260-6120','08505','서울특별시 중구','가산디지털2로 30',to_date('19/08/28','RR/MM/DD'),to_date('19/08/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (169,44,'이연임','이연임의 집1','043-820-7803','27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (170,44,'이연임','이연임의 집2','043-820-7803','08505','서울특별시 금천구','가산디지털10로 95',to_date('19/09/15','RR/MM/DD'),to_date('19/09/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (171,44,'이연임','이연임의 집3','043-820-7803','08505','서울특별시 강남구','가산디지털2로 200',to_date('19/09/25','RR/MM/DD'),to_date('19/09/25','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (172,44,'이연임','이연임의 집4','043-820-7803','08505','서울특별시 중구','가산디지털2로 30',to_date('19/10/05','RR/MM/DD'),to_date('19/10/05','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (173,45,'조미순','조미순의 집1','033-570-5322','25929','강원 삼척시','남양길 41-92 (남양동 344-5)',to_date('19/12/09','RR/MM/DD'),to_date('19/12/09','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (174,45,'조미순','조미순의 집2','033-570-5322','08505','서울특별시 금천구','가산디지털10로 95',to_date('19/12/19','RR/MM/DD'),to_date('19/12/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (175,45,'조미순','조미순의 집3','033-570-5322','08505','서울특별시 강남구','가산디지털2로 200',to_date('19/12/29','RR/MM/DD'),to_date('19/12/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (176,45,'조미순','조미순의 집4','033-570-5322','08505','서울특별시 중구','가산디지털2로 30',to_date('20/01/08','RR/MM/DD'),to_date('20/01/08','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (177,46,'양지수','양지수의 집1','061-750-6562','57939','전남 순천시','비행장길18 (매곡동 1)',to_date('20/05/02','RR/MM/DD'),to_date('20/05/02','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (178,46,'양지수','양지수의 집2','061-750-6562','08505','서울특별시 금천구','가산디지털10로 95',to_date('20/05/12','RR/MM/DD'),to_date('20/05/12','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (179,46,'양지수','양지수의 집3','061-750-6562','08505','서울특별시 강남구','가산디지털2로 200',to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (180,46,'양지수','양지수의 집4','061-750-6562','08505','서울특별시 중구','가산디지털2로 30',to_date('20/06/01','RR/MM/DD'),to_date('20/06/01','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (181,47,'임소연','임소연의 집1','063-220-7907','54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)',to_date('20/11/20','RR/MM/DD'),to_date('20/11/20','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (182,47,'임소연','임소연의 집2','063-220-7907','08505','서울특별시 금천구','가산디지털10로 95',to_date('20/11/30','RR/MM/DD'),to_date('20/11/30','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (183,47,'임소연','임소연의 집3','063-220-7907','08505','서울특별시 강남구','가산디지털2로 200',to_date('20/12/10','RR/MM/DD'),to_date('20/12/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (184,47,'임소연','임소연의 집4','063-220-7907','08505','서울특별시 중구','가산디지털2로 30',to_date('20/12/20','RR/MM/DD'),to_date('20/12/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (185,48,'이희정','이희정의 집1','055-213-0133','51439','경남 창원시','의창구 상남로 261 (신월동 103-2)',to_date('20/12/31','RR/MM/DD'),to_date('20/12/31','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (186,48,'이희정','이희정의 집2','055-213-0133','08505','서울특별시 금천구','가산디지털10로 95',to_date('21/01/10','RR/MM/DD'),to_date('21/01/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (187,48,'이희정','이희정의 집3','055-213-0133','08505','서울특별시 강남구','가산디지털2로 200',to_date('21/01/20','RR/MM/DD'),to_date('21/01/20','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (188,48,'이희정','이희정의 집4','055-213-0133','08505','서울특별시 중구','가산디지털2로 30',to_date('21/01/30','RR/MM/DD'),to_date('21/01/30','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (189,49,'정민주','정민주의 집1','043-730-0814','29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)',to_date('21/03/08','RR/MM/DD'),to_date('21/03/08','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (190,49,'정민주','정민주의 집2','043-730-0814','08505','서울특별시 금천구','가산디지털10로 95',to_date('21/03/18','RR/MM/DD'),to_date('21/03/18','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (191,49,'정민주','정민주의 집3','043-730-0814','08505','서울특별시 강남구','가산디지털2로 200',to_date('21/03/28','RR/MM/DD'),to_date('21/03/28','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (192,49,'정민주','정민주의 집4','043-730-0814','08505','서울특별시 중구','가산디지털2로 30',to_date('21/04/07','RR/MM/DD'),to_date('21/04/07','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (193,50,'김다영','김다영의 집1','041-930-2958','33492','충남 보령시','해안로 189 (내항동 1090)',to_date('21/12/05','RR/MM/DD'),to_date('21/12/05','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (194,50,'김다영','김다영의 집2','041-930-2958','08505','서울특별시 금천구','가산디지털10로 95',to_date('21/12/15','RR/MM/DD'),to_date('21/12/15','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (195,50,'김다영','김다영의 집3','041-930-2958','08505','서울특별시 강남구','가산디지털2로 200',to_date('21/12/25','RR/MM/DD'),to_date('21/12/25','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (196,50,'김다영','김다영의 집4','041-930-2958','08505','서울특별시 중구','가산디지털2로 30',to_date('22/01/04','RR/MM/DD'),to_date('22/01/04','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (197,51,'연제문','연제문의 집1','042-366-8341','35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)',to_date('22/01/11','RR/MM/DD'),to_date('22/01/11','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (198,51,'연제문','연제문의 집2','042-366-8341','08505','서울특별시 금천구','가산디지털10로 95',to_date('22/01/21','RR/MM/DD'),to_date('22/01/21','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (199,51,'연제문','연제문의 집3','042-366-8341','08505','서울특별시 강남구','가산디지털2로 200',to_date('22/01/31','RR/MM/DD'),to_date('22/01/31','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (200,51,'연제문','연제문의 집4','042-366-8341','08505','서울특별시 중구','가산디지털2로 30',to_date('22/02/10','RR/MM/DD'),to_date('22/02/10','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (201,52,'주재영','주재영의 집1','033-640-3910','25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)',to_date('22/04/26','RR/MM/DD'),to_date('22/04/26','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (202,52,'주재영','주재영의 집2','033-640-3910','08505','서울특별시 금천구','가산디지털10로 95',to_date('22/05/06','RR/MM/DD'),to_date('22/05/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (203,52,'주재영','주재영의 집3','033-640-3910','08505','서울특별시 강남구','가산디지털2로 200',to_date('22/05/16','RR/MM/DD'),to_date('22/05/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (204,52,'주재영','주재영의 집4','033-640-3910','08505','서울특별시 중구','가산디지털2로 30',to_date('22/05/26','RR/MM/DD'),to_date('22/05/26','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (205,53,'김현진','김현진의 집1','033-639-6800','24854','강원 속초시','청초호반로 211 (교동 668-26)',to_date('22/10/17','RR/MM/DD'),to_date('22/10/17','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (206,53,'김현진','김현진의 집2','033-639-6800','08505','서울특별시 금천구','가산디지털10로 95',to_date('22/10/27','RR/MM/DD'),to_date('22/10/27','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (207,53,'김현진','김현진의 집3','033-639-6800','08505','서울특별시 강남구','가산디지털2로 200',to_date('22/11/06','RR/MM/DD'),to_date('22/11/06','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (208,53,'김현진','김현진의 집4','033-639-6800','08505','서울특별시 중구','가산디지털2로 30',to_date('22/11/16','RR/MM/DD'),to_date('22/11/16','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (209,54,'심인숙','심인숙의 집1','063-430-3900','55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)',to_date('23/04/09','RR/MM/DD'),to_date('23/04/09','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (210,54,'심인숙','심인숙의 집2','063-430-3900','08505','서울특별시 금천구','가산디지털10로 95',to_date('23/04/19','RR/MM/DD'),to_date('23/04/19','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (211,54,'심인숙','심인숙의 집3','063-430-3900','08505','서울특별시 강남구','가산디지털2로 200',to_date('23/04/29','RR/MM/DD'),to_date('23/04/29','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (212,54,'심인숙','심인숙의 집4','063-430-3900','08505','서울특별시 중구','가산디지털2로 30',to_date('23/05/09','RR/MM/DD'),to_date('23/05/09','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (213,55,'김민지','김민지의 집1','043-841-0431','27353','충북 충주시','계명대로 271 (연수동 1645)',to_date('23/06/13','RR/MM/DD'),to_date('23/06/13','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (214,55,'김민지','김민지의 집2','043-841-0431','08505','서울특별시 금천구','가산디지털10로 95',to_date('23/06/23','RR/MM/DD'),to_date('23/06/23','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (215,55,'김민지','김민지의 집3','043-841-0431','08505','서울특별시 강남구','가산디지털2로 200',to_date('23/07/03','RR/MM/DD'),to_date('23/07/03','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (216,55,'김민지','김민지의 집4','043-841-0431','08505','서울특별시 중구','가산디지털2로 30',to_date('23/07/13','RR/MM/DD'),to_date('23/07/13','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (217,56,'신상아','신상아의 집1','063-440-6000','54102','전북 군산시','남수송5길 8-3 (수송동 792-7)',to_date('23/11/04','RR/MM/DD'),to_date('23/11/04','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (218,56,'신상아','신상아의 집2','063-440-6000','08505','서울특별시 금천구','가산디지털10로 95',to_date('23/11/14','RR/MM/DD'),to_date('23/11/14','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (219,56,'신상아','신상아의 집3','063-440-6000','08505','서울특별시 강남구','가산디지털2로 200',to_date('23/11/24','RR/MM/DD'),to_date('23/11/24','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (220,56,'신상아','신상아의 집4','063-440-6000','08505','서울특별시 중구','가산디지털2로 30',to_date('23/12/04','RR/MM/DD'),to_date('23/12/04','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (221,57,'안수영','안수영의 집1','054-280-9132','37688','경북 포항시','북구 용흥로 28번길 9',to_date('23/12/23','RR/MM/DD'),to_date('23/12/23','RR/MM/DD'),'Y');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (222,57,'안수영','안수영의 집2','054-280-9132','08505','서울특별시 금천구','가산디지털10로 95',to_date('24/01/02','RR/MM/DD'),to_date('24/01/02','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (223,57,'안수영','안수영의 집3','054-280-9132','08505','서울특별시 강남구','가산디지털2로 200',to_date('24/01/12','RR/MM/DD'),to_date('24/01/12','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (224,57,'안수영','안수영의 집4','054-280-9132','08505','서울특별시 중구','가산디지털2로 30',to_date('24/01/22','RR/MM/DD'),to_date('24/01/22','RR/MM/DD'),'N');
Insert into DELIVERY (DELIVERY_NO,DELIVERY_USER_NO,DELIVERY_NAME,DELIVERY_RECEIVER,PHONE,POST,ADDRESS,ADDRESS_DETAIL,ENROLL_DATE,MODIFY_DATE,STATUS) values (225,2,null,'집','010-2222-3333','08500','서울 금천구 가마산로 72','ㅈㄷㅈㄷㅈㄷ',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
REM INSERTING into EVENT
SET DEFINE OFF;
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (1,'이벤트제목입니다.1',null,null,null,'Y','Y');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (2,'이벤트제목입니다.2',null,null,null,'Y','Y');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (3,'이벤트제목입니다.3',null,null,null,'Y','Y');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (4,'이벤트제목입니다.4',null,null,null,'Y','Y');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (5,'이벤트제목입니다.5',null,null,null,'N','Y');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (6,'이벤트제목입니다.6',null,null,null,'N','N');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (7,'이벤트제목입니다.7',null,null,null,'N','N');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (8,'이벤트제목입니다.8',null,null,null,'N','N');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (9,'이벤트제목입니다.9',null,null,null,'N','N');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (10,'이벤트제목입니다.10',null,null,null,'N','N');
Insert into EVENT (EVENT_NO,EVENT_TITLE,START_DATE,END_DATE,ENROLL_DATE,EVENT_SHOW,STATUS) values (11,'이벤트',to_date('24/03/28','RR/MM/DD'),to_date('24/04/04','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','Y');
REM INSERTING into EVENT_PRODUCT
SET DEFINE OFF;
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (1,117,1);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (2,118,2);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (3,119,3);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (4,120,4);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (5,148,5);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (6,149,6);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (7,150,7);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (8,151,8);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (9,154,9);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (10,155,10);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (1,1,1);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (2,288,2);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (3,280,3);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (4,278,4);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (5,30,5);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (6,50,6);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (7,220,7);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (8,20,8);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (9,25,9);
Insert into EVENT_PRODUCT (EVENT_NO,PRO_NO,DISCOUNT) values (10,70,10);
REM INSERTING into FAQ
SET DEFINE OFF;
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (1,'주문 취소하면 적립금/쿠폰도 원상복구가 되나요?','주문 취소시 결제 금액 환불과 함께 적립금과 쿠폰이 원상복구 됩니다. 

다음에 주문하실 때 사용하실 수 있습니다.',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (2,'결제를 했는데 아직도 입금확인중이라고 뜹니다.','카드나 계좌이체 선택시 
고객님의 결제가 확인이 되었는데 입금 확인중이라고 뜨면, 
반드시 포마이펫 고객센터(02-1234-5678) 
또는 [1:1 문의하기]로 관련 내용을 접수해 주시기 바랍니다. 

무통장 입금시 입금 하시는 분의 성함이 달라도, 
계좌번호와 금액이 정확하면 입금확인이 가능하며 
초과입금을 하셨거나, 계좌번호를 잘못기재하여 입금을 하셨을 경우에는 
문의주시거나 1:1 상담에 글을 남겨주시면, 
확인 후 처리해드리도록 하겠습니다.  ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (3,'주문한 내용이나 수령인정보를 변경하려면 어떻게 해야 하나요?','이미 주문완료 후에는 상품변경은 안되며 전체취소 후 새로 주문을 해주셔야 합니다.
상품발송 상태 이후에는 변경, 취소가 불가능합니다. 
주문을 취소하실 경우에도 가능한 빨리 의사를 표현해 주셔야 합니다. 

주문건의 상태가 결제전, 결제확인 상태일 경우 
먼저 고객센터(02-1234-5678)를 통해 발송 여부를 확인하여 
수령인 정보 변경 관련하여 접수해 주시면 됩니다.  ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (4,'반품 할 상품을 직접 보내도 되나요?','반품 사유와 상품에 따라 차이가 있으니 
먼저 고객센터(02-1234-5678)에 반품 접수를 해주시고, 
접수시 안내받은 방법으로 반품 해주시기 바랍니다. 
반품접수 없이 임의로 반송한 경우 신속한 확인을 할 수 없으므로 
환불이 지연되거나 환불이 되지 않을 수 있으니 이 점 꼭 양지해 주시기 바랍니다. ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (5,'회원ID와 패스워드를 잊어버렸어요.','ID와 Password를 잊어버렸을 경우에는, 쇼핑몰 상단의 [로그인] 버튼을 클릭하신후, 
하단에 [아이디 찾기] 또는 [비밀번호 찾기]버튼을 클릭하세요. 
절차에 따라 입력을 하시면, ID확인과 비밀번호 확인을 하실 수 있습니다. 

다시 로그인을 하신 후, 마이페이지에 접속하시어 
꼭 안전한 비밀번호로 새로이 변경하시는걸 권장합니다. ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (6,'적립금은 어떻게 사용하나요?','상품 주문시, 결제창에서 적립금을  원하시는 사용금액 입력후 결제해주시면 됩니다. 

*적립금은 마이페이지에서 확인 가능합니다. ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (7,'주문한상품이 품절되었다는 연락을 받았어요.','품절로 불편함을 드리게 되어 정말 죄송합니다. 
품절상품으로 인한 환불시 발생하는 배송비, 수수료는 저희 부담으로, 교환이나 환불 가능합니다. 
품절상품에 대한 환불방법은 고객님께서 결제해주신 수단으로 각각 환불 처리 도와드리고 있습니다. ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (8,'반품 처리 기간은 어느정도 소요되나요?','택배기사님이 상품을 수거해간 후 물류센터에 도착하기까지 영업일기준 2~5일정도 소요되며 

교환/반품 양식서 처리내용이 정확히 기재된 경우 
보내주신 상품이 물류센터에 도착한 날로부터 접수/환불까지는 영업일기준 2-5일 정도 소요됩니다.',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (9,'회원정보 변경은 어떻게 하나요?','"로그인 하신 후  "내정보수정"에서 하실 수 있습니다. 
단, 배송지 정보를 변경하시기 위해서 회원정보 수정란에서 주소를 변경하시더라도 
회원정보의 주소와 배송지는 달리 취급되기 때문에, 배송지 추가/변경/삭제에 대한 처리는 
마이페이지 - 배송지 관리에서 정보 변경 해주시길 바랍니다. 

이미 상품을 주문하신 후 배송지를 변경하시더라도 
주문 당시에 기재하셨던 배송지는 변경되지 않으니 고객센터로 문의 주시기 바랍니다."

수정수정',to_date('23/12/11','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
Insert into FAQ (FAQ_NO,FAQ_TITLE,FAQ_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (28,'작성작성','작성작성',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y');
REM INSERTING into MACRO
SET DEFINE OFF;
Insert into MACRO (MACRO_NO,MACRO_CONTENT) values (1,'좋은 리뷰 감사합니다!');
Insert into MACRO (MACRO_NO,MACRO_CONTENT) values (2,'죄송합니다ㅠㅠ 더 나은 포마이펫이 되겠습니다');
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (1,'admin','admin','관리자','1900/01/01',null,null,'02-1234-5678','관리자 계정',null,null,to_date('10/01/01','RR/MM/DD'),to_date('10/01/01','RR/MM/DD'),'A',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (2,'user1','1234','김승건','1997/4/9','F','user1050@email.com','044-850-5314','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','30121',to_date('10/03/15','RR/MM/DD'),to_date('10/03/15','RR/MM/DD'),'Y',0,1,null,'C','태양','아비시니안',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (3,'user2','1234','오상은','1985/9/10','F','user1028@email.com','063-530-6931','전북 정읍시','서부산업도로 502 (수성동 985-3)','56171',to_date('10/05/05','RR/MM/DD'),to_date('10/05/05','RR/MM/DD'),'Y',0,0,null,'D','고씨','말티즈',6,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (4,'user3','1234','김성희','1992/10/1','F','user1010@email.com','031-936-5115','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','10497',to_date('10/09/29','RR/MM/DD'),to_date('10/09/29','RR/MM/DD'),'Y',0,1,null,'D','뿌리','요크셔 테리어',2,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (5,'user4','1234','임정은','1995/4/27','M','user1046@email.com','043-299-6022','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','28462',to_date('10/12/17','RR/MM/DD'),to_date('10/12/17','RR/MM/DD'),'Y',0,0,null,'D','레오','스피츠',3,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (6,'user5','1234','나미리','1999/3/3','M','user1020@email.com','062-370-6114','광주광역시 서구','천변우하로 391(동천동 584) ','61902',to_date('11/02/11','RR/MM/DD'),to_date('11/02/11','RR/MM/DD'),'Y',0,0,null,'D','짱구','스피츠',3,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (7,'user6','1234','임지호','1995/2/13','F','user1042@email.com','041-406-2213','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','32255',to_date('11/03/22','RR/MM/DD'),to_date('11/03/22','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (8,'user7','helloworld1234','박정은','1983/12/4','F','user1045@email.com','041-660-8105','충남 서산시','석림1로 67 (석림동 793-3)','32000',to_date('11/06/28','RR/MM/DD'),to_date('11/06/28','RR/MM/DD'),'Y',1,1,null,'C','미스터','페르시안',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (9,'user8','pass1234','박현정','1980/10/30','F','user1004@email.com','032-460-2733','경기 부천시','경인로 117번길 10, 삼정프라자 302호','14723',to_date('11/09/06','RR/MM/DD'),to_date('11/09/06','RR/MM/DD'),'Y',0,1,null,'D','토리','코카 스파니엘',2,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (10,'user9','123456','고미옥','1990/10/15','M','user1001@email.com','02-2110-7713','서울 서초구','방배천로 91, 구암타워 지하1층','06675',to_date('11/11/07','RR/MM/DD'),to_date('11/11/07','RR/MM/DD'),'Y',1,1,null,'D','루루','샴',1,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (11,'user10','securepass1234','박성춘','1988/4/27','M','user1040@email.com','055-344-2503',' 경남 김해시','계동로 195(장유2동 298-10)','51004',to_date('12/01/09','RR/MM/DD'),to_date('12/01/09','RR/MM/DD'),'Y',0,1,null,'D','햇님','시츄',4,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (12,'user11','password123','최정미','1993/12/12','F','user1012@email.com','053-609-6534','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','41422',to_date('12/02/23','RR/MM/DD'),to_date('12/02/23','RR/MM/DD'),'Y',0,0,null,'C','루루','아메리칸 숏헤어',2,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (13,'user12','abcd1234abcd','서세승','1983/12/31','M','user1038@email.com','055-760-8845','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','50147',to_date('12/06/15','RR/MM/DD'),to_date('12/06/15','RR/MM/DD'),'Y',0,0,null,'D','구름이','말티즈',2,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (14,'user13','abcd12345','김보경','1992/6/25','F','user1019@email.com','054-530-6515','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','37179',to_date('12/07/08','RR/MM/DD'),to_date('12/07/08','RR/MM/DD'),'Y',1,1,null,'D','보리','포메라니안',1,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (15,'user14','abcd12345678','권민희','1992/4/7','F','user1034@email.com','052-279-4015','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','44715',to_date('12/09/07','RR/MM/DD'),to_date('12/09/07','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (16,'user15','abcd1234','성정희','1998/3/10','F','user1006@email.com','031-659-0400','경기도 평택시','비전2로 77(비전동 1002) 2층','17851',to_date('12/12/19','RR/MM/DD'),to_date('12/12/19','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (17,'user16','helloworld123','천민경','1998/10/4','F','user1039@email.com','055-640-0713','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','53028',to_date('13/07/19','RR/MM/DD'),to_date('13/07/19','RR/MM/DD'),'Y',1,1,null,'D','코코','요크셔 테리어',3,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (18,'user17','12345678abcdef','전은남','1995/10/28','M','user1056@email.com','033-370-5200','강원 영월군','영월읍 중앙로202(덕포리600) ','26231',to_date('13/09/22','RR/MM/DD'),to_date('13/09/22','RR/MM/DD'),'Y',0,0,null,'C','쿠키','아메리칸 숏헤어',2,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (19,'user18','abcdefg','전진희','1986/10/18','F','user1014@email.com','054-820-0103','경북 안동시','마들6길 62 (용상동 1517-250)','36725',to_date('13/10/01','RR/MM/DD'),to_date('13/10/01','RR/MM/DD'),'Y',0,0,null,'D','또치','요크셔 테리어',1,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (20,'user19','securepass123','양지수','1993/2/17','F','user1023@email.com','061-750-6562','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','59691',to_date('14/04/07','RR/MM/DD'),to_date('14/04/07','RR/MM/DD'),'Y',1,1,null,'D','징징','치와와',5,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (21,'user20','securepass1','윤성일','1998/3/30','M','user1018@email.com','054-459-6552','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','39210',to_date('14/08/21','RR/MM/DD'),to_date('14/08/21','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (22,'user21','12345abcde','박영희','1990/12/30','F','user1026@email.com','061-850-6120','전남 보성군','보성읍 동인길 31 (보성리 232-5)','59455',to_date('14/10/06','RR/MM/DD'),to_date('14/10/06','RR/MM/DD'),'Y',0,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (23,'user22','securepass','최유림','1999/2/14','F','user1008@email.com','031-640-9411','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','17363',to_date('14/11/29','RR/MM/DD'),to_date('14/11/29','RR/MM/DD'),'Y',0,0,null,'D','밍밍','푸들',6,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (24,'user23','securepwd','박하얀','1991/12/2','M','user1007@email.com','031-780-0614','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','13311',to_date('15/03/17','RR/MM/DD'),to_date('15/03/17','RR/MM/DD'),'Y',1,1,null,'D','미미','스피츠',1,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (25,'user24','securepass123456','김소연','1994/2/5','M','user1052@email.com','033-769-3701','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','26460',to_date('15/06/08','RR/MM/DD'),to_date('15/06/08','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (26,'user25','password','박지현','1992/7/7','M','user1003@email.com','032-460-2617','인천 남동구','인하로 507번길 66 (구월1동 1460)','21573',to_date('15/07/25','RR/MM/DD'),to_date('15/07/25','RR/MM/DD'),'Y',1,1,null,'C','참치','러시안 블루',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (27,'user26','password12345','이주연','1998/9/27','M','user1025@email.com','010-1522-3232','대전 유성구',' 대덕대로 516 38층','34121',to_date('15/09/20','RR/MM/DD'),to_date('15/09/20','RR/MM/DD'),'Y',1,1,null,'D','떼껄룩','푸들',3,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (28,'user27','abcd123456','백현희','1985/6/11','M','user1024@email.com','061-430-6120','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','59240',to_date('15/11/18','RR/MM/DD'),to_date('15/11/18','RR/MM/DD'),'Y',0,0,null,'D','쿠키','말티푸',6,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (29,'user28','passwordabcdef','김동범','1982/9/16','M','user1043@email.com','041-520-9254','충남 천안시','서북구 오성로 89 (두정동 839)','31107',to_date('16/05/30','RR/MM/DD'),to_date('16/05/30','RR/MM/DD'),'Y',1,1,null,'D','타이거','퍼그',7,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (30,'user29','abcdef','이진','1985/3/20','F','user1002@email.com','02-6327-3943','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','03072',to_date('16/07/16','RR/MM/DD'),to_date('16/07/16','RR/MM/DD'),'Y',0,0,null,'D','토리','코코넛 테리어',2,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (31,'user30','pass12345678','전현주','1995/5/15','M','user1036@email.com','055-213-0124','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','50234',to_date('16/08/20','RR/MM/DD'),to_date('16/08/20','RR/MM/DD'),'Y',0,0,null,'D','뿌요','비숑 프리제',7,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (32,'user31','abcdefg123','서정숙','1997/1/19','M','user1031@email.com','063-630-6022','전북 남원시','요천로 1393 (천거동 160-5)','55777',to_date('16/11/01','RR/MM/DD'),to_date('16/11/01','RR/MM/DD'),'Y',1,1,null,'D','키키','비글',2,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (33,'user32','1234abcd1234','박소영','1981/12/22','F','user1032@email.com','064-728-5803','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','63219',to_date('17/03/18','RR/MM/DD'),to_date('17/03/18','RR/MM/DD'),'Y',0,0,null,'D','뽀로로','푸들',3,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (34,'user33','password12345678','류미란','1990/6/18','F','user1037@email.com','055-760-8841','경남 진주시','진주대로 963 (강남동 145)','52709',to_date('17/08/27','RR/MM/DD'),to_date('19/10/27','RR/MM/DD'),'N',1,1,to_date('19/10/27','RR/MM/DD'),'D','뭉이','퍼그',1,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (35,'user34','pass123','김선옥','1996/4/17','M','user1009@email.com','031-860-3502','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','11610',to_date('17/10/11','RR/MM/DD'),to_date('17/10/11','RR/MM/DD'),'Y',1,1,null,'C','토끼','뱅갈 고양이',2,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (36,'user35','12345678','윤연주','1984/9/5','M','user1013@email.com','053-609-6542','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','38549',to_date('17/12/27','RR/MM/DD'),to_date('17/12/27','RR/MM/DD'),'Y',1,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (37,'user36','password1234567','정선인','1987/7/14','M','user1033@email.com','051-850-5532','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','47605',to_date('18/01/01','RR/MM/DD'),to_date('18/01/01','RR/MM/DD'),'Y',1,1,null,'D','다람이','닥스훈트',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (38,'user37','passworld','김교희','1990/1/9','M','user1017@email.com','054-780-5811','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','36323',to_date('18/04/15','RR/MM/DD'),to_date('18/04/15','RR/MM/DD'),'Y',1,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (39,'user38','password1','신윤정','1998/7/23','M','user1015@email.com','054-870-5703','경북 청송군','진보면 못안길 14 (이촌리 613-14)','37406',to_date('18/05/31','RR/MM/DD'),to_date('22/05/03','RR/MM/DD'),'N',1,1,to_date('22/05/03','RR/MM/DD'),'D','뿌로로','시츄',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (40,'user39','abcd12345abcde','최아람','1987/6/22','M','user1051@email.com','033-258-3675','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','24233',to_date('18/06/28','RR/MM/DD'),to_date('18/06/28','RR/MM/DD'),'Y',1,1,null,'D','뽀송이','시츄',1,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (41,'user40','hello123','이희석','1995/11/25','M','user1005@email.com','031-230-0706','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','16491',to_date('18/08/18','RR/MM/DD'),to_date('18/08/18','RR/MM/DD'),'Y',1,1,null,'D','코코','믹스견',5,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (42,'user41','helloworld','이정아','1988/7/28','M','user1011@email.com','031-560-7011','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','11952',to_date('19/01/21','RR/MM/DD'),to_date('19/01/21','RR/MM/DD'),'Y',0,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (43,'user42','1234abcd','주정희','1986/3/6','F','user1021@email.com','061-260-6120','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','58564',to_date('19/07/29','RR/MM/DD'),to_date('19/07/29','RR/MM/DD'),'Y',0,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (44,'user43','password12345678','이연임','1991/8/26','M','user1049@email.com','043-820-7803','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','27931',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'),'Y',1,1,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (45,'user44','abcd123456789','조미순','1991/9/15','M','user1055@email.com','033-570-5322','강원 삼척시','남양길 41-92 (남양동 344-5)','25929',to_date('19/12/09','RR/MM/DD'),to_date('19/12/09','RR/MM/DD'),'Y',1,1,null,'D','삐쭈','시바 이누',5,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (46,'user45','helloworld1','양지수','1981/11/19','M','user1022@email.com','061-750-6562','전남 순천시','비행장길18 (매곡동 1)','57939',to_date('20/05/02','RR/MM/DD'),to_date('20/05/02','RR/MM/DD'),'Y',0,0,null,'D','뿌꾸','사모예드',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (47,'user46','abcdef12345','임소연','1993/3/15','M','user1027@email.com','063-220-7907','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','54966',to_date('20/11/20','RR/MM/DD'),to_date('20/11/20','RR/MM/DD'),'Y',1,1,null,'D','미우','퍼그',5,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (48,'user47','abcdefg1234','이희정','1987/9/30','M','user1035@email.com','055-213-0133','경남 창원시','의창구 상남로 261 (신월동 103-2)','51439',to_date('20/12/31','RR/MM/DD'),to_date('20/12/31','RR/MM/DD'),'Y',1,1,null,'C','레오','라팜',4,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (49,'user48','123456789abcde','정민주','1990/12/10','F','user1047@email.com','043-730-0814','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','29046',to_date('21/03/08','RR/MM/DD'),to_date('21/03/08','RR/MM/DD'),'Y',1,1,null,'D','콩이','시바 이누',4,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (50,'user49','abcd1234abcde','김다영','1991/7/29','M','user1044@email.com','041-930-2958','충남 보령시','해안로 189 (내항동 1090)','33492',to_date('21/12/05','RR/MM/DD'),to_date('21/12/05','RR/MM/DD'),'Y',0,0,null,'D','해피','사모예드',1,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (51,'user50','1234567890abc','연제문','1993/2/20','M','user1041@email.com','042-366-8341','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','35220',to_date('22/01/11','RR/MM/DD'),to_date('22/01/11','RR/MM/DD'),'Y',1,1,null,'C','뿌잉','스노우슈',1,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (52,'user51','password123456789','주재영','1988/5/18','F','user1053@email.com','033-640-3910','강원 강릉시','화부산로40번길 49 (교1동 846-7)','25502',to_date('22/04/26','RR/MM/DD'),to_date('23/05/26','RR/MM/DD'),'N',1,1,to_date('23/05/26','RR/MM/DD'),'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (53,'user52','abcdef12345678','김현진','1996/3/2','F','user1054@email.com','033-639-6800','강원 속초시','청초호반로 211 (교동 668-26)','24854',to_date('22/10/17','RR/MM/DD'),to_date('22/10/17','RR/MM/DD'),'Y',1,0,null,'C','찰리','시암',2,'F');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (54,'user53','password123456','심인숙','1999/10/23','M','user1029@email.com','063-430-3900','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','55422',to_date('23/04/09','RR/MM/DD'),to_date('23/04/09','RR/MM/DD'),'Y',1,1,null,'D','행복이','비글',7,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (55,'user54','abcdef1234567','김민지','1983/3/23','M','user1048@email.com','043-841-0431','충북 충주시','계명대로 271 (연수동 1645)','27353',to_date('23/06/13','RR/MM/DD'),to_date('23/06/13','RR/MM/DD'),'Y',0,0,null,'D','보리','비숑 프리제',5,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (56,'user55','1234567890','신상아','1987/11/6','F','user1030@email.com','063-440-6000','전북 군산시','남수송5길 8-3 (수송동 792-7)','54102',to_date('23/11/04','RR/MM/DD'),to_date('23/11/04','RR/MM/DD'),'Y',0,0,null,'N',null,null,null,null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (57,'user56','hellopass','안수영','1995/11/12','F','user1016@email.com','054-280-9132','경북 포항시','북구 용흥로 28번길 9','37688',to_date('23/12/23','RR/MM/DD'),to_date('23/12/23','RR/MM/DD'),'N',0,0,null,'D','곰돌이','비숑 프리제',5,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (58,'test02','mjp12345','구디','2024-03-20',null,'goodi@undefined','010-2222-3333','서울 동대문구 안암로 6','ddddd','02581',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y',1,1,null,'C','쿠키',null,7,'M');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_BIRTH,GENDER,EMAIL,PHONE,ADDRESS,ADDRESS_DETAIL,ADDRESS_POST,ENROLL_DATE,MODIFY_DATE,STATUS,STATUS_SNS,STATUS_EMAIL,RESIGN_DATE,PET_TYPE,PET_NAME,PET_KIND,PET_AGE,PET_GENDER) values (59,'godee1','1q2w3e4r','김구디','2000/3/1','F',null,'010-2222-3333','대전 동구 판교1길 3','rrrrr','34672',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y',1,0,null,'N',null,null,0,'M');
REM INSERTING into NOTICE
SET DEFINE OFF;
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (1,1,'반려동물용품 전문 쇼핑몰 포마이펫이 인사드립니다!','안녕하세요 포마이펫입니다. 
많은 이용 부탁드립니다 감사합니다 :) ',to_date('23/12/11','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (2,1,'[포마이펫] 폭설로 인한 경기/강원 일부지역 배송 휴무 안내','안녕하세요. 포마이펫입니다. 

폭설로 인한 경기 일부지역과 강원 일부 지역에 대한 배송 휴무 안내 드립니다. 

-1/23 (화) 폭설로 인한 휴무 

해당 기간동안 각 서비스 이용이 어려운 점 양해 부탁드리며 주문 시 참고해주시기 바랍니다. 

- 감사합니다. 포마이펫 일동 -',to_date('24/01/23','RR/MM/DD'),to_date('24/01/23','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (3,1,'[포마이펫][2024년 설명절] 휴무기간 및 배송지연 안내','2024/02/09 ~ 2024.02.12 설날 연휴로 인해 배송 업무가 지연 됨이 불가피해 
부득이하게 포마이펫이 휴무 기간을 갖게 되었습니다. 

~2월 6일 주문 건까지 당일 배송 예정이며, 
이후 주문 건은 배송이 지연되오니 이점 양해 부탁드립니다. 
설 명절 연휴로 인해 택배사 사정으로 상품 수거 또한 지연됩니다. 

- 행복한 설 연휴 되세요! 포마이펫 일동 -',to_date('24/02/01','RR/MM/DD'),to_date('24/02/01','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (4,1,'[포마이펫] 3/1 배송휴무 안내','안녕하세요. 포마이펫입니다. 

3/1 삼일절로 인해 택배사 배송 업무가 중단되니 이 점 양해 부탁드립니다. 

- 감사합니다! 포마이펫 일동 -',to_date('24/02/23','RR/MM/DD'),to_date('24/02/23','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (5,1,'[포마이펫] 서버 안정화 및 개선 작업 공지','안녕하세요. 반려동물을 사랑하는 포마이펫입니다. 

현재 포마이펫 서버 안정화 및 개선 작업으로 인해 포마이펫 사이트 이용이 불가합니다. 
서버 관련 작업으로 불편을 드리게 되어 너무 죄송합니다. 
보완 및 점검으로 댕냥이들 생각하는 고객님들이 
더욱 더 편리한 서비스를 이용하실 수 있도록 노력하겠습니다. 

서버 작업동안 고객센터는 이상 없이 운영될 예정으로 
궁금하신 점 있으시면 02-1234-5678 또는 cs@fomypet.co.kr로 
문의주시면 최대한 빠른 답변 드리겠습니다. 
서버 작업 후 접속 폭주에도 끄떡 없는 포마이펫으로 돌아오겠습니다. 

- 감사합니다! 포마이펫 일동 -',to_date('24/02/28','RR/MM/DD'),to_date('24/02/28','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (6,1,'[포마이펫] 서버 안정화 및 개선 작업 완료','안녕하세요. 포마이펫입니다. 

현재 시간 기준으로 
포마이펫 서버 안정화 및 개선 작업 완료되어 포마이펫 이용이 가능합니다. 

서버 작업으로 인해 불편을 드려 죄송하다는 말씀드리며 
앞으로도 더 나은 포마이펫을 위해 노력하겠습니다 :) 

혹시라도 궁금하신 점이 있으시다면 
1:1문의 또는 02-1234-5678, cs@formypet.co.kr로 문의주시면 
최대한 빠른 답변 드리겠습니다. 

- 감사합니다! 포마이펫 일동 -',to_date('24/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS) values (7,1,'[포마이펫][회원가입이벤트] ★지금 포마이펫 신규가입하면 적립금 3000원 즉시 지급★','반려동물용품 전문 쇼핑몰 포마이펫에서 알려드립니다! 

포마이펫을 사용해주시는 회원님들께 감사드리고자 약소하게나마 보답을 준비했습니다. 
지금 포마이펫 신규 회원가입 시 적립금 3000원을 즉시 지급합니다. 

가입 즉시 지급되는 적립금 3000원으로 더 즐거운 쇼핑되세요 :) 

- 감사합니다. 포마이펫 일동 -',to_date('24/03/25','RR/MM/DD'),to_date('24/03/25','RR/MM/DD'),'Y');
REM INSERTING into ORDER_DETAIL
SET DEFINE OFF;
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1,1,59,1,94000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (2,2,40,3,388500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (3,2,137,3,17700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (4,3,39,3,187500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (5,3,256,3,59700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (6,4,37,3,5400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (7,5,58,1,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (8,6,44,2,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (9,7,182,3,107700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (10,7,34,1,93000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (11,8,20,1,37000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (12,9,127,3,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (13,10,263,2,76000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (14,10,126,1,19000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (15,11,70,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (16,11,26,3,279000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (17,12,91,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (18,13,127,1,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (19,14,124,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (20,15,243,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (21,15,205,3,123000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (22,16,163,1,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (23,17,80,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (24,18,39,2,125000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (25,19,146,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (26,19,55,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (27,20,218,3,81000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (28,21,13,2,5600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (29,22,127,3,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (30,22,24,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (31,23,180,3,57000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (32,23,263,3,114000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (33,24,70,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (34,25,51,2,190000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (35,26,58,1,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (36,27,93,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (37,27,88,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (38,28,109,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (39,29,152,3,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (40,30,200,3,1266000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (41,30,265,2,76000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (42,31,47,3,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (43,31,195,1,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (44,32,90,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (45,33,73,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (46,33,181,2,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (47,34,191,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (48,35,18,2,74000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (49,35,193,3,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (50,36,94,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (51,36,39,1,62500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (52,37,234,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (53,38,183,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (54,39,244,1,3600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (55,39,192,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (56,39,132,1,34200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (57,40,100,3,265500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (58,40,29,2,212000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (59,41,63,1,45000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (60,41,69,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (61,42,164,2,45800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (62,42,66,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (63,42,186,1,13000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (64,43,79,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (65,43,22,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (66,44,250,1,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (67,45,253,2,199000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (68,45,162,2,376000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (69,46,248,2,27800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (70,47,36,2,3600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (71,47,223,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (72,48,121,2,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (73,48,167,3,250500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (74,49,253,3,298500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (75,50,108,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (76,50,23,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (77,51,208,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (78,51,205,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (79,51,238,1,35000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (80,52,105,3,79500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (81,53,22,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (82,54,56,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (83,54,46,3,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (84,54,45,1,67000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (85,55,167,2,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (86,55,284,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (87,56,239,3,66000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (88,57,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (89,57,176,1,4000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (90,58,19,2,156000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (91,59,20,2,74000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (92,59,284,2,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (93,60,54,3,432000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (94,60,275,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (95,61,175,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (96,62,108,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (97,62,119,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (98,63,231,3,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (99,63,91,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (100,63,193,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (101,64,47,2,32000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (102,65,17,1,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (103,66,250,3,29700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (104,66,139,1,34200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (105,67,18,3,111000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (106,67,91,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (107,68,16,1,37000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (108,69,28,1,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (109,69,40,1,129500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (110,69,275,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (111,70,23,2,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (112,71,270,3,57000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (113,71,6,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (114,72,43,2,259000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (115,72,44,2,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (116,72,126,3,57000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (117,73,65,1,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (118,74,154,2,32000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (119,75,235,2,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (120,75,132,1,34200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (121,75,117,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (122,76,168,3,406500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (123,77,163,3,234000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (124,77,111,3,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (125,78,22,2,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (126,78,201,1,422000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (127,78,67,2,182000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (128,79,77,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (129,79,157,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (130,80,144,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (131,81,187,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (132,81,62,2,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (133,82,25,2,190000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (134,82,248,2,27800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (135,83,91,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (136,83,103,3,37500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (137,84,64,1,83000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (138,84,117,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (139,85,172,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (140,86,90,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (141,87,162,2,376000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (142,87,275,3,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (143,87,255,2,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (144,88,113,2,80000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (145,88,213,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (146,89,234,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (147,90,230,1,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (148,90,134,1,13000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (149,91,237,2,70000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (150,91,262,1,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (151,92,235,3,90000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (152,93,105,3,79500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (153,93,127,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (154,94,257,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (155,95,117,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (156,95,12,2,5600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (157,96,211,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (158,96,132,2,68400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (159,97,102,3,432000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (160,98,128,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (161,99,79,3,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (162,99,217,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (163,99,287,1,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (164,99,114,1,4700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (165,100,138,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (166,100,46,1,28000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (167,101,270,2,38000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (168,102,65,1,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (169,102,140,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (170,102,190,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (171,102,255,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (172,103,46,3,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (173,103,233,2,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (174,103,58,1,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (175,104,11,1,2600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (176,105,125,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (177,105,64,2,166000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (178,106,49,1,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (179,107,149,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (180,107,22,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (181,107,128,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (182,108,77,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (183,108,108,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (184,109,122,3,6300,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (185,110,272,2,125800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (186,111,226,3,105000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (187,111,145,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (188,111,76,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (189,112,111,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (190,113,97,3,106200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (191,114,184,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (192,114,147,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (193,115,1,3,123000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (194,115,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (195,116,243,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (196,117,97,2,70800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (197,117,6,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (198,118,155,2,15400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (199,119,229,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (200,119,182,2,71800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (201,120,188,1,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (202,120,157,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (203,121,208,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (204,122,218,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (205,122,250,3,29700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (206,123,71,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (207,123,229,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (208,123,188,1,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (209,124,86,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (210,125,130,1,5500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (211,126,94,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (212,126,209,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (213,126,55,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (214,126,77,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (215,127,47,2,32000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (216,127,197,3,297000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (217,128,191,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (218,129,227,2,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (219,129,245,3,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (220,130,5,3,450000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (221,131,164,3,68700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (222,131,121,2,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (223,132,282,2,298000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (224,132,67,3,273000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (225,133,158,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (226,134,125,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (227,134,97,2,70800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (228,135,173,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (229,135,23,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (230,135,28,3,126000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (231,136,283,3,447000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (232,137,239,1,22000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (233,138,287,3,29700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (234,138,89,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (235,139,146,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (236,139,153,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (237,140,58,3,501000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (238,141,16,1,37000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (239,141,164,3,68700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (240,142,91,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (241,142,59,2,188000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (242,143,79,3,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (243,143,279,3,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (244,144,97,1,35400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (245,144,243,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (246,145,222,2,34000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (247,145,180,3,57000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (248,146,279,2,56000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (249,147,226,3,105000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (250,147,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (251,147,178,1,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (252,148,178,3,33000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (253,149,141,2,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (254,150,153,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (255,150,241,3,108000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (256,150,62,2,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (257,150,119,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (258,150,66,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (259,151,91,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (260,151,144,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (261,152,140,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (262,153,32,2,188000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (263,153,70,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (264,154,258,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (265,155,210,2,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (266,155,223,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (267,156,268,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (268,156,116,1,5500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (269,157,54,2,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (270,158,48,3,135000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (271,158,149,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (272,159,96,1,69000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (273,159,147,1,13000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (274,159,13,3,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (275,160,133,3,38700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (276,161,173,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (277,162,197,3,297000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (278,162,52,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (279,162,75,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (280,163,241,3,108000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (281,163,16,2,74000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (282,164,109,3,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (283,164,128,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (284,165,236,2,29800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (285,165,78,2,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (286,165,77,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (287,166,75,2,3800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (288,167,4,3,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (289,167,213,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (290,167,220,1,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (291,168,171,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (292,168,16,3,111000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (293,169,10,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (294,170,261,2,25600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (295,171,53,2,177000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (296,171,168,3,406500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (297,171,55,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (298,172,58,3,501000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (299,173,7,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (300,174,196,1,79000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (301,174,42,3,67800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (302,174,194,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (303,175,68,2,168000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (304,175,35,3,435000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (305,176,248,2,27800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (306,177,201,1,422000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (307,177,83,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (308,178,214,2,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (309,179,202,2,185000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (310,179,4,3,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (311,180,119,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (312,180,238,3,105000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (313,181,72,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (314,182,245,2,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (315,182,269,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (316,183,230,2,14000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (317,183,160,1,283000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (318,183,185,1,11900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (319,183,264,3,114000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (320,184,41,3,187500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (321,184,44,1,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (322,185,256,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (323,186,129,3,23700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (324,186,220,1,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (325,187,4,3,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (326,187,94,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (327,188,213,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (328,189,222,1,17000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (329,189,197,1,99000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (330,190,162,3,564000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (331,191,136,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (332,191,108,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (333,192,183,3,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (334,192,157,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (335,193,71,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (336,194,191,2,40000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (337,195,204,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (338,195,181,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (339,195,219,3,89400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (340,196,249,1,4000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (341,196,63,1,45000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (342,197,40,1,129500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (343,198,219,2,59600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (344,198,273,2,125800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (345,198,199,2,844000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (346,199,209,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (347,199,249,1,4000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (348,200,89,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (349,201,83,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (350,201,153,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (351,201,255,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (352,202,210,2,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (353,202,265,3,114000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (354,202,106,1,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (355,203,77,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (356,203,247,3,23700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (357,204,197,1,99000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (358,204,122,1,2100,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (359,205,27,2,100000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (360,206,218,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (361,207,39,2,125000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (362,207,51,2,190000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (363,207,93,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (364,208,30,2,61000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (365,209,187,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (366,210,220,3,13500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (367,210,19,2,156000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (368,211,67,2,182000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (369,211,118,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (370,212,187,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (371,213,153,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (372,213,277,3,162000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (373,214,115,2,9400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (374,215,2,1,88500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (375,215,191,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (376,216,220,1,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (377,216,122,3,6300,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (378,217,10,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (379,217,52,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (380,218,281,3,447000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (381,218,247,1,7900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (382,219,184,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (383,219,41,2,125000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (384,219,27,1,50000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (385,220,94,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (386,221,255,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (387,221,222,1,17000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (388,222,220,2,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (389,222,16,1,37000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (390,222,209,3,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (391,222,130,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (392,223,144,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (393,223,64,1,83000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (394,223,174,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (395,224,96,2,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (396,225,253,2,199000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (397,225,23,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (398,226,212,1,33000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (399,227,234,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (400,227,211,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (401,227,106,3,126000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (402,228,196,1,79000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (403,228,60,2,44000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (404,229,32,3,282000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (405,230,89,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (406,231,99,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (407,231,223,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (408,231,208,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (409,232,135,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (410,233,141,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (411,234,228,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (412,234,258,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (413,235,43,2,259000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (414,235,113,1,40000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (415,235,83,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (416,236,63,1,45000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (417,237,145,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (418,237,98,1,69000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (419,238,202,3,277500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (420,239,265,2,76000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (421,239,87,3,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (422,240,239,2,44000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (423,240,106,1,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (424,240,245,3,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (425,241,56,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (426,242,241,2,72000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (427,242,52,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (428,243,34,2,186000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (429,243,83,1,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (430,243,215,1,22800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (431,244,174,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (432,245,225,3,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (433,246,288,2,44000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (434,246,118,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (435,246,70,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (436,247,120,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (437,247,232,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (438,248,171,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (439,249,148,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (440,249,256,3,59700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (441,250,98,2,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (442,251,57,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (443,251,114,3,14100,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (444,252,35,2,290000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (445,252,161,1,49000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (446,252,184,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (447,253,214,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (448,254,167,2,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (449,255,127,1,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (450,255,149,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (451,255,30,3,91500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (452,256,43,1,129500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (453,257,209,3,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (454,258,10,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (455,258,286,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (456,258,241,2,72000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (457,259,11,3,7800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (458,259,183,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (459,259,263,2,76000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (460,260,262,2,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (461,261,140,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (462,261,130,2,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (463,262,166,2,68000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (464,262,11,3,7800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (465,263,64,1,83000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (466,263,275,3,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (467,264,132,1,34200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (468,264,243,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (469,265,253,2,199000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (470,266,13,1,2800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (471,267,268,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (472,267,207,3,50700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (473,267,199,1,422000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (474,268,27,2,100000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (475,269,83,1,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (476,269,176,2,8000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (477,270,137,3,17700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (478,270,82,2,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (479,270,27,3,150000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (480,271,217,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (481,271,227,1,2500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (482,272,4,2,192000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (483,273,42,1,22600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (484,273,181,2,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (485,274,122,1,2100,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (486,275,65,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (487,275,27,1,50000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (488,276,85,2,104000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (489,276,226,3,105000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (490,276,120,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (491,277,198,2,118000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (492,278,61,2,164000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (493,278,223,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (494,279,14,2,5600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (495,279,91,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (496,279,107,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (497,280,79,2,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (498,281,267,2,118000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (499,282,279,3,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (500,282,83,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (501,282,249,3,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (502,283,73,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (503,283,33,1,53000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (504,284,11,1,2600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (505,285,108,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (506,285,277,1,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (507,286,71,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (508,286,243,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (509,287,182,1,35900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (510,287,150,1,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (511,288,122,2,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (512,288,109,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (513,289,186,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (514,289,135,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (515,290,109,1,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (516,291,128,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (517,291,258,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (518,291,146,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (519,292,251,2,38000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (520,293,256,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (521,294,286,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (522,294,34,1,93000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (523,294,87,3,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (524,295,240,2,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (525,295,261,3,38400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (526,296,52,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (527,296,62,2,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (528,297,165,2,115800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (529,297,163,3,234000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (530,297,271,3,188700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (531,298,137,2,11800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (532,299,236,1,14900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (533,299,246,2,2000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (534,300,45,1,67000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (535,300,33,1,53000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (536,300,31,2,126000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (537,301,229,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (538,302,207,2,33800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (539,302,76,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (540,303,138,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (541,303,130,1,5500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (542,303,27,1,50000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (543,303,281,2,298000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (544,304,42,3,67800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (545,305,261,2,25600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (546,305,40,2,259000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (547,306,272,1,62900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (548,306,81,2,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (549,307,100,1,88500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (550,307,203,3,400500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (551,308,119,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (552,309,179,2,52000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (553,309,57,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (554,310,109,3,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (555,310,112,3,120000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (556,311,115,1,4700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (557,311,141,3,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (558,312,57,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (559,312,29,3,318000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (560,313,125,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (561,314,264,3,114000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (562,315,6,2,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (563,315,132,3,102600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (564,315,219,2,59600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (565,315,192,1,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (566,316,94,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (567,316,70,2,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (568,317,237,1,35000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (569,318,214,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (570,318,168,2,271000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (571,318,188,1,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (572,319,19,3,234000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (573,319,82,1,4500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (574,320,254,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (575,320,129,2,15800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (576,320,23,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (577,320,188,3,49500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (578,321,56,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (579,321,191,2,40000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (580,322,277,1,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (581,322,50,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (582,323,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (583,323,214,2,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (584,324,223,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (585,324,76,2,3800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (586,325,205,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (587,325,235,3,90000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (588,326,158,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (589,327,288,3,66000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (590,327,247,3,23700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (591,327,5,3,450000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (592,328,274,1,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (593,329,191,2,40000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (594,330,89,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (595,330,97,2,70800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (596,330,18,2,74000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (597,331,66,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (598,331,280,1,28000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (599,332,94,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (600,333,148,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (601,333,26,3,279000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (602,334,117,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (603,335,102,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (604,335,167,2,167000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (605,335,32,1,94000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (606,335,14,1,2800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (607,335,73,2,3800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (608,336,177,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (609,336,254,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (610,337,217,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (611,337,135,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (612,338,7,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (613,339,34,3,279000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (614,339,35,1,145000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (615,339,213,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (616,340,37,3,5400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (617,340,92,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (618,341,87,2,92000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (619,342,159,3,240000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (620,342,242,2,7200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (621,342,13,3,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (622,342,217,3,81000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (623,343,209,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (624,343,20,1,37000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (625,344,209,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (626,345,129,1,7900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (627,345,128,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (628,345,124,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (629,346,215,2,45600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (630,347,87,3,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (631,347,179,3,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (632,348,264,1,38000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (633,348,205,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (634,349,88,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (635,350,150,1,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (636,350,215,3,68400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (637,351,100,1,88500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (638,351,148,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (639,351,203,2,267000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (640,351,107,1,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (641,352,286,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (642,353,236,2,29800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (643,354,234,2,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (644,354,69,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (645,354,8,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (646,354,267,1,59000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (647,355,170,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (648,355,255,2,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (649,355,103,3,37500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (650,356,99,1,41000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (651,357,191,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (652,357,100,2,177000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (653,358,245,1,3300,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (654,359,195,3,72000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (655,359,177,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (656,360,142,3,108000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (657,360,238,2,70000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (658,360,156,1,7700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (659,361,152,2,32000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (660,362,11,3,7800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (661,362,95,2,70800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (662,363,39,1,62500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (663,363,188,1,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (664,363,94,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (665,364,205,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (666,365,232,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (667,365,172,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (668,366,279,3,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (669,366,64,1,83000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (670,366,143,1,90000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (671,367,101,3,159000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (672,367,213,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (673,368,174,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (674,369,218,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (675,369,266,2,35000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (676,369,89,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (677,370,243,3,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (678,370,98,1,69000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (679,371,273,3,188700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (680,371,115,2,9400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (681,371,228,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (682,372,125,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (683,372,238,1,35000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (684,373,287,1,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (685,373,249,2,8000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (686,374,98,3,207000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (687,375,86,2,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (688,375,240,2,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (689,375,277,3,162000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (690,375,135,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (691,376,31,1,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (692,377,146,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (693,378,288,1,22000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (694,378,229,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (695,379,168,3,406500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (696,379,263,2,76000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (697,380,68,1,84000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (698,380,182,1,35900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (699,381,211,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (700,381,57,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (701,382,55,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (702,382,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (703,382,160,3,849000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (704,383,5,2,300000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (705,383,118,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (706,384,258,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (707,384,236,3,44700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (708,385,197,3,297000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (709,385,11,3,7800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (710,386,95,1,35400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (711,387,210,3,72000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (712,387,148,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (713,387,128,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (714,388,233,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (715,388,194,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (716,389,257,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (717,390,276,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (718,390,275,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (719,390,87,3,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (720,390,27,1,50000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (721,391,38,3,67800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (722,391,65,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (723,392,104,2,140000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (724,392,103,1,12500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (725,393,268,2,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (726,393,285,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (727,394,146,2,24000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (728,394,30,2,61000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (729,395,117,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (730,395,272,3,188700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (731,395,79,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (732,396,156,2,15400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (733,396,149,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (734,397,132,2,68400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (735,398,221,3,51000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (736,399,169,3,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (737,399,255,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (738,399,284,2,7000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (739,400,77,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (740,400,91,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (741,401,21,3,234000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (742,401,137,1,5900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (743,402,192,3,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (744,402,165,3,173700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (745,402,98,3,207000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (746,403,127,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (747,403,64,1,83000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (748,404,149,1,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (749,405,58,2,334000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (750,405,167,1,83500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (751,405,233,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (752,405,85,2,104000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (753,406,262,2,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (754,407,5,2,300000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (755,407,171,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (756,408,52,3,123000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (757,408,276,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (758,409,55,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (759,410,48,3,135000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (760,410,96,2,138000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (761,411,127,3,63000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (762,411,119,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (763,411,117,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (764,411,19,1,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (765,412,12,3,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (766,413,23,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (767,413,105,2,53000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (768,414,170,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (769,414,273,1,62900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (770,414,231,3,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (771,415,181,2,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (772,415,6,2,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (773,415,239,3,66000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (774,416,77,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (775,417,250,1,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (776,417,176,1,4000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (777,418,233,1,5500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (778,419,93,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (779,419,153,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (780,420,271,1,62900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (781,420,161,3,147000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (782,420,117,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (783,421,214,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (784,422,260,3,38400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (785,422,232,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (786,422,4,1,96000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (787,423,212,1,33000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (788,423,168,3,406500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (789,423,286,3,87000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (790,424,266,1,17500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (791,425,165,2,115800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (792,425,124,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (793,426,36,2,3600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (794,427,187,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (795,427,197,2,198000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (796,428,281,3,447000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (797,429,220,2,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (798,430,37,3,5400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (799,430,233,2,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (800,430,121,1,2100,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (801,431,179,2,52000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (802,431,116,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (803,432,43,3,388500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (804,433,151,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (805,434,117,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (806,435,125,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (807,435,51,3,285000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (808,435,286,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (809,436,32,1,94000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (810,437,68,3,252000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (811,438,53,3,265500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (812,438,69,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (813,439,144,3,36000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (814,439,29,1,106000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (815,439,27,2,100000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (816,440,208,1,5000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (817,440,214,2,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (818,441,148,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (819,442,252,3,296400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (820,442,55,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (821,442,232,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (822,443,15,2,5600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (823,443,273,2,125800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (824,444,238,1,35000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (825,444,171,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (826,445,232,3,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (827,445,233,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (828,446,134,1,13000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (829,447,187,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (830,447,181,1,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (831,448,182,2,71800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (832,449,19,3,234000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (833,449,123,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (834,450,221,3,51000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (835,450,281,1,149000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (836,451,247,3,23700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (837,451,8,1,46500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (838,452,203,2,267000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (839,453,99,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (840,453,207,3,50700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (841,454,95,2,70800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (842,455,49,1,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (843,455,188,2,33000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (844,455,129,1,7900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (845,456,286,1,29000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (846,456,163,1,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (847,457,131,3,60000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (848,458,118,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (849,459,258,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (850,459,288,1,22000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (851,460,178,1,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (852,460,174,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (853,461,6,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (854,462,160,1,283000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (855,462,186,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (856,462,119,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (857,463,69,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (858,463,121,2,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (859,464,243,3,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (860,465,41,1,62500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (861,465,15,1,2800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (862,466,45,1,67000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (863,467,230,3,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (864,467,287,1,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (865,468,138,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (866,468,198,1,59000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (867,469,219,3,89400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (868,470,180,2,38000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (869,470,74,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (870,471,280,1,28000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (871,471,52,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (872,472,106,1,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (873,473,228,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (874,473,176,3,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (875,474,150,3,12600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (876,475,173,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (877,475,36,1,1800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (878,475,185,3,35700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (879,475,153,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (880,476,101,1,53000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (881,477,122,2,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (882,478,133,3,38700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (883,479,168,1,135500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (884,479,231,3,21000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (885,480,204,1,27000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (886,480,9,3,285000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (887,481,235,3,90000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (888,482,84,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (889,482,185,1,11900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (890,483,188,3,49500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (891,483,287,2,19800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (892,484,65,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (893,485,178,1,11000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (894,486,31,3,189000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (895,486,165,3,173700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (896,487,173,2,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (897,487,93,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (898,487,89,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (899,488,37,1,1800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (900,489,164,3,68700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (901,490,281,2,298000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (902,490,38,1,22600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (903,491,182,2,71800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (904,491,90,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (905,492,149,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (906,493,127,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (907,494,242,3,10800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (908,495,183,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (909,495,133,1,12900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (910,496,183,2,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (911,497,76,2,3800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (912,498,8,2,93000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (913,499,109,2,42000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (914,499,80,1,1500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (915,500,251,3,57000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (916,501,121,3,6300,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (917,502,14,1,2800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (918,502,176,2,8000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (919,503,247,2,15800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (920,503,231,2,14000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (921,504,148,1,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (922,505,82,2,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (923,506,283,1,149000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (924,506,99,2,82000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (925,506,256,2,39800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (926,507,25,2,190000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (927,507,81,3,22500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (928,507,278,1,91900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (929,508,12,1,2800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (930,509,74,1,1900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (931,510,186,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (932,510,268,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (933,511,154,3,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (934,511,210,2,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (935,512,35,3,435000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (936,512,32,3,282000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (937,513,62,1,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (938,514,75,2,3800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (939,515,95,3,106200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (940,515,101,1,53000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (941,515,184,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (942,516,177,1,20000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (943,517,277,3,162000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (944,518,148,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (945,519,217,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (946,519,37,3,5400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (947,520,113,3,120000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (948,521,179,3,78000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (949,522,207,1,16900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (950,522,183,1,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (951,523,256,3,59700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (952,523,275,1,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (953,524,212,3,99000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (954,524,184,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (955,525,99,3,123000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (956,525,172,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (957,526,269,1,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (958,527,103,2,25000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (959,527,66,1,48000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (960,528,212,3,99000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (961,529,186,3,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (962,530,280,1,28000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (963,531,211,3,81000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (964,531,274,1,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (965,532,262,2,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (966,533,67,2,182000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (967,534,67,3,273000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (968,534,245,3,9900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (969,535,211,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (970,535,124,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (971,536,215,1,22800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (972,537,129,2,15800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (973,537,283,1,149000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (974,538,55,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (975,539,168,1,135500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (976,539,108,1,12000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (977,540,7,2,288000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (978,541,23,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (979,541,90,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (980,542,2,1,88500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (981,542,283,1,149000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (982,543,56,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (983,543,49,1,39000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (984,544,120,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (985,544,84,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (986,545,160,3,849000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (987,546,160,3,849000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (988,547,133,3,38700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (989,547,279,2,56000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (990,548,65,3,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (991,549,72,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (992,550,75,3,5700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (993,551,181,1,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (994,551,41,1,62500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (995,552,221,3,51000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (996,553,275,2,6000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (997,554,242,1,3600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (998,555,226,3,105000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (999,555,276,2,58000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1000,556,202,1,92500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1001,557,85,2,104000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1002,558,231,2,14000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1003,558,133,3,38700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1004,558,217,2,54000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1005,559,81,2,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1006,559,210,3,72000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1007,560,202,1,92500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1008,561,31,2,126000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1009,562,25,1,95000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1010,562,151,1,4200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1011,563,70,3,10500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1012,563,119,3,30000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1013,563,115,3,14100,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1014,564,31,2,126000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1015,565,60,1,22000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1016,566,207,2,33800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1017,567,160,2,566000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1018,567,90,2,4400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1019,568,257,3,59700,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1020,569,71,1,2200,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1021,570,105,3,79500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1022,571,82,3,13500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1023,571,222,1,17000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1024,571,249,1,4000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1025,572,29,2,212000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1026,573,242,3,10800,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1027,574,211,3,81000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1028,575,233,3,16500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1029,575,82,2,9000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1030,575,103,2,25000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1031,576,159,1,80000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1032,577,78,2,3000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1033,578,152,1,16000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1034,579,256,1,19900,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1035,579,285,1,3500,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1036,580,187,2,26000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1037,581,148,2,8400,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1038,582,123,3,6600,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1039,582,174,1,10000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1040,582,135,3,18000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1041,582,81,2,15000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1042,583,45,3,201000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1043,584,6,1,144000,'N',3,null,null,1);
Insert into ORDER_DETAIL (OD_DETAIL_NO,ORDER_NO,PRO_NO,COUNT,PRICE,REFUND,DELI_STATUS,PACKAGE_NO,TRACKING_NO,STATUS) values (1044,585,201,2,844000,'N',3,null,null,1);
REM INSERTING into PACKAGE
SET DEFINE OFF;
REM INSERTING into POINT
SET DEFINE OFF;
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (2,null,to_date('10/03/15','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (3,null,to_date('10/05/05','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (4,null,to_date('10/09/29','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (5,null,to_date('10/12/17','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (6,null,to_date('11/02/11','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (7,null,to_date('11/03/22','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (8,null,to_date('11/06/28','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (9,null,to_date('11/09/06','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (10,null,to_date('11/11/07','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (11,null,to_date('12/01/09','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (12,null,to_date('12/02/23','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (13,null,to_date('12/06/15','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (14,null,to_date('12/07/08','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (15,null,to_date('12/09/07','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (16,null,to_date('12/12/19','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (17,null,to_date('13/07/19','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (18,null,to_date('13/09/22','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (19,null,to_date('13/10/01','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (20,null,to_date('14/04/07','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (21,null,to_date('14/08/21','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (22,null,to_date('14/10/06','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (23,null,to_date('14/11/29','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (24,null,to_date('15/03/17','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (25,null,to_date('15/06/08','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (26,null,to_date('15/07/25','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (27,null,to_date('15/09/20','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (28,null,to_date('15/11/18','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (29,null,to_date('16/05/30','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (30,null,to_date('16/07/16','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (31,null,to_date('16/08/20','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (32,null,to_date('16/11/01','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (33,null,to_date('17/03/18','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (34,null,to_date('19/10/27','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (35,null,to_date('17/10/11','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (36,null,to_date('17/12/27','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (37,null,to_date('18/01/01','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (38,null,to_date('18/04/15','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (39,null,to_date('22/05/03','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (40,null,to_date('18/06/28','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (41,null,to_date('18/08/18','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (42,null,to_date('19/01/21','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (43,null,to_date('19/07/29','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (44,null,to_date('19/09/05','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (45,null,to_date('19/12/09','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (46,null,to_date('20/05/02','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (47,null,to_date('20/11/20','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (48,null,to_date('20/12/31','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (49,null,to_date('21/03/08','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (50,null,to_date('21/12/05','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (51,null,to_date('22/01/11','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (52,null,to_date('23/05/26','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (53,null,to_date('22/10/17','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (54,null,to_date('23/04/09','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (55,null,to_date('23/06/13','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (56,null,to_date('23/11/04','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (57,null,to_date('23/12/23','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (2,null,to_date('10/03/15','RR/MM/DD'),0,100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (3,null,to_date('10/05/05','RR/MM/DD'),0,200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (4,null,to_date('10/09/29','RR/MM/DD'),0,300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (5,null,to_date('10/12/17','RR/MM/DD'),0,400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (6,null,to_date('11/02/11','RR/MM/DD'),0,500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (7,null,to_date('11/03/22','RR/MM/DD'),0,600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (8,null,to_date('11/06/28','RR/MM/DD'),0,700,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (9,null,to_date('11/09/06','RR/MM/DD'),0,800,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (10,null,to_date('11/11/07','RR/MM/DD'),0,900,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (11,null,to_date('12/01/09','RR/MM/DD'),0,1000,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (12,null,to_date('12/02/23','RR/MM/DD'),0,1100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (13,null,to_date('12/06/15','RR/MM/DD'),0,1200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (14,null,to_date('12/07/08','RR/MM/DD'),0,1300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (15,null,to_date('12/09/07','RR/MM/DD'),0,1400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (16,null,to_date('12/12/19','RR/MM/DD'),0,1500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (17,null,to_date('13/07/19','RR/MM/DD'),0,1600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (18,null,to_date('13/09/22','RR/MM/DD'),0,1700,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (19,null,to_date('13/10/01','RR/MM/DD'),0,1800,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (20,null,to_date('14/04/07','RR/MM/DD'),0,1900,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (21,null,to_date('14/08/21','RR/MM/DD'),0,2000,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (22,null,to_date('14/10/06','RR/MM/DD'),0,2100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (23,null,to_date('14/11/29','RR/MM/DD'),0,2200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (24,null,to_date('15/03/17','RR/MM/DD'),0,2300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (25,null,to_date('15/06/08','RR/MM/DD'),0,2400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (26,null,to_date('15/07/25','RR/MM/DD'),0,2500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (27,null,to_date('15/09/20','RR/MM/DD'),0,2600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (28,null,to_date('15/11/18','RR/MM/DD'),0,2700,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (29,null,to_date('16/05/30','RR/MM/DD'),0,2800,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (30,null,to_date('16/07/16','RR/MM/DD'),0,2900,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (31,null,to_date('16/08/20','RR/MM/DD'),0,3000,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (32,null,to_date('16/11/01','RR/MM/DD'),0,100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (33,null,to_date('17/03/18','RR/MM/DD'),0,200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (34,null,to_date('19/10/27','RR/MM/DD'),0,300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (35,null,to_date('17/10/11','RR/MM/DD'),0,400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (36,null,to_date('17/12/27','RR/MM/DD'),0,500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (37,null,to_date('18/01/01','RR/MM/DD'),0,600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (38,null,to_date('18/04/15','RR/MM/DD'),0,700,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (39,null,to_date('22/05/03','RR/MM/DD'),0,800,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (40,null,to_date('18/06/28','RR/MM/DD'),0,900,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (41,null,to_date('18/08/18','RR/MM/DD'),0,1000,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (42,null,to_date('19/01/21','RR/MM/DD'),0,1100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (43,null,to_date('19/07/29','RR/MM/DD'),0,1200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (44,null,to_date('19/09/05','RR/MM/DD'),0,1300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (45,null,to_date('19/12/09','RR/MM/DD'),0,1400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (46,null,to_date('20/05/02','RR/MM/DD'),0,1500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (47,null,to_date('20/11/20','RR/MM/DD'),0,1600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (48,null,to_date('20/12/31','RR/MM/DD'),0,1700,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (49,null,to_date('21/03/08','RR/MM/DD'),0,1800,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (50,null,to_date('21/12/05','RR/MM/DD'),0,1900,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (51,null,to_date('22/01/11','RR/MM/DD'),0,2000,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (52,null,to_date('23/05/26','RR/MM/DD'),0,2100,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (53,null,to_date('22/10/17','RR/MM/DD'),0,2200,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (54,null,to_date('23/04/09','RR/MM/DD'),0,2300,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (55,null,to_date('23/06/13','RR/MM/DD'),0,2400,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (56,null,to_date('23/11/07','RR/MM/DD'),0,2500,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (57,null,to_date('24/03/23','RR/MM/DD'),0,2600,2);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (58,null,to_date('24/03/28','RR/MM/DD'),3000,0,1);
Insert into POINT (USER_NO,ORDER_NO,POINT_DATE,POINT_ADD_LIST,POINT_USE_LIST,POINT_REASON) values (59,null,to_date('24/03/28','RR/MM/DD'),3000,0,1);
REM INSERTING into PRODUCT
SET DEFINE OFF;
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (1,'오리젠 독 퍼피 2kg','D',1,41000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/d/c/9/9/d/f/9dc99dffaa648c2151ffaddd6022b22e/10000/62464ad4d4a2ebd37c4798ad16d02804.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (2,'오리젠 독 퍼피 6kg','D',1,88500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/d/c/9/9/d/f/9dc99dffaa648c2151ffaddd6022b22e/10000/62464ad4d4a2ebd37c4798ad16d02804.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (3,'now 독 프레쉬 스몰브리드 퍼피 2.72kg','D',1,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/f/1/e/0/e/a/af1e0ea53131c79b30b4cd3c4447f611/10001/012093d8b284305467463ca97597c063.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (4,'now 독 프레쉬 스몰브리드 퍼피 5.4kg','D',1,96000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/f/1/e/0/e/a/af1e0ea53131c79b30b4cd3c4447f611/10001/012093d8b284305467463ca97597c063.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (5,'now 독 프레쉬 스몰브리드 퍼피 9.98kg','D',1,150000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/f/1/e/0/e/a/af1e0ea53131c79b30b4cd3c4447f611/10001/012093d8b284305467463ca97597c063.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (6,'오리젠 독 퍼피 11.4kg','D',1,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/d/c/9/9/d/f/9dc99dffaa648c2151ffaddd6022b22e/10000/62464ad4d4a2ebd37c4798ad16d02804.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (7,'오리젠 독 퍼피 라지브리드 11.4kg','D',1,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/7/a/7/f/d/8/87a7fd8d3d8b4bfdaf70d00dcbe43932/10001/2e1629464c7639948383d47ba683dd4f.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (8,'로얄캐닌 독 미니 인도어 퍼피 3kg','D',1,46500,-14,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/c/0/3/f/3/0/5c03f3073a9646bbd3ae0476cda6ba3f/10000/61baec7b4a1bc9e0b5c1797a770b787a.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (9,'로얄캐닌 독 미니 인도어 퍼피 8.7kg','D',1,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/c/0/3/f/3/0/5c03f3073a9646bbd3ae0476cda6ba3f/10000/61baec7b4a1bc9e0b5c1797a770b787a.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (10,'로얄캐닌 독 엑스스몰 퍼피 3kg','D',1,46500,-6,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/5/6/b/d/7/0/e56bd708241fb43c40c026c7593cae24/10001/88fa696fced15e5545aecb136043286a.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (11,'알모네이쳐 캣 대서양참치 캔 70g','C',1,2600,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/5/b/f/a/e/7/95bfae7fa3ecc47d59da5540d6838db1/10001/877314794f9dcbc0172c79583bd97854.jpeg','전연령,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (12,'쓰라이브 캣 Complete 100% 참지캔 75g','C',1,2800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/8/5/f/0/d/5/385f0d596dc70c0481b123ab2bed908b/10000/db87c5a18fcee643f495a4f3b0c077e3.jpeg','전연령,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (13,'쓰라이브 캣 Complete 100% 참지&연어캔 75g','C',1,2800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/f/0/f/8/4/d/5f0f84d81eb8acbd1471433b3457f952/10000/81b021f283f82f48dc18dbe915ad977d.jpeg','전연령,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (14,'쓰라이브 캣 Complete 100% 닭가슴살캔 75g','C',1,2800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/8/e/3/c/1/3/08e3c13fd86be8bfd3e24122226d23eb/10001/ae3095dc38c8873dae60a1d4f6e92fcc.jpeg','전연령,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (15,'쓰라이브 캣 Complete 100% 닭가슴살 키튼캔 75g','C',1,2800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/a/4/1/6/a/1/ca416a1875441f467fb285ade58335c0/10001/0d325dbd86d79b4c83117f6759047b93.jpeg','키튼,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (16,'now 캣 프레쉬 어덜트 1.36kg','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/c/3/2/7/7/0/ac32770ac7be140f2a66288560c64e2b/10001/b875d9a1c025c88aadc68ced6ffe46dd.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (17,'now 캣 프레쉬 어덜트 3.63kg','C',1,78000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/c/3/2/7/7/0/ac32770ac7be140f2a66288560c64e2b/10001/b875d9a1c025c88aadc68ced6ffe46dd.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (18,'now 캣 프레쉬 시니어 1.36kg','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/4/0/5/8/e/e/34058ee2f32eed748c041daf2bc647a9/10001/0faba55666eb80a6114d033f23bf91ae.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (19,'now 캣 프레쉬 시니어 3.63kg','C',1,78000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/4/0/5/8/e/e/34058ee2f32eed748c041daf2bc647a9/10001/0faba55666eb80a6114d033f23bf91ae.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (20,'now 캣 프레쉬 키튼 1.36kg','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/c/5/9/e/f/f/bc59eff966cc4c4c58918f660992ee43/10001/6772030751011ef7a3ae813ac345cc87.jpeg','키튼,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (21,'now 캣 프레쉬 키튼 3.63kg','C',1,78000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/c/5/9/e/f/f/bc59eff966cc4c4c58918f660992ee43/10001/6772030751011ef7a3ae813ac345cc87.jpeg','키튼,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (22,'내추럴그레이트니스 캣 살몬&터키 위드 펌킨&캣닙 캔 200g','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/3/a/b/0/d/0/b3ab0d01e4dcb653e9f27c9ef4050d6b/10000/3a801310a4a12a5c230a729bcf06241d.png','어덜트,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (23,'내추럴그레이트니스 캣 치킨 위드 요구르트 바나나&스트로베리 200g','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/6/a/b/f/3/8/f6abf3817e5edc5d8398b2de805d4c50/10000/acf998ea992e19be93d5f13590e72fa9.png','어덜트,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (24,'내추럴그레이트니스 캣 레빗&덕 위드 케롯&카모마일 캔 200g','C',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/4/3/3/b/9/6/5433b9638df467a4c72caaf0b1cab3e4/10000/785a3d3fd846ad55296dcdb02b6758d4.png','어덜트,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (25,'로얄캐닌 독 엑스스몰 퍼피 8.7kg','D',1,9500,163,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/5/6/b/d/7/0/e56bd708241fb43c40c026c7593cae24/10001/88fa696fced15e5545aecb136043286a.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (26,'로얄캐닌 독 미니 퍼피 8kg','D',1,93000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/b/1/d/b/3/b/ab1db3b4e4b2c090c44d11e346d5b03b/10000/a421b0787ea8804874216714fcbdf5e2.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (27,'로얄캐닌 독 미니스타터 마더&베이비 3kg','D',1,50000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/6/5/5/b/d/f/b655bdf058232b3b3d07f39a8fd54b06/10001/b916ced97b02ff0b7150b363040797e5.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (28,'아투 독 연어 퍼피 1.5kg','D',1,42000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/1/a/3/2/2/2/51a3222cd2820b00e37f10e2886d40e3/10001/6e462dcf8311a5d876066e66116e5f30.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (29,'아투 독 연어 퍼피 5kg','D',1,106000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/1/a/3/2/2/2/51a3222cd2820b00e37f10e2886d40e3/10001/6e462dcf8311a5d876066e66116e5f30.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (30,'아카나 독 퍼피 스몰브리드 레시피 2kg','D',1,30500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/6/3/c/b/d/d/763cbdd3d9d57cfaadaa1770c18c8db2/10001/27872a4a47929b418e218b1ef6b4def4.png','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (31,'아카나 독 퍼피 스몰브리드 레시피 6kg','D',1,63000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/6/3/c/b/d/d/763cbdd3d9d57cfaadaa1770c18c8db2/10001/27872a4a47929b418e218b1ef6b4def4.png','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (32,'피쉬포독 슈페리어 퍼피 5.7kg','D',1,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/2/1/c/6/0/4/721c604382f1f1ce0536e6454f329bc0/10000/1571e456327e1f9930f196dc16ce4272.jpeg','퍼피,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (33,'now 독 프레쉬 스몰브리드 어덜트 2.72kg','D',1,53000,5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/c/a/0/7/2/5/4ca0725ee800d2664baa11ae32b58779/10001/3fbba19f7b3793df21a149d1d98c4a95.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (34,'now 독 프레쉬 스몰브리드 어덜트 5.4kg','D',1,93000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/c/a/0/7/2/5/4ca0725ee800d2664baa11ae32b58779/10001/3fbba19f7b3793df21a149d1d98c4a95.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (35,'now 독 프레쉬 스몰브리드 어덜트 9.98kg','D',1,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/c/a/0/7/2/5/4ca0725ee800d2664baa11ae32b58779/10001/3fbba19f7b3793df21a149d1d98c4a95.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (36,'퓨리나 캣 팬시피스트 부드러운 흰살생선 키튼 캔 85g','C',1,1800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/c/6/9/7/8/2/fc69782d01d2f7cf8df9c9d42f186305/10001/4638e69238dfa0f8226508612d7bc447.jpeg','키튼,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (37,'퓨리나 캣 팬시피스트 부드러운 칠면조 키튼 캔 85g','C',1,1800,-6,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/f/e/2/9/7/7/5fe2977984937e687056b124eb00372a/10001/1b409c112c6842f3b25fa2a72c9f22a6.jpeg','키튼,주식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (38,'로얄캐닌 캣 키튼 1.2kg','C',1,22600,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/a/a/c/1/b/bbaac1b2e0c06b6c7325bdf3bde0d21a/10001/97b53dad5ed59887c0d2558ac77430d7.jpeg','키튼,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (39,'로얄캐닌 캣 키튼 4kg','C',1,62500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/a/a/c/1/b/bbaac1b2e0c06b6c7325bdf3bde0d21a/10001/97b53dad5ed59887c0d2558ac77430d7.jpeg','키튼,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (40,'로얄캐닌 캣 키튼 10kg','C',1,129500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/a/a/c/1/b/bbaac1b2e0c06b6c7325bdf3bde0d21a/10001/97b53dad5ed59887c0d2558ac77430d7.jpeg','키튼,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (41,'로얄캐닌 캣 인도어 4kg 변냄새 감소','C',1,62500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/d/c/d/9/5/4/7dcd9546dc2a04d97f8d58c5d4ad01c7/10001/5003985ad939afda2d739b13c0a4ee10.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (42,'로얄캐닌 캣 인도어 1.2kg 변냄새 감소','C',1,22600,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/d/c/d/9/5/4/7dcd9546dc2a04d97f8d58c5d4ad01c7/10001/5003985ad939afda2d739b13c0a4ee10.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (43,'로얄캐닌 캣 인도어 10kg 변냄새 감소','C',1,129500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/d/c/d/9/5/4/7dcd9546dc2a04d97f8d58c5d4ad01c7/10001/5003985ad939afda2d739b13c0a4ee10.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (44,'레오나르도 캣 푸드 시니어 2kg','C',1,39000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/b/3/5/6/e/9/7b356e99cf5628e061aa23cf48ccb201/10001/b03b3d77bbb53ae9d87fa2f1caebe991.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (45,'캐츠랑 전연령 20kg','C',1,6500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/c/b/b/f/3/d/7cbbf3d07011b86173cb9e7b350f75c2/10001/425bd3ee99ff6e57b4f5d2ec324e0538.jpeg','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (46,'캐츠랑 전연령 5kg','C',1,28000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/e/8/a/7/e/a/de8a7ea393a771a80def97fdcf0d00b1/10001/a4c74989aee4aa74295c0b849be78372.jpeg','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (47,'캐츠랑 전연령 2kg','C',1,16000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/5/7/6/9/8/bb57698df87e53baa0fe015202cb1847/10001/c1429b6f560dbdabde5f6ea69cbe57b4.jpeg','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (48,'지위픽 캣 양고기 400g','C',1,4500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/6/4/8/5/1/a/c64851a8d9a02f243d82a0f6368eba52/10000/a725a4e104ec7e4b673f40ffae833aae.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (49,'지위픽 캣 프로비넌스 오타고 밸리 340g','C',1,39000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/8/e/2/a/1/7/b8e2a174ca56d752df8498b76be3abda/10001/299f83b1cf28e9727c4278993f2cc3d9.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (50,'로얄캐닌 독 미니 인도어 어덜트 3kg','D',1,46500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/8/c/c/9/a/b/a8cc9abe2c86253f3b6f9acea88db684/10001/2d6f1a038093bea3427d03258471a5ec.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (51,'로얄캐닌 독 미니 인도어 어덜트 8.7kg','D',1,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/8/c/c/9/a/b/a8cc9abe2c86253f3b6f9acea88db684/10001/2d6f1a038093bea3427d03258471a5ec.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (52,'오리젠 독 오리지날 2kg','D',1,41000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/e/c/c/3/0/a/4ecc30adc81b1fc147c51beb3cf5b98b/10001/bde700c8eb907bf325e50ca4c074e35b.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (53,'오리젠 독 오리지날 6kg','D',1,88500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/e/c/c/3/0/a/4ecc30adc81b1fc147c51beb3cf5b98b/10001/bde700c8eb907bf325e50ca4c074e35b.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (54,'오리젠 독 오리지날 11.4kg','D',1,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/e/c/c/3/0/a/4ecc30adc81b1fc147c51beb3cf5b98b/10001/bde700c8eb907bf325e50ca4c074e35b.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (55,'게더 독 엔드레스 벨리 비건 레시피 1kg','D',1,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/8/0/7/d/8/3/1807d833ed972004c8e052d9eab2764e/10001/6245f009b06a9ca2d4d70ded38ff7a5c.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (56,'게더 독 프리 에이커 치킨 레시피 1kg','D',1,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/0/0/4/9/d/0/a0049d0229610f6848b6924973aef710/10001/1497c96f76dbe97b58c67f5bcb21e949.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (57,'지위픽 독 닭고기 캔 390g','D',1,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/f/d/1/f/d/4/dfd1fd4b9424a0f9e1b1a60f80737176/10001/f72c463c57b8434a3f36e961a7f69a69.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (58,'지위픽 독 프로비넌스 이스트 케이프 1.8kg','D',1,16500,118,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/5/6/2/1/6/4/95621642372ff3ee98a438aab371a46c/10001/07fc14d0d614a96a9b0f1131bfdf1e0f.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (59,'피쉬포독 슈페리어 어덜트 5.7kg','D',1,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/f/4/f/f/c/4/1f4ffc4eb8f30276d20686420fd2e42c/10001/303e99d19384ec182a841eb2db9ff980.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (60,'피쉬포독 화이트피쉬 어덜트 라지브리드 1kg','D',1,22000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/2/b/9/6/4/f/72b964f9f0c2382e9a76acb5b35a5ee0/10001/7fdf54203e790674fb8c6aca38f62eab.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (61,'피쉬포독 화이트피쉬 어덜트 6.3kg','D',1,82000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/1/f/c/0/1/c/91fc01c2dcbc4ec00bcb0b8efbaf2145/10001/d7f5cfb848a02cb25a8d5053b1ddda8f.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (62,'토우 독 구운오리&고구마 1.2kg','D',1,30000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/e/1/d/0/2/f/9e1d02fa27bc98e971b212fa038988c2/10000/8763f6fd9bf5815fb9e29a6362396b57.jpg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (63,'웰니스 독 심플 살몬&포테이토 스몰브리드 2.04kg','D',1,4500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/0/2/f/e/3/9/b02fe39c09bc5db4f23e2bb5820459bd/10001/193bd2598c8d1d5fc2c9c4ce0abe77a6.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (64,'웰니스 독 심플 살몬&포테이토 스몰브리드 4.76kg','D',1,83000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/0/2/f/e/3/9/b02fe39c09bc5db4f23e2bb5820459bd/10001/193bd2598c8d1d5fc2c9c4ce0abe77a6.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (65,'내추럴발란스 독 LI 야채 레시피 브로스 코팅 스몰브리드 2.4kg','D',1,48000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/2/7/7/4/c/b/f2774cb6fb84ce90e441c51437e9548d/10001/22d1087402a0f1d58d451fe9beb64351.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (66,'내추럴발란스 독 LI 연어&현미 레시피 라지브리드 2.4kg','D',1,48000,12,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/9/8/2/c/3/7/c982c373a4b8264a642adc057957d8f7/10001/5421777f65a1b276a9dda1ddef034e07.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (67,'내추럴발란스 독 LI 야채 레시피 브로스 코팅 라지브리드 5kg','D',1,91000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/6/3/2/5/8/b/a63258b7a9338d3dd93c8146347fdad9/10001/2def118230dfad22406b2b408acce4fe.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (68,'내추럴발란스 독 LI 연어&현미 레시피 라지브리드 5kg','D',1,8500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/9/8/2/c/3/7/c982c373a4b8264a642adc057957d8f7/10001/5421777f65a1b276a9dda1ddef034e07.jpeg','어덜트,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (69,'시저 독 쇠고기&달걀 1세이하 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/0/5/7/2/c/a/c0572cab839a10a6905894ecf8d4f3c3/10001/96ea75ae8a6f5da4fd422cc268944914.jpeg','퍼피,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (70,'힐스 독 퍼피 스몰포 스튜 치킨&야채 99g','D',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/c/8/7/e/0/0/ec87e00b6dac475c65b709ef9e6012ec/10000/2db37752fde931a9cbc11933c03f6d91.jpeg','퍼피,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (71,'시저 독 쇠고기 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/b/5/7/d/f/c/7b57dfce7e4910af7e24d0688245e734/10001/a7bbf101f3c2346b137e7118d39ed77f.png','어덜트,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (72,'시저 독 쇠고기&치즈 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/0/9/c/1/6/8/c09c1682980ace345da90a29a93d4abe/10001/c3a00a6c9290a169c574885cecdd5023.jpeg','어덜트,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (73,'ANF 캣 참치순살 캔 95g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/1/4/b/5/2/5/c14b525e60e4beacbed9c63a7ef684fe/10001/b6937b008aefdec45ef75e396e71398b.jpeg','간식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (74,'ANF 캣 참치무스 캔 95g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/3/4/e/2/6/6/034e2661e5aa607e0cea62ab61339d16/10001/c4408b0caadc3783d8c2cfd5e43008bb.jpeg','간식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (75,'ANF 캣 참치&새우 캔 95g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/f/7/7/3/e/f/2f773ef39c3311051e0a8f9b077c9ecc/10001/a30a492d40db77c2ca822019180b1f0f.jpeg','간식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (76,'ANF 캣 참치&게맛살 캔 95g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/0/8/e/9/6/5/908e965d47d1cbeb0f70780a90a65e40/10001/04418aa64729ae6dae2e0411f3ac8c87.jpeg','간식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (77,'ANF 캣 참치&치킨무스 캔 95g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/f/b/d/0/1/9/4fbd01969fa517fe57dd7764ff82bc9c/10001/c0b22ccb6e673100fcac63d86a973741.jpeg','간식캔');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (78,'뉴트리플랜 캣 흰살참치&연어 캔 160g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/4/5/2/7/2/4/a4527242f0bc1ca5953103a7564f0bb9/10001/f9d23833037e309531d2b10822257c80.png','간식캔,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (79,'뉴트리플랜 캣 흰살참치&게맛살 캔 160g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/d/a/0/7/c/7/fda07c78d29abf427451c3612690e28b/10001/fa582d65f673f6cd289a5913afc0d738.png','간식캔,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (80,'뉴트리플랜 캣 흰살참치&닭가슴살 캔 160g','C',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/2/1/d/4/f/0/a21d4f04f38f7808f8601528153edc51/10001/6be7160f04850be9daf41e252bceeb2b.jpeg','간식캔,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (81,'펫모닝 마법의 캣닢 스프레이 60ml','C',2,7500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/b/1/6/f/2/a/6b16f2a7af886ff7d347af919cf1afbe/10000/999d56d638117aab28dadf6a39a1f075.png','캣닢,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (82,'펫모닝 마법의 캣닢가루 10g','C',2,4500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/a/8/0/5/f/1/0a805f11bcccf1cac2a6dc526370f25c/10001/195a0ef1f7c99e912edecd88f1bbb6bc.jpeg','캣닢,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (83,'더리얼 독 로우 오리 어덜트 360g','D',1,48000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/8/d/3/f/6/f/b8d3f6f6e3524d19506be67845a59fd1/10000/db96e1cb9988723da1ca1acb56e0b121.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (84,'더리얼 독 로우 오리 어덜트 50g','D',1,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/f/e/f/2/b/8/5fef2b83e787fff55540b35059b65ef2/10000/a1b5eb20f1bf8263fd879b855e7c3301.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (85,'디어니스트키친 독 그레인프리 치킨 907g','D',1,52000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/8/b/a/9/9/0/b8ba990b368eaea8c04a0adca4475255/10000/ced7676c1795e8cd942d182f546a2c69.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (86,'디어니스트키친 독 훌그레인 칠면조 레시피 907g','D',1,48000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/9/d/8/e/8/0/89d8e80199e1ec665e5dcbaaf3b276d6/10000/f5f559614594a039529f83a223efdd5c.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (87,'더리얼 독 로우 닭고기 어덜트 360g','D',1,46000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/c/2/1/5/2/7/1c21527f94f9f1d25ea639fa2cc67588/10000/ee601210e1731e4cc41f78561cdc1379.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (88,'더리얼 독 로우 닭고기 어덜트 50g','D',1,10000,24,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/2/5/f/b/e/f/425fbefac5bd177046bdc7a7b8d12727/10000/2f03cd5f01af50604f1965faec0db511.jpeg','어덜트,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (89,'시저 독 연어&감자 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/9/6/7/e/3/b/c967e3bd246511ba1f659f39cca48bb7/10000/f27d3e9a74b1100942e955d4fc1dcd18.jpeg','어덜트,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (90,'시저 독 쇠고기&닭고기 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/0/7/1/8/3/9/c071839d57a0c9eb17d009b960d25f0f/10001/dbfe6e2f4169aea4e63ef4536d496c82.jpeg','어덜트,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (91,'시저 독 흰살생선&야채 100g','D',1,2200,64,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/7/1/c/0/6/2/771c062c69934f2f7672de0f58f2cc12/10001/4b9490326d727d5e73627a6ba8567382.jpeg','어덜트,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (92,'시저 독 쇠고기,현미&야채 14세이상 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/0/2/0/4/e/1/80204e1deb741c5a7d762efcb124e31b/10001/aec6f169a031a9d80ad3dbe445977137.jpeg','시니어,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (93,'시저 독 쇠고기 11세이상 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/2/6/0/f/5/5/2260f55c1922a44f5708ff7c6f1ad8c9/10001/2990f417beabecc43634e249ab9ba7ef.jpeg','시니어,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (94,'시저 독 닭고기 11세이상 캔 100g','D',1,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/8/f/c/e/1/9/b8fce19b2812b13da6bb943d1861d4dc/10001/2bc8ab52f8cd6657cde35e8f1e5132d1.jpeg','시니어,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (95,'네츄럴코어 독 에코9b 연어&고구마 시니어 2.4kg','D',1,35400,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/2/6/0/3/a/3/02603a36d7f0612613c0d0d5e5e3c0de/10000/f73b3a238022c47aff353a5195715343.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (96,'네츄럴코어 독 에코9b 연어&고구마 시니어 6kg','D',1,69000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/5/b/4/1/0/c/95b410c783b8a5062829c984e72b9eb2/10000/29adec66508e1c9085a6bc017c6e4a4b.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (97,'네츄럴코어 독 에코9a 오리&고구마 시니어 2.4kg','D',1,35400,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/3/5/b/b/b/f/535bbbf478dbf1628bff2a1939fe10d0/10001/2cfe83836781bce7f623e5c4c4b9920e.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (98,'네츄럴코어 독 에코9a 오리&고구마 시니어 6kg','D',1,69000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/0/a/8/a/4/1/10a8a41a0beac94d459de93a90071bf3/10001/59cf62950a979910efec6b7a7780e91b.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (99,'오리젠 독 시니어 2kg','D',1,41000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/6/0/7/3/e/7/86073e7eea314d6cb370c2c3715fa9c7/10001/406727f12ebc4a28a8d878d12eb6c28c.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (100,'오리젠 독 시니어 6kg','D',1,88500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/6/0/7/3/e/7/86073e7eea314d6cb370c2c3715fa9c7/10001/406727f12ebc4a28a8d878d12eb6c28c.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (101,'now 독 프레쉬 스몰브리드 시니어 2.72kg','D',1,53000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/9/2/d/7/1/a/992d71a8a4c19b6bcaa4108c2e07fddd/10001/381e74b9ebe994dce0920fa3415328e1.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (102,'오리젠 독 시니어 11.4kg','D',1,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/6/0/7/3/e/7/86073e7eea314d6cb370c2c3715fa9c7/10001/406727f12ebc4a28a8d878d12eb6c28c.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (103,'닥터소프트 독 치킨 시니어 1.2kg','D',1,12500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/d/3/9/c/a/7/7d39ca77ceb548990abd85d516702442/10000/4f78bd8f18853a0de02f9c41110f16f8.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (104,'로투스 독 오븐베이크 치킨 시니어 2.27kg','D',1,70000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/5/1/d/4/b/f/451d4bf3319a4162179ce64709cd4a7a/10000/a150698b624f4dfeec858abe8dd31d54.png','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (105,'로얄캐닌 독 미니 인도어 시니어 1.5kg','D',1,26500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/4/7/7/3/8/4/e477384b22e86ac2cc9c52a52689c765/10001/83d8a1f5b7eff13676c87de32f793aaf.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (106,'힐스 독 어덜트 7+스몰브리드 치킨 2kg','D',1,42000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/2/4/2/3/b/6/a2423b62e4a0dbd219364cb7eb868f1a/10001/176501cae4ea0e9ae19d66266f65daea.jpeg','시니어,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (107,'지위픽 독 사슴정강이뼈 소','D',2,21000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/a/0/d/a/6/3/ca0da6322848049df657c6345a563430/10001/26a00d4d11cf058b1fb3073d364bb278.png','뼈간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (108,'와일드라이프 독 홀스 스틱 말갈비 100g','D',2,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/0/a/6/2/8/9/f0a6289d39fcfc3524a9a7fdd76cace0/10000/ddcf65c107d1d7094ea0573ef2b8bf4d.png','뼈간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (109,'THE 건강한 형제 독 수제간식 오리도가니 500g','D',2,21000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/1/7/2/6/b/a/41726ba09e6498a8783cbb966cd0b5c9/10000/70c45008a25f8d1bb01ee45af6a4ca16.jpeg','뼈간식,수제간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (110,'THE 건강한 형제 독 수제간식 돼지사골 2p','D',2,21000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/8/2/4/d/5/a/d824d5a7aad683cf47aef4fefdf945c5/10000/b71bc5455c03f361f37b138be0f58272.jpeg','뼈간식,수제간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (111,'펫홀릭 마따따비 꼬치','C',2,1500,93,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/5/e/e/a/a/b/e5eeaabeeda947691e31c496f6529d50/10000/74958f5aa81b0f910b727ed410cdeb83.jpeg','캣닢,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (112,'이나바 캣 챠오 츄르 참치&가다랑어 버라이어티 14g*40p','C',2,40000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/b/3/7/c/e/e/9b37cee3e2ab90aa0d710654e0fbed1a/10001/ff39aff86e5ee6dd6b712b79b0d39d7f.jpeg','츄르,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (113,'이나바 캣 챠오 츄르 가다랑어 14g*40p','C',2,40000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/1/7/3/b/7/9/9173b794e8f0183727e9fa1393d7d034/10001/abd635fa454ea64732f55bbecf21584f.png','츄르');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (114,'이나바 캣 챠오 츄르 닭가슴살 14g*4p','C',2,4700,-2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/e/c/3/4/5/f/5ec345fff92077b048b8f988638e736f/10001/711f0459668932127764b3250aabf388.png','츄르');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (115,'이나바 캣 챠오 츄르 참치&헤어볼 14g*4p','C',2,4700,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/b/f/8/5/4/f/0bf854fbefe0343c90a54d53b2771835/10001/922b1f32a69d952a1c32ddc5728cdca5.png','츄르,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (116,'이나바 캣 챠오 츄르 유산균 가다랑어 14g*4p','C',2,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/6/1/e/f/4/e/461ef4e8607f593a8466ac8adb3654ea/10001/3ea09cec8b0a3d6998526d98bc447410.png','츄르,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (117,'진짜육포 소고기 180g','A',2,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/f/f/8/d/2/f/0ff8d2fd682a708599443085453c7e61/10001/4ea62c79766a00edf34fb4b9215089a2.jpeg','저키,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (118,'진짜육포 연어180g','A',2,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/d/e/c/7/1/9/4dec719144926220cb59d73f64b2818f/10001/919a29b98e94ae90c108cb9f484ba196.jpeg','저키,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (119,'진짜육포 황태 180g','A',2,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/0/d/4/9/6/3/00d4963767d580128bda37f4a363a302/10000/55051aee27feb045d4c1fc26692d6b6f.jpeg','저키,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (120,'진짜육포 오리고기 180g','A',2,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/e/d/4/d/3/a/0ed4d3a89b9e9e798eeaa8b56671c5a5/10000/d5422e8baac52662f56c993e2463333b.jpeg','저키,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (121,'에버그로 펫밀크 눈&관절 150ml','A',2,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/2/a/6/d/2/5/d2a6d252392a237dd6b9e04f606b66dc/10000/533c66d1dde62bea5e2d36f2c2ccb138.png','음료,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (122,'에버그로 펫밀크 피부&모발 150ml','A',2,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/a/3/4/3/3/a/1a3433aa3eebb0f874fdb2e9a44652be/10001/1c407f32bca374cce8416c9d343c8990.jpeg','음료,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (123,'닥터할리 캣 펫밀크 200ml','C',2,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/c/d/a/e/e/6/3cdaee6115eea18ed641fb193fc8a9c8/10001/f638f1f5669836268f961493b5480aff.jpeg','음료,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (124,'닥터할리 펫밀크 유산균 망고 180ml','A',2,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/4/5/e/4/4/e/345e44e61e0d8a5ff2fbde0be9d17cd5/10000/0880da4dfffa4bd3666ec3c74d790da0.jpeg','음료,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (125,'닥터할리 펫밀크 홍삼 200ml','A',2,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/8/e/8/0/5/2/68e8052b0d0ca8389955f896b2ee5829/10000/425f18a09c7772c06a8750cb8c671d0b.jpeg','음료,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (126,'THE 건강한 형제 독 수제간식 양등뼈 600g','D',2,19000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/4/2/5/f/5/6/3425f56fabad613d75c61cadc1bdcd63/10000/95e00dc4a22b80c9835b2f70c47ebbd2.jpeg','뼈간식,수제간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (127,'지위픽 독 구강간식 디어후퍼 35g','D',2,21000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/f/a/c/e/a/7/8facea7899ef0f1a9d7e172b3ec12e37/10000/c025dca1e4e0af21d5307fcef652a9f2.jpeg','뼈간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (128,'THE 건강한 형제 독 수제간식 돼지귀 80g','D',2,6000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/a/f/1/7/b/bbaf17b5ce1bbf05e7c844285717bbee/10000/dc05bc82d553f1478f687172bd04ef45.jpeg','뼈간식,수제간식,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (129,'그래니스 독 터키츄 롱스틱 30g','D',2,7500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/3/7/a/0/9/f/c37a09fc57b552f92a1f4dced4e47c35/10000/5dc9352870e9cd8bfa2cb9ea769edfb6.jpeg','껌');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (130,'네츄럴코어 독 하루유산균 혼합 12p','D',2,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/0/9/d/9/8/2/809d982d284b3e242403a808a1ca35fc/10000/3b54b914570644b54c62bba19252c372.png','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (131,'호랑이 독 콜라겐 치킨롤 닭가슴살&황태 180g','D',2,20000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/f/6/8/d/6/3/1f68d63a67f7b9db5076bd1a8852f93c/10000/389664be50f579f8b4ba840f7562d00b.jpeg','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (132,'포켄스 덴티페어리 독 디스펜서 소형견용 S 80p','D',2,34200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/6/b/e/9/8/e/a6be98eab347e2ff2a9fbf82104e8fe1/10000/62d80b189883ae61f56a788fd3a27143.png','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (133,'그래니스 독 터키츄 프레즐 5개입','D',2,12500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/8/1/9/b/c/5/5819bc5c97b3c78f8df0bde304be16e9/10001/bd36ffddfbc3066c8f3bbc5826afe420.jpeg','껌');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (134,'와일드라이프 독 홀스 스틱 말불리스틱 50g','D',2,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/2/9/c/3/b/8/429c3b8e512758b64e59b28abd67bf1f/10000/4d095495f8f0bb252f82f610179e956a.png','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (135,'ANF 독 밀크스틱 27p','D',2,6000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/f/7/7/3/2/5/2f773250120dc70142c5b35f0a230330/10001/4f3da99d4dbc290972975892cad97408.png','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (136,'그래니스 독 오리 도너츠 껌 S','D',2,2200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/3/b/4/f/c/4/c3b4fc462b899be32322d1b626202cf5/10000/2169d34594aa5391d823423f0ea35da5.jpeg','껌');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (137,'호랑이 독 유산균껌 딸기&바나나&블루베리 12p','D',2,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/4/a/8/6/0/7/74a8607128bf01f429013f4ae05597b3/10001/83e093733f6fcdf5d5fcf81f78deb8bb.jpeg','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (138,'호랑이 독 콜라겐 밀크스틱 30p','D',2,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/5/3/2/9/6/0/e53296074403dc16d37ae8b27f5efc91/10000/2e16c0b79fc5632acb3a750e37299679.jpeg','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (139,'포켄스 덴티페어리 독 디스펜서 중소현견용 M 46p','D',2,34200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/8/c/c/f/9/b/08ccf9bfd24f410547275d9defc96b70/10001/41e4f3c1d7d26bb0192bfd3c04f828ba.jpeg','껌,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (140,'펫생각 독 하루조이 미니말랑 자색고구마 200g','D',2,19500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/d/0/e/c/7/2/bd0ec72f96025bd6df0c23445141c6d2/10001/e94b08f2362d7a28b491749ee4f9713a.jpeg','저키');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (141,'POWER TREAT 독 파워바이트 소고기 15g','D',2,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/7/8/a/3/2/5/678a32543c7afab79ea9d1d17c312e8a/10000/121c5424f9208a7001e1909a6c88bffb.png','저키,영양/기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (142,'베츠페츠 안티놀 래피드 30정','A',2,36000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/a/a/8/c/f/c/3aa8cfc838f5a63cc8caf49997b1e0ff/10000/eb41b9f61f9637bc9abfb871a2daae39.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (143,'베츠페츠 안티놀 래피드 90정','A',2,90000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/4/7/f/8/1/9/247f81992cfa6975f5c93605f4a885d7/10000/009fe4551f62b7d037d7aa7a5b338af9.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (144,'시그니처바이 캣 A/a 식욕촉진&기력회복 캔 30g*8ea','C',2,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/7/8/1/e/6/3/1781e630cf153b7f83fe69dac6bfe7f9/10001/996c64958f8eab4ae3190d9731430144.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (145,'시그니처바이 캣 오라뮨 구강케어 참치&명태살 캔 30g*8ea','C',2,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/8/4/9/3/d/2/78493d2377d22a76e00a9f129e83ef18/10000/33c532b2d25a8e4fe77e98b1135a83e3.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (146,'시그니처바이 캣 P/a 복약지도 캔 30g*8ea','C',2,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/f/d/8/5/e/7/afd85e7697872e37053812b69ac87ed7/10001/a8d8228fe38f4039ef5b135701d86f39.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (147,'시그니처바이 캣 오라뮨 구강케어 닭가슴살 캔 30g*8ea','C',2,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/b/3/b/0/b/5/fb3b0b50c538201606b774686128c86c/10001/def2f463897423a1fb1dacc3fe31ed41.jpeg','처방식');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (148,'미음펫 우리아이 보양식 한우곰탕 100g','A',2,4200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/8/3/1/e/1/c/a831e1cf376079b71cec5de73025300d/10001/e5f67d50031132bc9ad5f99f49cfc499.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (149,'미음펫 우리아이 보양식 황태국 100g','A',2,4200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/3/2/e/1/7/f/632e17f0e53ac76025d0311207593cb4/10001/58558ba29b044ec648ba95bd0fea9540.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (150,'미음펫 우리아이 보양식 삼계탕 100g','A',2,4200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/e/d/2/0/d/6/7ed20d618366b3b56d3fa3518b0f6959/10001/6790ae37ac97980c6febc636f902dc7f.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (151,'미음펫 우리아이 보양식 오리탕 100g','A',2,4200,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/2/9/9/c/d/e/f299cdec2f189a5f42fbb91c328b141b/10001/eea71d711c2422e27f2dd6dfbe0530bd.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (152,'동해형씨 원물건조 열빙어 60g','A',2,16000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/9/b/5/b/b/8/89b5bb88c623d8e97a560329a2243fd4/10000/22fa5bed0d09e51da3b0e1f479bc8dcf.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (153,'동해형씨 원물건조 송어 70g','A',2,20000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/7/c/7/c/4/c/77c7c4c34787ecf64fa8c94dae7d0606/10000/99c1d275d351eb80885df438416b3f0c.jpeg','전체');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (154,'동해형씨 원물건조 양미리 55g','A',2,16000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/4/f/1/a/2/9/14f1a29ef297b634a9f1a12d62f71bf8/10000/9c6e185ac09e2edb71db114cdc83d141.jpeg','수제간식,영양기능');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (155,'지위픽 독 소고기 캔 170g','D',1,7700,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/1/5/a/3/7/b/515a37b7de7d9e03a3e0f867a29ad3bc/10001/337588a327a7c7c1ae6b7cecb55c7d67.jpeg','전연령,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (156,'지위픽 독 양고기 캔 170g','D',1,7700,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/4/a/8/9/1/6/d4a891609dacf3e43a85d84d985e87bb/10001/48684b841cedad7372fdf0f5bc948ce8.jpeg','전연령,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (157,'지위픽 독 소고기 캔 390g','D',1,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/0/7/6/1/7/1/b076171ce5941af5e97977e6a610dd45/10001/5fd18d69fb86de79974fa5292d944276.jpeg','전연령,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (158,'지위픽 독 양고기 캔 390g','D',1,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/5/5/f/e/7/3/755fe73752dd47683815dff3309692f5/10001/b15a5954db9176e2bfc14c9aed08b554.jpeg','전연령,습식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (159,'지위픽 독 소고기 1kg','D',1,80000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/8/0/8/d/e/f/8808defcd35315006da53e08bd1c79b0/10000/cf89420670679428b8721b5d9ce0cb24.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (160,'지위픽 독 소고기 4kg','D',1,283000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/8/0/8/d/e/f/8808defcd35315006da53e08bd1c79b0/10000/cf89420670679428b8721b5d9ce0cb24.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (161,'지위픽 독 양고기 454g','D',1,49000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/a/f/3/4/a/0/4af34a02bc514b87a3bb5ba55d856559/10000/e398fadebe263f29763cf188ce8ff538.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (162,'지위픽 독 닭고기 2.5kg','D',1,188000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/8/5/0/2/8/a/585028a24a381209c036ae8450e54e7c/10000/4a0a9188daf318abcb8cd6355e213758.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (163,'지위픽 독 닭고기 1kg','D',1,78000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/8/5/0/2/8/a/585028a24a381209c036ae8450e54e7c/10000/4a0a9188daf318abcb8cd6355e213758.jpeg','전연령,에어/동결사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (164,'ANF 독 6 Free 플러스 소고기&연어 1.8kg','D',1,22500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/4/a/4/7/1/0/d4a47106ca48b74ebfbde96fa6c37e8c/10001/439209a25f67c81cc4b2a4b8e55c55b7.jpeg','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (165,'ANF 독 6 Free 플러스 소고기&연어 5.6kg','D',1,57500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/4/a/4/7/1/0/d4a47106ca48b74ebfbde96fa6c37e8c/10001/439209a25f67c81cc4b2a4b8e55c55b7.jpeg','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (166,'아카나 독 프리런 덕 2kg','D',1,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/7/7/5/8/9/e/c77589e1a08dc517c85d7ef2c0286e41/10001/24e18f156821cdcef2b4d34ffb506008.png','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (167,'아카나 독 프리런 덕 6kg','D',1,83500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/7/7/5/8/9/e/c77589e1a08dc517c85d7ef2c0286e41/10001/24e18f156821cdcef2b4d34ffb506008.png','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (168,'아카나 독 프리런 덕 11.4kg','D',1,135500,-17,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/7/7/5/8/9/e/c77589e1a08dc517c85d7ef2c0286e41/10001/24e18f156821cdcef2b4d34ffb506008.png','전연령,건식사료');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (169,'호랑이모래 무향 6kg','C',3,16000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/c/7/9/7/a/4/5c797a417c97fc053db510dcf60fe478/10001/5ee408a284da521dc35ee898ec9b2a8d.jpeg','모래,배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (170,'호랑이 두부모래 오리지날 7L','C',3,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/f/c/4/6/1/4/3fc4614e7164e6aa22c3bec695529c9f/10001/6bf6c5d153b8a28bb09d822a05d74f5e.jpeg','모래,배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (171,'가필드 천연 카사바 고양이 모래 퍼플 4.55kg','C',3,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/4/a/2/a/0/7/a4a2a07c64ec8d42cb59a3beb8728179/10001/5da51d99b4b0953939b50abcde2b5da6.jpeg','모래,배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (172,'가필드 천연 카사바 고양이 모래 그린 4.55kg','C',3,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/7/4/6/5/2/c/274652c9b32d8ada7eaf473c2bea3983/10000/79f522fa00eb87d8d8f0fc06391f8c67.jpeg','모래,배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (173,'호랑이 모래탈취제 라벤더 1kg','C',3,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/6/5/d/7/3/2/665d732b1daf842558d64fd4dabcab4f/10001/86f730380e04bc8957467016416182da.jpeg','모래');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (174,'호랑이 모래탈취제 베이비파우더 1kg','C',3,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/8/d/c/2/1/e/b8dc21e71726cc0cd3d628da7f56728f/10001/ce3dec759032c06187e5c52e210c86c9.jpeg','모래');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (175,'호랑이 두부모래 참숯 7L','C',3,10000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/7/6/8/b/4/0/3768b40c2e080df8a6594b2a921cb158/10000/719b884c6c00982a0a873d7ce898b3df.jpeg','모래,배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (176,'그린백 배변봉투 리필용4p','D',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/0/a/2/6/5/c/e0a265cd970385f3a1597b3485ca04cd/10001/e8eafd1324b63daecdbe561843799b5a.jpeg','배변용품,산책용품,위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (177,'호랑이패드 중형 200매','D',3,20000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/c/9/0/7/6/9/dc907690df0abd25fa43bbc916b95f4f/10000/807ddd99affa9dccd9d9d269cf2173ee.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (178,'풉 패드 소형 100매','D',3,11000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/4/a/2/b/f/4/94a2bf4ed19a8a3e926af939cc0d6cbf/10000/b234d58f6077f9660d180fd0d416a5ce.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (179,'호랑이패드 대형 60매','D',3,26000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/a/4/c/c/3/3/fa4cc33bda6d994af769c014933af555/10001/f878f3c957e6c8930e88d208ffca775f.png','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (180,'호랑이 블랙패드 중형 50매','D',3,19000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/f/3/b/1/a/9/5f3b1a93285cacb34f878d8b1016a03d/10000/b39c3f26440701b256e0f41df1e5a1be.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (181,'호랑이 블랙패드 대형 20매','D',3,18000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/5/f/a/b/d/d/f5fabdd9144203c1feb20a1dc16cdbb4/10000/8f3ead0e5368b44efef325eb45e9e5db.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (182,'써니데이즈 논슬립 실리콘 배변매트 대형','D',3,35500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/7/3/2/4/d/8/07324d8b37932e35963ea13fc34aa521/10001/c6423a98c243ed4adada3507bd72cb9e.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (183,'플레이바우 심플 배변봉투 클립','D',3,9000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/b/5/a/f/2/f/7b5af2fb777c43579f66e62081b72baa/10000/da718f424b274bffa4b496caa362dd0a.jpg','배변용품,산책용품,위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (184,'베이컨박스 고아웃클럽 풉백 케이스','D',3,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/6/0/8/b/b/0/f608bb0a5f7adb63b18bde85ccbc76dc/10000/131e5aa087699347fd477180284fcbfb.jpeg','배변용품,산책용품,위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (185,'포포마크 독 풉백 케이스','D',3,11500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/3/c/d/3/a/1/13cd3a1ddedbb0b095fa002c64a1feec/10000/5f77c435c00096fb25884f560386768a.jpeg','배변용품,산책용품,위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (186,'요요쉬 중형 패드 30매','D',3,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/1/d/6/6/d/c/61d66dce21784457e4a8b3e2f00c95df/10000/2c2496602da1e0738b04257038e8dc6b.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (187,'요요쉬 플로랄와인 대형 20매','D',3,13000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/4/8/d/b/1/1/e48db1139f33954abb3de66527d749a0/10001/1e73237de12e0e4b1fb0be383a7bb5b4.jpeg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (188,'요기쏘 수컷용 벽면 배변판','D',3,16500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/7/6/0/3/5/e/776035e7be3b678a13dcfb18eff33966/10000/a1ae451bdabc47ebb548653972f9d9ec.jpg','배변용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (189,'오롯이 천연탈취제 30ml','D',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/d/b/0/e/e/bbdb0eecf9674068349793495e6b9196/10001/bbd7b2dbd2c00bb0d3749bc96e390f3e.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (190,'쁨 물티슈 80매','D',3,6000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/2/1/8/0/8/7/e2180873c5e7ef1f481307932d04b130/10000/6c3fb8e97c9af2644ab5541cf989f3a7.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (191,'버박 에피오틱 귀세정제 125ml','D',3,20000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/5/7/4/d/e/1/e574de1e0f009f3ca4848d99235bdbc0/10001/42cc8710e796c05781d4cccec364a4c0.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (192,'오너스 아이클렌저(눈물세정제)120ml','D',3,18000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/c/f/3/0/2/a/bcf302a66694c2424ab028e2358892e8/10000/5963e6bc8d7a199b3fabfeb611239247.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (193,'에티펫 귀 깨끗시트 캡형 30매','D',3,3000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/b/a/a/2/0/0/abaa20013d161ff9220a3af80ef5d1bc/10001/5b66111b99a9bb520e5bcfd9040a0b1d.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (194,'에티펫 치아 깨끗시트 캡형 30매','D',3,3000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/b/6/e/e/8/a/0b6ee8aa366f9460c8b566390e0a09ca/10000/ab4142a2dd305cfb8b8506b937da7fe8.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (195,'이지세이프펫 스퀘어 반려동물 살균탈취제 1000ml','D',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/6/b/1/2/4/a/d6b124a554047bf4ea78842020a47122/10001/0c9dbbeaf71a1e0fbd3f7d47b1eab11e.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (196,'이너프파이브 컴포터블 미끄럼틀 캣타워','C',3,79000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/0/4/0/c/a/f/6040caf35930fc97d93727e26c9be0a9/10001/13a87c46b6b8d05817a26cf29abb2aa2.jpeg','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (197,'이너프파이브 컴포터블 라운지 캣타워','C',3,99000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/6/4/7/2/1/0/8647210ca2244bf591384778160f617b/10001/7f8e7c8dd7a7b3fe58385e016849690b.jpeg','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (198,'이너프파이브 컴포터블 베이직 캣타워','C',3,59000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/6/c/6/a/e/3/a6c6ae3b766408353e432dc465dd1967/10000/2ba2eabee105f7f4e2560dce27ee4c22.jpeg','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (199,'집사의 반격 스타캣휠 내부카펫포함(1060) 아이보리','C',3,422000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/4/a/7/0/6/2/64a7062d7c4810f14507cdf17f90c7a7/10000/f9ef4625e99856d332c728aa41f0dd23.png','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (200,'집사의 반격 스타캣휠 내부카펫포함(1060) 그레이','C',3,422000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/4/a/7/0/6/2/64a7062d7c4810f14507cdf17f90c7a7/10000/f9ef4625e99856d332c728aa41f0dd23.png','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (201,'집사의 반격 스타캣휠 내부카펫포함(1060) 브라운','C',3,422000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/4/a/7/0/6/2/64a7062d7c4810f14507cdf17f90c7a7/10001/f7aaa411038d0f39d8762c9e09fe0954.png','캣타워/휠');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (202,'VETRESKA 선인장 타워 스크래쳐 M','C',3,92500,8,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/5/2/4/2/e/7/15242e7998082bdd4c5fd78541c7641a/10000/7cde77030a851af37d4db76567710a9b.jpeg','스크래쳐');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (203,'VETRESKA 선인장 타워 스크래쳐 L','C',3,133500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/9/6/c/3/d/2/496c3d224539988fd993efa5e9b44c1b/10000/7b6ea93300026a10d23a82c3df5f12c3.jpeg','스크래쳐');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (204,'VETRESKA 수박 스크래쳐','C',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/f/0/7/d/5/1/1/f07d511c402444a97e0ef4123bfd04b2/10001/de47cc6950e486a397a7b62e78407a6f.jpeg','스크래쳐');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (205,'VETRESKA 체리 스크래쳐','C',3,41000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/6/d/d/c/8/8/46ddc886dd166a44f06913720b0cd991/10000/bee1c27f2db4c666a8c17eccfdd5f0c3.jpeg','스크래쳐');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (206,'VETRESKA 흡착식 생과일 스크래쳐 복숭아','C',3,30000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/e/0/0/4/1/7/de00417cc2670570eb897585d16f654a/10000/f1b7c78343319310d669e94a991aac5b.jpeg','스크래쳐');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (207,'피버 미니 트리머','A',3,16500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/a/d/4/6/f/c/1ad46fcbf966b7c57cce1d724a8c7db2/10000/f4b13b76e41194bf5f28955ccc8e58e5.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (208,'트루터치 죽은털제거 글러브','A',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/7/3/9/e/3/9/c739e397bbc831bc89619cfd92167398/10001/e1b43120342c544ace3ee763606661f0.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (209,'페스룸 이지 페이셜 콤','A',3,9000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/0/e/0/1/7/d/80e017deb5ea782a47f3edb6a7a37374/10000/f94d0209fa1f65bf99770c3a157dc711.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (210,'페스룸 브러쉬','A',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/f/9/3/f/4/4/af93f441923a7a847c7c51d4b8f61cbd/10000/3cce802024afd5fa3cfdca35d81fc338.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (211,'페스룸 포우 케어 에센스 85ml','A',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/7/d/5/1/8/4/37d5184693d14d740d7a1c2456cbf9c9/10000/2950287b7d2921242cadf26c2e8934e4.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (212,'펫홀릭 안전 미용가위세트','A',3,33000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/a/4/1/9/3/c/7a4193cb4265628a8ad361b81c47b69f/10001/08873d39890f27e1b51b7021705784f7.jpeg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (213,'케어앤맘 부분 미용가위','A',3,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/0/0/a/c/a/3/a00aca3c5a3fdff69a06727eedba8c1b/10000/2216dbf435bf221e51a8669a5ea91c82.jpg','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (214,'케어앤맘 겸자가위 곡선형 귀털제거용','A',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/1/7/a/2/9/7/617a297b64bfb14246a91e6652c2518d/10001/efd1c8d009fd8590bd6faa7e62aba4ca.png','미용/관리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (215,'네이처펫 강아지 노즈워크 터그폴','D',3,22800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/6/5/2/3/2/b/165232b565022a3f77bea76502aedfb7/10000/8a1b99f02c61450bb1e86b5b2ea0695c.jpg','훈련용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (216,'쏘울펫 훈련 입마개 블랙4호','D',3,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/1/7/e/e/6/9/a17ee6940691caffece4db6c8aead944/10001/212fbeb2a028ec8071e044d94414f926.jpeg','훈련용품,산책용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (217,'니즈더펫 인터라켄 와이드 마틴 목줄','D',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/9/b/4/a/6/3/99b4a63183abad2446c4ae4e92049022/10000/16411ae5f0d84c098461ce76f8bdb71b.jpg','훈련용품,산책용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (218,'니즈더펫 인터라켄 슬림 2.0 마틴 목줄','D',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/8/0/f/3/8/1/a80f3810f7ae3871a2b082c19cbee93c/10000/8688958aed1843f791ed12fc79651e48.jpg','훈련용품,산책용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (219,'리스펫 말하는 강아지 지능개발 훈련벨 4종 세트','D',3,29800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/a/c/9/8/c/a/eac98cabd043194cbf11a150cb4cbce3/10001/93a4cc4ef62b04813a168158189f5b5f.jpeg','훈련용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (220,'펫모닝 프리스비 소프트 원반','D',3,4500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/6/7/e/e/0/4/667ee04bd29e8f411708437dd1c110f3/10000/cf3c072f29fde88d6183b67c857e23ef.jpeg','훈련용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (221,'네추라 너리쉬 악어 덴탈장난감','D',3,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/3/c/b/f/2/9/93cbf292ed640fe2014d228802d4a6fc/10001/f24ed88bc82184e2dca48f0c4351241f.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (222,'네추라 너리쉬 스테고 덴탈장난감','D',3,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/f/2/a/4/2/0/9f2a4203a652d5c2faf6dd9b8d2194de/10001/8ee1f4416661037604a67d337cb56cdc.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (223,'네추라 너리쉬 미니공룡 덴탈장난감','D',3,12000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/d/f/e/e/6/c/bdfee6c7aff15109d822c9eaf9639be4/10001/55f815987460b3e9fb2f3525496accbd.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (224,'네추라 너리쉬 티렉스 덴탈장난감','D',3,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/b/6/b/0/a/6/7b6b0a6c4a791bf7e5e494b820546d6f/10001/5c28d026018809364e08705ed5dc0582.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (225,'도기맨 IQ 스낵볼 장난감 S','D',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/6/8/8/d/5/4/4688d54f4fad74273e0c2d8e9418eb54/10000/c30bf0d1da4256c195d3815edd6fadba.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (226,'펫홀릭 노즈워크 당근농장','D',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/4/b/6/f/4/4/84b6f44ec6d869647d1338c2e77bdb96/10000/e0dee87b18c60ddf66f777f34a781355.jpeg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (227,'라텍스 동물농장 1p','D',3,2500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/6/8/e/3/a/8/868e3a8e49aa6ff04747810bdae68694/10001/623a3c33ba5482d5d719a8e9db6cf42a.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (228,'멍멍샵 스낵볼 대','D',3,9000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/c/3/2/3/d/c/cc323dc6516ec000396c483923bb7c5d/10000/ed358084485259a4e6e9ee91364cca66.jpg','장난감,노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (229,'와글와글 몬스터 라텍스 토이','D',3,3000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/b/3/2/5/0/2/ab325024daf2c4684a54a7a306c807e5/10001/68a65f4793401c6be0e84ca439d0fb1d.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (230,'베스트에버 바스락삑삑 브로콜리','D',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/d/2/c/b/9/6/bd2cb965bb02296ec781d19f1831fafd/10001/5edb2962095c8e9df2698d7d53e3cda1.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (231,'베스트에버 파 빠스락 장난감','D',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/0/8/e/b/f/4/708ebf4c6feb7f01710236d344843c58/10001/1f5ad7a02899507be7e33fd435e2fa86.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (232,'도기프랜드 탱탱볼 장난감 S 2p','D',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/8/b/0/b/b/d/78b0bbdc394c54b90e87970c3a71c111/10001/a057662e9f34850bbcd88d162b287702.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (233,'펫모닝 소리나는 키위 바닐라향','D',3,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/b/e/3/c/7/a/abe3c7a77e06c8b64da16b70214faff1/10001/4cd899b03f2006deed6054ca07952960.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (234,'알뜰펫 탕탕탕냥 장난감','A',3,18000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/b/a/f/0/9/7/4baf097d9761b99ad4e5965dce78a82e/10000/34bde584f9d047de8fd7f263f519b9f6.jpg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (235,'펫홀릭 돌돌이 노즈워크','D',3,30000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/0/1/1/2/9/0/5011290fd87d9d97dddbde9f970c4dc9/10000/6213d8b7685813468be8009677e0db28.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (236,'더플래 노즈워크 킁킁볼','D',3,14500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/6/b/a/8/f/8/a6ba8f8dcd2a11993f9ff14bbace0564/10001/a45e21137606faf6570ed75a8ecb8558.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (237,'니나오토슨 트위스터 레벨3','D',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/7/2/3/9/b/2/c7239b288f748168e3114bf9a0f2ea49/10000/5002b10d9438229a588b37ff9b64cd64.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (238,'니나오토슨 카지노 레벨3','D',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/1/a/1/9/8/8/e1a19889645ff9e32cced56e4ab53f01/10000/973c125653653fd5d90978226e1d0ec1.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (239,'보드미펫 노즈워크볼','D',3,22000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/e/e/d/2/4/7/5eed2472916cd6d13f1bd0b5a00290e5/10000/28042f22cac54d78980fa11a6abe28b1.jpg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (240,'니나오토슨 챌린지','D',3,39000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/f/e/7/7/e/a/7fe77ea025187622c9412333f48260f5/10000/87e38516dc60108b8eb40985c804c16c.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (241,'니나오토슨 멀티퍼즐','D',3,36000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/4/5/e/9/8/4/d45e984852ba8309989c17b15ecbdc4f/10000/9bb509417805a5f11c0f63853af86582.jpeg','노즈워크');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (242,'고양이섬 카샤카샤 라바 네온옐로우','C',3,3600,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/b/4/5/4/2/c/eb4542cc834632a5e46908abc8c95366/10001/a96c9bf44075f0962dbaa060b1bfedf0.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (243,'고양이섬 토끼털 오뎅꼬치 3p','C',3,3000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/8/4/4/4/3/1/a/844431a02fc7b22a5c5b4c22b903f6ab/10000/d0b57faf447554c6c1cbb02112dd7acb.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (244,'고양이섬 바스락 꿈틀이','C',3,3600,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/2/5/7/a/f/7/d257af7c9f0e9ad739da577c7bac769b/10000/32fc062a291139790f30b8a6e9513191.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (245,'고양이섬 비단결 오로라스틱','C',3,3300,3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/4/7/3/3/a/5/94733a5dc58b8a5be7266a8910dcd70b/10000/4f8532e6be946e2f603f8cd2200302e6.jpeg','장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (246,'고양이섬 공룡 캣닢쿠션','C',3,1000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/6/5/6/7/4/a/9/65674a9c3ff7932ac6fd0445bff54fc3/10001/e872a0711d5cf7a96a11658a3b11b88e.jpeg','캣닢,장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (247,'고양이섬 캣파춥스 캣닢토이','C',3,7500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/2/0/8/3/c/9/d2083c9a00c9162872f54724f00a1ec9/10001/ac8f52008d402442a0e4b36cf86b638a.jpeg','캣닢,장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (248,'고양이섬 캣닢품은 양모 마우스','C',3,13500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/5/3/f/9/9/6/353f996a790d0e2107bc75f6921a30bb/10001/a1b57d4c21b2f1c52a5ed97e6c7d92a8.jpeg','캣닢,장난감');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (249,'냥품멍품 캣 칫솔 냥냥 치카칫솔','C',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/e/6/3/a/e/4/7e63ae4cd17927c08a1652651ef82f09/10000/e7b41b8d4e6bf8cf3854bae5ed6f2493.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (250,'메디멀 효소치약 30ml','A',3,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/4/1/8/e/5/1/9418e51401b70f17e8e045de0f9a1155/10000/955be1036073f57469d1734c2453e37a.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (251,'버박 C.E.T 이중효소 닭고기맛 70g','A',3,19000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/e/a/3/9/5/2/e/ea3952e5e18790919174bd0d8bbc02c4/10001/82d024f9f7167cb34efd0c4c9df2067d.jpeg','위생용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (252,'아토주 마그리 고양이 방묘문 펫도어 150cm','C',3,98800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/f/0/b/c/7/5/df0bc75705ca416452b4e809714a96a8/10000/9bbbc7024c5a432c8c65ffcc32b98236.jpg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (253,'갓펜 고양이 안전문 본품 150cm','C',3,99500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/e/f/1/4/6/f/def146f492d5a2fd5abf6c71f3fecf51/10000/1cfa712d82bd218eb660dc9ec85f6cb5.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (254,'모모제리 쁘띠 스카프 러버덕 S','A',3,500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/d/a/a/2/0/1/3daa201e1bef111a48593266e3f2e68a/10001/b8f28a7b4e672f7bb33a491045f7329d.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (255,'모모제리 쁘띠 스카프 러버덕 M','A',3,500,24,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/d/a/a/2/0/1/3daa201e1bef111a48593266e3f2e68a/10001/b8f28a7b4e672f7bb33a491045f7329d.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (256,'냥슬아치 할매 조끼 티셔츠 S','A',3,19500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/9/5/e/6/4/3/595e64379ae18cf5d393fc49d808e236/10001/223478969aeb432f89973b129c962e32.jpg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (257,'냥슬아치 할매 조끼 티셔츠 M','A',3,19500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/9/5/e/6/4/3/595e64379ae18cf5d393fc49d808e236/10001/223478969aeb432f89973b129c962e32.jpg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (258,'냥슬아치 할매 조끼 티셔츠 L','A',3,19500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/9/5/e/6/4/3/595e64379ae18cf5d393fc49d808e236/10001/223478969aeb432f89973b129c962e32.jpg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (259,'냥슬아치 할매 조끼 티셔츠 XL','A',3,19500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/9/5/e/6/4/3/595e64379ae18cf5d393fc49d808e236/10001/223478969aeb432f89973b129c962e32.jpg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (260,'미요펫 당초무늬 방울 목걸이 레드','A',3,12800,3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/2/a/4/3/1/7/92a4317a8f6d21498e416aad2f5bbab1/10000/7465e93334867a145f4ac47f75bcaba7.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (261,'미요펫 당초무늬 방울 목걸이 그린','A',3,12800,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/9/2/a/4/3/1/7/92a4317a8f6d21498e416aad2f5bbab1/10000/7465e93334867a145f4ac47f75bcaba7.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (262,'개달당 꽃송이 뜨개 초커','A',3,1500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/c/a/0/1/b/d/7ca01bdf974c5938f1448b933a8cff5a/10000/f864fd2cb60f0853c3d804575a296a17.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (263,'이츠독 꿀벌 구명조끼 S','D',3,38000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/2/1/f/5/f/6/521f5f6d51173c387d4574add9908532/10001/cfb5b435f512561d7ffb94657551ec35.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (264,'이츠독 꿀벌 구명조끼 M','D',3,38000,122,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/2/1/f/5/f/6/521f5f6d51173c387d4574add9908532/10001/cfb5b435f512561d7ffb94657551ec35.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (265,'이츠독 꿀벌 구명조끼 L','D',3,38000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/5/2/1/f/5/f/6/521f5f6d51173c387d4574add9908532/10001/cfb5b435f512561d7ffb94657551ec35.jpeg','의류/악세사리');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (266,'딩동펫 반려동물 애견투명 울타리 소형12p','D',3,17500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/6/9/f/7/7/1/769f771081689cea7d2e671118603d80/10000/caa74b5c06dd74259aba0b0cb1c4fb2a.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (267,'펫트리움 이지스텝 안전문','D',3,59000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/2/e/e/a/5/2/d2eea52ac4cbd1ab1acd5b90d9f4cfa4/10000/f559216013c92e2eef9676018011514d.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (268,'펫홀릭 데일리 넥카라 그레이','A',3,6000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/0/9/0/e/8/a/c090e8a3db2229264bd507308032c49d/10000/f0fcc42aeeab56c6d43deff6027326f1.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (269,'펫홀릭 데일리 넥카라 화이트','A',3,6000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/0/9/0/e/8/a/c090e8a3db2229264bd507308032c49d/10000/f0fcc42aeeab56c6d43deff6027326f1.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (270,'예보들 벚꽃 넥카라','A',3,19000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/b/7/4/7/7/e/bb7477ee4fdbd538db04e9d31c6f0d3e/10000/8d6e63dd5356b8d68298ea1398f41547.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (271,'펫트니스 미아방지 위치추적 스마트 인식표 핑크','A',3,62500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/8/7/5/d/f/a/c875dfa9756773baf726f65070b162e6/10001/494bbabc48dd4e728426945ddcf4b573.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (272,'펫트니스 미아방지 위치추적 스마트 인식표 블루','A',3,62500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/8/7/5/d/f/a/c875dfa9756773baf726f65070b162e6/10000/6bc7383c0b7c400d9671e4acc20c9e29.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (273,'펫트니스 미아방지 위치추적 스마트 인식표 옐로우','A',3,62500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/8/7/5/d/f/a/c875dfa9756773baf726f65070b162e6/10000/6bc7383c0b7c400d9671e4acc20c9e29.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (274,'꼬잇 미리해요 소변 검사키트','A',3,18000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/b/3/b/d/a/b/0/b3bdab0d4e1008354b523dd78992619b/10000/e71ac397e3283a79cf67390bb2af49ef.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (275,'펫홀릭 알약 물약 투약기 필건','A',3,3000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/1/a/3/f/2/c/7/1a3f2c7ce16802d1ec9e551a08bd9308/10001/c39e7504c4c74120b625abd8d8774809.jpeg','기타');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (276,'산타펫 꾹꾹이 방석 핑크','A',3,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/e/b/d/c/5/b/7ebdc5b3d9b2d4bc1ffe0d011659d9b8/10001/dd11f6cdccceb79384b610da7319cd80.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (277,'엠피에스 이태리 스쿠도1 그레이','A',3,5500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/0/b/e/0/9/0/7/0be090744c6ba34f08e0828c9bde6e80/10001/da8cb4c7d12d7707999a52c872f80dbe.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (278,'릿첼 접이식 켄넬 이동장 아이보리','A',3,91500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/3/e/0/3/2/c/d3e032c92d7a54a91fb6d3f52aee90bd/10001/9564dc775bbbb42a826b25361641dcb8.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (279,'스페이스캣 사계절 720g 이동가방 베이지','A',3,28000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/a/d/b/d/b/c/a/adbdbca8b6d3dccd293c26fe8a76e240/10001/a3cdea61948eca7dc46ac838a708e8fc.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (280,'스페이스캣 사계절 720g 이동가방 카키','A',3,28000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/c/9/2/a/5/7/7c92a5737f0a1c863fd9c628a6a17b3c/10001/c53f9e6c8290ca04409525873f64874e.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (281,'로띠에 뉴바론 유모차 베이지','A',3,149000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/9/0/7/9/d/b/d9079db84d4c0a7e6a94c998830f66f8/10001/a73f50e3ee1a465a8e63b669b96ffafa.jpg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (282,'로띠에 뉴바론 유모차 아이보리','A',3,149000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/9/0/7/9/d/b/d9079db84d4c0a7e6a94c998830f66f8/10001/2956f0c24bfc4a80ae543716e70b854b.jpg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (283,'로띠에 뉴바론 유모차 블랙','A',3,149000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/d/9/0/7/9/d/b/d9079db84d4c0a7e6a94c998830f66f8/10001/99469551ce6f43e1bf014a4c9adbd7ae.jpg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (284,'쥬쥬베 캣 하네스 레드','C',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/9/d/5/6/0/b/c9d560b0d50333c6f9d40b47bfd12ec3/10001/0f4af7e8879b08b8938be87fc2764050.jpeg','산책용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (285,'쥬쥬베 캣 하네스 블루','C',3,3500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/c/9/d/5/6/0/b/c9d560b0d50333c6f9d40b47bfd12ec3/10001/f1d73b4fbf875377f19ccef5788a61d9.jpeg','산책용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (286,'산타펫 꾹꾹이 방석 그레이','A',3,29000,10,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/7/e/b/d/c/5/b/7ebdc5b3d9b2d4bc1ffe0d011659d9b8/10000/5e72d223b679261b55cb91b3e3fc3948.jpeg','생활용품');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (287,'펫홀릭 에코 세라믹 식기 화이트','A',3,9500,0,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','https://images.pet-friends.co.kr/storage/pet_friends/product/id/3/1/a/4/0/a/5/31a40a5e66d4c858e2ae1dd3007a7b88/10001/9a7468441736932e9aa592eb29fb3e5e.jpeg','급수/급식기');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (288,'까사미코 원목 물그릇 대형','A',3,22000,16,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'E','https://images.pet-friends.co.kr/storage/pet_friends/product/id/4/b/8/0/e/d/2/4b80ed2e89a85b9c5757f7011a35202d/10001/42ae5ed0f66afd664e48c51cb424ac23.jpeg','급수/급식기');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (289,'펫홀릭 물과 사료를 동시에 2in1 식기','A',3,1500,31,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N','https://images.pet-friends.co.kr/storage/pet_friends/product/id/2/2/a/3/e/a/1/22a3ea1a0c6ad0111c84e774cbb14816/10001/aeb930a18f2637ddabbdbb3e1f15a7bb.jpeg','급수/급식기');
Insert into PRODUCT (PRO_NO,PRO_NAME,PRO_CATE_CODE,PRO_MIDD_NO,PRICE,STOCK,ENROLL_DATE,MODIFY_DATE,STATUS,PRO_MAIN_IMAGE,KEYWORD) values (290,'고양이사료','C',1,3000,70,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y','resources/thumbnail_upfiles/20240328155258_91471.jpg','키튼,어덜트,전체');
REM INSERTING into PRO_CATEGORY
SET DEFINE OFF;
Insert into PRO_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values ('A','공통');
Insert into PRO_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values ('C','고양이');
Insert into PRO_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values ('D','강아지');
REM INSERTING into PRO_CATEGORY_MIDD
SET DEFINE OFF;
Insert into PRO_CATEGORY_MIDD (CATE_MIDD_NO,CATE_MIDD_NAME) values (1,'사료');
Insert into PRO_CATEGORY_MIDD (CATE_MIDD_NO,CATE_MIDD_NAME) values (2,'간식');
Insert into PRO_CATEGORY_MIDD (CATE_MIDD_NO,CATE_MIDD_NAME) values (3,'용품');
REM INSERTING into QNA
SET DEFINE OFF;
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (1,2,40,'주문 관련해서 문의 드립니다.','주문 문의글 내용
주문 문의글 내용',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'Y',1,'답변답변',to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (2,3,10,'OOOOO 상품 문의','OOOO 상품 재입고는 언제 되나요???ㅠㅠ 사고 싶어요
돈이 있는데 사질 못하다니...ㅠㅠ',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (3,4,20,'교환 문의 드립니다.','어제 주문한 상품을 받았는데
그 중 OOO상품이 불량인 것 같아요
교환 처리 부탁드립니다.',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (4,5,30,'혹시 반품 가능할까요??','포장도 안 뜯었고 배송 온 상태 그대로 입니다.
단순 변심으로 인한 반품은 어떻게 진행되나요?  ',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (5,6,40,'주문 문의 드립니다.','무통장 입금도 되나요??',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (6,2,40,'결제오류가 난 것 같아요ㅠㅠㅠ','확인 가능할까요???',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (7,2,40,'주문 취소 문의드립니다.','주문 취소 가능하나요?',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (8,2,50,'회원 정보는 어디서 변경 가능할까요??','회원 정보 좀 수정하고 싶은데 어디로 가야하는걸까요ㅠㅠ 못찾겟어요ㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (9,3,60,'언제 배송되나요???','주문한지 꽤 됐는데 아직도 물건이 도착을 안하네요...
언제쯤 배송이 완료되나요??',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (10,6,70,'자유게시판 이용 문의','자유게시판에는 꼭 반려동물에 대한 얘기만 써야하나요?
그 외의 이야기는 쓸 수 없는 걸까요??',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (11,7,70,'포토게시판 이용 문의','포토게시판에는 반려동물 사진만 올리기가 가능한가요??
그냥 풍경사진도 올리고 싶은데 그건 불가능한가요??',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (12,8,20,'불량인 것 같아요','물건 받았는데 좀 깨져잇는부분이 있네요..
깨진 부분 사진 첨부해서 보내드립니다.
확인해주시고 교환처리 부탁드립니다.',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (13,4,30,'그냥 교환말고 반품할게요..','저번에 교환신청하고 물건 다시 받았는데 
이번에도 불량이네요
반품 처리 부탁드립니다.',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (14,2,50,'반려동물 정보 수정도 가능한가요?','우리집 아이가 개명을 해서요
어디서 변경 가능하죠??',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (15,9,40,'입금 확인 부탁드립니다.','방금 입금했는데 잘 되엇는지 확인 한 번 부탁드려요
OO은행 ㅁㅁㅁ으로 xxxxxx원 입금했습니다.',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (16,5,10,'xxxxxxx상품 문의','xxxxxx를 구매하고 싶은데 
어쩌구 저쩌구',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
Insert into QNA (QNA_NO,QNA_WRITER,CATEGORY,QNA_TITLE,QNA_CONTENT,ENROLL_DATE,MODIFY_DATE,STATUS,ANSWER_WRITER,ANSWER_CONTENT,ANSWER_DATE) values (17,3,10,'게시판은 어떻게 이용하나요?','궁금궁금
정말 궁금',to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),'N',null,null,to_date('24/03/28','RR/MM/DD'));
REM INSERTING into QNA_CATEGORY
SET DEFINE OFF;
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (10,'상품');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (20,'교환');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (30,'반품');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (40,'주문/결제/취소');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (50,'회원정보');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (60,'배송문의');
Insert into QNA_CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (70,'기타');
REM INSERTING into REPLY
SET DEFINE OFF;
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (1,5,38,'댓글내용댓글내용댓글내용11111',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (2,3,38,'댓글 내용입니다아아아아',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (3,5,37,'ㅋㅋㅋ너무 웃겨욬ㅋㅋㅋㅋㅋ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (4,2,37,'악ㅋㅋㅋㅋ재치가 넘치시네요',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (5,2,40,'로얄캐닌 캣 인도어 변냄새 감소 추천이여~~~',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (6,6,40,'저도 로얄캐닌 캣 인도어 추천합니다!!',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (7,2,39,'안녕하세요!! 저는 user1이에요',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (8,3,49,'앜ㅋㅋㅋㅋㅋ산책 잘 다녀오세여~~~~!!',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (9,7,49,'ㅋㅋㅋㅋ아이궄ㅋㅋ그래도 강아지가 넘 귀엽네요!!ㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (10,6,49,'어머 눈망울이 너무 예뻐요ㅠㅠㅠㅠ귀여워어어어어ㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (11,3,46,'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ고양이가 넘 예쁘네요',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (12,4,46,'세상에ㅠㅠㅠㅠ넘 귀여운 고양이ㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (13,2,44,'저도 꽃 놓고 갑니다 @->-> 총총',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (14,3,44,'저도 놓고 가여 @->-> 총총',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (15,4,44,'저도여~~ @->->',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (16,2,45,'ㅠㅠㅠㅠ어머 사진 너무 잘찍으셨네요ㅠㅠㅠㅠㅠ넘 귀여워어어어어',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (17,6,45,'어머ㅠㅠㅠㅠ넘 예쁜 아이네요ㅠㅠㅠㅠㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (18,8,45,'진짜ㅠㅠㅠ넘 귀여워요ㅠㅠㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (19,2,43,'숲 풍경이 푸르르고 좋네요 덕분에 힐링하고 갑니다',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (20,2,42,'작성자님도 좋은 하루 되세요~~!!!',to_date('24/03/28','RR/MM/DD'),'Y');
Insert into REPLY (REPLY_NO,REPLY_WRITER,REPLY_BNO,REPLY_CONTENT,ENROLL_DATE,STATUS) values (21,7,50,'네 ㅠㅠ넘 귀엽네요ㅠㅠㅠ',to_date('24/03/28','RR/MM/DD'),'Y');
REM INSERTING into REVIEW
SET DEFINE OFF;
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (1,288,4,'리뷰제목1','리뷰내용1',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'Y',null,'좋은 리뷰 감사합니다!
적립금 드릴게요');
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (2,287,5,'리뷰제목2','리뷰내용2',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (3,286,6,'리뷰제목3','리뷰내용3',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (4,288,8,'리뷰제목4','리뷰내용4',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (5,288,7,'리뷰제목5','리뷰내용5',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (6,284,4,'리뷰제목6','리뷰내용6',2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (7,284,5,'리뷰제목7','리뷰내용7',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (8,1,3,'리뷰제목8','특별히 더 좋지도 않고 더 나쁘지도 않았어요',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (9,30,2,'리뷰제목9','괜찮았어요 다음에도 주문할 것 같아요',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (10,38,5,'리뷰제목10','저희집 아이가 너무 좋아해요 굳굳',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (11,39,6,'리뷰제목11','평이 좋아 구매했는데 제가 너무 기대한 걸까요? 실망스러웠어요..',1,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (12,40,8,'리뷰제목12','상품은 괜찮은데 이번에는 배송이 좀.. 많이 오래걸렸어요ㅠㅠ',2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (13,168,3,'리뷰제목13','굳굳굳',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (14,270,9,'리뷰제목14','좋았어용',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (15,278,2,'리뷰제목15','잘 구매했습니다',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (16,287,5,'리뷰제목16','추천추천추천추천',4,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (17,288,3,'리뷰제목17','완전 강추',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (18,289,6,'리뷰제목18','그냥 그랬어요',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (19,1,7,'리뷰제목19','좋아요!! 추천합니다',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (20,30,8,'리뷰제목20','그냥 그랬어요....',2,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (21,36,2,'리뷰제목21','나쁘진 않은 듯???',3,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
Insert into REVIEW (RE_NO,PRO_NO,RE_WRITER,RE_TITLE,RE_CONTENT,RE_STAR,ENROLL_DATE,MODIFY_DATE,READ_COUNT,STATUS,MACRO_NO,REVIEW) values (22,270,9,'리뷰제목22','상품 잘 받았습니다!!',5,to_date('24/03/28','RR/MM/DD'),to_date('24/03/28','RR/MM/DD'),0,'N',null,null);
REM INSERTING into STOCK
SET DEFINE OFF;
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (1,289,10,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (2,290,20,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (3,245,5,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (4,255,5,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (5,168,8,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (6,58,64,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (7,33,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (8,114,4,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (9,202,13,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (10,260,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (11,111,85,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (12,264,85,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (13,91,43,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (14,289,54,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (15,290,42,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (16,245,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (17,255,14,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (18,168,9,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (19,58,66,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (20,33,4,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (21,114,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (22,25,165,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (23,10,3,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (24,8,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (25,37,8,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (26,66,7,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (27,88,15,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (28,91,26,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (29,58,8,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (30,33,12,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (31,114,4,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (32,25,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (33,10,3,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (34,8,9,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (35,37,8,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (36,66,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (37,88,1,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (38,91,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (39,289,1,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (40,290,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (41,245,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (42,255,6,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (43,168,4,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (44,58,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (45,33,3,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (46,114,1,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (47,202,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (48,260,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (49,111,8,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (50,264,27,to_date('24/03/28','RR/MM/DD'),'I');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (51,91,10,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (52,289,32,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (53,290,20,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (54,245,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (55,255,1,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (56,168,12,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (57,58,2,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (58,33,5,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (59,114,1,to_date('24/03/28','RR/MM/DD'),'O');
Insert into STOCK (STOCK_NO,PRO_NO,COUNT,ENROLL_DATE,STATUS) values (60,288,3,to_date('24/03/28','RR/MM/DD'),'I');
REM INSERTING into TB_ORDER
SET DEFINE OFF;
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (1,2,to_date('22/08/14','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',202208141,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',94000,9400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (2,3,to_date('22/08/15','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',202208152,'간편결제',1,'배송 전 연락바랍니다.',406200,15000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (3,5,to_date('22/08/16','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',202208163,'은행',1,'부재 시 문 앞에 놓아주세요.',247200,19800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (4,6,to_date('22/08/17','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',202208174,'간편결제',1,'배송 전 연락바랍니다.',5400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (5,19,to_date('22/08/18','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',202208185,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',167000,4200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (6,44,to_date('22/08/19','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',202208196,'은행',1,'부재 시 택배함에 넣어주세요.',78000,9500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (7,25,to_date('22/08/20','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',202208207,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',200700,17000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (8,47,to_date('22/08/21','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',202208218,'간편결제',1,'배송 전 연락바랍니다.',37000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (9,41,to_date('22/08/22','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',202208229,'은행',1,'부재 시 문 앞에 놓아주세요.',63000,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (10,24,to_date('22/08/23','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',2022082310,'카드',1,null,95000,8800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (11,39,to_date('22/08/24','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',2022082411,'카드',1,'부재 시 경비실에 맡겨주세요.',289500,48700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (12,3,to_date('22/08/25','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',2022082512,'카드',1,'부재 시 문 앞에 놓아주세요.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (13,41,to_date('22/08/26','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',2022082613,'은행',1,'배송 전 연락바랍니다.',21000,11900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (14,39,to_date('22/08/27','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',2022082714,'무통장입금',1,null,2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (15,52,to_date('22/08/28','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',2022082815,'카드',1,null,126000,25800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (16,13,to_date('22/08/29','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',2022082916,'무통장입금',1,null,78000,10300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (17,21,to_date('22/08/30','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',2022083017,'카드',1,null,1500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (18,18,to_date('22/08/31','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',2022083118,'간편결제',1,null,125000,18300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (19,41,to_date('22/09/01','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',2022090119,'은행',1,'부재 시 문 앞에 놓아주세요.',99000,20000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (20,29,to_date('22/09/02','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',2022090220,'은행',1,'빠른 확인과 배송 부탁드립니다.',81000,8100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (21,44,to_date('22/09/03','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',2022090321,'은행',1,'부재 시 문 앞에 놓아주세요.',5600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (22,36,to_date('22/09/04','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',2022090422,'은행',1,'빠른 확인과 배송 부탁드립니다.',66500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (23,47,to_date('22/09/05','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',2022090523,'카드',1,'부재 시 경비실에 맡겨주세요.',171000,14000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (24,8,to_date('22/09/06','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',2022090624,'은행',1,'부재 시 문 앞에 놓아주세요.',10500,4000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (25,35,to_date('22/09/07','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',2022090725,'간편결제',1,'배송 전 연락바랍니다.',190000,18200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (26,9,to_date('22/09/08','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',2022090826,'간편결제',1,'부재 시 택배함에 넣어주세요.',167000,400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (27,27,to_date('22/09/09','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',2022090927,'카드',1,'부재 시 택배함에 넣어주세요.',22200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (28,48,to_date('22/09/10','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',2022091028,'카드',1,'배송 전 연락바랍니다.',42000,4400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (29,18,to_date('22/09/11','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',2022091129,'은행',1,'빠른 확인과 배송 부탁드립니다.',48000,5300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (30,33,to_date('22/09/12','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',2022091230,'카드',1,'부재 시 택배함에 넣어주세요.',1342000,13000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (31,10,to_date('22/09/13','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',2022091331,'카드',1,'빠른 확인과 배송 부탁드립니다.',72000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (32,32,to_date('22/09/14','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',2022091432,'은행',1,'부재 시 문 앞에 놓아주세요.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (33,17,to_date('22/09/15','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',2022091533,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',41700,200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (34,35,to_date('22/09/16','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',2022091634,'은행',1,'부재 시 경비실에 맡겨주세요.',60000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (35,51,to_date('22/09/17','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',2022091735,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',83000,4400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (36,49,to_date('22/09/18','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',2022091836,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',64700,7000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (37,38,to_date('22/09/19','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',2022091937,'무통장입금',1,'부재 시 택배함에 넣어주세요.',54000,4700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (38,23,to_date('22/09/20','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',2022092038,'카드',1,'부재 시 문 앞에 놓아주세요.',18000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (39,22,to_date('22/09/21','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',2022092139,'카드',1,'빠른 확인과 배송 부탁드립니다.',91800,36500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (40,12,to_date('22/09/22','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',2022092240,'카드',1,'부재 시 경비실에 맡겨주세요.',477500,22400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (41,6,to_date('22/09/23','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',2022092341,'무통장입금',1,null,51600,28100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (42,53,to_date('22/09/24','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',2022092442,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',154800,21300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (43,38,to_date('22/09/25','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',2022092543,'간편결제',1,'부재 시 택배함에 넣어주세요.',5000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (44,51,to_date('22/09/26','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',2022092644,'카드',1,'부재 시 택배함에 넣어주세요.',9900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (45,38,to_date('22/09/27','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',2022092745,'간편결제',1,'배송 전 연락바랍니다.',575000,9100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (46,24,to_date('22/09/28','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',2022092846,'은행',1,'빠른 확인과 배송 부탁드립니다.',27800,13500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (47,15,to_date('22/09/29','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',2022092947,'간편결제',1,'부재 시 경비실에 맡겨주세요.',15600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (48,6,to_date('22/09/30','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',2022093048,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',254700,19100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (49,33,to_date('22/10/01','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',2022100149,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',298500,24400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (50,54,to_date('22/10/02','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',2022100250,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',27500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (51,23,to_date('22/10/03','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',2022100351,'간편결제',1,'부재 시 경비실에 맡겨주세요.',122000,10900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (52,53,to_date('22/10/04','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',2022100452,'간편결제',1,'부재 시 경비실에 맡겨주세요.',79500,6500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (53,22,to_date('22/10/05','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',2022100553,'카드',1,'빠른 확인과 배송 부탁드립니다.',10500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (54,17,to_date('22/10/06','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',2022100654,'카드',1,'빠른 확인과 배송 부탁드립니다.',180000,6300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (55,29,to_date('22/10/07','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',2022100755,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',177500,13400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (56,49,to_date('22/10/08','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',2022100856,'은행',1,'빠른 확인과 배송 부탁드립니다.',66000,9800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (57,52,to_date('22/10/09','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',2022100957,'간편결제',1,'부재 시 택배함에 넣어주세요.',8400,5800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (58,7,to_date('22/10/10','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',2022101058,'무통장입금',1,'배송 전 연락바랍니다.',156000,7500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (59,11,to_date('22/10/11','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',2022101159,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',81000,13800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (60,45,to_date('22/10/12','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',2022101260,'은행',1,'빠른 확인과 배송 부탁드립니다.',435000,10300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (61,40,to_date('22/10/13','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',2022101361,'카드',1,'부재 시 문 앞에 놓아주세요.',30000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (62,4,to_date('22/10/14','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',2022101462,'은행',1,null,22000,5500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (63,27,to_date('22/10/15','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',2022101563,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',30600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (64,26,to_date('22/10/16','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',2022101664,'간편결제',1,'부재 시 경비실에 맡겨주세요.',32000,4700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (65,27,to_date('22/10/17','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',2022101765,'간편결제',1,'부재 시 택배함에 넣어주세요.',78000,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (66,9,to_date('22/10/18','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',2022101866,'카드',1,'부재 시 경비실에 맡겨주세요.',63900,13200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (67,39,to_date('22/10/19','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',2022101967,'은행',1,'빠른 확인과 배송 부탁드립니다.',117600,3700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (68,21,to_date('22/10/20','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',2022102068,'카드',1,'부재 시 문 앞에 놓아주세요.',37000,28800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (69,47,to_date('22/10/21','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',2022102169,'간편결제',1,'부재 시 택배함에 넣어주세요.',177500,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (70,48,to_date('22/10/22','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',2022102270,'카드',1,'부재 시 경비실에 맡겨주세요.',7000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (71,28,to_date('22/10/23','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',2022102371,'은행',1,'부재 시 택배함에 넣어주세요.',201000,44700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (72,25,to_date('22/10/24','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',2022102472,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',394000,18900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (73,10,to_date('22/10/25','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',2022102573,'무통장입금',1,'배송 전 연락바랍니다.',48000,11300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (74,28,to_date('22/10/26','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',2022102674,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',32000,14100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (75,36,to_date('22/10/27','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',2022102775,'은행',1,'배송 전 연락바랍니다.',114200,10000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (76,33,to_date('22/10/28','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',2022102876,'카드',1,'배송 전 연락바랍니다.',406500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (77,17,to_date('22/10/29','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',2022102977,'간편결제',1,'배송 전 연락바랍니다.',238500,34300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (78,45,to_date('22/10/30','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',2022103078,'무통장입금',1,'배송 전 연락바랍니다.',611000,44200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (79,39,to_date('22/10/31','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',2022103179,'은행',1,'배송 전 연락바랍니다.',29700,10900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (80,12,to_date('22/11/01','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',2022110180,'간편결제',1,'부재 시 경비실에 맡겨주세요.',12000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (81,8,to_date('22/11/02','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',2022110281,'은행',1,'부재 시 택배함에 넣어주세요.',86000,20100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (82,56,to_date('22/11/03','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',2022110382,'간편결제',1,'부재 시 문 앞에 놓아주세요.',217800,6000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (83,51,to_date('22/11/04','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',2022110483,'카드',1,null,39700,34900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (84,18,to_date('22/11/05','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',2022110584,'카드',1,'부재 시 문 앞에 놓아주세요.',103000,12400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (85,24,to_date('22/11/06','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',2022110685,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',58000,45300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (86,6,to_date('22/11/07','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',2022110786,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (87,12,to_date('22/11/08','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',2022110887,'간편결제',1,'부재 시 경비실에 맡겨주세요.',395000,30600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (88,26,to_date('22/11/09','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',2022110988,'간편결제',1,'부재 시 경비실에 맡겨주세요.',116000,11900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (89,17,to_date('22/11/10','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',2022111089,'무통장입금',1,'배송 전 연락바랍니다.',54000,18200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (90,18,to_date('22/11/11','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',2022111190,'카드',1,'배송 전 연락바랍니다.',20000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (91,49,to_date('22/11/12','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',2022111291,'간편결제',1,'부재 시 문 앞에 놓아주세요.',85000,2300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (92,50,to_date('22/11/13','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',2022111392,'은행',1,'부재 시 택배함에 넣어주세요.',90000,200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (93,8,to_date('22/11/14','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',2022111493,'은행',1,'부재 시 택배함에 넣어주세요.',121500,11900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (94,29,to_date('22/11/15','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',2022111594,'무통장입금',1,'배송 전 연락바랍니다.',39800,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (95,54,to_date('22/11/16','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',2022111695,'카드',1,'배송 전 연락바랍니다.',35600,9800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (96,55,to_date('22/11/17','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',2022111796,'간편결제',1,'배송 전 연락바랍니다.',95400,9300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (97,39,to_date('22/11/18','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',2022111897,'카드',1,'부재 시 택배함에 넣어주세요.',432000,55600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (98,48,to_date('22/11/19','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',2022111998,'카드',1,'부재 시 문 앞에 놓아주세요.',6000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (99,7,to_date('22/11/20','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',2022112099,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',46100,25000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (100,41,to_date('22/11/21','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20221121100,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',48000,20800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (101,51,to_date('22/11/22','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20221122101,'은행',1,'부재 시 문 앞에 놓아주세요.',38000,20500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (102,37,to_date('22/11/23','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20221123102,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',108800,3500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (103,6,to_date('22/11/24','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20221124103,'은행',1,'빠른 확인과 배송 부탁드립니다.',262000,6900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (104,5,to_date('22/11/25','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20221125104,'카드',1,'배송 전 연락바랍니다.',2600,600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (105,47,to_date('22/11/26','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20221126105,'은행',1,'부재 시 택배함에 넣어주세요.',172600,100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (106,19,to_date('22/11/27','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20221127106,'간편결제',1,'부재 시 문 앞에 놓아주세요.',39000,6200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (107,51,to_date('22/11/28','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20221128107,'무통장입금',1,'배송 전 연락바랍니다.',29100,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (108,17,to_date('22/11/29','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',20221129108,'은행',1,'부재 시 경비실에 맡겨주세요.',41700,15000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (109,46,to_date('22/11/30','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20221130109,'무통장입금',1,'부재 시 택배함에 넣어주세요.',6300,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (110,43,to_date('22/12/01','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20221201110,'간편결제',1,'배송 전 연락바랍니다.',125800,40300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (111,21,to_date('22/12/02','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20221202111,'은행',1,'배송 전 연락바랍니다.',149700,20000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (112,20,to_date('22/12/03','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20221203112,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',1500,400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (113,15,to_date('22/12/04','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20221204113,'카드',1,null,106200,44200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (114,49,to_date('22/12/05','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20221205114,'카드',1,'배송 전 연락바랍니다.',78000,30000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (115,31,to_date('22/12/06','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20221206115,'은행',1,'배송 전 연락바랍니다.',127400,1400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (116,29,to_date('22/12/07','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20221207116,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',3000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (117,4,to_date('22/12/08','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20221208117,'카드',1,'빠른 확인과 배송 부탁드립니다.',214800,2700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (118,37,to_date('22/12/09','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20221209118,'카드',1,'빠른 확인과 배송 부탁드립니다.',15400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (119,32,to_date('22/12/10','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',20221210119,'간편결제',1,'부재 시 택배함에 넣어주세요.',74800,26300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (120,47,to_date('22/12/11','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20221211120,'무통장입금',1,'배송 전 연락바랍니다.',52500,13400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (121,15,to_date('22/12/12','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20221212121,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',15000,6200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (122,12,to_date('22/12/13','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20221213122,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',56700,1800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (123,40,to_date('22/12/14','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20221214123,'은행',1,'부재 시 문 앞에 놓아주세요.',23900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (124,53,to_date('22/12/15','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20221215124,'카드',1,'배송 전 연락바랍니다.',144000,200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (125,24,to_date('22/12/16','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20221216125,'카드',1,'빠른 확인과 배송 부탁드립니다.',5500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (126,54,to_date('22/12/17','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20221217126,'은행',1,'배송 전 연락바랍니다.',84500,46100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (127,18,to_date('22/12/18','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20221218127,'카드',1,'배송 전 연락바랍니다.',329000,24700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (128,42,to_date('22/12/19','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20221219128,'카드',1,'부재 시 택배함에 넣어주세요.',60000,1300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (129,3,to_date('22/12/20','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20221220129,'무통장입금',1,'배송 전 연락바랍니다.',14900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (130,38,to_date('22/12/21','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20221221130,'무통장입금',1,'배송 전 연락바랍니다.',450000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (131,25,to_date('22/12/22','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20221222131,'카드',1,'배송 전 연락바랍니다.',72900,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (132,21,to_date('22/12/23','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20221223132,'은행',1,null,571000,23700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (133,23,to_date('22/12/24','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20221224133,'간편결제',1,'배송 전 연락바랍니다.',36000,1900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (134,28,to_date('22/12/25','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20221225134,'은행',1,'배송 전 연락바랍니다.',75200,49400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (135,28,to_date('22/12/26','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20221226135,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',156500,10500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (136,21,to_date('22/12/27','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20221227136,'간편결제',1,'부재 시 경비실에 맡겨주세요.',447000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (137,2,to_date('22/12/28','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20221228137,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',22000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (138,52,to_date('22/12/29','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',20221229138,'간편결제',1,'부재 시 문 앞에 놓아주세요.',34100,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (139,9,to_date('22/12/30','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20221230139,'카드',1,null,56000,8500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (140,39,to_date('22/12/31','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20221231140,'카드',1,null,501000,28700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (141,16,to_date('23/01/01','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230101141,'카드',1,null,105700,6400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (142,55,to_date('23/01/02','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230102142,'카드',1,'부재 시 경비실에 맡겨주세요.',190200,700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (143,12,to_date('23/01/03','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230103143,'은행',1,'부재 시 택배함에 넣어주세요.',88500,12700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (144,36,to_date('23/01/04','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230104144,'은행',1,'부재 시 문 앞에 놓아주세요.',38400,5200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (145,31,to_date('23/01/05','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230105145,'은행',1,'배송 전 연락바랍니다.',91000,100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (146,26,to_date('23/01/06','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230106146,'간편결제',1,'배송 전 연락바랍니다.',56000,15900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (147,31,to_date('23/01/07','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230107147,'간편결제',1,'부재 시 문 앞에 놓아주세요.',120400,11700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (148,20,to_date('23/01/08','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230108148,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',33000,11300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (149,10,to_date('23/01/09','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230109149,'무통장입금',1,'부재 시 택배함에 넣어주세요.',3000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (150,21,to_date('23/01/10','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230110150,'카드',1,null,382000,15600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (151,29,to_date('23/01/11','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230111151,'은행',1,null,42600,3600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (152,26,to_date('23/01/12','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230112152,'은행',1,null,19900,2400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (153,3,to_date('23/01/13','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230113153,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',198500,800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (154,23,to_date('23/01/14','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230114154,'은행',1,'부재 시 택배함에 넣어주세요.',19900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (155,17,to_date('23/01/15','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',20230115155,'무통장입금',1,'배송 전 연락바랍니다.',60000,5100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (156,16,to_date('23/01/16','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230116156,'은행',1,'부재 시 경비실에 맡겨주세요.',17500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (157,2,to_date('23/01/17','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20230117157,'간편결제',1,'부재 시 택배함에 넣어주세요.',288000,10800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (158,42,to_date('23/01/18','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230118158,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',147600,12200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (159,18,to_date('23/01/19','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230119159,'무통장입금',1,'부재 시 택배함에 넣어주세요.',90400,10800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (160,13,to_date('23/01/20','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20230120160,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',38700,11200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (161,51,to_date('23/01/21','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20230121161,'무통장입금',1,'배송 전 연락바랍니다.',30000,1100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (162,25,to_date('23/01/22','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230122162,'무통장입금',1,'배송 전 연락바랍니다.',380900,23000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (163,41,to_date('23/01/23','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230123163,'무통장입금',1,'배송 전 연락바랍니다.',182000,22400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (164,53,to_date('23/01/24','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230124164,'카드',1,'부재 시 택배함에 넣어주세요.',75000,16300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (165,44,to_date('23/01/25','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20230125165,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',38500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (166,34,to_date('23/01/26','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20230126166,'은행',1,'배송 전 연락바랍니다.',3800,1900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (167,35,to_date('23/01/27','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20230127167,'무통장입금',1,'부재 시 택배함에 넣어주세요.',328500,42000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (168,26,to_date('23/01/28','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230128168,'간편결제',1,'부재 시 경비실에 맡겨주세요.',198000,1800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (169,47,to_date('23/01/29','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20230129169,'카드',1,'부재 시 경비실에 맡겨주세요.',46500,23900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (170,13,to_date('23/01/30','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20230130170,'간편결제',1,'부재 시 경비실에 맡겨주세요.',25600,6600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (171,16,to_date('23/01/31','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230131171,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',670500,17200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (172,12,to_date('23/02/01','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230201172,'간편결제',1,'배송 전 연락바랍니다.',501000,27600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (173,8,to_date('23/02/02','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230202173,'은행',1,'배송 전 연락바랍니다.',144000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (174,10,to_date('23/02/03','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230203174,'카드',1,'부재 시 택배함에 넣어주세요.',152800,37100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (175,55,to_date('23/02/04','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230204175,'간편결제',1,'부재 시 경비실에 맡겨주세요.',603000,7500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (176,22,to_date('23/02/05','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230205176,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',27800,6700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (177,9,to_date('23/02/06','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230206177,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',566000,22700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (178,37,to_date('23/02/07','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20230207178,'카드',1,'부재 시 경비실에 맡겨주세요.',10000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (179,23,to_date('23/02/08','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230208179,'간편결제',1,'부재 시 경비실에 맡겨주세요.',473000,32700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (180,16,to_date('23/02/09','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230209180,'무통장입금',1,'부재 시 택배함에 넣어주세요.',125000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (181,3,to_date('23/02/10','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230210181,'은행',1,'부재 시 문 앞에 놓아주세요.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (182,7,to_date('23/02/11','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',20230211182,'은행',1,'부재 시 경비실에 맡겨주세요.',24600,7000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (183,3,to_date('23/02/12','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230212183,'카드',1,'부재 시 문 앞에 놓아주세요.',422900,15200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (184,41,to_date('23/02/13','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230213184,'간편결제',1,'배송 전 연락바랍니다.',226500,2000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (185,6,to_date('23/02/14','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20230214185,'간편결제',1,null,39800,13200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (186,19,to_date('23/02/15','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230215186,'은행',1,null,28200,12100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (187,51,to_date('23/02/16','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20230216187,'은행',1,'부재 시 문 앞에 놓아주세요.',294600,3900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (188,30,to_date('23/02/17','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20230217188,'은행',1,'배송 전 연락바랍니다.',12000,500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (189,32,to_date('23/02/18','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',20230218189,'간편결제',1,'배송 전 연락바랍니다.',116000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (190,40,to_date('23/02/19','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230219190,'무통장입금',1,'부재 시 택배함에 넣어주세요.',564000,7200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (191,12,to_date('23/02/20','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230220191,'은행',1,'부재 시 택배함에 넣어주세요.',14200,6200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (192,31,to_date('23/02/21','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230221192,'카드',1,'빠른 확인과 배송 부탁드립니다.',51000,34200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (193,26,to_date('23/02/22','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230222193,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',4400,3200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (194,12,to_date('23/02/23','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230223194,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',40000,15300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (195,47,to_date('23/02/24','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20230224195,'무통장입금',1,'부재 시 택배함에 넣어주세요.',197400,25800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (196,18,to_date('23/02/25','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230225196,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',49000,6900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (197,20,to_date('23/02/26','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230226197,'간편결제',1,'부재 시 문 앞에 놓아주세요.',129500,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (198,5,to_date('23/02/27','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20230227198,'간편결제',1,'부재 시 문 앞에 놓아주세요.',1029400,23400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (199,9,to_date('23/02/28','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230228199,'간편결제',1,'부재 시 문 앞에 놓아주세요.',22000,16500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (200,46,to_date('23/03/01','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20230301200,'은행',1,'부재 시 문 앞에 놓아주세요.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (201,41,to_date('23/03/02','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230302201,'무통장입금',1,'배송 전 연락바랍니다.',121000,6100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (202,56,to_date('23/03/03','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230303202,'간편결제',1,'부재 시 택배함에 넣어주세요.',204000,1200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (203,20,to_date('23/03/04','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230304203,'은행',1,'배송 전 연락바랍니다.',25600,19100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (204,8,to_date('23/03/05','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230305204,'카드',1,'부재 시 택배함에 넣어주세요.',101100,33900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (205,36,to_date('23/03/06','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230306205,'카드',1,'부재 시 문 앞에 놓아주세요.',100000,18200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (206,40,to_date('23/03/07','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230307206,'간편결제',1,'부재 시 경비실에 맡겨주세요.',54000,3900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (207,25,to_date('23/03/08','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230308207,'무통장입금',1,null,319400,90000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (208,26,to_date('23/03/09','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230309208,'간편결제',1,null,61000,20200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (209,42,to_date('23/03/10','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230310209,'은행',1,null,39000,12300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (210,23,to_date('23/03/11','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230311210,'카드',1,'부재 시 경비실에 맡겨주세요.',169500,1600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (211,19,to_date('23/03/12','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230312211,'카드',1,'빠른 확인과 배송 부탁드립니다.',192000,24700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (212,9,to_date('23/03/13','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230313212,'간편결제',1,'부재 시 문 앞에 놓아주세요.',39000,17900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (213,56,to_date('23/03/14','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230314213,'은행',1,'부재 시 문 앞에 놓아주세요.',182000,11600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (214,23,to_date('23/03/15','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230315214,'카드',1,'배송 전 연락바랍니다.',9400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (215,52,to_date('23/03/16','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',20230316215,'은행',1,'배송 전 연락바랍니다.',108500,29100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (216,42,to_date('23/03/17','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230317216,'카드',1,'배송 전 연락바랍니다.',10800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (217,45,to_date('23/03/18','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20230318217,'간편결제',1,'부재 시 경비실에 맡겨주세요.',87500,36400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (218,23,to_date('23/03/19','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230319218,'카드',1,'부재 시 경비실에 맡겨주세요.',454900,5000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (219,24,to_date('23/03/20','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20230320219,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',201000,43000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (220,19,to_date('23/03/21','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230321220,'간편결제',1,'부재 시 택배함에 넣어주세요.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (221,54,to_date('23/03/22','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230322221,'간편결제',1,'부재 시 택배함에 넣어주세요.',32000,300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (222,38,to_date('23/03/23','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20230323222,'은행',1,'부재 시 경비실에 맡겨주세요.',89500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (223,12,to_date('23/03/24','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230324223,'은행',1,'부재 시 택배함에 넣어주세요.',139000,2500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (224,14,to_date('23/03/25','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20230325224,'은행',1,'배송 전 연락바랍니다.',138000,3600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (225,11,to_date('23/03/26','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20230326225,'간편결제',1,'배송 전 연락바랍니다.',209500,22800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (226,18,to_date('23/03/27','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230327226,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',33000,24700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (227,28,to_date('23/03/28','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20230328227,'은행',1,null,207000,61900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (228,13,to_date('23/03/29','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20230329228,'간편결제',1,null,123000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (229,12,to_date('23/03/30','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230330229,'은행',1,'부재 시 문 앞에 놓아주세요.',282000,16700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (230,22,to_date('23/03/31','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230331230,'카드',1,'부재 시 문 앞에 놓아주세요.',4400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (231,40,to_date('23/04/01','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230401231,'카드',1,'부재 시 경비실에 맡겨주세요.',92000,9700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (232,27,to_date('23/04/02','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',20230402232,'카드',1,'부재 시 문 앞에 놓아주세요.',18000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (233,42,to_date('23/04/03','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230403233,'은행',1,'배송 전 연락바랍니다.',1500,600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (234,37,to_date('23/04/04','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20230404234,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',28900,1100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (235,21,to_date('23/04/05','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230405235,'은행',1,'부재 시 경비실에 맡겨주세요.',395000,71100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (236,40,to_date('23/04/06','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230406236,'은행',1,'배송 전 연락바랍니다.',45000,4500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (237,49,to_date('23/04/07','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20230407237,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',108000,17400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (238,25,to_date('23/04/08','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230408238,'은행',1,'빠른 확인과 배송 부탁드립니다.',277500,79900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (239,40,to_date('23/04/09','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230409239,'은행',1,'부재 시 문 앞에 놓아주세요.',214000,16500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (240,55,to_date('23/04/10','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230410240,'카드',1,'부재 시 경비실에 맡겨주세요.',95900,51500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (241,34,to_date('23/04/11','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20230411241,'무통장입금',1,'배송 전 연락바랍니다.',87000,32000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (242,3,to_date('23/04/12','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230412242,'무통장입금',1,'배송 전 연락바랍니다.',113000,18000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (243,5,to_date('23/04/13','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20230413243,'카드',1,'빠른 확인과 배송 부탁드립니다.',256800,45800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (244,12,to_date('23/04/14','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230414244,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',30000,3500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (245,46,to_date('23/04/15','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20230415245,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',21000,2000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (246,35,to_date('23/04/16','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20230416246,'카드',1,'부재 시 문 앞에 놓아주세요.',57500,5900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (247,6,to_date('23/04/17','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20230417247,'간편결제',1,'부재 시 택배함에 넣어주세요.',45000,37900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (248,41,to_date('23/04/18','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230418248,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',29000,27600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (249,10,to_date('23/04/19','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230419249,'카드',1,'빠른 확인과 배송 부탁드립니다.',68100,17100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (250,10,to_date('23/04/20','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230420250,'카드',1,'빠른 확인과 배송 부탁드립니다.',138000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (251,11,to_date('23/04/21','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20230421251,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',50100,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (252,2,to_date('23/04/22','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20230422252,'카드',1,'부재 시 경비실에 맡겨주세요.',378000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (253,56,to_date('23/04/23','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230423253,'은행',1,'빠른 확인과 배송 부탁드립니다.',15000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (254,42,to_date('23/04/24','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230424254,'간편결제',1,'부재 시 경비실에 맡겨주세요.',167000,200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (255,9,to_date('23/04/25','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230425255,'간편결제',1,'배송 전 연락바랍니다.',125100,3300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (256,25,to_date('23/04/26','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230426256,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',129500,17900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (257,31,to_date('23/04/27','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230427257,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',27000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (258,8,to_date('23/04/28','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230428258,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',176500,20600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (259,29,to_date('23/04/29','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230429259,'간편결제',1,'배송 전 연락바랍니다.',101800,45600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (260,14,to_date('23/04/30','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20230430260,'카드',1,'부재 시 경비실에 맡겨주세요.',30000,17100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (261,9,to_date('23/05/01','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230501261,'카드',1,'배송 전 연락바랍니다.',50800,1600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (262,22,to_date('23/05/02','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230502262,'은행',1,'배송 전 연락바랍니다.',75800,21300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (263,4,to_date('23/05/03','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20230503263,'카드',1,'부재 시 경비실에 맡겨주세요.',92000,48900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (264,21,to_date('23/05/04','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230504264,'은행',1,'배송 전 연락바랍니다.',40200,22800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (265,22,to_date('23/05/05','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230505265,'은행',1,'배송 전 연락바랍니다.',199000,20500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (266,23,to_date('23/05/06','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230506266,'간편결제',1,'배송 전 연락바랍니다.',2800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (267,30,to_date('23/05/07','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20230507267,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',490700,11900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (268,47,to_date('23/05/08','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20230508268,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',100000,21100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (269,43,to_date('23/05/09','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20230509269,'카드',1,'부재 시 택배함에 넣어주세요.',56000,3200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (270,8,to_date('23/05/10','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230510270,'은행',1,'부재 시 문 앞에 놓아주세요.',176700,1600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (271,18,to_date('23/05/11','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230511271,'간편결제',1,'배송 전 연락바랍니다.',29500,2800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (272,9,to_date('23/05/12','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230512272,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',192000,23900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (273,11,to_date('23/05/13','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20230513273,'은행',1,'부재 시 문 앞에 놓아주세요.',58600,5700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (274,2,to_date('23/05/14','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20230514274,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',2100,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (275,10,to_date('23/05/15','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230515275,'카드',1,'배송 전 연락바랍니다.',194000,11000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (276,29,to_date('23/05/16','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230516276,'카드',1,'부재 시 택배함에 넣어주세요.',239000,2900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (277,6,to_date('23/05/17','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20230517277,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',118000,16000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (278,36,to_date('23/05/18','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230518278,'간편결제',1,'부재 시 경비실에 맡겨주세요.',188000,3900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (279,2,to_date('23/05/19','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20230519279,'카드',1,'부재 시 경비실에 맡겨주세요.',54200,3500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (280,28,to_date('23/05/20','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20230520280,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',3000,900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (281,54,to_date('23/05/21','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230521281,'무통장입금',1,'배송 전 연락바랍니다.',118000,4700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (282,54,to_date('23/05/22','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230522282,'무통장입금',1,'부재 시 택배함에 넣어주세요.',192000,15700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (283,8,to_date('23/05/23','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230523283,'카드',1,'배송 전 연락바랍니다.',54900,18500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (284,4,to_date('23/05/24','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20230524284,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',2600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (285,27,to_date('23/05/25','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',20230525285,'카드',1,'부재 시 문 앞에 놓아주세요.',66000,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (286,36,to_date('23/05/26','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230526286,'카드',1,'부재 시 문 앞에 놓아주세요.',8200,1600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (287,55,to_date('23/05/27','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230527287,'간편결제',1,'배송 전 연락바랍니다.',40100,16400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (288,14,to_date('23/05/28','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20230528288,'카드',1,'배송 전 연락바랍니다.',46200,12200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (289,20,to_date('23/05/29','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230529289,'은행',1,'부재 시 경비실에 맡겨주세요.',38000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (290,25,to_date('23/05/30','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230530290,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',21000,5700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (291,19,to_date('23/05/31','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230531291,'카드',1,'배송 전 연락바랍니다.',43900,5700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (292,27,to_date('23/06/01','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',20230601292,'은행',1,'부재 시 문 앞에 놓아주세요.',38000,37500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (293,16,to_date('23/06/02','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230602293,'간편결제',1,'배송 전 연락바랍니다.',19900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (294,42,to_date('23/06/03','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230603294,'카드',1,'부재 시 택배함에 넣어주세요.',260000,14500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (295,12,to_date('23/06/04','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230604295,'무통장입금',1,'배송 전 연락바랍니다.',116400,15800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (296,50,to_date('23/06/05','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',20230605296,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',101000,8000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (297,17,to_date('23/06/06','RR/MM/DD'),'36725','경북 안동시','마들6길 62 (용상동 1517-250)','전진희','054-820-0103',20230606297,'카드',1,'빠른 확인과 배송 부탁드립니다.',538500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (298,3,to_date('23/06/07','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230607298,'간편결제',1,'부재 시 택배함에 넣어주세요.',11800,4700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (299,48,to_date('23/06/08','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',20230608299,'카드',1,'부재 시 문 앞에 놓아주세요.',16900,3400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (300,4,to_date('23/06/09','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20230609300,'무통장입금',1,'부재 시 택배함에 넣어주세요.',246000,3000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (301,28,to_date('23/06/10','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20230610301,'간편결제',1,'배송 전 연락바랍니다.',3000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (302,32,to_date('23/06/11','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',20230611302,'간편결제',1,'부재 시 문 앞에 놓아주세요.',39500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (303,38,to_date('23/06/12','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20230612303,'무통장입금',1,'배송 전 연락바랍니다.',383500,19500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (304,38,to_date('23/06/13','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20230613304,'카드',1,'부재 시 문 앞에 놓아주세요.',67800,7800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (305,55,to_date('23/06/14','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230614305,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',284600,1300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (306,51,to_date('23/06/15','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20230615306,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',77900,25700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (307,39,to_date('23/06/16','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20230616307,'간편결제',1,'부재 시 문 앞에 놓아주세요.',489000,36000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (308,6,to_date('23/06/17','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20230617308,'간편결제',1,'부재 시 경비실에 맡겨주세요.',20000,3000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (309,9,to_date('23/06/18','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230618309,'은행',1,'배송 전 연락바랍니다.',88000,21800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (310,34,to_date('23/06/19','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20230619310,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',183000,14000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (311,20,to_date('23/06/20','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230620311,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',9200,1400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (312,34,to_date('23/06/21','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20230621312,'은행',1,'부재 시 경비실에 맡겨주세요.',354000,3400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (313,53,to_date('23/06/22','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230622313,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',4400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (314,51,to_date('23/06/23','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20230623314,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',114000,40500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (315,36,to_date('23/06/24','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230624315,'카드',1,'배송 전 연락바랍니다.',468200,3200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (316,44,to_date('23/06/25','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20230625316,'은행',1,'배송 전 연락바랍니다.',9200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (317,30,to_date('23/06/26','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20230626317,'은행',1,'부재 시 택배함에 넣어주세요.',35000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (318,29,to_date('23/06/27','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230627318,'카드',1,'빠른 확인과 배송 부탁드립니다.',292500,11500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (319,3,to_date('23/06/28','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230628319,'카드',1,'부재 시 경비실에 맡겨주세요.',238500,13800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (320,7,to_date('23/06/29','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',20230629320,'간편결제',1,'부재 시 경비실에 맡겨주세요.',80800,7300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (321,36,to_date('23/06/30','RR/MM/DD'),'52709','경남 진주시','진주대로 963 (강남동 145)','류미란','055-760-8841',20230630321,'무통장입금',1,'부재 시 택배함에 넣어주세요.',69000,16400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (322,19,to_date('23/07/01','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230701322,'카드',1,'부재 시 문 앞에 놓아주세요.',100500,14600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (323,43,to_date('23/07/02','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20230702323,'무통장입금',1,'부재 시 택배함에 넣어주세요.',14400,10100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (324,56,to_date('23/07/03','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230703324,'은행',1,'부재 시 경비실에 맡겨주세요.',15800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (325,23,to_date('23/07/04','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230704325,'간편결제',1,'부재 시 문 앞에 놓아주세요.',131000,40500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (326,41,to_date('23/07/05','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230705326,'은행',1,'배송 전 연락바랍니다.',36000,14800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (327,47,to_date('23/07/06','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20230706327,'은행',1,'부재 시 문 앞에 놓아주세요.',539700,1500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (328,42,to_date('23/07/07','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20230707328,'카드',1,'빠른 확인과 배송 부탁드립니다.',18000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (329,52,to_date('23/07/08','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',20230708329,'간편결제',1,'배송 전 연락바랍니다.',40000,4300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (330,13,to_date('23/07/09','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20230709330,'은행',1,'빠른 확인과 배송 부탁드립니다.',151400,9400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (331,54,to_date('23/07/10','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230710331,'간편결제',1,'배송 전 연락바랍니다.',124000,3000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (332,10,to_date('23/07/11','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20230711332,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',4400,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (333,49,to_date('23/07/12','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20230712333,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',287400,5500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (334,37,to_date('23/07/13','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20230713334,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',20000,5900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (335,22,to_date('23/07/14','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230714335,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',411600,39400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (336,53,to_date('23/07/15','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230715336,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',25000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (337,37,to_date('23/07/16','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20230716337,'간편결제',1,'배송 전 연락바랍니다.',33000,18900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (338,25,to_date('23/07/17','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230717338,'카드',1,'부재 시 택배함에 넣어주세요.',144000,25400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (339,4,to_date('23/07/18','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20230718339,'카드',1,'부재 시 택배함에 넣어주세요.',460000,6200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (340,43,to_date('23/07/19','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20230719340,'무통장입금',1,'배송 전 연락바랍니다.',9800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (341,8,to_date('23/07/20','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230720341,'카드',1,'부재 시 택배함에 넣어주세요.',92000,26400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (342,50,to_date('23/07/21','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',20230721342,'은행',1,'부재 시 경비실에 맡겨주세요.',336600,34000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (343,55,to_date('23/07/22','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230722343,'간편결제',1,'부재 시 경비실에 맡겨주세요.',46000,20300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (344,30,to_date('23/07/23','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20230723344,'은행',1,'부재 시 경비실에 맡겨주세요.',9000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (345,49,to_date('23/07/24','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20230724345,'카드',1,'빠른 확인과 배송 부탁드립니다.',18300,2800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (346,29,to_date('23/07/25','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230725346,'카드',1,'부재 시 경비실에 맡겨주세요.',45600,13400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (347,45,to_date('23/07/26','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20230726347,'간편결제',1,'부재 시 문 앞에 놓아주세요.',216000,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (348,19,to_date('23/07/27','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20230727348,'은행',1,'빠른 확인과 배송 부탁드립니다.',120000,10100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (349,28,to_date('23/07/28','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20230728349,'은행',1,'부재 시 경비실에 맡겨주세요.',30000,2400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (350,52,to_date('23/07/29','RR/MM/DD'),'24854','강원 속초시','청초호반로 211 (교동 668-26)','김현진','033-639-6800',20230729350,'카드',1,'부재 시 택배함에 넣어주세요.',72600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (351,41,to_date('23/07/30','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20230730351,'카드',1,null,389100,1300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (352,56,to_date('23/07/31','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230731352,'간편결제',1,null,87000,9700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (353,22,to_date('23/08/01','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230801353,'은행',1,null,29800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (354,18,to_date('23/08/02','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230802354,'간편결제',1,null,148100,2600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (355,48,to_date('23/08/03','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',20230803355,'간편결제',1,'배송 전 연락바랍니다.',57500,10400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (356,53,to_date('23/08/04','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230804356,'간편결제',1,'부재 시 택배함에 넣어주세요.',41000,5800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (357,21,to_date('23/08/05','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230805357,'간편결제',1,'배송 전 연락바랍니다.',197000,13000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (358,50,to_date('23/08/06','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',20230806358,'은행',1,'부재 시 문 앞에 놓아주세요.',3300,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (359,53,to_date('23/08/07','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230807359,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',132000,33500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (360,21,to_date('23/08/08','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230808360,'간편결제',1,'배송 전 연락바랍니다.',185700,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (361,34,to_date('23/08/09','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20230809361,'카드',1,'부재 시 경비실에 맡겨주세요.',32000,13400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (362,49,to_date('23/08/10','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20230810362,'은행',1,'부재 시 문 앞에 놓아주세요.',78600,25500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (363,48,to_date('23/08/11','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',20230811363,'무통장입금',1,'배송 전 연락바랍니다.',81200,9200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (364,53,to_date('23/08/12','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230812364,'간편결제',1,'배송 전 연락바랍니다.',82000,23200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (365,53,to_date('23/08/13','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20230813365,'무통장입금',1,'부재 시 택배함에 넣어주세요.',34000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (366,22,to_date('23/08/14','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20230814366,'은행',1,'빠른 확인과 배송 부탁드립니다.',257000,17800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (367,4,to_date('23/08/15','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20230815367,'은행',1,'부재 시 경비실에 맡겨주세요.',195000,11600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (368,9,to_date('23/08/16','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20230816368,'은행',1,'빠른 확인과 배송 부탁드립니다.',10000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (369,23,to_date('23/08/17','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230817369,'무통장입금',1,'부재 시 택배함에 넣어주세요.',93400,1800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (370,40,to_date('23/08/18','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230818370,'간편결제',1,'부재 시 문 앞에 놓아주세요.',78000,35600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (371,21,to_date('23/08/19','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230819371,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',216100,5500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (372,54,to_date('23/08/20','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230820372,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',39400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (373,35,to_date('23/08/21','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20230821373,'은행',1,'0',17900,6600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (374,5,to_date('23/08/22','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20230822374,'카드',1,null,207000,4200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (375,21,to_date('23/08/23','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20230823375,'은행',1,'부재 시 경비실에 맡겨주세요.',348000,49400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (376,25,to_date('23/08/24','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20230824376,'간편결제',1,'부재 시 택배함에 넣어주세요.',63000,23900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (377,20,to_date('23/08/25','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230825377,'카드',1,'부재 시 택배함에 넣어주세요.',36000,14500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (378,29,to_date('23/08/26','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230826378,'카드',1,'배송 전 연락바랍니다.',25000,15700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (379,47,to_date('23/08/27','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20230827379,'카드',1,'빠른 확인과 배송 부탁드립니다.',482500,1800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (380,44,to_date('23/08/28','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20230828380,'무통장입금',1,'부재 시 택배함에 넣어주세요.',119900,10500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (381,39,to_date('23/08/29','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20230829381,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',51000,11300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (382,16,to_date('23/08/30','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230830382,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',882400,20100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (383,54,to_date('23/08/31','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20230831383,'은행',1,'부재 시 문 앞에 놓아주세요.',330000,6400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (384,56,to_date('23/09/01','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230901384,'은행',1,'빠른 확인과 배송 부탁드립니다.',64600,17800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (385,44,to_date('23/09/02','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20230902385,'무통장입금',1,'배송 전 연락바랍니다.',304800,31600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (386,15,to_date('23/09/03','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20230903386,'간편결제',1,'배송 전 연락바랍니다.',35400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (387,16,to_date('23/09/04','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20230904387,'간편결제',1,'0',102600,18000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (388,23,to_date('23/09/05','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230905388,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',22500,5200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (389,18,to_date('23/09/06','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230906389,'은행',1,'배송 전 연락바랍니다.',39800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (390,26,to_date('23/09/07','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20230907390,'카드',1,'배송 전 연락바랍니다.',281000,12600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (391,56,to_date('23/09/08','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20230908391,'은행',1,'빠른 확인과 배송 부탁드립니다.',211800,8000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (392,40,to_date('23/09/09','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20230909392,'간편결제',1,'부재 시 택배함에 넣어주세요.',152500,25700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (393,12,to_date('23/09/10','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20230910393,'카드',1,'배송 전 연락바랍니다.',15500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (394,39,to_date('23/09/11','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20230911394,'간편결제',1,'배송 전 연락바랍니다.',85000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (395,48,to_date('23/09/12','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',20230912395,'무통장입금',1,'배송 전 연락바랍니다.',210200,13300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (396,31,to_date('23/09/13','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230913396,'간편결제',1,null,28000,400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (397,45,to_date('23/09/14','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20230914397,'간편결제',1,null,68400,4100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (398,13,to_date('23/09/15','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20230915398,'간편결제',1,'배송 전 연락바랍니다.',51000,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (399,29,to_date('23/09/16','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20230916399,'카드',1,'부재 시 택배함에 넣어주세요.',60000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (400,23,to_date('23/09/17','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20230917400,'은행',1,'부재 시 경비실에 맡겨주세요.',12300,8000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (401,55,to_date('23/09/18','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20230918401,'간편결제',1,'배송 전 연락바랍니다.',239900,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (402,8,to_date('23/09/19','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20230919402,'카드',1,'배송 전 연락바랍니다.',434700,25900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (403,2,to_date('23/09/20','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20230920403,'은행',1,'빠른 확인과 배송 부탁드립니다.',125000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (404,20,to_date('23/09/21','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20230921404,'카드',1,'부재 시 문 앞에 놓아주세요.',4200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (405,38,to_date('23/09/22','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20230922405,'카드',1,'부재 시 택배함에 넣어주세요.',538000,2200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (406,31,to_date('23/09/23','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20230923406,'간편결제',1,'부재 시 경비실에 맡겨주세요.',30000,500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (407,43,to_date('23/09/24','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20230924407,'은행',1,'빠른 확인과 배송 부탁드립니다.',329000,22700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (408,35,to_date('23/09/25','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20230925408,'간편결제',1,'부재 시 경비실에 맡겨주세요.',181000,21900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (409,45,to_date('23/09/26','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20230926409,'카드',1,'부재 시 택배함에 넣어주세요.',29000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (410,7,to_date('23/09/27','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',20230927410,'간편결제',1,'부재 시 택배함에 넣어주세요.',273000,5100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (411,18,to_date('23/09/28','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20230928411,'카드',1,'부재 시 경비실에 맡겨주세요.',181000,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (412,39,to_date('23/09/29','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20230929412,'간편결제',1,'부재 시 경비실에 맡겨주세요.',8400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (413,3,to_date('23/09/30','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20230930413,'카드',1,'배송 전 연락바랍니다.',56500,2200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (414,54,to_date('23/10/01','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20231001414,'무통장입금',1,null,93900,4500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (415,20,to_date('23/10/02','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20231002415,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',390000,11700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (416,11,to_date('23/10/03','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20231003416,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',1900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (417,51,to_date('23/10/04','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20231004417,'카드',1,'빠른 확인과 배송 부탁드립니다.',13900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (418,23,to_date('23/10/05','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20231005418,'카드',1,'배송 전 연락바랍니다.',5500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (419,40,to_date('23/10/06','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20231006419,'카드',1,'부재 시 문 앞에 놓아주세요.',62200,21700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (420,50,to_date('23/10/07','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',20231007420,'간편결제',1,'부재 시 택배함에 넣어주세요.',239900,5600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (421,14,to_date('23/10/08','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20231008421,'간편결제',1,'부재 시 택배함에 넣어주세요.',5000,900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (422,53,to_date('23/10/09','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20231009422,'은행',1,'빠른 확인과 배송 부탁드립니다.',139400,8200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (423,46,to_date('23/10/10','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20231010423,'은행',1,'배송 전 연락바랍니다.',526500,8900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (424,3,to_date('23/10/11','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20231011424,'간편결제',1,'부재 시 택배함에 넣어주세요.',17500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (425,4,to_date('23/10/12','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20231012425,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',120200,1000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (426,20,to_date('23/10/13','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20231013426,'은행',1,'부재 시 경비실에 맡겨주세요.',3600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (427,21,to_date('23/10/14','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20231014427,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',224000,22000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (428,48,to_date('23/10/15','RR/MM/DD'),'57939','전남 순천시','비행장길18 (매곡동 1)','양지수','061-750-6562',20231015428,'간편결제',1,'부재 시 경비실에 맡겨주세요.',447000,14600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (429,33,to_date('23/10/16','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',20231016429,'카드',1,'부재 시 택배함에 넣어주세요.',9000,2000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (430,26,to_date('23/10/17','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20231017430,'은행',1,'부재 시 택배함에 넣어주세요.',18500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (431,38,to_date('23/10/18','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20231018431,'카드',1,null,68500,17600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (432,53,to_date('23/10/19','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20231019432,'은행',1,'부재 시 경비실에 맡겨주세요.',388500,3000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (433,49,to_date('23/10/20','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20231020433,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',12600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (434,28,to_date('23/10/21','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20231021434,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',30000,8500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (435,4,to_date('23/10/22','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20231022435,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',345200,15800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (436,46,to_date('23/10/23','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20231023436,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',94000,9700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (437,53,to_date('23/10/24','RR/MM/DD'),'25502','강원 강릉시','화부산로40번길 49 (교1동 846-7)','주재영','033-640-3910',20231024437,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',252000,300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (438,35,to_date('23/10/25','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20231025438,'카드',1,'배송 전 연락바랍니다.',272100,12200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (439,39,to_date('23/10/26','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20231026439,'은행',1,'부재 시 문 앞에 놓아주세요.',242000,26500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (440,45,to_date('23/10/27','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20231027440,'은행',1,'부재 시 문 앞에 놓아주세요.',15000,13400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (441,55,to_date('23/10/28','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20231028441,'간편결제',1,'부재 시 경비실에 맡겨주세요.',8400,4400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (442,18,to_date('23/10/29','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20231029442,'카드',1,'부재 시 문 앞에 놓아주세요.',369400,32300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (443,13,to_date('23/10/30','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20231030443,'간편결제',1,'배송 전 연락바랍니다.',131400,5400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (444,31,to_date('23/10/31','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20231031444,'간편결제',1,'부재 시 경비실에 맡겨주세요.',93000,10500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (445,54,to_date('23/11/01','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20231101445,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',31500,300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (446,14,to_date('23/11/02','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20231102446,'카드',1,'배송 전 연락바랍니다.',13000,7500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (447,33,to_date('23/11/03','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',20231103447,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',44000,100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (448,47,to_date('23/11/04','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20231104448,'무통장입금',1,'부재 시 택배함에 넣어주세요.',71800,22300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (449,5,to_date('23/11/05','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20231105449,'카드',1,'배송 전 연락바랍니다.',238400,8200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (450,39,to_date('23/11/06','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20231106450,'은행',1,'배송 전 연락바랍니다.',200000,17000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (451,25,to_date('23/11/07','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20231107451,'은행',1,'부재 시 택배함에 넣어주세요.',70200,10700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (452,14,to_date('23/11/08','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20231108452,'카드',1,'부재 시 택배함에 넣어주세요.',267000,15900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (453,13,to_date('23/11/09','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20231109453,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',132700,34900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (454,31,to_date('23/11/10','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20231110454,'무통장입금',1,'배송 전 연락바랍니다.',70800,1300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (455,31,to_date('23/11/11','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20231111455,'간편결제',1,null,79900,28900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (456,12,to_date('23/11/12','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20231112456,'카드',1,'부재 시 문 앞에 놓아주세요.',107000,4500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (457,50,to_date('23/11/13','RR/MM/DD'),'29046','충북 옥천군','옥천읍 중앙로 64 (금구리 3-1)','정민주','043-730-0814',20231113457,'간편결제',1,'배송 전 연락바랍니다.',60000,3400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (458,44,to_date('23/11/14','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20231114458,'간편결제',1,'배송 전 연락바랍니다.',20000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (459,45,to_date('23/11/15','RR/MM/DD'),'27931','충북 증평군','증평읍 윗장뜰길 69 (교동리 61-1)','이연임','043-820-7803',20231115459,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',41900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (460,29,to_date('23/11/16','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20231116460,'간편결제',1,'부재 시 경비실에 맡겨주세요.',21000,5500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (461,56,to_date('23/11/17','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20231117461,'간편결제',1,'부재 시 문 앞에 놓아주세요.',144000,1400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (462,33,to_date('23/11/18','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',20231118462,'은행',1,'빠른 확인과 배송 부탁드립니다.',342000,24900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (463,54,to_date('23/11/19','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20231119463,'은행',1,'부재 시 택배함에 넣어주세요.',10800,8500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (464,11,to_date('23/11/20','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20231120464,'카드',1,'부재 시 경비실에 맡겨주세요.',9000,2300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (465,32,to_date('23/11/21','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',20231121465,'무통장입금',1,'배송 전 연락바랍니다.',65300,21500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (466,27,to_date('23/11/22','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',20231122466,'간편결제',1,'부재 시 택배함에 넣어주세요.',67000,2100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (467,37,to_date('23/11/23','RR/MM/DD'),'47605','부산광역시 연제구','거제대로222 나라키움부산통합청사 7층 조사원실','정선인','051-850-5532',20231123467,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',30900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (468,22,to_date('23/11/24','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20231124468,'은행',1,'부재 시 문 앞에 놓아주세요.',69000,12300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (469,9,to_date('23/11/25','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20231125469,'간편결제',1,'부재 시 경비실에 맡겨주세요.',89400,7200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (470,24,to_date('23/11/26','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20231126470,'간편결제',1,'부재 시 문 앞에 놓아주세요.',39900,12600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (471,25,to_date('23/11/27','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20231127471,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',110000,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (472,30,to_date('23/11/28','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20231128472,'은행',1,'부재 시 경비실에 맡겨주세요.',42000,24700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (473,49,to_date('23/11/29','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20231129473,'은행',1,'부재 시 택배함에 넣어주세요.',21000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (474,42,to_date('23/11/30','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20231130474,'카드',1,'빠른 확인과 배송 부탁드립니다.',12600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (475,22,to_date('23/12/01','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20231201475,'무통장입금',1,'부재 시 택배함에 넣어주세요.',67500,12300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (476,31,to_date('23/12/02','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20231202476,'간편결제',1,null,53000,29300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (477,27,to_date('23/12/03','RR/MM/DD'),'21573','인천 남동구','인하로 507번길 66 (구월1동 1460)','박지현','032-460-2617',20231203477,'은행',1,'부재 시 택배함에 넣어주세요.',4200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (478,7,to_date('23/12/04','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',20231204478,'은행',1,'부재 시 문 앞에 놓아주세요.',38700,16800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (479,32,to_date('23/12/05','RR/MM/DD'),'50234','경남 합천군','합천읍 남정길 23 (합천리 951-1) ','전현주','055-213-0124',20231205479,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',156500,14400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (480,38,to_date('23/12/06','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20231206480,'카드',1,'부재 시 문 앞에 놓아주세요.',312000,3100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (481,41,to_date('23/12/07','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20231207481,'은행',1,null,90000,17500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (482,33,to_date('23/12/08','RR/MM/DD'),'11610','경기 의정부시','체육로 298-7 (녹양동 412-2) 크로바프라자 5층','김선옥','031-860-3502',20231208482,'은행',1,'빠른 확인과 배송 부탁드립니다.',31900,21000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (483,39,to_date('23/12/09','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20231209483,'무통장입금',1,'배송 전 연락바랍니다.',69300,7600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (484,54,to_date('23/12/10','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20231210484,'카드',1,null,144000,3400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (485,22,to_date('23/12/11','RR/MM/DD'),'59691','전남 여수시','예울마루로 35-23 (웅천동 1698-1)','양지수','061-750-6562',20231211485,'카드',1,'부재 시 경비실에 맡겨주세요.',11000,4500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (486,18,to_date('23/12/12','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20231212486,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',362700,9100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (487,21,to_date('23/12/13','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20231213487,'카드',1,'부재 시 택배함에 넣어주세요.',28800,10700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (488,8,to_date('23/12/14','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20231214488,'은행',1,'부재 시 문 앞에 놓아주세요.',1800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (489,3,to_date('23/12/15','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20231215489,'은행',1,'배송 전 연락바랍니다.',68700,4300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (490,2,to_date('23/12/16','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20231216490,'카드',1,null,320600,47700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (491,16,to_date('23/12/17','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20231217491,'무통장입금',1,'부재 시 택배함에 넣어주세요.',74000,6500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (492,41,to_date('23/12/18','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20231218492,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',8400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (493,9,to_date('23/12/19','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20231219493,'은행',1,'배송 전 연락바랍니다.',42000,5100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (494,55,to_date('23/12/20','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20231220494,'카드',1,null,10800,5900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (495,3,to_date('23/12/21','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20231221495,'무통장입금',1,'배송 전 연락바랍니다.',21900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (496,56,to_date('23/12/22','RR/MM/DD'),'55422','전북 진안군','진안읍 학천변길 29 (군상리 241-6)','심인숙','063-430-3900',20231222496,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',18000,7700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (497,21,to_date('23/12/23','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20231223497,'은행',1,null,3800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (498,40,to_date('23/12/24','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20231224498,'카드',1,'부재 시 문 앞에 놓아주세요.',93000,29800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (499,47,to_date('23/12/25','RR/MM/DD'),'51439','경남 창원시','의창구 상남로 261 (신월동 103-2)','이희정','055-213-0133',20231225499,'카드',1,'부재 시 택배함에 넣어주세요.',43500,1700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (500,12,to_date('23/12/26','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20231226500,'간편결제',1,'부재 시 문 앞에 놓아주세요.',57000,20500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (501,14,to_date('23/12/27','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20231227501,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',6300,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (502,21,to_date('23/12/28','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20231228502,'카드',1,'부재 시 경비실에 맡겨주세요.',10800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (503,18,to_date('23/12/29','RR/MM/DD'),'53028','경남 통영시','용남면 용남해안로 355(용남면 동달리 100-2)','천민경','055-640-0713',20231229503,'간편결제',1,'부재 시 경비실에 맡겨주세요.',29800,1500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (504,13,to_date('23/12/30','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20231230504,'간편결제',1,'부재 시 문 앞에 놓아주세요.',4200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (505,44,to_date('23/12/31','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20231231505,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',9000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (506,6,to_date('24/01/01','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20240101506,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',270800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (507,40,to_date('24/01/02','RR/MM/DD'),'24233','강원 춘천시','후석로 440번길 64 (후평1동 240-3)  춘천지방합동청사 4층','최아람','033-258-3675',20240102507,'간편결제',1,'배송 전 연락바랍니다.',304400,1500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (508,49,to_date('24/01/03','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20240103508,'은행',1,'부재 시 택배함에 넣어주세요.',2800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (509,44,to_date('24/01/04','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20240104509,'은행',1,'부재 시 문 앞에 놓아주세요.',1900,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (510,13,to_date('24/01/05','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20240105510,'간편결제',1,'배송 전 연락바랍니다.',57000,10300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (511,5,to_date('24/01/06','RR/MM/DD'),'10497','경기도 고양시','덕양구 화중로 104번길 50, 정부고양지방합동청사 7층','김성희','031-936-5115',20240106511,'은행',1,'부재 시 택배함에 넣어주세요.',96000,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (512,24,to_date('24/01/07','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20240107512,'은행',1,'부재 시 문 앞에 놓아주세요.',717000,7900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (513,16,to_date('24/01/08','RR/MM/DD'),'44715','울산광역시 남구','삼산로 366번길 2 (삼산동 1626-1)','권민희','052-279-4015',20240108513,'간편결제',1,'부재 시 문 앞에 놓아주세요.',30000,400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (514,19,to_date('24/01/09','RR/MM/DD'),'26231','강원 영월군','영월읍 중앙로202(덕포리600) ','전은남','033-370-5200',20240109514,'무통장입금',1,'배송 전 연락바랍니다.',3800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (515,24,to_date('24/01/10','RR/MM/DD'),'59240','전남 강진군','강진읍 목리길 14 (동성리 63-4) ','백현희','061-430-6120',20240110515,'간편결제',1,null,198200,8100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (516,4,to_date('24/01/11','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20240111516,'은행',1,null,20000,11900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (517,30,to_date('24/01/12','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20240112517,'무통장입금',1,null,162000,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (518,20,to_date('24/01/13','RR/MM/DD'),'59455','전남 보성군','보성읍 동인길 31 (보성리 232-5)','박영희','061-850-6120',20240113518,'무통장입금',1,null,8400,900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (519,4,to_date('24/01/14','RR/MM/DD'),'56171','전북 정읍시','서부산업도로 502 (수성동 985-3)','오상은','063-530-6931',20240114519,'간편결제',1,null,59400,57200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (520,14,to_date('24/01/15','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20240115520,'카드',1,null,120000,35100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (521,29,to_date('24/01/16','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20240116521,'무통장입금',1,null,78000,5800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (522,21,to_date('24/01/17','RR/MM/DD'),'17363','경기 이천시','이섭대천로 1254 (창전동 144-5) 케이티이천사옥 3층','최유림','031-640-9411',20240117522,'간편결제',1,'부재 시 경비실에 맡겨주세요.',25900,3500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (523,30,to_date('24/01/18','RR/MM/DD'),'31107','충남 천안시','서북구 오성로 89 (두정동 839)','김동범','041-520-9254',20240118523,'은행',1,'부재 시 경비실에 맡겨주세요.',62700,11400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (524,23,to_date('24/01/19','RR/MM/DD'),'39210','경북 구미시','봉곡로 10길 11-11 (봉곡동 419)','윤성일','054-459-6552',20240119524,'은행',1,'부재 시 택배함에 넣어주세요.',125000,6400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (525,46,to_date('24/01/20','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20240120525,'카드',1,'부재 시 택배함에 넣어주세요.',181000,27200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (526,55,to_date('24/01/21','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20240121526,'무통장입금',1,'부재 시 문 앞에 놓아주세요.',6000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (527,54,to_date('24/01/22','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20240122527,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',73000,41200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (528,35,to_date('24/01/23','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20240123528,'은행',1,'부재 시 택배함에 넣어주세요.',99000,800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (529,34,to_date('24/01/24','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20240124529,'무통장입금',1,null,39000,17900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (530,39,to_date('24/01/25','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20240125530,'은행',1,'배송 전 연락바랍니다.',28000,600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (531,11,to_date('24/01/26','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20240126531,'무통장입금',1,'배송 전 연락바랍니다.',99000,17100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (532,3,to_date('24/01/27','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20240127532,'카드',1,'부재 시 택배함에 넣어주세요.',30000,4400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (533,7,to_date('24/01/28','RR/MM/DD'),'61902','광주광역시 서구','천변우하로 391(동천동 584) ','나미리','062-370-6114',20240128533,'은행',1,'배송 전 연락바랍니다.',182000,14800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (534,11,to_date('24/01/29','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20240129534,'간편결제',1,'부재 시 택배함에 넣어주세요.',282900,5000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (535,38,to_date('24/01/30','RR/MM/DD'),'36323','경북 울진군','울진읍 옥계현충길 15 (읍내리 658-2)','김교희','054-780-5811',20240130535,'간편결제',1,'부재 시 택배함에 넣어주세요.',60600,32200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (536,39,to_date('24/01/31','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20240131536,'간편결제',1,null,22800,3800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (537,15,to_date('24/02/01','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20240201537,'간편결제',1,null,164800,46400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (538,54,to_date('24/02/02','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20240202538,'카드',1,'빠른 확인과 배송 부탁드립니다.',58000,36500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (539,9,to_date('24/02/03','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20240203539,'카드',1,'배송 전 연락바랍니다.',147500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (540,26,to_date('24/02/04','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20240204540,'무통장입금',1,'배송 전 연락바랍니다.',288000,19400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (541,2,to_date('24/02/05','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20240205541,'은행',1,null,17100,11100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (542,26,to_date('24/02/06','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20240206542,'은행',1,null,237500,38600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (543,55,to_date('24/02/07','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20240207543,'무통장입금',1,'배송 전 연락바랍니다.',97000,31600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (544,34,to_date('24/02/08','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20240208544,'간편결제',1,'배송 전 연락바랍니다.',60000,19500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (545,39,to_date('24/02/09','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20240209545,'카드',1,'부재 시 경비실에 맡겨주세요.',849000,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (546,13,to_date('24/02/10','RR/MM/DD'),'41422','대구광역시 북구','동암로 64, 동북지방통계청 셈빛관 2층','최정미','053-609-6534',20240210546,'무통장입금',1,'부재 시 경비실에 맡겨주세요.',849000,33800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (547,9,to_date('24/02/11','RR/MM/DD'),'32000','충남 서산시','석림1로 67 (석림동 793-3)','박정은','041-660-8105',20240211547,'간편결제',1,'부재 시 문 앞에 놓아주세요.',94700,300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (548,44,to_date('24/02/12','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20240212548,'무통장입금',1,null,144000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (549,35,to_date('24/02/13','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20240213549,'카드',1,'부재 시 택배함에 넣어주세요.',4400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (550,25,to_date('24/02/14','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20240214550,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',5700,1300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (551,43,to_date('24/02/15','RR/MM/DD'),'25929','강원 삼척시','남양길 41-92 (남양동 344-5)','조미순','033-570-5322',20240215551,'카드',1,'빠른 확인과 배송 부탁드립니다.',80500,6800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (552,11,to_date('24/02/16','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20240216552,'은행',1,null,51000,16200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (553,29,to_date('24/02/17','RR/MM/DD'),'55777','전북 남원시','요천로 1393 (천거동 160-5)','서정숙','063-630-6022',20240217553,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',6000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (554,49,to_date('24/02/18','RR/MM/DD'),'33492','충남 보령시','해안로 189 (내항동 1090)','김다영','041-930-2958',20240218554,'카드',1,'배송 전 연락바랍니다.',3600,1800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (555,10,to_date('24/02/19','RR/MM/DD'),'14723','경기 부천시','경인로 117번길 10, 삼정프라자 302호','박현정','032-460-2733',20240219555,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',163000,31700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (556,8,to_date('24/02/20','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20240220556,'간편결제',1,'부재 시 택배함에 넣어주세요.',92500,18800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (557,15,to_date('24/02/21','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20240221557,'간편결제',1,'부재 시 경비실에 맡겨주세요.',104000,1000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (558,12,to_date('24/02/22','RR/MM/DD'),'17851','경기도 평택시','비전2로 77(비전동 1002) 2층','성정희','031-659-0400',20240222558,'간편결제',1,null,106700,41500);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (559,6,to_date('24/02/23','RR/MM/DD'),'06675','서울 서초구','방배천로 91, 구암타워 지하1층','고미옥','02-2110-7713',20240223559,'간편결제',1,'배송 전 연락바랍니다.',87000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (560,54,to_date('24/02/24','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20240224560,'카드',1,'빠른 확인과 배송 부탁드립니다.',92500,3700);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (561,42,to_date('24/02/25','RR/MM/DD'),'11952','경기도 구리시','아차산로 500(교문동) 태산빌딩 4층','이정아','031-560-7011',20240225561,'카드',1,'배송 전 연락바랍니다.',126000,13600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (562,35,to_date('24/02/26','RR/MM/DD'),'63219','제주특별자치도 제주시','청사로 59 (도남동) 정부제주합동청사 5층 509호','박소영','064-728-5803',20240226562,'카드',1,'부재 시 택배함에 넣어주세요.',99200,25400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (563,3,to_date('24/02/27','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20240227563,'무통장입금',1,null,54600,1400);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (564,31,to_date('24/02/28','RR/MM/DD'),'03072','서울시 종로구','창경궁로 215 1층 경인지방통계청 서울사무소 연간조사실','이진','02-6327-3943',20240228564,'카드',1,null,126000,21200);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (565,2,to_date('24/02/29','RR/MM/DD'),'28462','충북 청주시','흥덕구 덕암로 17번길 10 (봉명2동 2452)','임정은','043-299-6022',20240229565,'간편결제',1,null,22000,7000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (566,44,to_date('24/03/01','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20240301566,'카드',1,'빠른 확인과 배송 부탁드립니다.',33800,23300);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (567,34,to_date('24/03/02','RR/MM/DD'),'38549','경북 경산시','자인면 일연로 109-34 (북사리 359), 동북지방통계청 경산분소','윤연주','053-609-6542',20240302567,'간편결제',1,'부재 시 문 앞에 놓아주세요.',570400,18900);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (568,3,to_date('24/03/03','RR/MM/DD'),'30121','세종특별자치시 가름로','232, 세종 비지니스센터 A동 421호 ','김승건','044-850-5314',20240303568,'무통장입금',1,'빠른 확인과 배송 부탁드립니다.',59700,8800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (569,55,to_date('24/03/04','RR/MM/DD'),'37688','경북 포항시','북구 용흥로 28번길 9','안수영','054-280-9132',20240304569,'간편결제',1,'배송 전 연락바랍니다.',2200,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (570,25,to_date('24/03/05','RR/MM/DD'),'13311','경기도 성남시','수정구 수정로 85 (태평1동 6454) ','박하얀','031-780-0614',20240305570,'간편결제',1,'부재 시 문 앞에 놓아주세요.',79500,2100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (571,11,to_date('24/03/06','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20240306571,'카드',1,'부재 시 택배함에 넣어주세요.',34500,31100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (572,41,to_date('24/03/07','RR/MM/DD'),'16491','경기 수원시','팔달구 효원로308번길 58-6 (인계동 1133-9)','이희석','031-230-0706',20240307572,'무통장입금',0,'배송 전 연락바랍니다.',212000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (573,51,to_date('24/03/08','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20240308573,'은행',1,'빠른 확인과 배송 부탁드립니다.',10800,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (574,14,to_date('24/03/09','RR/MM/DD'),'50147','경남 거창군','거창읍 수남로 2159 (김천리 169-22)','서세승','055-760-8845',20240309574,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',81000,19000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (575,26,to_date('24/03/10','RR/MM/DD'),'26460','강원 원주시','입춘로 50 (반곡동 1858-5) 나라키움 원주청사 3층','김소연','033-769-3701',20240310575,'카드',1,'부재 시 경비실에 맡겨주세요.',50500,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (576,46,to_date('24/03/11','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20240311576,'무통장입금',1,'부재 시 택배함에 넣어주세요.',80000,3600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (577,54,to_date('24/03/12','RR/MM/DD'),'54102','전북 군산시','남수송5길 8-3 (수송동 792-7)','신상아','063-440-6000',20240312577,'간편결제',1,'빠른 확인과 배송 부탁드립니다.',3000,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (578,15,to_date('24/03/13','RR/MM/DD'),'37179','경북 상주시','삼백로143번 삼백타워 2층(서성동 56-6)','김보경','054-530-6515',20240313578,'카드',1,'빠른 확인과 배송 부탁드립니다.',16000,6000);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (579,11,to_date('24/03/14','RR/MM/DD'),'51004',' 경남','김해시 계동로 195(장유2동 298-10)','박성춘','055-344-2503',20240314579,'카드',1,'배송 전 연락바랍니다.',23400,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (580,46,to_date('24/03/15','RR/MM/DD'),'54966','전북 전주시','완산구 우전로 238 (효자동 2가 1241-1)','임소연','063-220-7907',20240315580,'카드',1,null,26000,5800);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (581,39,to_date('24/03/16','RR/MM/DD'),'37406','경북 청송군','진보면 못안길 14 (이촌리 613-14)','신윤정','054-870-5703',20240316581,'무통장입금',0,'부재 시 문 앞에 놓아주세요.',8400,7100);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (582,51,to_date('24/03/17','RR/MM/DD'),'35220','대전광역시 서구','한밭대로 713 (월평2동 282-1 통계센터 9층)','연제문','042-366-8341',20240317582,'은행',1,'빠른 확인과 배송 부탁드립니다.',49600,0);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (583,44,to_date('24/03/18','RR/MM/DD'),'58564','전남 무안군','삼향읍 오룡5길 2 (남악리 1969) ','주정희','061-260-6120',20240318583,'카드',1,'부재 시 경비실에 맡겨주세요.',201000,1600);
Insert into TB_ORDER (ORDER_NO,USER_NO,ORDER_DATE,POST,ADDRESS,ADDRESS_DETAIL,RECEIVER,PHONE,PAYMENT_NO,PAYMENT_TYPE,PAYMENT_STATUS,ORDER_MESSAGE,TOTAL_AMOUNT,POINT_USE) values (584,8,to_date('24/03/19','RR/MM/DD'),'32255','충남 홍성군','홍북읍 충남대로 45 정부충남지방합동청사 3층','임지호','041-406-2213',20240319584,'카드',1,'배송 전 연락바랍니다.',144000,13200);
REM INSERTING into WISH
SET DEFINE OFF;
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (1,36,275);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (2,22,149);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (3,40,101);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (4,14,180);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (5,7,249);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (6,10,171);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (7,15,222);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (8,55,183);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (9,42,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (10,18,190);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (11,41,30);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (12,16,283);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (13,29,36);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (14,42,162);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (15,46,230);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (16,49,275);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (17,3,98);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (18,41,187);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (19,18,129);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (20,8,238);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (21,28,278);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (22,36,13);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (23,34,282);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (24,9,41);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (25,23,227);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (26,13,260);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (27,28,89);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (28,45,158);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (29,39,76);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (30,13,238);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (31,37,228);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (32,28,24);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (33,14,206);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (34,36,99);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (35,15,246);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (36,43,36);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (37,13,27);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (38,41,208);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (39,55,163);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (40,52,74);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (41,54,132);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (42,25,233);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (43,9,196);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (44,38,174);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (45,42,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (47,47,200);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (48,47,35);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (49,14,21);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (50,49,151);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (51,50,181);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (52,50,200);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (53,29,286);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (54,24,279);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (55,26,69);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (56,39,169);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (57,42,161);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (58,12,282);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (59,48,20);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (60,40,237);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (61,3,269);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (62,56,60);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (63,26,124);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (64,31,190);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (65,25,47);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (66,27,15);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (67,27,182);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (68,23,239);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (69,33,56);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (70,53,118);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (71,45,41);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (72,10,251);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (73,27,269);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (74,28,251);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (75,33,289);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (76,54,201);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (77,36,193);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (78,3,15);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (79,20,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (80,3,43);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (81,28,241);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (82,42,192);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (83,49,148);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (84,24,58);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (85,14,161);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (86,16,154);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (87,17,19);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (88,10,226);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (89,11,266);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (90,18,113);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (91,6,58);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (92,35,241);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (93,13,108);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (94,42,109);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (95,32,85);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (96,30,164);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (97,36,86);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (98,36,150);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (99,49,248);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (101,13,159);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (102,50,179);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (103,32,39);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (104,42,270);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (105,25,161);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (106,49,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (107,23,258);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (108,15,254);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (109,31,154);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (110,16,151);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (111,26,181);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (112,17,34);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (113,38,142);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (114,50,187);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (115,26,180);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (116,40,267);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (117,3,213);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (118,31,192);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (119,37,43);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (120,47,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (121,8,62);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (122,25,188);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (123,40,27);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (124,37,253);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (125,35,41);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (126,5,56);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (127,50,240);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (128,29,31);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (129,17,106);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (130,32,269);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (131,32,77);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (132,45,19);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (133,12,18);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (134,51,135);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (135,49,282);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (136,45,92);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (137,28,18);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (139,53,185);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (140,32,155);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (141,55,74);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (142,24,170);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (143,33,89);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (144,27,9);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (145,41,169);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (146,42,121);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (147,30,44);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (148,27,230);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (149,31,8);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (150,35,116);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (151,25,117);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (153,37,242);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (154,39,168);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (155,6,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (156,31,289);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (157,38,15);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (158,52,148);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (159,36,230);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (160,29,168);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (161,10,224);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (162,14,274);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (163,48,207);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (164,54,195);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (165,27,272);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (166,47,94);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (167,52,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (168,8,102);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (169,10,27);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (170,43,197);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (171,18,30);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (172,47,229);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (173,30,38);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (174,19,15);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (175,31,264);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (176,35,81);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (177,22,143);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (178,38,173);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (179,4,63);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (180,46,27);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (181,44,22);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (182,49,11);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (183,37,116);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (184,21,245);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (185,48,157);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (186,24,283);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (187,10,144);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (188,15,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (189,29,269);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (190,6,63);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (191,28,253);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (192,40,231);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (193,49,110);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (194,48,32);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (195,3,12);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (196,25,32);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (197,42,203);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (198,55,104);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (199,43,178);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (200,52,211);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (201,43,216);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (202,22,59);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (203,23,189);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (204,38,219);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (205,26,13);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (206,19,171);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (207,36,48);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (208,34,30);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (209,34,178);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (210,39,196);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (211,10,60);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (212,28,149);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (213,7,110);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (214,36,110);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (215,40,266);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (216,4,228);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (217,37,259);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (218,40,5);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (219,5,62);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (220,45,9);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (221,29,142);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (222,47,54);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (223,31,134);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (224,25,140);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (225,5,272);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (226,31,96);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (228,26,244);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (229,15,9);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (230,22,145);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (231,48,131);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (232,21,89);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (233,24,210);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (234,26,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (235,55,141);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (236,36,216);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (237,37,270);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (238,29,86);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (239,35,128);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (240,27,211);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (241,4,101);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (242,53,133);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (243,15,184);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (244,48,140);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (245,22,279);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (246,50,213);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (247,9,113);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (248,38,202);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (249,21,177);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (250,37,22);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (251,10,10);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (252,27,286);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (253,13,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (254,49,66);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (255,53,93);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (256,52,116);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (257,3,95);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (258,46,163);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (259,34,237);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (260,24,274);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (261,46,204);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (262,37,112);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (263,49,81);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (264,18,229);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (265,4,141);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (266,45,30);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (267,20,149);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (268,56,8);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (269,41,135);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (270,43,55);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (271,25,80);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (272,34,67);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (273,23,274);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (274,10,227);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (275,7,114);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (276,14,56);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (277,36,120);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (278,32,62);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (279,37,84);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (280,30,78);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (281,23,33);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (282,23,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (283,23,203);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (284,56,79);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (285,4,153);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (286,41,171);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (287,24,125);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (288,6,264);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (289,5,208);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (290,32,229);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (291,36,40);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (292,26,160);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (293,39,235);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (294,3,109);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (295,55,194);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (296,40,233);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (297,20,201);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (298,52,258);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (299,28,259);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (300,17,114);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (301,46,131);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (302,12,138);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (303,41,278);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (304,53,162);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (305,33,146);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (306,5,196);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (307,35,223);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (308,49,209);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (309,21,282);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (310,49,55);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (311,33,122);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (312,48,268);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (313,45,65);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (314,33,180);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (315,45,42);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (316,46,69);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (317,36,129);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (318,56,225);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (319,9,2);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (321,38,148);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (322,42,170);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (323,7,4);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (324,31,256);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (325,17,259);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (326,26,190);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (327,36,191);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (328,12,152);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (329,40,19);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (330,29,265);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (331,26,257);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (332,3,37);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (333,5,251);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (334,49,6);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (335,48,234);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (336,45,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (337,17,243);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (338,19,144);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (339,23,101);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (340,42,97);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (341,56,236);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (342,53,20);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (343,47,110);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (344,35,56);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (345,28,97);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (346,19,79);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (347,29,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (348,25,57);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (349,17,186);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (350,14,164);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (351,48,83);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (352,33,152);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (353,49,125);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (354,19,24);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (355,54,213);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (356,23,88);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (357,19,62);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (358,35,218);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (359,30,261);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (360,28,115);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (361,39,102);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (362,9,14);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (363,18,248);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (364,48,181);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (365,44,207);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (366,56,237);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (367,12,122);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (368,34,11);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (369,6,245);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (370,39,155);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (371,44,195);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (372,55,248);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (373,22,237);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (374,37,249);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (375,49,164);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (376,46,154);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (377,33,19);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (378,15,244);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (379,29,26);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (380,35,87);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (383,45,5);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (384,55,25);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (385,39,140);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (386,26,157);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (387,36,244);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (388,54,157);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (389,7,222);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (390,34,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (391,23,265);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (392,3,158);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (393,55,90);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (394,54,252);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (396,4,280);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (397,27,133);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (398,26,102);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (399,5,149);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (400,53,250);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (402,31,165);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (403,16,61);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (404,20,284);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (405,37,197);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (406,23,113);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (407,17,124);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (408,34,205);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (409,18,284);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (410,35,100);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (411,34,283);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (412,40,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (413,24,16);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (414,51,164);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (415,17,100);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (416,46,92);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (417,36,124);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (418,50,218);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (419,31,152);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (420,12,146);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (421,13,199);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (422,11,186);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (423,26,209);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (424,32,93);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (425,31,227);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (426,51,56);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (427,30,236);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (428,34,240);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (429,33,273);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (430,48,57);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (431,19,192);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (432,40,84);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (433,36,32);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (434,36,104);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (435,38,204);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (436,28,268);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (437,28,3);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (438,8,208);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (439,21,86);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (440,51,21);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (441,24,74);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (442,40,279);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (443,30,187);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (444,20,247);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (445,33,168);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (446,12,266);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (447,37,287);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (448,38,4);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (449,4,148);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (450,23,287);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (451,28,42);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (452,15,112);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (454,12,50);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (455,21,47);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (456,22,111);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (457,7,210);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (458,41,17);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (459,47,208);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (460,50,289);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (461,25,192);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (462,10,191);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (463,39,158);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (464,4,4);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (465,10,124);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (466,43,203);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (467,42,223);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (468,49,102);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (469,10,77);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (470,12,176);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (471,12,169);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (472,8,41);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (473,51,9);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (474,18,196);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (475,31,100);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (476,33,230);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (477,8,168);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (478,37,128);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (479,21,5);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (480,35,255);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (481,14,185);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (482,3,162);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (483,49,283);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (484,6,70);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (485,18,235);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (486,56,23);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (487,30,57);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (488,26,53);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (489,10,115);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (490,16,34);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (491,50,159);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (492,33,71);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (493,28,208);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (494,29,272);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (495,13,41);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (496,54,72);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (497,46,38);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (498,16,233);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (499,15,187);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (500,50,87);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (501,34,186);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (502,53,193);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (503,45,223);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (504,53,123);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (506,13,219);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (507,55,188);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (508,31,20);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (509,44,206);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (510,20,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (511,22,257);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (512,11,19);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (513,55,173);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (514,22,98);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (515,44,285);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (516,33,36);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (517,19,232);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (518,4,278);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (519,39,147);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (520,24,226);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (521,22,47);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (522,46,165);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (523,48,80);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (524,21,257);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (525,7,14);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (526,26,223);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (527,29,194);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (528,11,279);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (530,48,250);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (531,34,88);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (532,32,183);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (533,30,277);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (535,43,245);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (536,4,256);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (537,4,126);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (538,41,136);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (539,49,37);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (540,17,229);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (541,43,267);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (542,20,138);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (543,38,218);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (544,48,119);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (545,46,25);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (546,49,172);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (547,55,93);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (548,16,240);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (549,40,45);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (550,14,271);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (551,33,248);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (552,36,118);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (553,30,24);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (554,40,210);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (555,14,29);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (556,44,191);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (557,56,42);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (558,34,109);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (559,26,63);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (560,4,245);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (561,31,232);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (562,19,172);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (563,26,249);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (564,4,82);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (565,20,25);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (566,21,175);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (567,45,153);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (568,50,250);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (569,56,114);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (570,11,273);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (571,28,163);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (572,46,241);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (573,37,141);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (574,51,52);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (575,54,237);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (576,14,265);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (578,9,153);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (579,38,69);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (580,10,3);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (581,54,181);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (582,45,177);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (583,13,100);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (584,9,84);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (585,38,10);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (586,8,54);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (587,11,184);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (588,36,218);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (589,54,13);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (590,7,108);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (592,35,99);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (593,10,221);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (594,45,79);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (595,37,31);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (596,49,94);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (597,3,14);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (598,22,139);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (599,27,143);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (600,10,266);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (601,20,111);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (602,37,149);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (603,24,88);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (604,52,214);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (605,6,55);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (606,38,169);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (607,23,280);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (608,56,34);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (609,33,32);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (610,55,64);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (611,10,20);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (612,10,117);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (613,50,215);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (614,21,75);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (615,43,224);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (616,32,122);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (618,14,147);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (619,16,135);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (620,19,155);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (621,25,231);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (622,47,89);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (623,38,49);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (624,37,57);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (625,9,274);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (626,40,229);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (627,23,121);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (628,4,199);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (629,42,127);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (630,15,34);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (631,19,33);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (632,40,9);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (633,46,280);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (634,12,287);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (635,15,259);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (636,49,71);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (637,26,38);
Insert into WISH (WISH_NO,USER_NO,PRO_NO) values (638,14,285);
--------------------------------------------------------
--  DDL for Index PK_DELIVERY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DELIVERY" ON "DELIVERY" ("DELIVERY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_EVENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EVENT" ON "EVENT" ("EVENT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REVIEW" ON "REVIEW" ("RE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PRO_CATEGORY_MIDD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRO_CATEGORY_MIDD" ON "PRO_CATEGORY_MIDD" ("CATE_MIDD_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTICE" ON "NOTICE" ("NOTICE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STOCK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STOCK" ON "STOCK" ("STOCK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PRODUCT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRODUCT" ON "PRODUCT" ("PRO_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ORDER_DETAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ORDER_DETAIL" ON "ORDER_DETAIL" ("OD_DETAIL_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PACKAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PACKAGE" ON "PACKAGE" ("PACKAGE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEMBER" ON "MEMBER" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MACRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MACRO" ON "MACRO" ("MACRO_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_WISH
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_WISH" ON "WISH" ("WISH_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CART
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CART" ON "CART" ("CART_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD" ON "BOARD" ("BOARD_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ATTACHMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ATTACHMENT" ON "ATTACHMENT" ("FILE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FAQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FAQ" ON "FAQ" ("FAQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ORDER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ORDER" ON "TB_ORDER" ("ORDER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PRO_CATEGORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRO_CATEGORY" ON "PRO_CATEGORY" ("CATEGORY_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_QNA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_QNA" ON "QNA" ("QNA_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REPLY" ON "REPLY" ("REPLY_NO") 
  ;
--------------------------------------------------------
--  DDL for Trigger NEW_MEMBER_POINT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NEW_MEMBER_POINT_TRIGGER" 
AFTER INSERT ON "MEMBER"
FOR EACH ROW
BEGIN
    INSERT INTO "POINT" ("USER_NO", "POINT_ADD_LIST", "POINT_REASON")
    VALUES (:NEW."USER_NO", 3000, 1);
END;

/
ALTER TRIGGER "NEW_MEMBER_POINT_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_PRODUCT_STOCK_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UPDATE_PRODUCT_STOCK_TRIGGER" 
AFTER INSERT OR UPDATE ON "STOCK"
FOR EACH ROW
BEGIN
    IF :NEW.STATUS = 'I' THEN
        UPDATE "PRODUCT"
        SET "STOCK" = "STOCK" + :NEW."COUNT"
        WHERE "PRO_NO" = :NEW."PRO_NO";
    ELSIF :NEW.STATUS = 'O' THEN
        UPDATE "PRODUCT"
        SET "STOCK" = "STOCK" - :NEW."COUNT"
        WHERE "PRO_NO" = :NEW."PRO_NO";
    END IF;
END;

/
ALTER TRIGGER "UPDATE_PRODUCT_STOCK_TRIGGER" ENABLE;
--------------------------------------------------------
--  Constraints for Table MACRO
--------------------------------------------------------

  ALTER TABLE "MACRO" ADD CONSTRAINT "PK_MACRO" PRIMARY KEY ("MACRO_NO") ENABLE;
  ALTER TABLE "MACRO" MODIFY ("MACRO_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "MACRO" MODIFY ("MACRO_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STOCK
--------------------------------------------------------

  ALTER TABLE "STOCK" ADD CONSTRAINT "PK_STOCK" PRIMARY KEY ("STOCK_NO") ENABLE;
  ALTER TABLE "STOCK" ADD CHECK (STATUS IN ('I', 'O')) ENABLE;
  ALTER TABLE "STOCK" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "STOCK" MODIFY ("PRO_NO" NOT NULL ENABLE);
  ALTER TABLE "STOCK" MODIFY ("STOCK_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENT_PRODUCT
--------------------------------------------------------

  ALTER TABLE "EVENT_PRODUCT" MODIFY ("PRO_NO" NOT NULL ENABLE);
  ALTER TABLE "EVENT_PRODUCT" MODIFY ("EVENT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DELIVERY
--------------------------------------------------------

  ALTER TABLE "DELIVERY" ADD CONSTRAINT "PK_DELIVERY" PRIMARY KEY ("DELIVERY_NO") ENABLE;
  ALTER TABLE "DELIVERY" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DELIVERY" MODIFY ("ADDRESS_DETAIL" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("POST" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("DELIVERY_RECEIVER" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("DELIVERY_USER_NO" NOT NULL ENABLE);
  ALTER TABLE "DELIVERY" MODIFY ("DELIVERY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POINT
--------------------------------------------------------

  ALTER TABLE "POINT" ADD CHECK (POINT_REASON IN (1, 2)) ENABLE;
  ALTER TABLE "POINT" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_ORDER
--------------------------------------------------------

  ALTER TABLE "TB_ORDER" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("ORDER_NO") ENABLE;
  ALTER TABLE "TB_ORDER" ADD UNIQUE ("PAYMENT_NO") ENABLE;
  ALTER TABLE "TB_ORDER" ADD CHECK (PAYMENT_STATUS IN (0, 1)) ENABLE;
  ALTER TABLE "TB_ORDER" ADD CHECK (PAYMENT_TYPE IN ('카드', '은행', '무통장입금', '간편결제')) ENABLE;
  ALTER TABLE "TB_ORDER" MODIFY ("PAYMENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("PAYMENT_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("RECEIVER" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("ADDRESS_DETAIL" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("POST" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_ORDER" MODIFY ("ORDER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY ("CART_NO") ENABLE;
  ALTER TABLE "CART" MODIFY ("CART_PRO" NOT NULL ENABLE);
  ALTER TABLE "CART" MODIFY ("CART_USER" NOT NULL ENABLE);
  ALTER TABLE "CART" MODIFY ("CART_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "ORDER_DETAIL" ADD CONSTRAINT "PK_ORDER_DETAIL" PRIMARY KEY ("OD_DETAIL_NO") ENABLE;
  ALTER TABLE "ORDER_DETAIL" ADD CHECK (STATUS IN (1, 2, 3, 4)) ENABLE;
  ALTER TABLE "ORDER_DETAIL" ADD CHECK (DELI_STATUS IN (1, 2, 3)) ENABLE;
  ALTER TABLE "ORDER_DETAIL" ADD CHECK (REFUND IN ('Y', 'N')) ENABLE;
  ALTER TABLE "ORDER_DETAIL" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAIL" MODIFY ("COUNT" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAIL" MODIFY ("PRO_NO" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAIL" MODIFY ("ORDER_NO" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAIL" MODIFY ("OD_DETAIL_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRO_CATEGORY
--------------------------------------------------------

  ALTER TABLE "PRO_CATEGORY" ADD CONSTRAINT "PK_PRO_CATEGORY" PRIMARY KEY ("CATEGORY_CODE") ENABLE;
  ALTER TABLE "PRO_CATEGORY" ADD CHECK (CATEGORY_CODE IN ('A', 'C', 'D')) ENABLE;
  ALTER TABLE "PRO_CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "PRO_CATEGORY" MODIFY ("CATEGORY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USER_NO") ENABLE;
  ALTER TABLE "MEMBER" ADD UNIQUE ("USER_ID") ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (PET_GENDER IN ('M', 'F')) ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (PET_TYPE IN ('C', 'D', 'N')) ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (STATUS_EMAIL IN (0, 1)) ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (STATUS_SNS IN (0, 1)) ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (GENDER IN ('M', 'F')) ENABLE;
  ALTER TABLE "MEMBER" ADD CHECK (STATUS IN ('Y', 'N', 'A')) ENABLE;
  ALTER TABLE "MEMBER" MODIFY ("PET_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_BIRTH" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_PWD" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY ("FILE_NO") ENABLE;
  ALTER TABLE "ATTACHMENT" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "ATTACHMENT" ADD CHECK (FILE_LEVEL IN (1, 2)) ENABLE;
  ALTER TABLE "ATTACHMENT" ADD CHECK (REF_TYPE IN ('B', 'P', 'R', 'Q', 'E')) ENABLE;
  ALTER TABLE "ATTACHMENT" MODIFY ("CHANGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("ORIGIN_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("REF_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("REF_BNO" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("FILE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("RE_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CHECK (STATUS IN ('Y', 'N', 'D')) ENABLE;
  ALTER TABLE "REVIEW" ADD CHECK (RE_STAR IN (1, 2, 3, 4, 5)) ENABLE;
  ALTER TABLE "REVIEW" MODIFY ("RE_STAR" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RE_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RE_WRITER" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("PRO_NO" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY ("PRO_NO") ENABLE;
  ALTER TABLE "PRODUCT" ADD CHECK (STATUS IN ('Y', 'N', 'E')) ENABLE;
  ALTER TABLE "PRODUCT" MODIFY ("KEYWORD" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRO_MAIN_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("STOCK" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRO_MIDD_NO" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRO_CATE_CODE" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRO_NAME" NOT NULL ENABLE);
  ALTER TABLE "PRODUCT" MODIFY ("PRO_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NOTICE_NO") ENABLE;
  ALTER TABLE "NOTICE" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_WRITER" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QNA_CATEGORY
--------------------------------------------------------

  ALTER TABLE "QNA_CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "QNA_CATEGORY" MODIFY ("CATEGORY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("BOARD_NO") ENABLE;
  ALTER TABLE "BOARD" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "BOARD" ADD CHECK (BOARD_TYPE IN (1, 2)) ENABLE;
  ALTER TABLE "BOARD" MODIFY ("BOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_TITLE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRO_CATEGORY_MIDD
--------------------------------------------------------

  ALTER TABLE "PRO_CATEGORY_MIDD" ADD CONSTRAINT "PK_PRO_CATEGORY_MIDD" PRIMARY KEY ("CATE_MIDD_NO") ENABLE;
  ALTER TABLE "PRO_CATEGORY_MIDD" ADD CHECK (CATE_MIDD_NO IN (1, 2, 3)) ENABLE;
  ALTER TABLE "PRO_CATEGORY_MIDD" MODIFY ("CATE_MIDD_NAME" NOT NULL ENABLE);
  ALTER TABLE "PRO_CATEGORY_MIDD" MODIFY ("CATE_MIDD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY ("FAQ_NO") ENABLE;
  ALTER TABLE "FAQ" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "FAQ" MODIFY ("FAQ_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("FAQ_TITLE" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("FAQ_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY ("QNA_NO") ENABLE;
  ALTER TABLE "QNA" ADD CHECK (STATUS IN ('Y', 'N', 'D')) ENABLE;
  ALTER TABLE "QNA" MODIFY ("QNA_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "QNA" MODIFY ("QNA_TITLE" NOT NULL ENABLE);
  ALTER TABLE "QNA" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "QNA" MODIFY ("QNA_WRITER" NOT NULL ENABLE);
  ALTER TABLE "QNA" MODIFY ("QNA_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NO") ENABLE;
  ALTER TABLE "REPLY" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "REPLY" MODIFY ("REPLY_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "REPLY" MODIFY ("REPLY_BNO" NOT NULL ENABLE);
  ALTER TABLE "REPLY" MODIFY ("REPLY_WRITER" NOT NULL ENABLE);
  ALTER TABLE "REPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PACKAGE
--------------------------------------------------------

  ALTER TABLE "PACKAGE" ADD CONSTRAINT "PK_PACKAGE" PRIMARY KEY ("PACKAGE_NO") ENABLE;
  ALTER TABLE "PACKAGE" MODIFY ("PACKAGE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WISH
--------------------------------------------------------

  ALTER TABLE "WISH" ADD CONSTRAINT "PK_WISH" PRIMARY KEY ("WISH_NO") ENABLE;
  ALTER TABLE "WISH" MODIFY ("PRO_NO" NOT NULL ENABLE);
  ALTER TABLE "WISH" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "WISH" MODIFY ("WISH_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "PK_EVENT" PRIMARY KEY ("EVENT_NO") ENABLE;
  ALTER TABLE "EVENT" ADD CHECK (STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "EVENT" ADD CHECK (EVENT_SHOW IN ('Y', 'N')) ENABLE;
  ALTER TABLE "EVENT" MODIFY ("EVENT_TITLE" NOT NULL ENABLE);
  ALTER TABLE "EVENT" MODIFY ("EVENT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY ("BOARD_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY ("CART_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "CART" ADD CONSTRAINT "FK_PRODUCT_TO_CART_1" FOREIGN KEY ("CART_PRO")
	  REFERENCES "PRODUCT" ("PRO_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DELIVERY
--------------------------------------------------------

  ALTER TABLE "DELIVERY" ADD CONSTRAINT "FK_MEMBER_TO_DELIVERY_1" FOREIGN KEY ("DELIVERY_USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVENT_PRODUCT
--------------------------------------------------------

  ALTER TABLE "EVENT_PRODUCT" ADD CONSTRAINT "FK_EVENT_TO_EVENT_PRODUCT_1" FOREIGN KEY ("EVENT_NO")
	  REFERENCES "EVENT" ("EVENT_NO") ENABLE;
  ALTER TABLE "EVENT_PRODUCT" ADD CONSTRAINT "FK_PRODUCT_TO_EVENT_PRODUCT_1" FOREIGN KEY ("PRO_NO")
	  REFERENCES "PRODUCT" ("PRO_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY ("NOTICE_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "ORDER_DETAIL" ADD CONSTRAINT "FK_PACKAGE_TO_ORDER_DETAIL_1" FOREIGN KEY ("PACKAGE_NO")
	  REFERENCES "PACKAGE" ("PACKAGE_NO") ENABLE;
  ALTER TABLE "ORDER_DETAIL" ADD CONSTRAINT "FK_PRODUCT_TO_ORDER_DETAIL_1" FOREIGN KEY ("PRO_NO")
	  REFERENCES "PRODUCT" ("PRO_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POINT
--------------------------------------------------------

  ALTER TABLE "POINT" ADD CONSTRAINT "FK_MEMBER_TO_POINT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "POINT" ADD CONSTRAINT "FK_ORDER_TO_POINT_1" FOREIGN KEY ("ORDER_NO")
	  REFERENCES "TB_ORDER" ("ORDER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD CONSTRAINT "FK_MEMBER_TO_QNA_1" FOREIGN KEY ("QNA_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_TO_REPLY_1" FOREIGN KEY ("REPLY_BNO")
	  REFERENCES "BOARD" ("BOARD_NO") ENABLE;
  ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY ("REPLY_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MACRO_TO_REVIEW_1" FOREIGN KEY ("MACRO_NO")
	  REFERENCES "MACRO" ("MACRO_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY ("RE_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_PRODUCT_TO_REVIEW_1" FOREIGN KEY ("PRO_NO")
	  REFERENCES "PRODUCT" ("PRO_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_ORDER
--------------------------------------------------------

  ALTER TABLE "TB_ORDER" ADD CONSTRAINT "FK_MEMBER_TO_ORDER_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WISH
--------------------------------------------------------

  ALTER TABLE "WISH" ADD CONSTRAINT "FK_MEMBER_TO_WISH_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "WISH" ADD CONSTRAINT "FK_PRODUCT_TO_WISH_1" FOREIGN KEY ("PRO_NO")
	  REFERENCES "PRODUCT" ("PRO_NO") ENABLE;
