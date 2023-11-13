/* 단체예매내역 */
CREATE TABLE tblGroupBook (
	group_book_seq NUMBER PRIMARY KEY, /* 단체예매내역번호 */
	book_date DATE NOT NULL, /* 예매일자 */
	group_division VARCHAR2(200) NOT NULL, /* 단체구분 */
	region VARCHAR2(200) NOT NULL, /* 지역 */
	group_name VARCHAR2(200) NOT NULL, /* 단체명 */
	address VARCHAR2(200) NOT NULL, /* 주소 */
	visit_date DATE NOT NULL, /* 방문일자 */
	visit_time VARCHAR2(200) NOT NULL /* 방문시간 */
);

CREATE SEQUENCE seqGroupBook;

/* 회원/단체예매 */
CREATE TABLE tblUserGroupBook (
	user_group_book_seq NUMBER PRIMARY KEY, /* 회원단체예매번호 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
	group_book_seq NUMBER REFERENCES tblGroupBook(group_book_seq) NOT NULL /* 단체예매내역번호 */
);

CREATE SEQUENCE seqUserGroupBook;

create or replace view vwRestaurant
as
select restaurant_seq, name, menu, time, capacity, tel, (select info from tblLocation where location_seq = r.location_seq) as location, (select name from tblCategory where category_seq = r.category_seq) as category, (select img from tblRestaurantImg where restaurant_seq = r.restaurant_seq and rownum = 1) as img from tblRestaurant r;