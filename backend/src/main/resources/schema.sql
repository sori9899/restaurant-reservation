create table if not exists CUSTOMER
(
    CUSTOMER_ID   int primary key comment '고객 ID',
    CUSTOMER_PW   varchar(10) not null comment '고객 PW',
    TEL           varchar(12) comment '고객 전화번호|010-XXXX-XXXX',
    CUSTOMER_NAME varchar(10) not null comment '고객명',
    AGE           int         not null comment '나이'
);

create table if not exists RESTAURANT_ADMIN
(
    ADMIN_ID   int primary key comment '식당 관리자 ID',
    ADMIN_NAME varchar(10) not null comment '식당 관리자 명',
    TEL        varchar(12) comment '식당 관리자 전화번호'
);

create table if not exists RESTAURANT
(
    REST_ID   int primary key comment '식당 ID',
    REST_NAME varchar(10) not null comment '식당명',
    ADMIN_ID  int         not null comment '식당 관리자 ID|RESTAURANT_ADMIN.ADMIN_ID',
    TEL       int         not null comment '식당 전화번호',
    LNG       decimal     not null comment '경도',
    LAT       decimal     not null comment '위도',
    INTRO     text comment '식당 소개문',

    foreign key (ADMIN_ID) references RESTAURANT_ADMIN (ADMIN_ID) on delete restrict
);

create table if not exists RESTAURANT_WEEK_SCHEDULE
(
    REST_ID   int primary key comment '식당 ID|RESTAURANT.REST_ID',
    DAY_OF_WEEK varchar(10) comment '예약 가능 요일|MONDAY|TUESDAY|WEDNESDAY|THURSDAY|FRIDAY|SATURDAY|SUNDAY',
    check (DAY_OF_WEEK in ('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY')),
    foreign key (REST_ID) references RESTAURANT (REST_ID) on delete restrict
);

create table if not exists RESTAURANT_DAY_SCHEDULE
(
    REST_ID   int primary key comment '식당 ID|RESTAURANT.REST_ID',
    TIME_OF_DAY varchar(10) comment '예약 가능 시간|hh:mm',
    foreign key (REST_ID) references RESTAURANT (REST_ID) on delete restrict
);

create table if not exists MENU
(
    MENU_ID   int primary key comment '메뉴 ID',
    REST_ID   int         not null comment '식당 ID|RESTAURANT.REST_ID',
    MENU_NAME varchar(10) not null comment '메뉴명',
    PRICE     int         not null comment '가격',
    CATEGORY  varchar(2)  not null comment '메뉴 카테고리',
    foreign key (REST_ID) references RESTAURANT (REST_ID) on delete restrict
);

create table if not exists RESERVATION
(
    SERIAL_NUM  int primary key comment '예약 Sequence',
    CUSTOMER_ID int  not null comment '고객 ID|CUSTOMER.CUSTOMER_ID',
    REST_ID     int  not null comment '식당 ID|REST',
    COST        int  not null comment '총 가격',
    VISIT_DATE  date not null comment '방문 일시|yyyy-MM-dd',
    VISIT_NUM   int  not null comment '방문 인원',
    RES_DATE    date not null comment '예약 일시|yyyy-MM-dd',
    REQUEST     text comment '추가 요청사항',
    foreign key (CUSTOMER_ID) references CUSTOMER (CUSTOMER_ID) on delete restrict,
    foreign key (REST_ID) references RESTAURANT (REST_ID) on delete restrict
);