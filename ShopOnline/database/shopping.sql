	/*
	*		-------------------			PHẦN TẠO DATABASE			------------------------
	*/

use master
go
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'shopping')
		DROP DATABASE shopping
go
create database shopping
go
use shopping
go

	/*
	*		-------------------			PHẦN TẠO BẢNG			------------------------
	*/

create table Roles
(
	id int identity(1,1) primary key,
	name nvarchar(50) unique not null, /*ROLE_ADMIN / ROLE_USER ... */
	notes nvarchar(250)
)
go

create table Users
(	
	id int identity(1,1) primary key,
	userName varchar(20) unique not null,
	password varchar(100) not null,
	fullName nvarchar(50) not null,
	phone varchar(11) not null,
	email Varchar(50) unique not null,	
	brithday Date ,
	gender bit not null,
	photo varchar(100),
	adress nvarchar(100) not null,
	notes nvarchar(250)
)
go

create table UserRoles
(
	id int identity(1,1) primary key,
	user_Id int references Users(id) on delete cascade,
	role_Id int references Roles(id) on delete set null
)
go

create table Customers
(
	id bigint identity(1,1) primary key,
	name nvarchar(50) not null,
	phone varchar(11) not null,
	email Varchar(50) unique not null,
	password varchar(100) not null,
	gender bit not null,
	adress nvarchar(100) not null,
	notes nvarchar(250)
)
go

create table ProductType
(
	id int identity(1,1) primary key,
	name nvarchar(100) unique not null
)
go

create table Products
(
	id int identity(1,1) primary key,
	name nvarchar(50) not null,
	price int not null,
	quantity int not null,
	descriptions nvarchar(250) not null,
	photo varchar(50) not null,
	id_ProductType int references ProductType(id) on delete set null
)
go


create table Orders
(
	id bigint identity(1,1) primary key,
	[date] Date not null,
	id_Customer bigint references Customers(id) not null,
)
go

create table OrderDetails
(
	id_Order bigint references Orders(id) on delete cascade,
	id_Product int references Products(id),
	price int not null,
	quantity int not null,
	Constraint pk_CTDH primary key(id_Order,id_Product)
)
go



	/*
	*		-------------------			PHẦN THÊM DỮ LIỆU			------------------------
	*/

/* Insert Roles			name				notes	*/
Insert into Roles
				values('ROLE_USER',		N'Quản lý tất cả sản phẩm đơn hàng'),
					  ('ROLE_ADMIN',		N'Quản lý tất cả user thêm nhân viên... ')
go

/* Insert Users			username		passWord(123)														fullName				phone				email						brithday				gender				photo				adress				notes */
Insert into Users		
				 values('admin1',		'$2a$10$X6cJgcyflgYgeAnlC0W26.3G18hOWmTGeaQNrV9igiyWeHy8uzHT2',		N'Đào Quang Tiến',		'0127836789',		'tien1233@gmail.com',		'07/14/1994',			'1',				'tien.jpg',			N'Tây Ninh',		N'Ghét màu Tím'),
					   ('admin2',		'$2a$10$X6cJgcyflgYgeAnlC0W26.3G18hOWmTGeaQNrV9igiyWeHy8uzHT2',		N'Đỗ Trung Hiếu',		'0127836789',		'hieutrung13@gmail.com',	'12/09/1995',			'1',				'hieu.jpg',			N'Thanh Hóa',		N'Thích màu hồng'),	   
					   ('admin',		'$2a$10$X6cJgcyflgYgeAnlC0W26.3G18hOWmTGeaQNrV9igiyWeHy8uzHT2',		N'Nguyễn Văn Mạnh',		'0127836789',		'manh3@gmail.com',			'02/02/1999',			'1',				'manh.jpg',			N'Hà Nội',			N'Ghét lừa rối')
go

/* Insert UserRoles		user_Id			role_id	*/
Insert into UserRoles    
				 values(1,				1),
					   (2,				1),
					   (3,				2)

go


/* Insert Customers		name						phone			email						pasword			gender		adress			notes */
Insert into Customers		
				 values(N'Nguyễn Thị Minh Ngọc',	'0234789498',   'ngocntm01@gmail.com',		'123',			'0',		N'Quận 7',		'thsich đu thứ'),
					   (N'Nguyễn Bùi Thanh Sang',	'0367716718',   'sangnbt02@gmail.com',		'234',			'1',		N'Quận 5',		''),
					   (N'Lê Thành Tiến',			'0248795623',   'tienlt03@gmail.com',		'134',			'1',		N'Quận 4',		''),
					   (N'Nguyễn Hữu Minh',			'0457898965',   'minhnh04@gmail.com',		'133',			'1',		N'Quận 5',		''),
					   (N'Trần Công Mạnh',			'0121479895',   'manhtc05@gmail.com',		'143',			'1',		N'Quận 3',		''),
					   (N'Lê Thị Ái',				'0654689896',   'ailt06@gmail.com',			'153',			'0',		N'Quận 2',		''),
					   (N'Lê Văn Dũng',				'0146789984',   'chauhnm07@gmail.com',		'163',			'0',		N'Quận 1',		''),
					   (N'Trần Công Phước',			'0147887542',   'dunglv09@gmail.com',		'173',			'1',		N'Quận 1',		''),
					   (N'Trần Anh Khoa',			'0165987977',   'khoata10@gmail.com',		'183',			'1',		N'Quận 2',		''),
					   (N'Nguyễn Ngọc Đông Nhi',	'0312346778',   'nhinnd11@gmail.com',		'193',			'0',		N'Quận 3',		''),
					   (N'Trần Minh Thư',			'0187845235',   'thutm12@gmail.com',		'123',			'0',		N'Quận 4',		''),
					   (N'Nguyễn Thiện Nhân',		'0198786565',   'nhannt13@gmail.com',		'123',			'1',		N'Quận 5',		''),
					   (N'Trần Lê Yến Nhi',			'0332468798',   'nhitly14@gmail.com',		'123',			'0',		N'Quận 6',		''),
					   (N'Nguyễn Quốc Tuấn',		'0987987653',   'tuannq15@gmail.com',		'123',			'1',		N'Quận 7',		''),
					   (N'Nguyễn Thu Mai',			'0332168988',   'maint17@gmail.com',		'123',			'0',		N'Quận 8',		''),
					   (N'Lý Thị Hồng Vân',			'0145454945',   'vanlth18@gmail.com',		'123',			'0',		N'Quận 9',		''),
					   (N'Nguyễn Thị Duyên',		'0235468989',   'duyennt19@gmail.com',		'123',			'0',		N'Quận 10',		''),
					   (N'Đinh Tiến Luật',		    '0468798462',   'luatdt20@gmail.com',		'123',			'1',		N'Quận 11',		''),
					   (N'Trần Lê Anh Tú',			'0365468987',   'tutla22@gmail.com',		'123',			'1',		N'Quận 12',		''),
					   (N'Lê Đức Việt',				'0987987653',   'vietld22@gmail.com',		'123',			'1',		N'Quận 7',		''),
					   (N'Lê Minh Hoàng',			'0212654987',   'hoanglm23@gmail.com',		'123',			'1',		N'Quận 9',		'')



go

/* Insert ProductType		name			*/			
Insert into ProductType
					 values(N'Xe máy'),
						   (N'Đồng hồ'),
						   (N'Điện Thoại'),
						   (N'Lap Top'),
						   (N'Vali'),
						   (N'Quạt'),
						   (N'Nón'),
						   (N'Máy ảnh'),
						   (N'Nhẫn')

/* Insert  Products		name				price			quantity	descriptions												photo				id_ProductType	*/			
Insert into Products 
				values(	N'Dell XPS 15',		19000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1003.jpg',			4	),
					  ( N'Casio 1024',		8999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1024.jpg',			2	),		  
					  ( N'Yamaha 1097',		55000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1097.jpg',			1	),
					  ( N'Casio 1043',		8999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1043.jpg',			2	),
					  (	N'Quạt 1114',		900000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1114.jpg',			6	),
					  (	N'Dell Precision',	25000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1004.jpg',			4	),
					  (	N'Nhẫn Lisa',		7000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1009.jpg',			9	),
					  ( N'Canon Eos 750D',	5000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1005.jpg',			8	),
					  ( N'Canon  1019F',	5000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1019.jpg',			8	),
					  ( N'Xe máy 1096',		55000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1096.gif',			1	),
					  ( N'Canon 1016',		5000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1016.jpg',			8	),			
					 (	N'Asus ROG',		27000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1006.jpg',			4	),
					 (	N'Asus X409FA',		21500000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1006.png',			4	),
					 

					 (	N'Dell 1008',		21000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1008.jpg',			4	),
					 (	N'Asus 1015G',		19000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1015.jpg',			4	),
					 (	N'Asus 1044G',		27000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1044.jpg',			4	),
					 (	N'Lenovo 1058G',	23500000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1058.jpg',			4	),
					 (	N'Asus 1061',		31000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1061.jpg',			4	),
					 (	N'Acer 1061',		30000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1061.png',			4	),
					 (	N'Acer 1063',		16000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1063.jpg',			4	),
					 (	N'Dell 1065R',		18000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1065.jpg',			4	),
					 (	N'Asus 1066G',		37000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1066.jpg',			4	),
					 (	N'Acer 1077',		14500000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1077.jpg',			4	),

					 ( N'Casio B640W',		1565000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1001.jpg',			2	),	
					 ( N'Casio B54',		2999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1002.jpg',			2	),	 
					 ( N'Casio 1034',		2999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1034.jpg',			2	),
					 ( N'Casio 1035',		8999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1035.jpg',			2	),
					 ( N'Casio 1038',		7999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1038.jpg',			2	),
					 ( N'Casio 1039',		6999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1039.jpg',			2	),
					 ( N'Casio 1075',		9999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1075.jpg',			2	),
					 ( N'Casio 1076',		8499000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1076.jpg',			2	),
					 ( N'Casio 1067',		9999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1067.jpg',			2	),
					 ( N'Casio 1081',		5999000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1081.jpg',			2	),
					 ( N'Casio 1084',		5789000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1084.jpg',			2	),
					 ( N'Casio 1085',		5599000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1085.jpg',			2	),
					 ( N'Casio 1087',		5799000 ,		100,		N'Hàng chính hãng - Miễn phí vận chuyển trên toàn quốc',	'1087.jpg',			2	),

					 ( N'Canon 1020D',		5000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1020.jpg',			8	),
					 ( N'Canon 1021',		5000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1021.jpg',			8	),
					 ( N'Canon 1025',		6000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1025.jpg',			8	),
					 ( N'Canon 1026',		7000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1026.jpg',			8	),
					 ( N'Canon 1027',		8000000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1027.jpg',			8	),
					 ( N'Canon 1047',		4700000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1047.jpg',			8	),
					 ( N'Canon 1048',		4800000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1048.jpg',			8	),
					 ( N'Canon 1049',		4900000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1049.jpg',			8	),
					 ( N'Canon 1068',		6800000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1068.jpg',			8	),
					 ( N'Canon 1062',		6200000 ,		100,		N'Hàng chính hãng - Bảo hành 12 tháng',						'1062.jpg',			8	),


					 ( N'Lisa 1017',		7000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1017.jpg',			9	),
					 ( N'Lisa 1053',		8000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1053.jpg',			9	),
					 ( N'Lisa 1054',		9000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1054.jpg',			9	),
					 ( N'Lisa 1055',		9000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1055.jpg',			9	),
					 ( N'Lisa 1083',		9000000 ,		100,		N'Hàng chính hãng - Bảo hàng 24 tháng',						'1083.jpg',			9	),


					 ( N'Quạt 1115',		900000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1115.jpg',			6	),
					 ( N'Quạt 1116',		700000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1116.jpg',			6	),
					 ( N'Quạt 1117',		800000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1117.jpg',			6	),
					 ( N'Quạt 1118',		1900000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1118.jpg',			6	),
					 ( N'Quạt 1119',		1800000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1119.jpg',			6	),
					 ( N'Quạt 1120',		1700000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1120.jpg',			6	),
					 ( N'Quạt 1121',		1600000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1121.jpg',			6	),
					 ( N'Quạt 1122',		1500000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1122.jpg',			6	),
					 ( N'Quạt 1123',		1200000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1123.jpg',			6	),
					 ( N'Quạt 1124',		1100000 ,		100,		N'Hàng chính hãng - Bảo hàng 12 tháng',						'1124.jpg',			6	),



					 ( N'Yamaha 1098',		45000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1098.jpg',			1	),
					 ( N'Yamaha 1099',		25000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1099.gif',			1	),
					 ( N'Yamaha 1100',		35000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1100.jpg',			1	),
					 ( N'Yamaha 1101',		19000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1101.jpg',			1	),
					 ( N'Yamaha 1102',		28000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1102.jpg',			1	),
					 ( N'Yamaha 1103',		27000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1103.jpg',			1	),
					 ( N'Yamaha 1104',		21000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1104.jpg',			1	),
					 ( N'Yamaha 1105',		22000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1105.jpg',			1	),
					 ( N'Yamaha 1106',		43000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1106.jpg',			1	),
					 ( N'Yamaha 1107',		49000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1107.jpg',			1	),
					 ( N'Yamaha 1108',		38000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1108.jpg',			1	),
					 ( N'Yamaha 1109',		37000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1109.jpg',			1	),

					 ( N'Vali 1010',		1500000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1010.jpg',			5	),
					 ( N'Vali 1013',		500000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1013.jpg',			5	),
					 ( N'Vali 1018',		5500000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1018.jpg',			5	),
					 ( N'Vali 1030',		2500000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1030.jpg',			5	),
					 ( N'Vali 1037',		35000000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1037.jpg',			5	),
					 ( N'Vali 1040',		800000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1040.jpg',			5	),
					 ( N'Vali 1041',		700000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1041.jpg',			5	),
					 ( N'Vali 1045',		1200000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1045.jpg',			5	),
					 ( N'Vali 1046',		2100000 ,		100,		N'Hàng cao cấp - Bảo hành toàn quốc',						'1046.jpg',			5	),

					 ( N'Samsung 1011',		1000000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1012',		2200000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1031',		3100000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1032',		4100000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1033',		5100000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1059',		6200000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1060',		7100000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1069',		4200000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1071',		5500000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	),
					 ( N'Samsung 1072',		6300000 ,		100,		N'Hàng chính hàng - Bảo hành toàn quốc',					'1011.jpg',			3	)
					 
	
go
/*Insert  Orders		date				id_Customer	*/
Insert into Orders
				values(	'01/17/2020',		1),
					  (	'01/18/2020',		2),
					  (	'01/19/2020',		3),		
					  (	'01/20/2020',		4),		
					  (	'01/21/2020',		5),		
					  (	'01/22/2020',		6),		
					  (	'01/23/2020',		7),		
					  (	'01/24/2020',		8),		
					  (	'01/25/2020',		9),		
					  (	'01/26/2020',		10),
					  (	'01/27/2020',		11),
					  (	'01/28/2020',		12),		
					  (	'02/02/2020',		1),		
					  (	'02/03/2020',		3),
					  (	'02/04/2020',		1),
					  (	'02/04/2020',		13),	
					  ( '02/04/2020',		14),
					  ( '02/04/2020',		15)
					  
					  							
go

/*Insert OrderDetails		id_Order		id_Product				price				quantity*/
Insert into OrderDetails
					values(	1,				1,						19000000,			2),
						  ( 1,				2,						8999000,			1),
						  (	1,				5,						900000,			    1),
						  ( 2,				1,						19000000,			1),
						  ( 2,				7,						7000000,			1),						
						  ( 3,				8,						5000000,			2),
						  ( 4,				9,						5000000,			1),
						  ( 4,				4,						8999000,			1),
						  ( 5,				10,						55000000,			1),
						  ( 6,				9,						5000000,			1),
						  ( 7,				10,						55000000,			1),
						  ( 8,				9,						5000000,			1),
						  ( 9,				10,						55000000,			1),
						  (	10,				1,						19000000,			2),
						  ( 11,				2,						8999000,			1),
						  (	12,				5,						900000,			    3),
						  ( 13,				1,						19000000,			1),
						  ( 14,				7,						7000000,			1),						
						  ( 15,				8,						5000000,			2),
						  ( 16,				9,						5000000,			1),
						  ( 17,				10,						55000000,			1),
						  ( 18,				9,						5000000,			1)
						 
						 
go


