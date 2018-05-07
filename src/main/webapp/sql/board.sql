CREATE TABLE FREEBOARD(
SEQ NUMBER NOT NULL,
CATEGORY VARCHAR2(20) NOT NULL,
ID VARCHAR2(20) NOT NULL,
NICKNAME VARCHAR2(20) NOT NULL,
SUBJECT VARCHAR2(20) NOT NULL,
CONTENT CLOB NOT NULL,
FILE1 VARCHAR2(200) NOT NULL,
RE NUMBER DEFAULT 0,
RE_LEV NUMBER DEFAULT 0,
RE_REF NUMBER DEFAULT 0,
RE_SEQ NUMBER DEFAULT 0,
HIT NUMBER DEFAULT 0,
LOGTIME DATE DEFAULT SYSDATE
);

create sequence seq_freenum nocycle nocache;
create sequence seq_freereplynum nocycle nocache;


CREATE TABLE NOTICEBOARD(
SEQ NUMBER NOT NULL,
CATEGORY VARCHAR2(20) NOT NULL,
ID VARCHAR2(20) NOT NULL,
NICKNAME VARCHAR2(20) NOT NULL,
SUBJECT VARCHAR2(20) NOT NULL,
CONTENT CLOB NOT NULL,
FILE1 VARCHAR2(200) NOT NULL,
RE NUMBER DEFAULT 0,
RE_LEV NUMBER DEFAULT 0,
RE_REF NUMBER DEFAULT 0,
RE_SEQ NUMBER DEFAULT 0,
HIT NUMBER DEFAULT 0,
LOGTIME DATE DEFAULT SYSDATE
);

insert into NOTICEBOARD values (seq_qnanum.NEXTVAL,'규칙','hong','홍홍','솔라 활동전','
- 글 작성하실때 기본적으로 5줄이상으로(5문장 이상의) 올려주셔야 합니다 (PC기준)
    모바일이라 잘 모르겠다면? 한 문장 쓰고 엔터 눌러서 다음 문장 쓰는 식으로 5줄 작성해 주시면 됩니다!
    짧게 대충 쓰는 혼잣말이 아니라, 회원님들과 나누고 교류하는 글과 댓글로 함꼐해요~ ^^
    
- 글 제목에 특수문자, 자신의 닉네임, 공백 , 시리즈 형식으로 기재 금지입니다!!!
    ㅎㅎ,ㅋㅋ 같은 자음남발과 이모티콘만 사용한 제목도 금지사항이며,
    제목도 너무 길지 않게 적어주세요,(PC로 확인해 2줄이상으로 길면 삭제대상입니다.)
    
- 반말금지 : 카페 내에서 반말체로 글이나 덧글을 게시하지 않도록 주의해 주세요.
    (다양한 연령대의 남녀노소 모두가 공개적으로 이용하는 카페 게시판이니,
    친분이 있든, 혼잣말이든 , 서평이든 상관없이 정중하게 의사소통 것이 기본입니다.)
    
-친구/이웃구함 금지 ,블로그 & 타 사이트 스크랩, 주소링크, 방문 유도글 금지 등
    홍보성으로 이용돌수 있는 게시글은 모든 기본적으로 금지사항입니다! 바로 무통보 삭제됩니다.

-주소 노출 이미지 금지, 저작권 침해 게시글 금지입니다.
    (이미지에 자신의 저작권을 지키기 위한 워터마크 삽입 자체는 괜찮으나, 주소노출은 홍보로 간주됩니다.)
    
',' ',0,0,0,0,0,sysdate);

create sequence seq_noticenum nocycle nocache;
create sequence seq_noticereplynum nocycle nocache;

CREATE TABLE QNABOARD(
SEQ NUMBER NOT NULL,
CATEGORY VARCHAR2(20) NOT NULL,
ID VARCHAR2(20) NOT NULL,
NICKNAME VARCHAR2(20) NOT NULL,
SUBJECT VARCHAR2(20) NOT NULL,
CONTENT CLOB NOT NULL,
FILE1 VARCHAR2(200) NOT NULL,
RE NUMBER DEFAULT 0,
RE_LEV NUMBER DEFAULT 0,
RE_REF NUMBER DEFAULT 0,
RE_SEQ NUMBER DEFAULT 0,
HIT NUMBER DEFAULT 0,
LOGTIME DATE DEFAULT SYSDATE
);

create sequence seq_qnanum nocycle nocache;