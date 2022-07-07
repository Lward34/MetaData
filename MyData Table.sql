CREATE TABLE CUSTOMER ( Customer_ID VARCHAR(10) NOT NULL, Name VARCHAR(20), Address VARCHAR(50), Phone INTEGER, Email VARCHAR(20), CONSTRAINT CUSTOMER_PK PRIMARY KEY ( CUSTOMER_ID ) ENABLE);

CREATE TABLE RENTAL ( Rental_ID VARCHAR(10) NOT NULL, Vid/DVD_ID VARCHAR(20), Customer_ID VARCHAR(10), Rental_Date DATE, Return_Date DATE, LateFee FLOAT, Rewind_Fee FLOAT, DamageFee FLOAT, CONSTRAINT RENTAL_PK PRIMARY KEY ( Rental_ID ) ENABLE );

CREATE TABLE INVENTORY (InventoryID VARCHAR(10) NOT NULL, Vid/DVD_ID VARCHAR(10), MovieID VARCHAR(10), DistributorID VARCHAR(10), In_Stock BOOLEAN, CONSTRAINT INVENTORY_PK PRIMARY KEY ( Inventory_ID ) ENABLE );	 

CREATE TABLE MOVIES ( MovieID VARCHAR(10) NOT NULL , MovieTitle VARCHAR(20), ActorID VARCHAR(10) , CastID VARCHAR(10), Length TIME, Rating INTEGER, Year_Release DATE, A_Awards VARCHAR(10), Price FLOAT, CONSTRAINT MOVIES_PK PRIMARY KEY ( MovieID ) ENABLE );

CREATE TABLE CATALOG ( CatalogID VARCHAR(10) NOT NULL, DistributorID VARCHAR(10), MovieID VARCHAR(10), CONSTRAINT CATALOG_PK PRIMARY KEY ( CatalogID ) ENABLE );

CREATE TABLE DISTRIBUTOR (DistributorID	VARCHAR(10)  NOT NULL, Phone INTEGER, Email VARCHAR(10), CatalogID VARCHAR(10),  MovieID VARCHAR(10), Batch_Cost FLOAT, CONSTRAINT MOVIES_PK PRIMARY KEY ( MovieID ) ENABLE);

CREATE TABLE SHIPMENT(ShippingID VARCHAR(10)  NOT NULL, SerialNumber VARCHAR(10), DistributorID	VARCHAR(10), CatalogID VARCHAR(10), Quantity INTEGER, Dates DATE, Delivery_Cost FLOAT, CONSTRAINT SHIPMENT_PK PRIMARY KEY ( ShipmentID ) ENABLE); 

CREATE TABLE CAST(CastID VARCHAR(10) NOT NULL, ActorID VARCHAR(10), MovieID VARCHAR(10), CONSTRAINT CAST_PK PRIMARY KEY ( CastID ) ENABLE );

CREATE TABLE MOVIE_DIRECT(MovDirectID VARCHAR(10) NOT NULL, DirectorID VARCHAR(10), MovieID VARCHAR(10), CONSTRAINT MOVIE_DIRECT_PK PRIMARY KEY ( MovDirectID ) ENABLE );

CREATE TABLE DIRECTOR(DirectorID VARCHAR(10) NOT NULL, Name VARCHAR(10), A_Awards VARCHAR(10), CONSTRAINT DIRECTOR_PK PRIMARY KEY ( DirectorID ) ENABLE );

CREATE TABLE ACTOR(ActorID VARCHAR(10) NOT NULL, Name VARCHAR(10), Gender BOOLEAN, A_Awards VARCHAR(10), CONSTRAINT ACTOR_PK PRIMARY KEY ( ActorID ) ENABLE );

CREATE TABLE ACAD_AWARD(A_AwardsID VARCHAR(10) NOT NULL, Award_Name VARCHAR(10), CONSTRAINT ACAD_AWARD_PK PRIMARY KEY ( A_AwardsID ) ENABLE ); 

CREATE TABLE MOVIE_GEN(GenreID VARCHAR(10) NOT NULL, Movie_Type VARCHAR(10), MOVIE_GEN_PK PRIMARY KEY ( A_AwardsID ) ENABLE ); 

CREATE TABLE DISCOUNT(DiscountID VARCHAR(10) NOT NULL, DiscountAmount FLOAT, DISCOUNT_PK PRIMARY KEY ( DiscountID ) ENABLE );



alter table "YOURNAME"."RENTAL" add constraint fk_custormer foreign key("CustormerID") references "CUSTOMER"("DVD_ID")

alter table "YOURNAME"."INVENTORY" add constraint fk_vid/DVD foreign key("Vid/DVD_ID") references "DVD"("Vid/DVD_ID")

alter table "YOURNAME"."INVENTORY" add constraint fk_movie foreign key("MovieID") references "MOVIE"("MovieID")

alter table "YOURNAME"."INVENTORY" add constraint fk_distributor foreign key("DistributorID") references "DISTRIBUTOR"("DistributorID")

alter table "YOURNAME"."MOVIES" add constraint fk_actor foreign key("ActorID") references "ACTOR"("ActorID")

alter table "YOURNAME"."MOVIES" add constraint fk_cast foreign key("CastID") references "CAST"("CastID")

alter table "YOURNAME"."MOVIES" add constraint fk_a_awards foreign key("A_Awards") references "A_AWARDS"("A_Awards")

alter table "YOURNAME"."CATALOG" add constraint fk_distributor foreign key("DistributorID") references "DISTRIBUTOR"("DistributorID")

alter table "YOURNAME"."CATALOG" add constraint fk_movie foreign key("MovieID") references "MOVIES"("MovieID")

alter table "YOURNAME"."DISTRIBUTOR" add constraint fk_catalog foreign key("CatalogID") references "CATALOG"("CatalogID")

alter table "YOURNAME"."DISTRIBUTOR" add constraint fk_movie foreign key("MovieID") references "MOVIES"("MovieID")

alter table "YOURNAME"."SHIPMENT" add constraint fk_distributor foreign key("DistributorID") references "DISTRIBUTOR"("DistributorID")

alter table "YOURNAME"."SHIPMENT" add constraint fk_catalog foreign key("CatalogID") references "CATALOG"("CatalogID")

alter table "YOURNAME"."CAST" add constraint fk_actor foreign key("ActorID") references "ACTOR"("ActorID")

alter table "YOURNAME"."CAST" add constraint fk_movie foreign key("MovieID") references "MOVIES"("MovieID")

alter table "YOURNAME"."MOVIE_DIRECT" add constraint fk_director foreign key("DirectorID") references "DIRECTOR"("DirectorID")

alter table "YOURNAME"."MOVIE_DIRECT" add constraint fk_movie foreign key("MovieID") references "MOVIES"("MovieID")

alter table "YOURNAME"."DIRECTOR" add constraint fk_a_awards foreign key("A_Awards") references "A_AWARDS"("A_Awards")

alter table "YOURNAME"."ACTOR" add constraint fk_a_awards foreign key("A_Awards") references "A_AWARDS"("A_Awards")


begin execute immediate 'create or replace trigger movies_autoincrement_trigger '||chr(10)|| ' before insert on "YOURNAME"."MOVIES" '||chr(10)|| ' for each row '||chr(10)|| 'begin '||chr(10)|| ' if inserting then '||chr(10)|| ' if :NEW."MOVIES_ID" is null then '||chr(10)|| ' select MOVIES_ID.nextval into :NEW."MOVIES_ID" from dual; '||chr(10)|| ' end if; '||chr(10)|| ' end if; '||chr(10)|| 'end;'||chr(10); end;


