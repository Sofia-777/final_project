-- USERTABLE
CREATE TABLE USERTABLE (
    u_id        VARCHAR2(15)     PRIMARY KEY,                                                   -- ���� ���̵�
    u_pwd       VARCHAR2(15)     NOT NULL,                                                      -- ���� ��й�ȣ
    u_nickname  VARCHAR2(30)     NOT NULL,                                                      -- ���� �г���
    u_name      VARCHAR2(20)     NOT NULL,                                                      -- ���� �̸�
    u_age_y     NUMBER(4)        NOT NULL,                                                      -- ���� ����(��)(4�ڸ�)
    u_age_m     NUMBER(2)        NOT NULL,                                                      -- ���� ����(��)(2�ڸ�)
    u_age_d     NUMBER(2)        NOT NULL,                                                      -- ���� ����(��)(2�ڸ�)
    u_email     VARCHAR2(50)     NOT NULL,                                                      -- ���� �̸���
    u_tel1      VARCHAR2(3)      NOT NULL,                                                      -- ���� ��ȭ��ȣ1
    u_tel2      NUMBER(4)        NOT NULL,                                                      -- ���� ��ȭ��ȣ2
    u_tel3      NUMBER(4)        NOT NULL,                                                      -- ���� ��ȭ��ȣ3
    u_addr1     VARCHAR2(50)     NOT NULL,                                                      -- ���� �ּ�(�����ȣ)
    u_addr2     VARCHAR2(100)    NOT NULL,                                                      -- ���� �ּ�(���θ� �ּ�)
    u_addr3     VARCHAR2(150)    NOT NULL,                                                      -- ���� �ּ�(���ּ�)
    u_gender    VARCHAR2(20)     NOT NULL,                                                      -- ���� ����(select)
    u_regdate   DATE             DEFAULT SYSDATE                                                -- ���� ��������
);


-- JOINTABLE
CREATE TABLE JOINTABLE (
    j_idx           NUMBER(4)           PRIMARY KEY,                                            -- ������ �۹�ȣ
    j_id            VARCHAR2(15)        REFERENCES USERTABLE(u_id) ON DELETE SET NULL,          -- ������ �ۼ���/������ ���̵�(����)
    j_nickname      VARCHAR2(30)        NOT NULL,                                               -- ������ �ۼ���/������ �г���
    j_city          VARCHAR2(10)        NOT NULL,                                               -- ������ ���� ��з�(select)
    j_location      VARCHAR2(100)       NOT NULL,                                               -- ������ ���� �Һз�(text)
    j_hobbyB        VARCHAR2(50)        NOT NULL,                                               -- ������ ��� ��з�(select)
    j_hobbyS        VARCHAR2(100)       NOT NULL,                                               -- ������ ��� �Һз�(text)
    j_title         VARCHAR2(80)        NOT NULL,                                               -- ������ ����
    j_date          DATE                DEFAULT SYSDATE,                                        -- ������ �ۼ�����
    j_Dday          DATE                NOT NULL,                                               -- ������ ��������(���� �޷�/text)
    j_Mday          DATE                NOT NULL,                                               -- ������ ������ ����(���� �޷�/text)
    j_count         NUMBER(5)           DEFAULT 0,                                              -- ������ ��ȸ��
    j_cost          VARCHAR2(2)                  ,                                              -- ������ ��� ����(üũ�ڽ�)
    j_maxmem        NUMBER(2)           NOT NULL,                                               -- ������ �ִ��ο�(text)
    j_nowmem        NUMBER(2)           NOT NULL,                                               -- ������ �����ο�
    j_content       VARCHAR2(3000)      NOT NULL,                                               -- ������ ����
    j_pwd           VARCHAR(12)         NOT NULL,                                               -- ������ ��й�ȣ
    j_end           NUMBER(1)           NOT NULL,                                               -- ������ ���� ����
    j_admindel      NUMBER(1)           DEFAULT 1                                               -- ������ ������ ���� ����
);


-- JOINTABLE SEQ
CREATE SEQUENCE JOINTABLE_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;


-- JOINCOMMENT
CREATE TABLE JOINCOMMENT(
    jc_idx          NUMBER(6)       PRIMARY KEY,                                                -- ������ ��� �ۼ� �� ��ȣ
    jc_bidx         NUMBER(6)       REFERENCES JOINTABLE(j_idx) ON DELETE SET NULL,             -- ������ ��� �ۼ� ��� ��ȣ
    jc_id           VARCHAR2(15)    REFERENCES USERTABLE(u_id) ON DELETE SET NULL,              -- ������ ��� �ۼ��� ���̵�
    jc_nickname     VARCHAR2(30)    NOT NULL,                                                   -- ������ ��� �ۼ��� �г���
    jc_content      VARCHAR2(3000)  NOT NULL,                                                   -- ������ ��� �ۼ� ����
    jc_date         DATE            DEFAULT SYSDATE                                             -- ������ ��� �ۼ�����
);


-- JOINCOMMENT SEQ
CREATE SEQUENCE JOINCOMMENT_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;



-- APPLYTABLE
CREATE TABLE APPLYTABLE(
    ap_bidx         NUMBER(6)       REFERENCES JOINTABLE(j_idx) ON DELETE SET NULL,             -- ������ ���������� �޾ƿ��� �۹�ȣ
    ap_id           VARCHAR2(15)    REFERENCES USERTABLE(u_id) ON DELETE SET NULL,              -- ������ ���������� �޾ƿ��� ���̵�
    ap_nickname     VARCHAR2(30)    NOT NULL                                                    -- ������ ���������� �޾ƿ��� �г���
);


-- LOCATION
CREATE TABLE CITYTABLE (
    city        VARCHAR2(100)   NOT NULL
);
INSERT INTO CITYTABLE VALUES('�λ�');
INSERT INTO CITYTABLE VALUES('����');
INSERT INTO CITYTABLE VALUES('����');
INSERT INTO CITYTABLE VALUES('�뱸');
INSERT INTO CITYTABLE VALUES('����');
INSERT INTO CITYTABLE VALUES('���');


-- HOBBY
CREATE TABLE HOBBYTABLE (
    hobby           VARCHAR2(50)    NOT NULL
);
INSERT INTO HOBBYTABLE VALUES('�');
INSERT INTO HOBBYTABLE VALUES('������');
INSERT INTO HOBBYTABLE VALUES('����');
INSERT INTO HOBBYTABLE VALUES('�丮');
INSERT INTO HOBBYTABLE VALUES('����');
INSERT INTO HOBBYTABLE VALUES('����');


-- MESSAGETABLE
CREATE TABLE MESSAGETABLE (
    me_idx          NUMBER(6)       PRIMARY KEY,                                                -- ���� ��ȣ
    me_snick        VARCHAR2(15)    NOT NULL,                                                   -- ���� �߽���
    me_rnick        VARCHAR2(15)    NOT NULL,                                                   -- ���� ������
    me_title        VARCHAR2(80)    NOT NULL,                                                   -- ���� ����
    me_content      VARCHAR2(3000)  NOT NULL,                                                   -- ���� ����
    me_date         DATE            DEFAULT SYSDATE                                             -- ���� �ۼ���
);


-- MESSAGETABLE_SEQ
CREATE SEQUENCE MESSAGETABLE_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;


-- BOARDTABLE
CREATE TABLE BOARDTABLE (
    b_idx       NUMBER(6)       PRIMARY KEY,                                                    -- �����Խ��� �۹�ȣ
    b_id        VARCHAR2(15)    REFERENCES USERTABLE(u_id) ON DELETE SET NULL,                  -- �����Խ��� ���̵�(����)
    b_nickname  VARCHAR2(30)    NOT NULL,                                                       -- �����Խ��� �г���
    b_title     VARCHAR2(80)    NOT NULL,                                                       -- �����Խ��� ����
    b_content   VARCHAR2(3000)  NOT NULL,                                                       -- �����Խ��� ����
    b_date      DATE            DEFAULT SYSDATE,                                                -- �����Խ��� �ۼ�����
    b_count     NUMBER(5)       DEFAULT 0,                                                      -- �����Խ��� ��ȸ��
    b_pwd       VARCHAR(12)     NOT NULL,                                                       -- �����Խ��� ��й�ȣ
    b_admindel  NUMBER(1)       DEFAULT 1                                                       -- �����Խ��� ������ ���� ����
);


-- BOARDTABLE SEQ
CREATE SEQUENCE BOARDTABLE_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;


-- BOARDCOMMENT
CREATE TABLE BOARDCOMMENT(
    bc_idx          NUMBER(6)       PRIMARY KEY,                                                -- �Խ��� ����� �Խñ� ��ȣ
    bc_bidx         NUMBER(6)       REFERENCES BOARDTABLE(b_idx) ON DELETE SET NULL,            -- �Խ��� ����� �Խ��� ��ȣ
    bc_id           VARCHAR2(15)    REFERENCES USERTABLE(u_id) ON DELETE SET NULL,              -- �Խ��� ����� ���� ���̵�
    bc_nickname     VARCHAR2(30)    NOT NULL,                                                   -- �Խ��� ����� ���� �г���
    bc_content      VARCHAR2(3000)  NOT NULL,                                                   -- �Խ��� ����� ����
    bc_date         DATE            DEFAULT SYSDATE                                             -- �Խ��� ����� �ۼ�����
);


-- BOARDCOMMENT SEQ
CREATE SEQUENCE BOARDCOMMENT_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;


-- ADMINTABLE
CREATE TABLE ADMINTABLE (
    a_id        VARCHAR2(10)              PRIMARY KEY,                                          -- ������ ���̵�
    a_pwd       VARCHAR2(10),                                                                   -- ������ ��й�ȣ
    a_nickname  VARCHAR2(10)                                                                    -- ������ �г���
);
INSERT INTO ADMINTABLE VALUES('system', 'tiger', '������');


-- NOTICETABLE
CREATE TABLE NOTICETABLE(
    n_idx       NUMBER(6)       PRIMARY KEY,                                                    -- �������� �۹�ȣ
    n_id        VARCHAR2(15)    REFERENCES ADMINTABLE(a_id) ON DELETE SET NULL,                 -- �������� ���̵�(������)
    n_nickname  VARCHAR2(30)    NOT NULL,                                                       -- �������� �г���
    n_title     VARCHAR2(80)    NOT NULL,                                                       -- �������� ����
    n_content   VARCHAR2(3000)  NOT NULL,                                                       -- �������� ����
    n_date      DATE            DEFAULT SYSDATE,                                                -- �������� �ۼ�����
    n_count     NUMBER(5)       DEFAULT 0                                                       -- �������� ��ȸ��
);


-- NOTICETABLE SEQ
CREATE SEQUENCE NOTICETABLE_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1 START WITH 1 
NOCYCLE 
NOCACHE;


COMMIT;