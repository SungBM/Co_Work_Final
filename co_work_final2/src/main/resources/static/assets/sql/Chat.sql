create table room(
  roomNumber   NUMBER PRIMARY KEY,
  roomName      VARCHAR2(50)
);
 
create table chat_log(
 roomNumber      NUMBER,  --���߿� primary key
 CHAT_DATE      VARCHAR2(50),
 CHAT_SEND      VARCHAR2(50),
 CHAT_CONTENT   VARCHAR2(2000),
 CHAT_FILE      VARCHAR2(100),    --���ε�� ���� �̸�
 CHAT_ORIGINAL   VARCHAR2(100)   --���������̸�
);

create table chat_member(
 roomNumber   NUMBER REFERENCES room(roomNumber),
 ID         VARCHAR2(50)REFERENCES MEMBER(ID)
);