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

insert into NOTICEBOARD values (seq_qnanum.NEXTVAL,'��Ģ','hong','ȫȫ','�ֶ� Ȱ����','
- �� �ۼ��ϽǶ� �⺻������ 5���̻�����(5���� �̻���) �÷��ּž� �մϴ� (PC����)
    ������̶� �� �𸣰ڴٸ�? �� ���� ���� ���� ������ ���� ���� ���� ������ 5�� �ۼ��� �ֽø� �˴ϴ�!
    ª�� ���� ���� ȥ�㸻�� �ƴ϶�, ȸ���Ե�� ������ �����ϴ� �۰� ��۷� �Բ��ؿ�~ ^^
    
- �� ���� Ư������, �ڽ��� �г���, ���� , �ø��� �������� ���� �����Դϴ�!!!
    ����,���� ���� �������߰� �̸�Ƽ�ܸ� ����� ���� ���������̸�,
    ���� �ʹ� ���� �ʰ� �����ּ���,(PC�� Ȯ���� 2���̻����� ��� ��������Դϴ�.)
    
- �ݸ����� : ī�� ������ �ݸ�ü�� ���̳� ������ �Խ����� �ʵ��� ������ �ּ���.
    (�پ��� ���ɴ��� ������ ��ΰ� ���������� �̿��ϴ� ī�� �Խ����̴�,
    ģ���� �ֵ�, ȥ�㸻�̵� , �����̵� ������� �����ϰ� �ǻ���� ���� �⺻�Դϴ�.)
    
-ģ��/�̿����� ���� ,��α� & Ÿ ����Ʈ ��ũ��, �ּҸ�ũ, �湮 ������ ���� ��
    ȫ�������� �̿뵹�� �ִ� �Խñ��� ��� �⺻������ ���������Դϴ�! �ٷ� ���뺸 �����˴ϴ�.

-�ּ� ���� �̹��� ����, ���۱� ħ�� �Խñ� �����Դϴ�.
    (�̹����� �ڽ��� ���۱��� ��Ű�� ���� ���͸�ũ ���� ��ü�� ��������, �ּҳ����� ȫ���� ���ֵ˴ϴ�.)
    
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