------------------------------------------------------------------------------
혼밥&혼술
------------------------------------------------------------------------------

--시퀀스 생성
create sequence place_seq
start with 1
increment by 1
nocache
nomaxvalue;

--테이블 생성
create table tip_place(
  place_seq number not null,
  id varchar2(15) not null, -- 작성자 id
  name varchar2(15) not null, -- 작성자 이름
  place_lat number not null, -- 장소의 위도 (y좌표)
  place_lng number not null, -- 장소의 경도 (x좌표)
  place_name varchar2(60) not null, -- 한글 30자
  place_addressname varchar2(300) not null,
  place_roadaddressname varchar2(300),
  place_phone varchar2(15),
  place_type number not null,
  place_detail varchar2(4000) not null,
  logtime date default sysdate
);


REM INSERTING into TIP_PLACE
SET DEFINE OFF;
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (2,'jaesuk0731','서재석',37.57052951736436,126.98973571886324,'원조일산비빔국수 본점','서울 종로구 종로3가 5','서울 종로구 종로 111','02-742-1004',1,'종로 근처에 학원 다니는 분들!
여기 모르면 간첩.',to_date('18/04/18','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (3,'jaesuk0731','서재석',37.5114276679358,127.04536147234634,'청춘포차','서울 강남구 삼성동 38','서울 강남구 봉은사로57길 8','02-3416-0887',2,'처음 혼술해봤는데 여기만한 데가 없더라구요',to_date('18/04/18','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (4,'jaesuk0731','서재석',37.61175363804342,127.06363666529965,'혼술식당','서울 성북구 석관동 127-56','서울 성북구 한천로78길 21','070-5104-5945',1,'존맛탱',to_date('18/04/18','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (5,'jaesuk0731','서재석',37.589896376132025,127.01927975320419,'혼술주점 혜화동','서울 성북구 동선동2가 67','서울 성북구 보문로30라길 5-2','02-978-9488',1,'존맛ㅁ존맛',to_date('18/04/18','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (6,'jaesuk0731','서재석',37.405112199699225,127.12668376365173,'카페그레이','경기 성남시 분당구 이매동 97-5','경기 성남시 분당구 판교로 476','031-704-0448',3,'여기 진짜 조용하고 좋습니다!',to_date('18/04/19','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (7,'jaesuk0731','서재석',37.589368706514435,126.99157608223776,'할매 국밥','서울 종로구 명륜3가 53-21','서울특별시 종로구 성균관로 25-2',null,1,'개존맛탱',to_date('18/04/19','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (8,'jaesuk0731','서재석',37.5705800196194,126.99021565912854,'스타벅스 종로3가점','서울 종로구 종로3가 9-3','서울 종로구 종로 113-1','02-758-8339',3,'커피 존맛',to_date('18/04/19','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (9,'jaesuk0731','서재석',37.572043324174174,126.99131571817267,'큰맘할매순대국 낙원동점','서울 종로구 돈의동 111','서울 종로구 돈화문로9길 6','02-745-9298',1,'순대국 먹고싶은 날엔
혼자 여기 옵니다,,,',to_date('18/04/19','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (11,'jaesuk0731','서재석',37.5705800196194,126.99021565912852,'스타벅스 종로3가점','서울 종로구 종로3가 9-3','서울 종로구 종로 113-1','02-758-8339',3,'여기
분위기 좋아요',to_date('18/04/19','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (12,'hyori','이효리',33.33314561082264,126.2308570015827,'제주돗','제주특별자치도 제주시 한경면 조수리 254-1','제주특별자치도 제주시 한경면 조수2길 34','064-772-0505',1,'여기 진짜 분위기 미쳐요
혼자 먹으러 왔다고 하면
알바생이 말동무도 해줘요!',to_date('18/04/20','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (13,'user03','김지호',37.50350079281367,127.02643395068056,'호랑이식당 강남본점','서울 강남구 역삼동 810-14','서울 강남구 봉은사로4길 20','02-508-6655',1,'혼자 먹는 사람들 정말 많이 찾아오는
숨은 명소!',to_date('18/04/20','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (14,'user03','김지호',37.55068602270585,126.9232836918942,'삼거리포차','서울 마포구 서교동 361-12','서울 마포구 와우산로 70','02-3144-6748',2,'여기 모르는 사람 있나요? ㅋ',to_date('18/04/20','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (15,'teacher','박강사',37.572725146646434,126.96094218256633,'대성집','서울 종로구 행촌동 209-35','서울 종로구 사직로 5','02-735-4259',1,'숨은 명소입니더',to_date('18/04/20','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (16,'yoojaesuk','유재석',37.530682878855025,126.92162113959311,'정인면옥','서울 영등포구 여의도동 13-1','서울 영등포구 국회대로76길 10','02-2683-2615',1,'여기 냉면 쥑입니다.
혼밥 명소!
혼자 오지말고
꼭 나중에 커플이랑 오세요',to_date('18/04/20','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (17,'yoojaesuk','유재석',37.54840717918816,126.92158412053477,'켄비멘리키','서울 마포구 상수동 313-3','서울 마포구 독막로15길 3-12','02-324-0822',1,'상수 맛집입니다.
혼밥하기 좋아요',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (18,'yoojaesuk','유재석',37.56394633831961,127.01620260656844,'빛나는 바다','서울 중구 신당동 102-1','서울특별시 중구 다산로 236','02-1829-2394',2,'술마시기 좋은 분위기!
분위기 깡패입니다.',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (19,'yoojaesuk','유재석',37.55831588588856,127.01139515131754,'동동등갈비&혼밥돼지','서울 중구 신당동 375-31','서울 중구 청구로17길 67','02-6498-1882',1,'가게 이름부터 혼자먹기 좋아보이는곳!',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (20,'jaesuk','서재석',37.57102509177565,126.97791797759294,'김밥천국','서울 종로구 세종로 119','서울 종로구 종로 1',null,1,'혼밥하면 김밥천국 아니겠습니까',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (21,'jaesuk','서재석',37.39493160877016,127.12238902185256,'스타벅스 분당이매점','경기 성남시 분당구 이매동 146-2','경기 성남시 분당구 이매로 15','031-8017-3439',3,'여기 조용해요',to_date('18/04/28','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (1,'jaesuk0731','서재석',37.57435614410793,127.01942095955775,'혼술혼밥','서울 종로구 숭인동 169','서울 종로구 종로 379','02-742-4333',2,'혼자 술먹었는데 존맛탱',to_date('18/04/18','RR/MM/DD'));
Insert into TIP_PLACE (PLACE_SEQ,ID,NAME,PLACE_LAT,PLACE_LNG,PLACE_NAME,PLACE_ADDRESSNAME,PLACE_ROADADDRESSNAME,PLACE_PHONE,PLACE_TYPE,PLACE_DETAIL,LOGTIME) values (10,'user1','기성용',37.54151249236552,127.06937508059765,'건대맛집','서울 종로구 숭인동 169','서울 종로구 종로 379','02-742-4333',2,'혼자 술먹었는데 존맛탱',to_date('18/04/19','RR/MM/DD'));


------------------------------------------------------------------------------
무인택배
------------------------------------------------------------------------------

--시퀀스 생성
create sequence express_seq
start with 1
increment by 1
nocache
nomaxvalue;

--테이블 생성
create table tip_express(
  express_seq number not null,
  id varchar2(15) not null, -- 작성자 id
  name varchar2(15) not null, -- 작성자 이름
  express_lat number not null, -- 장소의 위도 (y좌표)
  express_lng number not null, -- 장소의 경도 (x좌표)
  express_name varchar2(60) not null, -- 한글 30자
  epxress_addressname varchar2(300) not null,
  express_roadaddressname varchar2(300) not null,
  express_region_depth_name varchar2(100) not null,
  express_addressdetail varchar2(100) not null,
  express_detail varchar2(4000) not null,
  logtime date default sysdate
);



REM INSERTING into TIP_EXPRESS
SET DEFINE OFF;
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (1,'yoojaesuk','유재석',37.571049890037784,126.97875293003646,'광화문 핫스팟','서울 종로구 청진동 246','서울특별시 종로구 종로3길 17','서울:종로구','D타워 1층 로비','로비에 맡기면
무료로 알아서 다 보관해주세요!',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (6,'yoojaesuk','유재석',37.57062720735151,126.98368840976751,'종각역 안심센터','서울 종로구 공평동 70','서울특별시 종로구 종로 51','서울:종로구','종로타워 1층 로비','여기 아저씨가 다 받아줘요',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (7,'yoojaesuk','유재석',37.56856229277221,126.97446361451186,'종각 사시는 분들 모여라!!!!!!!!!!!!!!!!!!!!','서울 중구 정동 1-76','서울특별시 중구 덕수궁길 140','서울:중구','서울덕수초등학교 경비실','여기 정문 옆에 무인택배 보관함 있어요
아무도 안건드려요 장담해요',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (8,'yoojaesuk','유재석',37.56851842361331,126.98067793234802,'중구 사는분','서울 중구 다동 33','서울특별시 중구 청계천로 30','서울:중구','예금보험공사','공식 안심택배 등록 기관입니다.',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (9,'yoojaesuk','유재석',37.571986769114574,126.97790367603717,'광화문에 회사가 있는 분들!','서울 종로구 세종로 100','서울특별시 종로구 세종대로 178','서울:종로구','KT광화문지사 3층','3층에 고객센터에 맡기시면 됩니다.
이름이랑 연락처만 적으시면
편하게 맡기실 수 있어요!',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (10,'yoojaesuk','유재석',37.57463516840781,126.97525395765904,'경복궁역 회사원분들!!','서울 종로구 세종로 77-6','서울특별시 종로구 세종대로 209','서울:종로구','정부서울청사 1층','정부서울청사에서는
시민들을 위해 무료로 무인택배 서비스를 합니다.',to_date('18/04/24','RR/MM/DD'));
Insert into TIP_EXPRESS (EXPRESS_SEQ,ID,NAME,EXPRESS_LAT,EXPRESS_LNG,EXPRESS_NAME,EPXRESS_ADDRESSNAME,EXPRESS_ROADADDRESSNAME,EXPRESS_REGION_DEPTH_NAME,EXPRESS_ADDRESSDETAIL,EXPRESS_DETAIL,LOGTIME) values (5,'yoojaesuk','유재석',37.57061317815443,126.9803151630476,'종각역 사람이라면 여기!!!!','서울 종로구 청진동 128','서울특별시 종로구 종로5길 7','서울:종로구','타워8 지하주차장','여기 지하주차장이 CCTV로 둘러싸여서
정말 안전하고 안심할 수 있어요!',to_date('18/04/24','RR/MM/DD'));

------------------------------------------------------------------------------
레시피
------------------------------------------------------------------------------

--시퀀스 생성
create sequence recipe_seq
start with 1
increment by 1
nocache
nomaxvalue;

--테이블 생성
create table tip_recipe(
  recipe_seq number not null,
  id varchar2(15) not null,
  name varchar2(15) not null,
  foodimage varchar2(100),
  foodname varchar2(50) not null,
  foodname_detail varchar2(300),
  cookingtime number not null,
  difficulty number not null,
  jaeryo_necessary varchar2(1000) not null,
  jaeryo_nonecessary varchar2(1000),
  recipe0 varchar2(4000) not null,
  recipe1 varchar2(4000) not null,
  recipe2 varchar2(4000) not null,
  recipe3 varchar2(4000) not null,
  recipe4 varchar2(4000) not null,
  recipe5 varchar2(2000),
  recipe6 varchar2(2000),
  recipe7 varchar2(2000),
  recipe8 varchar2(2000),
  recipe9 varchar2(2000),
  price number,
  hit number,
  logtime date default sysdate
  );


REM INSERTING into TIP_RECIPE
SET DEFINE OFF;
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (1,'jaesuk','서재석','tomato-pasta1.jpg','토마토 파스타','이것만 있으면 하루 요리 뚝딱',15,1,'마늘 3개, 올리브 오일, 스파게티면, 토마토 소스','null','ㅁㄴㅇㄹ22','ㅁㄴㅇㄹ12','ㅁㄴㅇㄹㄹㄷ32ㄱㄻㄹ','ㄴㅌㅋ','ㅁㄹ','null','null','null','null','null',0,2,to_date('18/04/26','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (2,'jaesuk','서재석','740_SAM_0792.JPG','고추장불고기','막걸리 안주로 좋은 것!',25,2,'돼지고기 목살 1kg, 고추장 6큰술, 간장 3큰술, 다진마늘 1과 1/2큰술, 고춧가루 1과 1/2작은술, 올리고당 1큰술, 설탕 1큰술, 참기름 1큰술','양파 1개, 당근 반쪽, 대파 1쪽, 해물(쭈꾸미), 후추 약간, 상추','먹기좋게 썬 돼지고기를 준비한 후
위 레시피에 적혀있는 모든 재료들을 넣어주세요.','고추장 불고기 양념이 잘 밸 수 있도록 골고루 섞어준 후 뚜껑을 덮어 냉장고에 넣습니다.','두 세시간 정도 숙성시간을 주면 됩니다.
(그 이상 반나절 정도 더 두어도 상관없어요.)','당근, 양파, 대파 등을 먹기 좋게 썰어 같이 볶습니다
(경우에 따라 쭈꾸미 등을 넣어도 좋습니다)','다 볶으면 깨를 살살 뿌려 상추에 싸먹습니다.','null','null','null','null','null',15000,58,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (3,'jaesuk','서재석','참치주먹밥.jpg','참치주먹밥','저렴하고 쉽게 구할 수 있는 참치캔을 이용한 주먹밥',20,1,'참치캔 1/2개(50g), 밥 1공기(200g)','null','참치는 체에 밭쳐 기름기를 뺀다. 부추는 송송 썬다.','볼에 밥, 소금, 참기름을 넣고 섞는다.(참치에 간이 되어 있기 때문에 소금간은 약하게 한다.)','밥에 참치, 부추, 검은깨, 후춧가루를 넣고 주걱으로 가르듯이 섞는다.','손에 비닐장갑을 끼고 밥을 한입크기로 동그랗게 만든다.','먹는다','null','null','null','null','null',3000,4,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (4,'user2','김또깡','계란볶음밥.jpg','계란볶음밥','반찬이 없을 때 손쉽게 만드는 볶음밥',15,1,'달걀 2개(100g), 밥 1공기(200g)','null','볼에 달걀, 소금을 넣고 잘 푼다.',' 달군 팬에 식용유 1큰술을 두르고 달걀을 넣고 젓가락으로 저어가며 익혀 스크램블 에그를 만들어 접시에 덜어둔다.','달군 팬에 식용유 1큰술을 두르고 밥을 넣고 고슬고슬하게 볶다가 간장을 넣고 골고루 섞어가며 볶는다.','밥이 다 볶아지면 달걀을 넣고 잘 섞는다.','불을 끄고 참기름, 깨를 넣고 다시 한번 골고루 섞는다.','null','null','null','null','null',3500,52,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (5,'user2','김또깡','null','떡볶이','김또깡님의 추천레시피',20,2,'불린떡 2줌, 어묵 2장, 대파, 멸치 다시마 육수 3.5컵, 고춧가루 2스푼, 설탕 2스푼, 카레가루 2스푼, 진간장 2스푼, 고추장 3스푼','후추,  모짜렐라 치즈','고춧가루, 설탕, 카레가루, 진간장, 고추장을 섞는다.','어묵, 대파, 양파, 깻잎 등을 썬다.','멸치육수를 끓인 후 양념장을 넣어 풀어준다.','밀떡을 넣고, 보글보글 끓기 시작하면 어묵을 넣는다.','떡이 익고 양념이 배기 시작하면 대파를 넣는다.','후추를 기호에 따라 넣는다.
플레이팅한다.','기호에 따라 치즈를 전자레인지에 넣고 돌린다.','null','null','null',0,5,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (8,'hello','박안녕','IMG_2574.jpg','소갈비찜','부드럽고 씹는 식감이 매력적인 소갈비찜',200,3,'소갈비 1.2kg, 당근 1개, 무 1/3, 버섯한줄, 대파 1대, 홍고추 1개, 간장 6스푼, 맛술 4스푼, 설탕 3스푼, 올리고당 3스푼, 다진마늘 1큰술, 참기름, 후추','null','소갈비는 3시간 이상 핏물을 빼주세요.
그 사이 당근과 무는 모서리를 둥글게 만들어 썰어놓으세요.','양념장을 만들어놓으세요. 위 재료에서 간장 6스푼 부터가 모두 양념재료입니다.','핏물 뺀 소고기를 살짝 데쳐서 준비해주세요.
데친후에 찬물에 행궈 준비 ! 데친 갈비는 다시 채소들과 함께 오랫동안 끓여줄거랍니다.','물8컵을 넣고 데친 소갈비와 양파, 대파를 넣고 센불에서 1시간정도 삶아주세요 .','1시간 이상 삶은 소갈비는 건져 칼집을 내거나 크기가 큰 경우는 잘라서 준비하고 삶은물은 버리지 마시고 체에 걸러 3컵정도 분량을 남겨주세요','1시간 이상 삶은 갈비는 건져 만들어둔 소갈비찜 양념장에 30분정도 재워주세요 . ','이후 삶은 국물 3컵을 넣고 센불에서 20분정도 팔팔 끓여주세요. 센불에 보글보글 20분 ! 채소 넣고 15분 !','무와 당근이 푹 - 익어야 하며 소갈비찜에 고루고루 양념이 쏙쏙 베어들어 부드러운 소갈비찜이 완성 되었습니다.','null','null',35000,0,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (9,'hello','박안녕','DSC07345.JPG','소고기미역국','해장용으로 딱이에요!',30,2,'불린 미역, 소고기, 참기름, 국간장, 다진 마늘','소금(국간장 대신)','미역을 먹을 만큼의 양을 불에 불려주고
소고기는 키친타월을 이용해 핏기를 닦아줍니다.','잘 불린 미역과, 핏기 제거된 소고기를 달군 냄비에 넣고
참기름 2수저 넣어 달달 볶아주세요. 소고기 겉면이 익을 때까지 볶아 주세요.','물은 1리터 정도 붓고 보글보글 끓여줍니다.','국간장 또는 소금으로 간을 맞춰줍니다.다진 마늘도 넣어주고 소고기 미역국을 끓이면서 불순물을 제거해 줍니다.','보글보글 끓이다가 중불로 줄여 푹~ 끓여주세요','드세요','null','null','null','null',6000,55,to_date('18/04/27','RR/MM/DD'));
Insert into TIP_RECIPE (RECIPE_SEQ,ID,NAME,FOODIMAGE,FOODNAME,FOODNAME_DETAIL,COOKINGTIME,DIFFICULTY,JAERYO_NECESSARY,JAERYO_NONECESSARY,RECIPE0,RECIPE1,RECIPE2,RECIPE3,RECIPE4,RECIPE5,RECIPE6,RECIPE7,RECIPE8,RECIPE9,PRICE,HIT,LOGTIME) values (13,'hong','홍홍','tip_계란볶음밥_20180501-21-41-35.jpg','sdfas','sadfas',11,1,'asdfas','sdfasf','asfasfasd','fasdf','fasf','fasfsa','fasfas','null','null','null','null','null',11000,5,to_date('18/05/01','RR/MM/DD'));



------------------------------------------------------------------------------
인테리어
------------------------------------------------------------------------------

--시퀀스 생성
create sequence interior_seq
start with 1
increment by 1
nocache
nomaxvalue;

--테이블 생성
create table tip_interior(
interior_seq number not null,
id varchar2(15) not null,
name varchar2(15) not null,
price number not null,
roomsize number,
interior_title varchar2(300),
interior_mainimage varchar2(200),
interior_content varchar2(1000) not null,
hit number not null,
like_user varchar2(4000),
logtime date default sysdate
);

REM INSERTING into TIP_INTERIOR
SET DEFINE OFF;
Insert into TIP_INTERIOR (INTERIOR_SEQ,ID,NAME,PRICE,ROOMSIZE,INTERIOR_TITLE,INTERIOR_MAINIMAGE,INTERIOR_CONTENT,HIT,LIKE_USER,LOGTIME) values (5,'hong','홍홍',20,4,'방 꾸미는 데 하루면 충분!','tip_interior_drawing_20180502-16-29-26.jpg','tip_20180502-16-29-26_hong.txt',4,'|',to_date('18/05/02','RR/MM/DD'));
Insert into TIP_INTERIOR (INTERIOR_SEQ,ID,NAME,PRICE,ROOMSIZE,INTERIOR_TITLE,INTERIOR_MAINIMAGE,INTERIOR_CONTENT,HIT,LIKE_USER,LOGTIME) values (4,'hong','홍홍',20,5,'방 꾸미는 데 하루면 충분!','tip_20160703031330h3DMYXUQHd_20180501-19-47-27.png','tip_20180502-16-29-46_hong.txt',2,'|',to_date('18/05/01','RR/MM/DD'));
Insert into TIP_INTERIOR (INTERIOR_SEQ,ID,NAME,PRICE,ROOMSIZE,INTERIOR_TITLE,INTERIOR_MAINIMAGE,INTERIOR_CONTENT,HIT,LIKE_USER,LOGTIME) values (3,'hong','홍홍',50,14,'이게 바로 인테리어','tip_img_20150813105653_e6e733e2_20180501-19-17-52.jpg','tip_20180502-16-20-44_hong.txt',8,'|hong2|',to_date('18/05/01','RR/MM/DD'));



------------------------------------------------------------------------------
일기
------------------------------------------------------------------------------

--시퀀스 생성
create sequence diary_seq nocache nocycle;

--테이블 생성
create table diary(
  diary_seq NUMBER NOT NULL,
  id VARCHAR2(20) NOT NULL,
  diary_date date,
  diary_content varchar2(4000)
);


REM INSERTING into DIARY
SET DEFINE OFF;
Insert into DIARY (DIARY_SEQ,ID,DIARY_DATE,DIARY_CONTENT) values (10,'hong',to_date('18/05/24','RR/MM/DD'),'내용 입력');
Insert into DIARY (DIARY_SEQ,ID,DIARY_DATE,DIARY_CONTENT) values (2,'hong2',to_date('18/05/03','RR/MM/DD'),'서블리 만세');
Insert into DIARY (DIARY_SEQ,ID,DIARY_DATE,DIARY_CONTENT) values (7,'hong',to_date('18/05/09','RR/MM/DD'),'수정화면시 버튼 수정');
Insert into DIARY (DIARY_SEQ,ID,DIARY_DATE,DIARY_CONTENT) values (4,'hong',to_date('18/05/03','RR/MM/DD'),'서블리 만세');
Insert into DIARY (DIARY_SEQ,ID,DIARY_DATE,DIARY_CONTENT) values (9,'hong',to_date('18/05/10','RR/MM/DD'),'왜 줄이 두껍게sdfsdf');


------------------------------------------------------------------------------
쇼핑몰(신상)
------------------------------------------------------------------------------

--시퀀스 생성
create sequence mall_seq nocycle nocache;

--테이블 생성
create table mall(
  mall_seq number not null,
  id VARCHAR2(20) NOT NULL,
  subject varchar2(200),
  img varchar2(200),
  mallurl varchar2(4000)
);


REM INSERTING into MALL
SET DEFINE OFF;
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (7,'hong','이렇게이쁜데 아직도없어~?','아직도.JPG','http://chuu.co.kr/?cafe_mkt=ntbox_b01&utm_source=naver&utm_medium=castbox&utm_term=&utm_content=middle&utm_campaign=2016%2Balways-on&cafe_prdNo=24442#anchorBoxName_24442&NaPm=ct%3Djgom40b4%7Cci%3D2b2de78a524c0156d4cd02f9f55a7a5d4249d8ec%7Ctr%3Dsbtp%7Csn%3D155831%7Chk%3D9c2a1818575a871a9d39425a1f287c56ba2c9648');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (6,'hong','명품신상나왔대 얼른사','명품.JPG','http://www.mirage.co.kr/?cafe_mkt=ntbox_a01&NaPm=ct%3Djgom3g8w%7Cci%3D09f13429bf64f0a88bd093e27f0e0d38f03d2ee0%7Ctr%3Dsbtp%7Csn%3D117934%7Chk%3D8bd4852bb3ab0c911869424649db0e94ac8a849e');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (8,'hong','한번먹으면 멈출수없는맛','이거뭔데.JPG','http://itempage3.auction.co.kr/DetailView.aspx?ItemNo=B467158775&BCODE=BN00245557&ck=&sn=&igaw_eng=&airbridge_referrer=');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (9,'hong','전상품 만원대 세일!','세일.JPG','http://k-club.co.kr/?cafe_mkt=ntbox_a01&NaPm=ct%3Djgom8nqw%7Cci%3D66739af780ec1fdaa52085962982b8b2b3d1ea69%7Ctr%3Dsbtp%7Csn%3D203198%7Chk%3Dc630762f88ca85d126140c2ac9b58c9eaedaab06');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (10,'hong','쫀쫀하니 엄청 편할걸','이렇게.JPG','http://adcr.shopping.naver.com/adcr.nhn?x=FZuWQ2mHdZT5dUWR3p6ffv%2F%2F%2Fw%3D%3Dscea4cp4hKFkDJqMN9sdScCaN%2Bw77vx9gRnmEMVWfYydvnpMS9jhr0DdpZV2kZqeGrHOHKtNhMzIHibml6QlTTSVlGRUW2LrY3JzWqmOZ%2Bk%2B2mxiU1yPtj4OdEEV90IjEGrSqB9Vpeyh3oNVrV91zKXmpA7drIdHQF1rL9ujyrXFAEGJIBw76EKfWOpnuP7I34gfutUGSJJTa69xmfvSGV1XGiizYG7lArXDrMo9VCAWx28JOJSv35hnerFiKxpzKZNmAIslyBvYjFeJzknSR%2Fm2MKwjiLXiKZxsPV42Fh3VZokzhNUKiMrmmivzkmweuG6DW2BAxsiKuX8xWau3BTKEV8DRL25DjO2Ilk%2BrVWmMasESTZ6WutUhtAt7xPuS5hoRFaUtYeYfjRUV1W72aABexVsxPPLs47j5iPL2w8tGoxl6dsTqXMptCFVP8R%2FRneptgXs%2Bygo1tO91YX42kEXx9ZGEy5IDBQcOcY0IPfASM6qc7ak8RiqJOl3SGf6FsX8RSzzMFnDrcO0yGStkAP7LGgPcId8aZ5oe%2FknguMvww9%2F3dvkkvR9GkwZpT59iMgqSlEar1qr477y0Vx1CSJBuxBQgsUgeXeGlszERvJBw%3D&y=sNeFZxAbSFxoyQM5Z3rY7f%2F%2F%2Fw%3D%3Ds1vuOkaGneZPr03AXe0hKRZU%2Fp6rSL4LMLfbOTsSECcZbwGQAS32krnTz6RclAKfHWIj2Vzqq%2FW2i4KxCP6OZ6IgIxBKBdmYCwL7aYxPJOChCa8MEOG%2BmuVDHr8I%2BFXJgtDBdRM6jxuDUFDX63amAvRW8mMbquRb7L4XpItaCeOfs8XESv1U5RIzOBh%2Fstuxq%2BrEnm5EBNqxaQ3MJmD4w2OOmmae96sxkhwKu8CdRzlGvfFhuhoBRcOBKBjQao1nwL%2B44FBEBmEo9Gg6e%2FJqmBfhRr4RxAmXManBkgyqzhyJGzvmg1GQ5Tw4lvtmb0iDpM4rkzK8kEAdw6Fylfzl5Oh27ZTfwPeiB40QfnKMth3iFR%2BNX%2FxwJuQUWpK4fpsrtvtVTcvJAMXUC2kKQ1Rtf%2FEBr%2F0dZAmuDyVpLQUKIDffXeInkIfVHLE4Yn4KicMR%2FDNwCbH1YU5NORinDfbUwm3HxqNvTOy0sR3HnXgPSQUrQOeZQWUuFdJrNGsIvVmSMAvt60km5iQN8Ylobtk7HVU8WYmo1OXNaDufosNXieMgEoEllC9wCKL6jEfg7%2F204vTP0Iys%2Biqjm65oevCESD04lM999%2F6oDgKg0two9%2FqMeAedlORTzH%2BxNs228QIq53kbtaJonsh6gG6JZ4Z6ApCaAeWKfMDDYS%2B%2B56ySXByaaEzCbgQNDSxOdlbpWTnI8oiWPIYYLD7WGkrMkVFpbG5tWS1sPhecfFh%2FgAGr0FqY%3D');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (11,'hong','피부좋아졌다고 느낄거야','피부.JPG','https://www.sinbiang.kr/product/detail.html?product_no=6&cate_no=1&display_group=2&cafe_mkt=ntbox_c05&NaPm=ct%3Djgomkync%7Cci%3D3cfa269f0ec50998182bd88258eeddd51169fbfd%7Ctr%3Dsbtp%7Csn%3D89113%7Chk%3D8a2e401a471310b7288cfe6e75ea453d90cc54f2');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (12,'hong','배에 11자 복근 봤어?','한글로.JPG','http://www.andar.co.kr/?cafe_mkt=ntbox_a03&NaPm=ct%3Djgomm2rs%7Cci%3Ded7da9ac92f3b8d206d5bc0bc9519a9662e58d7e%7Ctr%3Dsbtp%7Csn%3D302753%7Chk%3De11dcf8ba7243f551d36423e9754bf75dae81e91');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (13,'hong','달걀형 얼굴되고싶지?','해야되나.JPG','http://www.elandmall.com/shop/initPlanShop.action?disp_ctg_no=1804345713&utm_source=SAA1&utm_medium=banner&utm_campaign=P1804345713&chnl_no=SAA1&chnl_dtl_no=1804854474&utm_referrer=http%3A%2F%2Fwww.elandmall.com%2Fgate%2Fgate.action%3Fchnl_no%3DSAA1%26chnl_dtl_no%3D1804854474&cafe_mkt=ntbox_b02&NaPm=ct%3Djgomn29k%7Cci%3Da089f71b7f0f517027b21a6f75f6adaf8a33d04f%7Ctr%3Dsbtp%7Csn%3D393273%7Chk%3D6d3313a25a3cfa551333ac6cadeeb2afc5cbc7eb');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (14,'hong','인기있는이유가 있어','파일이름.JPG','http://www.minsshop.com/?cafe_mkt=ntbox_c01&cafe_prdNo=12374#anchorBoxName_12374&NaPm=ct%3Djgomnon4%7Cci%3D9bd03c36ca18be86d1049746444d5b1637ee5760%7Ctr%3Dsbtp%7Csn%3D151893%7Chk%3D80e79d16f844b586edf2c0a7fe0e46b31a72ef03');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (15,'hong','너빼고 다있어~ 제작제품','퀄리티의완성.JPG','http://www.sappun.co.kr/index.html?ref=naversb&NaPm=ct%3Djgomond4%7Cci%3D5e4b1b65fa69d5ed80ed0522a52aaf38ee4ed34e%7Ctr%3Dsbtp%7Csn%3D223828%7Chk%3Db406fd141360eba344cebaa2ff05b453cfe195cf');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (16,'hong','단아하게 예뻐','테스트.JPG','http://www.mayblue.co.kr/?da_ref=Yz01aHo1VTI=&NaPm=ct%3Djgomq2ag%7Cci%3D9d1533c874b4aa61ddd8f10bad8edcf6aa8003a2%7Ctr%3Dsbtp%7Csn%3D108407%7Chk%3D0dd198fa04cd51c17d176cad7377ad561bbc2e99');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (17,'hong','발의피로가 쏴악 풀린대','발마사지.JPG','http://www.mcnplaza.com/shop/shopdetail.html?src=image&kw=000645&branduid=40717&cafe_mkt=ntbox_c04&NaPm=ct%3Djgomt7ps%7Cci%3D28286513a5c573c18a1da7ca96f46c564e6d8ed1%7Ctr%3Dsbtp%7Csn%3D223624%7Chk%3Db1483e8293a575c760e34710c9eedc4ad950be78');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (18,'hong','퀄리티 자부심 끝장나','퀄리티.JPG','https://www.kgcshop.co.kr/event/goodsPromotion?dispId=816&utm_source=navershoppingbox_may&utm_campaign=Naver_shoppingbox&utm_medium=display&utm_content=banner&utm_term=coupon&_CAD=naversp&NaPm=ct%3Djgomw1kg%7Cci%3D33c6ef4223d932e81ccd52930edeb73fddd26eee%7Ctr%3Dsbtp%7Csn%3D563884%7Chk%3Dca9e0f03b5fdda8b5caf63bd9b387e2985776088');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (19,'hong','이뻐죽겠지 ? 사고싶지 ?','ㅋ.JPG','http://www.andar.co.kr/?cafe_mkt=ntbox_a01&NaPm=ct%3Djgomxxgw%7Cci%3Dac972b2d5ef0ba47589ab16bf53ce372abc0d266%7Ctr%3Dsbtp%7Csn%3D302753%7Chk%3Db5350970d4cfc0dc8664aa9cca341ffd040c54a3');
Insert into MALL (MALL_SEQ,ID,SUBJECT,IMG,MALLURL) values (20,'hong','벽에걸어두면 인테리어효과','카네.JPG','http://www.ariafurniture.co.kr/?cafe_mkt=ntbox_b06&NaPm=ct%3Djgon0cns%7Cci%3D12930d4482549b256f0be9508f41c05141012876%7Ctr%3Dsbtp%7Csn%3D278235%7Chk%3Df615edd357325acaebf5208f07249bc639a2f878');


------------------------------------------------------------------------------
쇼핑몰(중고)
------------------------------------------------------------------------------

--시퀀스 생성
create sequence board_seq nocycle nocache;

--테이블 생성
create table mallboard(
  board_seq number not null,
  category varchar2(20) not null,
  id varchar2(20) not null,
  nickname varchar2(20) not null,
  subject varchar2(200),
  content CLOB,
  logtime date default sysdate,
  hit number not null
);

REM INSERTING into MALLBOARD
SET DEFINE OFF;
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (1,'구매','hong','홍홍','크롭',to_date('18/05/02','RR/MM/DD'),40);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (2,'판매','hong','홍홍','아놔~',to_date('18/05/02','RR/MM/DD'),16);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (3,'구매','hong','홍홍','ㄴㅇㄷㄹㄷㄹㄷ',to_date('18/05/03','RR/MM/DD'),0);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (4,'판매','hong','홍홍','키킼',to_date('18/05/03','RR/MM/DD'),0);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (5,'판매','hong','홍홍','ㄴㅇㄹㄴㅇㄹ',to_date('18/05/03','RR/MM/DD'),0);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (6,'구매','hong','홍홍','ㄴㅇㄹㄴㅇㄹ',to_date('18/05/03','RR/MM/DD'),0);
Insert into MALLBOARD (BOARD_SEQ,CATEGORY,ID,NICKNAME,SUBJECT,LOGTIME,HIT) values (7,'구매','hong','홍홍','ㄴㅇㄹㅇㄹ',to_date('18/05/03','RR/MM/DD'),0);

------------------------------------------------------------------------------
가계부
------------------------------------------------------------------------------

--시퀀스 생성
create sequence seq_ledger nocache nocycle;

--테이블 생성
create table ledger(
seq number not null,            -- 시퀀스
id varchar2(30) not null,       -- 회원 아이디  
inout varchar2(30) not null,    -- 수입/지출 분류
content varchar2(30),           -- 내용
contentplus varchar2(50),       -- 추가 내용
income number,                  -- 수입
spand number,                   -- 지출
balance number not null,        -- 잔액
category varchar2(30) not null, -- 카테고리(식비 등)
logdate date   -- 날짜(선택한/등록한 X)
); 



------------------------------------------------------------------------------
전문지식
------------------------------------------------------------------------------

--시퀀스 생성
create sequence seq_proinfo nocache nocycle;

--테이블 생성
create table proinfo(
seq number not null,            -- 시퀀스
category varchar2(30) not null, -- 카테고리  
subject varchar2(200) not null,  -- 글 제목
contents varchar2(4000) not null,          -- 내용
imgFile varchar2(100)           -- 이미지 파일
); 

insert into proinfo values 
(seq_proinfo.nextval, 'live', '오피스텔과 원룸의 차이', ' 오피스텔은 오피스(Office Building)와 호텔(Hotel)이 합쳐져 이루어진 말로 낮에는 사무실이나 작업용 등으로 사용하고 밤에는 숙박이 가능한 형태의 공간을 뜻합니다. 엄밀히 말하면 오피스텔은 건축법에 따라‘업무시설’에 분류되는데요. 반면 원룸은 화장실을 뺀 모든 공간이 하나로 터져 있는 형태의 주택으로 주택법에 따라 ‘도시형 생활주택’의 하나로 분류됩니다. 도시형 생활주택은 1인 가구가 급증하면서 이들의 주거안정을 위해 지난 2009년부터 시행된 주거형태인데요. 주택법의 사업계획승인을 얻어지어진 300세대 이하, 전용면적 85m 이하인 주택으로 단지형 연립주택, 단지형 다세대주택, 원룸형 3종류로 구성된 것이 특징입니다.

 오피스텔의 경우 대부분 대규모로 지어지기 때문에 역세권에 지어지는게 일반적입니다. 따라서 교통접근성이 편리한 것이 최고의 장점! 게다가 내부 시설 또한 쾌적하게 지어져있고 세탁기, 냉장고, 수납장 등 기본적으로 필요한 것들이 풀옵션으로 들어가있어 개인적으로 따로 준비해야 할 번거로움이 적은데요. 하지만 생활시설들과 옵션 등이 이미 준비되어 있기 때문에 아무래도 관리비, 유지비가 다른 주거시설보다는 조금 높게 형성되어있습니다.

 혼자 사는 1인 가구에게 인기가 높은 원룸. 원룸이 갖는 최고의 장점은 역시 가격과 편리함이 아닐까 싶습니다. 요즘에는 풀옵션을 갖춘 원룸도 많아 쾌적한 생활이 가능하기도 해요. 원룸은 종류도 가장 기본적인 형태의 오픈형 원룸부터 주방 분리형 원룸, 발코니 분리형 원룸등 종류도 다양! 취향에 맞게 선택할 수 있다는 장점도 갖추고 있습니다.
', 'diff.PNG');

insert into proinfo values (seq_proinfo.nextval, 'live', '자취방 구하기 체크리스트', '월세가 싸다고 해서 다가 아니다!
 보통 대학생들이 구하는 자취방은 반전세 혹은 월세인 경우가 많습니다. 월세가 쌀 경우에는 관리비가 월세에 포함되지 않는 경우가 많기 때문에 이를 잘 따져야할 필요성이 있습니다. 관리비, 가스비, 전기세는 보통 별도로 지출되는데 여기에 인터넷까지 추가 연결해야한다면 한 달에 약 10만원 정도의 지출이 더 발생합니다. 

위치 및 접근성 확인하기
 학생들의 경우에는 주로 학교 주변에 자취방을 구하고, 직장인들은 직장 주변에 자취방을 구하는데요. 분명 가까운 곳에 자취방을 구하려고 찾아봤는데, 가격이나 다른 조건들을 고려하다보니 거리가 약간 멀어진 경우가 생길 수 있습니다. 위치와 접근성이 어떤지, 버스정류장이나 지하철은 집에서 얼마나 가까운 지 등을 꼼꼼히 확인해봐야 후회 없는 자취방 구하기를 할 수 있습니다. 

가까운 편의시설이 있는지 확인하기
 챙겨주실 부모님도 없고, 스스로 모든 것을 해결해야 하는 상황에서 마트나 병원과 같은 편의시설의 위치는 아주 중요합니다. 필요한 것을 사와야 하는데 자가용은 없고, 대중교통도 이용하기 애매한 거리라면 혼자 힘든 장보기를 매번 해결해야하는 어려움이 있습니다. 마트와 은행은 어디쯤에 있는지, 약국이나 병원은 얼마나 먼지 체크해보는 것이 좋습니다.

보안 시스템 체크하기
여자 남자 할 것 없이 범죄의 표적이 되는 요즘, 보안 시스템은 무엇보다 중요한데요. 잠금 장치는 잘 되어 있는지, 열쇠를 집주인이나 전 세입자가 가지고 있지는 않은지 모두 체크해 봐야 합니다. 특히 저층일 경우에는 창문의 보안 시스템까지 체크하는 것이 좋은데요. 잠금장치뿐만 아니라 출입구나 현관 밖 복도에 CCTV가 있는지 확인하는 것이 좋습니다. 

그 외 체크리스트
1) 집 보는 시간 ? 낮에는 채광을, 밤에는 소음과 빛 공해를 확인할 수 있음 가능하다면 낮과 밤 모두 확인해보는 것이 좋음
2) 가스비, 전기세가 가정용인지 산업용인지 확인하기 ? 월 2~3만원 정도 차이
3) 난방 / 곰팡이 관련 ? 외풍은 안 드는 지, 햇빛은 잘 드는지, 습하지 않은지 확인하기
4) 옵션 확인하기 ? 침대, TV 모두 포함되어 있어 가구 구매비나, 짐을 줄일 수 있음
', 'live_1.PNG');

insert into proinfo values (seq_proinfo.nextval, 'living', '이사의 종류와 주의사항
', '1. 포장이사
포장이사는 이사 업체에게 이사를 의뢰하게 되면, 이삿짐 패킹부터 운송, 이후 정리까지 해주는 이사 계의 토탈서비스라고 할 수 있어요. 손이 많이 가는 일을 업체에서 대행해주는 형태의 서비스이기 때문에 보편적으로 가장 많이 이용하는 이사방법이기도 하죠. 요새는 업체에 따라 간단한 청소나 스팀 청소가 서비스에 포함되어있는 경우도 있다고 해요.
서비스의 폭이 큰 만큼, 자잘한 문제들이 발생하는 경우가 많다고 하니, 계약서를 꼼꼼히 읽어 차후 문제에 대비하는 게 좋답니다.

2. 일반이사
일반이사는 가구, 가전 등 부피가 큰 짐을 제외한 짐을 직접 포장해 놓으면, 이사 당일, 업체에서 바로 짐을 운송해주는 이사서비스에요. 포장단계가 줄어든 만큼, 포장이사보다는 5~10만원정도 저렴한 금액으로 이용할 수 있어, 이사비용을 조금이나마 줄이고 싶은 분들, 직접 이삿짐을 포장할 여유시간이 있는 분들에게 추천해요. 
3. 반포장이사
반포장 이사는 일반이사와 포장이사의 중간수준의 서비스로, 이사당일 포장자재를 이용해 고객과 업체직원이 함께 포장을 하고 이사를 하는 서비스랍니다. 가구나 가전을 집안으로 옮기는 서비스를 포함하되, 잔 짐정리는 고객 본인이 해야 해요.

4. 용달이사
용달이사는 ‘운송’에 집중한 이사서비스로, 포장부터 이사 이후의 모든 정리는 고객의 몫인 서비스랍니다. 운송비만 지불하면 되기 때문이 비교적 저렴하다는 장점이 있지만, 직접 짐을 정리 해야 하기 때문에 짐이 많은 가정은 이용하기 어렵겠죠? 짐이 적은 1인가구의 자취방 이사 시에는 용달이사도 괜찮답니다.

5. 보관이사
잦은 이사나, 계약 사정상의 문제로 짐을 빼는 날짜와 입주날짜가 다를 경우, 짐을 보관할 곳이 없어 곤란할 수 있죠. 이런 문제 상황에서 유용하게 이용할 수 있는 이사서비스가 바로 보관이사 서비스에요. 미리 빼놓은 짐을 업체의 컨테이너에 보관해 두었다가, 입주하는 날 이삿짐을 이사 장소로 운반해 주죠. 보관이사의 경우, 안전한 보관을 위해 신뢰할만한 업체에 이사를 의뢰하는 것이 중요하답니다.

6. 원룸이사
원룸으로 이사를 하는 사람들의 대부분은 직장인, 벤처인, 자취생 등이 많죠. 이런 사람들은 실질적으로 이사 전 청소나, 이삿짐 정리가 어렵답니다. 최근에 나온 원룸이사 서비스는 포장이사와 유사하지만 원룸 같은 소형주거형태에 특화되어 청소, 이사 후 정리 등을 기본으로 포함한다고 해요. 소규모 이사를 원하시는 분들이 이용하면 좋겠죠?
', 'living.PNG');

insert into proinfo values (seq_proinfo.nextval, 'living', '짐 싸는 팁', '1인가구라도, 한 살림이다 보니, 이사를 할 때 짐이 여간 많은 게 아니죠. 이사를 좀 더 효율적으로 하기 위해서라도 이삿짐은 체계적으로 싸야 한답니다.
그릇 같은 경우, 에어캡을 적절한 사이즈로 잘라 준비한 후, 같은 종류의 그릇을 겹쳐 한 번에 포장하는 것이 좋아요. 컵의 경우, 유리나 사기 재질은 쉽게 깨질 위험이 있으므로, 에어캡으로 하나씩 개별 포장해줘야 한답니다.
후라이팬이나 냄비류는 코팅이 손상되지 않게 신문지나 종이를 깔고 쌓아주시고요. 의류의 경우, 일반적으로 구할 수 있는 박스에 부피가 적은 옷을, 겨울의류 등 부피가 큰 옷은 대봉투에 담아주세요. 책은 운반 시 용이하도록 작은 박스를 이용해 포장해주는 것이 좋답니다.
', 'living_2.PNG');

insert into proinfo values (seq_proinfo.nextval, 'lived', '전입신고', '전입신고란? 
하나의 세대에 속하는 자의 전원 또는 그 일부가 거주지를 이동할 때 주소지변경 및 등록을 위한 전입사실을 새로운 거주지 관할기관에 신고하는 일을 바로 ‘전입신고’라고 하는데요. 대부분 주민센터에서 이루어지고요. 전입한 날부터 14일 이내에 차량 등에 대한 변경등록 신고도 함께 해야 한답니다.  

전입신고 하는 법 & 구비서류 
그렇다면, 전입신고는 어떻게 하면 될까요? 
먼저 주민센터를 방문해서 비치되어 있는 전입신고서를 작성한 후 제출하면 되는데요. 전화번호, 생년월일, 인감등록 여부, 등록장애인 여부 등을 기재하게 되죠. 정부민원포털인 민원24를 통해 인터넷 신고도 할 수 있어요. 전입신고에 필요한 구비서류는 세대주의 신분증인데요. 세대주가 아닌 사람이 신고를 할 때는 세대주의 신분증과 도장, 신고하는 사람의 신분증까지 모두 가지고 가야 해요. 또 전입하는 모든 가족의 주민등록증을 가져와서 등본 정리를 해야 한답니다. 정당한 사유 없이 14일 이내에 신고를 하지 않거나, 허위로 신고를 하면 과태료나 처벌을 받을 수 있다는 점을 주의해 주세요! 

전입신고 시 주의할 점 
특히 다세대주택으로 이사했을 경우에는 전입신고할 때 먼저 건축물관리대장을 잘 확인해야 한답니다. 문에 있는 호수 배열과 등기부등본상의 호수가 틀린 경우가 종종 있기 때문인데요. 호수가 기재된 평면도가 있는 건축물관리대장을 확인하면 정확한 호수를 알 수 있어요. 주택임대차보호법의 보호를 받으려면 등기부상의 호수로 계약서 작성과 전입신고를 해야 하는데, 불법구조변경을 통해 세대수를 늘리는 바람에 등기부상에는 없는 호수가 존재하는 경우 낭패를 볼 수 있으므로 반드시 확인해야 할 부분이랍니다. 

따라서 계약 전에 등기부등본을 꼭 확인하고, 임대차계약을 체결한 후 전입신고를 할 때도 꼭 임대차계약서를 지참하셔서 확정일자를 받는 것이 중요해요. 법원 또는 동사무소 등에서 주택임대차계약을 체결한 날짜를 확인하여 주기 위해서 임대차계약서 여백에 그 날짜가 찍힌 도장을 찍어주는 데요. 이 날짜가 바로 확정일자랍니다. 확정일자는 임대인이 집을 경매에 내놓았을 때 매우 중요하게 사용되는데요. 주택임차인이 임차 주택의 보증금에 대하여 제3자에게 대항력을 갖기 위해서는 전세권을 설정해야 하는데 확정일자를 받으면 경매 때 우선순위 배당에 참가하여 후순위 담보물권자보다 우선적으로 보증금을 변제받을 수 있기 때문이죠.
', 'lived_1.PNG');

insert into proinfo values (seq_proinfo.nextval, 'lived', '온라인 확정일자 받는 법', ' 확정일자를 받으려면 임대차계약서를 가지고 동 주민센터, 공증기관이나 법원·등기소를 통해 방문하면 되는데요. 2015년 9월부터는 간편하게 인터넷으로 확정일자를 받을 수 있게 됐답니다. 인터넷등기소(www.iros.go.kr)를 통해 공휴일을 포함 24시간 신청이 가능하고요. 방문 신청은 전입신고 후에 확정일자를 받을 수 있지만 온라인 확정일자는 계약 체결 직후부터 신청이 가능해 좀 더 빨리 확정일자를 받을 수 있어요. 온라인 신청은 계약 당사자(임대인, 임차인, 공인중개사)가 직접 하거나 인터넷등기소 전자신청에 사용자(이용) 등록이 되어 있는 법무사, 변호사가 대리 신청할 수 있고요. 방문할 때는 600원의 수수료를 지불해야 하지만 온라인 신청을 할 때는 100원 할인 받아 500원만 지불하면 된답니다. 휴대폰 소액결제 또는 카드 결제 후 확정일자 전자이미지가 표시된 주택임대차 계약증서를 출력할 수 있어요. 계약당사자(임대인, 임차인)는 추후 인터넷등기소에 보관된 계약증서를 추가 발급받을 수도 있답니다. 단, 주택만 대상으로 하기 때문에 상가임대차 계약은 온라인 신청이 불가능하다는 점도 기억해 주세요! 
', 'lived_2.PNG');

insert into proinfo values (seq_proinfo.nextval, 'live', '집 계약시 주의사항', '1. 집주인과 집 소유자가 동일인물인지 확인
 먼저 집 계약을 위해 이 집의 소유자가 집주인과 동일인물인지를 확인해야합니다. 전세나 월세로 집을 계약하는 경우에는 대법원 인터넷 등기소 홈페이지에서 등기부등본을 통해 임대인의 실명과 선순위, 가압류, 근저당 등을 확인할 수 있습니다. 만약 집주인이 아닌 다른사람이 대리인으로 나와 계약이 진행되는 경우, 해당집을 소유하고 있는 소유주와 직접 통화후 계약위임 사실을 정확하게 확인하고 계약을 진행해야 합니다. 이때는 위임장과 인감증명서를 함께 받는 것이 안전하게 집을 계약할 수 있는 방법입니다.

2. 저당금액 정확하게 살펴보기
 다음으로는 저당금액을 확인해보는 것인데요. 등기부에 등재되어 있는 저당금액이 30%이하라면 안전하게 집을 가입할 수 있습니다. 만약 30%를 초과한 경우에는 전세보증금을 돌려받지 못할 수 있기 때문에 이런 부분까지 생각해두시고 집을 계약하는 것이 좋습니다.

3. 특약설정 하기
 집 계약시 특약을 설정해두는 것이 좋은데요. 기본적으로 세입자가 먼저 계약을 파기하게 되는 경우 집주인으로부터 계약금을 반환받을 수 없게 됩니다. 또한 집주인이 계약을 해지 했을 경우에는 세입자에게 2배 가까이 배상을 해주어야 합니다. 그렇기 때문에 이부분에 대해서는 집주인과 세입자 모두 알아두는 것이 좋습니다.

4. 주택 열쇠를 받은 당일 주민센터에 전입신고 하기
집 계약을 완료한 후에는 해당 집의 열쇠를 받아 동사무소/주민센터에 직접 전입신고를 하고 확실한 확정일자를 받아두는 것이 좋은데요. 이는 임대차보호법에 의한 보증금을 보호받기 위함인데요. 임차인이 확정일자를 받을 경우, 임차주택이 경매, 공매로 부쳐졌을 때 우선변제권을 가질 수 있습니다.', 'live_6.PNG');

insert into proinfo values (seq_proinfo.nextval, 'live', '집 계약시 주의사항', '1. 집주인과 집 소유자가 동일인물인지 확인
 먼저 집 계약을 위해 이 집의 소유자가 집주인과 동일인물인지를 확인해야합니다. 전세나 월세로 집을 계약하는 경우에는 대법원 인터넷 등기소 홈페이지에서 등기부등본을 통해 임대인의 실명과 선순위, 가압류, 근저당 등을 확인할 수 있습니다. 만약 집주인이 아닌 다른사람이 대리인으로 나와 계약이 진행되는 경우, 해당집을 소유하고 있는 소유주와 직접 통화후 계약위임 사실을 정확하게 확인하고 계약을 진행해야 합니다. 이때는 위임장과 인감증명서를 함께 받는 것이 안전하게 집을 계약할 수 있는 방법입니다.

2. 저당금액 정확하게 살펴보기
 다음으로는 저당금액을 확인해보는 것인데요. 등기부에 등재되어 있는 저당금액이 30%이하라면 안전하게 집을 가입할 수 있습니다. 만약 30%를 초과한 경우에는 전세보증금을 돌려받지 못할 수 있기 때문에 이런 부분까지 생각해두시고 집을 계약하는 것이 좋습니다.

3. 특약설정 하기
 집 계약시 특약을 설정해두는 것이 좋은데요. 기본적으로 세입자가 먼저 계약을 파기하게 되는 경우 집주인으로부터 계약금을 반환받을 수 없게 됩니다. 또한 집주인이 계약을 해지 했을 경우에는 세입자에게 2배 가까이 배상을 해주어야 합니다. 그렇기 때문에 이부분에 대해서는 집주인과 세입자 모두 알아두는 것이 좋습니다.

4. 주택 열쇠를 받은 당일 주민센터에 전입신고 하기
집 계약을 완료한 후에는 해당 집의 열쇠를 받아 동사무소/주민센터에 직접 전입신고를 하고 확실한 확정일자를 받아두는 것이 좋은데요. 이는 임대차보호법에 의한 보증금을 보호받기 위함인데요. 임차인이 확정일자를 받을 경우, 임차주택이 경매, 공매로 부쳐졌을 때 우선변제권을 가질 수 있습니다.', 'live_6.PNG');


insert into proinfo values (seq_proinfo.nextval, 'live', '주택임대차-등기부등본 보는 방법
', '1.등기부등본의 열람 및 발급
  등기부등본은 주소만 정확히 알면 관할 법원 등기소에서 누구라도 열람 및 발급받을 수 있으며, 전화나 팩스로 미리 신청한 후 방문하면 편리합니다.


2.등기부등본의 구성
  등기부등본은 크게 표제부, 갑구, 을구 세 부분으로 구성됩니다.

1)표제부
표제부에는 등기의 주인공인 건물이 어디에 있는, 어떤 것인지 명시되어있습니다. 처음 등기를 신청한 날짜, 건물이 있는 곳, 건물의 구조와 면적이 나타나 있습니다. 일반적으로 건물등기부나 토지등기부는 표제부 한 장으로 모든 것이 끝나지만 아파트와 같은 공동주택 표제부는 2장입니다. 앞의 표제부에는 아파트 전체의 재용이 나오고, 뒤의 표제부에는 등기부에 소유권을 나타내고자 한 건물의 일부에 대한 내용이 나옵니다.

2)갑구
갑구에는 소유권과 관련된 사항이 적혀 있습니다. 여기에 가압류, 가처분, 가등기가 있으면 계약하지 않는 것이 좋습니다. 등기부상 "×"로 표시된 것은 말소되었다는 표시이므로 신경쓰지 않아도 됩니다.

3)을구
을구에는 소유권을 제외한 다른 권리들이 나타납니다. 근저당권, 저당권, 지상권, 임차권 등의 권리가 여기에 적힙니다. 각 권리가 설정된 날짜, 성정원인, 권리자 성명, 채권 액수 등을 알 수 있습니다. 을구에서 순위 번호는 권리주장의 우선 순위이기 때문에 매우 중요합니다.
', 'lived_2.PNG');

insert into proinfo values (seq_proinfo.nextval, 'living', '이사업체와 체크해야 할 사항', '1 귀중품은 스스로 챙기고 여유가 없다면 별도로 취급해 도난의 우려를 사전에 방지한다. 

2 운송 전 이사화물의 품명과 수량은 모두가 있는 자리에서 확인하여야 한다. 앞으로 분실이 있으면 책임 소재를 철저히 밝힌다. 

3 깨지기 쉽거나 훼손 가능성이 높은 물품은 따로 구분하여 이삿짐센터 직원에게 특별히 주의사항을 말해둔다! 

4 가구 등 대형 물품을 배치를 사전에 계획! 별도운임 요구 시비를 방지해야 한다! 

5 계약 시 정리, 정돈, 에어컨의 설치 여부 등에 대한 특별계약사항은 반드시 계약서상에 책임 여부를 분명히 기재한다! 


6.이삿짐 파손, 분실 등의 피해가 발생한다면, 그 자리에서 피해 내용에 대한 확인서를 받아둠과 동시에 파손이나 훼손된 이삿짐에 대해서는 사진촬영을 해둔 후 즉시 이사업체에 연락하여 피해보상 및 처리절차를 상담해야 한다!', 'living_3.PNG');


insert into proinfo values (seq_proinfo.nextval, 'lived', '베이크 아웃', '베이크 아웃은 실내의 온도를 높혀 유해오염물질인 휘발성 유기화합물과 폼알데하이드 등의 배출을 일시적으로 증가시킨 후 환기시킨다. 이렇게 함으로써 새집증후군의 위험에서 어느 정도 벗어날 수 있다. 그 방법은 우선 바깥으로 통하는 문과 창문을 모두 닫는다. 오염물질이 많이 빠져나올 수 있도록 실내에 있는 수납가구의 문과 서랍을 전부 연다. 가구에 종이나 비닐이 씌워진 경우에는 벗겨 낸다. 실내 온도를 35∼40℃로 올려 6∼10시간을 유지한다. 문과 창문을 모두 열어 1∼2시간 정도 환기를 시킨다. 이와 같이 난방과 환기를 3∼5번 정도 반복한다. 또 다른 방법으로는 실내 온도를 35∼40℃로 맞춘 후 72시간을 그대로 두었다가 5시간 동안 환기시킨다. 이렇게 하면 실내의 오염물질이 현저하게 줄어든다. 

주의할 점은 실내 온도를 올릴 때 난방시스템이 과열되지 않도록 하여야 한다. 또 베이크아웃을 하는 동안 실내에 노인이나 어린이, 임산부 등이 출입하지 않도록 한다. 베이크아웃을 마친 후에도 문과 창문을 자주 열어 계속 환기를 시키는 것이 좋다.
, 'lived_3.PNG');
------------------------------------------------------------------------------
회원
------------------------------------------------------------------------------

--테이블 생성
create table member(
  id varchar2(15) not null,
  pwd varchar2(16) not null,
  name varchar2(20) not null,
  nickname varchar2(20) not null,
  gender varchar2(2) not null,
  tel1 varchar2(5) not null,
  tel2 varchar2(5) not null,
  tel3 varchar2(5) not null,
  email1 varchar2(15) not null,
  email2 varchar2(15) not null,
  post varchar2(10),
  addr1 varchar2(150),
  addr2 varchar2(150),
  joinDate varchar(20) not null,
  grade varchar(20),
  score number,
  profile varchar2(50)
);

--관리자 계정
insert into member values('admin', 'admin', '관리자', '관리자', 'a', '010', '123', '1234', 
'sola.manage', 'gmail.com', '11111', '서울시 종로구', '돈화문로 26 (단성사) 401호', sysdate, 'master', 9999, 'default_profile.jpg');