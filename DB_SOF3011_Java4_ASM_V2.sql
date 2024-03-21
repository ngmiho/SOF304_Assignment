USE [master]
GO
/****** Object:  Database [DB_SOF3011_JAVA4_ASM_V2]    Script Date: 6/12/2023 12:36:59 PM ******/
CREATE DATABASE [DB_SOF3011_JAVA4_ASM_V2]
GO

USE [DB_SOF3011_JAVA4_ASM_V2]
GO
/****** Object:  Table [dbo].[History]    Script Date: 6/12/2023 12:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewedDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 6/12/2023 12:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[email] [varchar](255) NOT NULL,
	[sharedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/12/2023 12:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/12/2023 12:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[href] [varchar](255) NOT NULL,
	[poster] [varchar](max) NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON 
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (1, 2, 1, CAST(N'2023-11-19T19:26:15.517' AS DateTime), 1, CAST(N'2023-12-04T21:02:56.880' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (2, 2, 3, CAST(N'2023-11-19T19:26:15.517' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (3, 2, 2, CAST(N'2023-11-19T19:28:11.683' AS DateTime), 1, CAST(N'2023-12-04T19:42:45.990' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (4, 2, 6, CAST(N'2023-11-19T19:40:18.063' AS DateTime), 1, CAST(N'2023-11-26T10:19:58.010' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (5, 2, 5, CAST(N'2023-11-19T20:45:47.927' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (6, 2, 4, CAST(N'2023-11-20T10:46:19.237' AS DateTime), 1, CAST(N'2023-11-20T11:26:21.187' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (7, 1, 2, CAST(N'2023-11-26T10:23:05.570' AS DateTime), 1, CAST(N'2023-11-26T10:23:07.750' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (8, 1, 1, CAST(N'2023-11-26T10:23:23.603' AS DateTime), 1, CAST(N'2023-11-26T10:23:25.693' AS DateTime))
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (11, 1, 3, CAST(N'2023-11-26T23:13:31.387' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (12, 1, 4, CAST(N'2023-11-26T23:13:41.170' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (13, 1, 10, CAST(N'2023-12-01T00:02:04.047' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (14, 1, 7, CAST(N'2023-12-01T00:36:32.407' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (15, 1, 11, CAST(N'2023-12-01T00:37:58.550' AS DateTime), 0, NULL)
GO
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (16, 2, 11, CAST(N'2023-12-06T12:17:53.933' AS DateTime), 1, CAST(N'2023-12-06T12:20:24.037' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Share] ON 
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (1, 1, 1, N'a@gmail.com', CAST(N'2023-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (2, 2, 2, N'b@gmail.com', CAST(N'2023-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (4, 1, 1, N'b@gmail.com', CAST(N'2023-12-04T22:25:59.127' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (5, 2, 1, N'minhhoang25498@gmail.com', CAST(N'2023-12-04T22:49:35.487' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (6, 2, 2, N'minhhoang25498@gmail.com', CAST(N'2023-12-04T22:39:45.917' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (7, 2, 1, N'minhhoang25498@gmail.com', CAST(N'2023-12-04T22:51:48.417' AS DateTime))
GO
INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [sharedDate]) VALUES (9, 2, 11, N'minhhoang25498@gmail.com', CAST(N'2023-12-06T12:20:52.897' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Share] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (1, N'HoangNM0', N'123', N'hoangnmps26822@fpt.edu.vn', 1, 1)
GO
INSERT [dbo].[User] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (2, N'HoangNM', N'123', N'minhhoang25498@gmail.com', 0, 1)
GO
INSERT [dbo].[User] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (4, N'HoangNM1', N'123', N'minhhoang25498@gmail.com', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (1, N'Đen - Diễn viên tồi ft. Thành Bùi, Cadillac (M/V)', N'7ICKkagL3xA', N'https://img.youtube.com/vi/7ICKkagL3xA/maxresdefault.jpg', 0, 0, N'Đen - Diễn viên tồi ft. Thành Bùi, Cadillac (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (2, N'Đen - Mang Tiền Về Cho Mẹ ft. Nguyên Thảo (M/V)', N'UVbv-PJXm14', N'https://img.youtube.com/vi/UVbv-PJXm14/maxresdefault.jpg', 0, 0, N'Đen - Mang Tiền Về Cho Mẹ ft. Nguyên Thảo (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (3, N'Đen - Nấu ăn cho em ft. PiaLinh (M/V)', N'ukHK1GVyr0I', N'https://img.youtube.com/vi/ukHK1GVyr0I/maxresdefault.jpg', 0, 0, N'Đen - Nấu ăn cho em ft. PiaLinh (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (4, N'Đen - Trốn Tìm ft. MTV band (M/V)', N'Ws-QlpSltr8', N'https://img.youtube.com/vi/Ws-QlpSltr8/maxresdefault.jpg', 0, 0, N'Đen - Trốn Tìm ft. MTV band (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (5, N'Đen - Luôn yêu đời ft. Cheng (M/V)', N'CnZxamAbSnw', N'https://img.youtube.com/vi/CnZxamAbSnw/maxresdefault.jpg', 0, 0, N'Đen - Luôn yêu đời ft. Cheng (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (6, N'Đen - một triệu like ft. Thành Đồng (M/V)', N'oigiXW6XyCQ', N'https://img.youtube.com/vi/oigiXW6XyCQ/maxresdefault.jpg', 0, 0, N'Đen - một triệu like ft. Thành Đồng (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (7, N'Đen - Lối Nhỏ ft. Phương Anh Đào (M/V)', N'KKc_RMln5UY', N'https://img.youtube.com/vi/KKc_RMln5UY/maxresdefault.jpg', 0, 0, N'Đen - Lối Nhỏ ft. Phương Anh Đào (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (10, N'Đen ft. MIN - Bài Này Chill Phết (M/V)', N'ddaEtFOsFeM', N'https://img.youtube.com/vi/ddaEtFOsFeM/maxresdefault.jpg', 0, 0, N'Đen ft. MIN - Bài Này Chill Phết (M/V)', 1)
GO
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (11, N'Đen x JustaTee - Đi Về Nhà (M/V)', N'vTJdVE_gjI0', N'https://img.youtube.com/vi/vTJdVE_gjI0/maxresdefault.jpg', 0, 0, N'Đen x JustaTee - Đi Về Nhà (M/V)', 1)
GO
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E61641C82D3B9]    Script Date: 6/12/2023 12:37:00 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__F3DBC5720AFC16C4]    Script Date: 6/12/2023 12:37:00 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Video__7FF10F05617C0B0B]    Script Date: 6/12/2023 12:37:00 PM ******/
ALTER TABLE [dbo].[Video] ADD UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[History] ADD  DEFAULT (getdate()) FOR [viewedDate]
GO
ALTER TABLE [dbo].[History] ADD  DEFAULT ((0)) FOR [isLiked]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Video] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[Video] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectUsersLikedVideoByVideoHref]    Script Date: 6/12/2023 12:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SelectUsersLikedVideoByVideoHref](@videoHref varchar(255))
AS
BEGIN
	SELECT 
		u.id, u.username, u.[password], u.email, u.isAdmin, u.isActive
	FROM
		Video v LEFT JOIN History h ON v.id = h.videoId
		LEFT JOIN [User] u ON h.userId = u.id
	WHERE
		v.href = @videoHref AND u.isActive = 1 AND v.isActive = 1 AND h.isLiked = 1 
END
GO
USE [master]
GO
ALTER DATABASE [DB_SOF3011_JAVA4_ASM_V2] SET  READ_WRITE 
GO
