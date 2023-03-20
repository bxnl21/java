use master
go

create database [webbangame]
go

use webbangame
go

create table [users]
(
	id				int				primary key identity,
	username		varchar(10)		unique not null,
	[password]		varchar(10)		not null,
	email			varchar(50)		unique not null,
	isAdmin			bit				not null default 0,
	isActive		bit				not null default 1
)
go

create table games
(
	id				int				primary key identity,
	title			nvarchar(255)	not null,
	href			varchar(50)		unique not null,
	poster			varchar(255)	null,
	price			decimal(12,3)	not null,
	quantity		int				not null,
	[description]	ntext			not null,
	isActive		bit				not null default 1
)
go

create table orders
(
	id				int				primary key identity,
	fullname		nvarchar(255)	not null,
	email			varchar(255)	not null,
	[address]		nvarchar(255)	not null,
	phone			varchar(11)		not null,
	createdDate		datetime		not null default getdate()
)
go

create table order_details
(
	id				int				primary key identity,
	orderId			int				foreign key references orders(id),
	gameId			int				foreign key references games(id),
	price			decimal(12,3)	not null,
	quantity		int				not null
)
go

insert into users(username, [password], email, isAdmin) values
('admin', '111', 'admin@admin.com', 1),
('user1', '111', 'user1@user.com', 0),
('user2', '111', 'user2@user.com', 0)
go

insert into games(title, href, price, quantity, [description], poster) values
('CS GO', 'csgo', 1500000, 100, N'Counter-Strike: Global Offensive là một trò chơi máy tính thuộc thể loại bắn súng góc nhìn thứ nhất, chiến thuật nhiều người chơi được phát triển bởi Valve Corporation và Hidden Path Entertainment, đơn vị cũng đã tiếp tục duy trì Counter-Strike: Source sau khi phát hành.', 'https://gamek.mediacdn.vn/133514250583805952/2021/2/22/photo-1-16139642311542094859234.png'),
('eFootball 2022', 'pes-2022', 3500000, 50, N'eFootball là một trò chơi video mô phỏng bóng đá hiệp hội được phát triển và xuất bản bởi Konami', 'https://cdn.tgdd.vn//GameApp/-1//cau-hinh-choi-pes-2022-efootball-2022-cap-nhat-moi-nhat-1-thumb-800x450.jpg'),
('Dota 2', 'dota-2', 450000, 200, N'Dota 2 là một trò chơi đấu trường trận chiến trực tuyến nhiều người chơi được Valve Corporation phát triển, dựa theo một mod game nổi tiếng - Defense of the Ancients', 'https://cdn.akamai.steamstatic.com/steam/apps/570/capsule_616x353.jpg'),
('Terraria', 'terraria', 750000, 20, N'Terraria là một trò chơi thế giới mở phiêu lưu hành động được phát triển bởi Re-Logic', 'https://hadoantv.com/wp-content/uploads/2020/12/download-terraria-hadoan-tv.jpg'),
('Left 4 Dead 2', 'left-4-dead-2', 1250000, 10, N'Left 4 Dead 2 là một trò chơi bắn súng góc nhìn thứ nhất năm 2009 được phát triển và xuất bản bởi Valve', 'https://image.thanhnien.vn/w1024/Uploaded/2022/tqdxwpmdh/2020_09_23/left-4-dead-2-update-02_tpag.jpg'),
('GTA V Online', 'gta-v-online', 3700000, 75, N'Grand Theft Auto Online là một trò chơi phiêu lưu hành động nhiều người chơi trực tuyến được Rockstar North phát triển và được Rockstar Games phát hành', 'https://phongvu.vn/cong-nghe/wp-content/uploads/2021/12/GTA-online.jpg'),
('Valheim', 'valheim', 800000, 10, N'Valheim là một trò chơi điện tử hộp cát và sinh tồn sắp ra mắt của nhà phát triển Iron Gate Studio người Thụy Điển', 'https://cdn.akamai.steamstatic.com/steam/apps/892970/ss_551f06a43b72609d7ca3cd63e93c58e949d58384.1920x1080.jpg?');
go

